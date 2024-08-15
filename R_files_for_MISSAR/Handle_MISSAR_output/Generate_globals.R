
# Packages -----------------
#install.packages("tidyverse")
#install.packages("readxl")
#install.packages("openxlsx")
#install.packages("ggplot2")
#install.packages('Rcpp')
#install.packages('questionr')
#install.packages('readr')
#install.packages('googlesheets4')
#install.packages('googledrive')

rm(list=ls())
gc()

# Open packages
library(tidyverse)
library(readxl)
library(openxlsx)
library(ggplot2)
library(Rcpp)
library(questionr)
library(readr)
library(googlesheets4)
library(googledrive)

gs4_auth() #Connection to google account
#setwd("C:/Users/lcalcagno/Documents/Investigaci?n/")
setwd("/Users/Leonardo/Documents/MISSAR/")
setwd("MISSAR_private/R_files_for_MISSAR")
#To verify working directory
#getwd()

if(!file.exists("MISSAR_output")) {
  dir.create("MISSAR_output")
}


setwd("MISSAR_output/")



###Generate csv globals ----
#Import errors may make variables with decimal spaces 1000 times bigger (read as if they were integers). We identify, for all variables with a non-null
#decimal part (.x%%1>0), those that are more than 100 times larger than their median, excluding null values, and correct them. 
correct_csv<-function(input){
  input<-input%>%
    mutate(across(where(is.double),~ifelse(.x>median(.x[.x>0])*100 & .x%%1>0, .x/1000, 
                                           .x)) 
           )
  
}


#Generate global files in csv format, without formatting problems (copy-pasting often generates missing decimal point errors)
generate_globals<-function(id,input,output,ruta){
  
  csv_globals<-read_sheet(id,sheet=input)
  
  csv_globals[is.na(csv_globals)]<-0 #Missing values put to 0
  csv_globals<-csv_globals%>%
    select(-c(152)) #Remove last column with #REF!
  
  take_out_cpi<-csv_globals%>%
    subset(PERIOD %in% c("CPI_HIGH","CPI_LOW","CPI_CENTRAL")) #It is normal for inflation indexes to wildly vary nominally
  
  csv_globals<-subset(csv_globals,!(PERIOD %in% c("CPI_HIGH","CPI_LOW","CPI_CENTRAL")))

    csv_globals<-csv_globals%>%
    correct_csv()%>%
    rbind(take_out_cpi)#
  
  
  # mutate_all(~(str_replace(.,",","."))) #Keep variables as character, but replace "," by "." (needed for LIAM2)
  
  write_csv(csv_globals,output)
  drive_upload(output,path=ruta,overwrite = T) #Upload it corrected
  
}

leg<-"August_2024_legislation/"
sust<-"Sustainability_LIAM2_output/"
adeq<-"Adequacy_and_redistribution_LIAM2_output/"
#Google authentification may trigger here again, proceed with authentification before going further
id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") #Prepare globals csv with R to avoid formatting errors

sheet_name<-"copy_to_csv_2024_leg"
output_name<-"globals_prosp_Milei_leg.csv"
generate_globals(id_globals,sheet_name,output_name,leg)




leg<-"December_2023_legislation/"
sust<-"Sustainability_LIAM2_output/"
adeq<-"Adequacy_and_redistribution_LIAM2_output/"
#Google authentification may trigger here again, proceed with authentification before going further
id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") #Prepare globals csv with R to avoid formatting errors

sheet_name<-"copy_to_csv_2020_leg"
output_name<-"globals_prosp_jun_2022_leg.csv"
generate_globals(id_globals,sheet_name,output_name,leg)




sheet_name<-"copy_to_csv_Macri_leg"
output_name<-"globals_prosp_scenarios_Macri_leg.csv"
leg_Macri<-"Macri_legislation/"
generate_globals(id_globals,sheet_name,output_name,leg_Macri)


sheet_name<-"copy_to_csv_2017_leg"
output_name<-"globals_transposed_prosp_scenarios_2017_leg.csv"
leg_CFK<-"Dec_2015_legislation_with_moratorium/"
generate_globals(id_globals,sheet_name,output_name,leg_CFK)

#Cleanup -----
rm(output_name,sheet_name)
setwd("../")
unlink("MISSAR_output",recursive=TRUE)
rm(list=ls())

