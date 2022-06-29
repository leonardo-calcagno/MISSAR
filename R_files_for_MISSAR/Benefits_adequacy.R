
# Packages -----------------
install.packages("tidyverse")
install.packages("readxl")
install.packages("openxlsx")
install.packages("ggplot2")
install.packages('Rcpp')
install.packages('questionr')
install.packages('readr')
install.packages('googlesheets4')
install.packages('googledrive')

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
setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")

#To verify working directory
#getwd()

if(!file.exists("MISSAR_output")) {
  dir.create("MISSAR_output")
}


setwd("MISSAR_output/")

#####Get adequacy results across legislations in one file ----

##Get projected CPI indexes

leg<-"June_2022_legislation/"
id_adequacy<- drive_get(paste0(leg,"Graphics_adequacy"))

leg_Macri<-"Macri_legislation/"
id_adequacy_Macri<-drive_get(paste0(leg_Macri,"Graphics_adequacy_Macri_leg"))

leg_CFK<-"Dec_2015_legislation_with_moratorium/"
id_adequacy_CFK<-drive_get(paste0(leg_CFK,"Graphics_adequacy_CFK_leg"))

CPI_pessimistic<-read_sheet(id_adequacy,sheet="Inflation indexes",range="D3:D410",col_names=FALSE)%>%
  mutate(mergeid=row_number())
names(CPI_pessimistic)<-c("pessimistic_projection","mergeid")

CPI_central<-read_sheet(id_adequacy,sheet="Inflation indexes",range="F3:F410",col_names=FALSE)%>%
  mutate(mergeid=row_number())
names(CPI_central)<-c("central_projection","mergeid")

CPI_optimistic<-read_sheet(id_adequacy,sheet="Inflation indexes",range="H3:H410",col_names=FALSE)%>%
  mutate(mergeid=row_number())
names(CPI_optimistic)<-c("optimistic_projection","mergeid")

CPI_year_month<-read_sheet(id_adequacy,sheet="Inflation indexes", range="A3:B410",col_names=FALSE)
names(CPI_year_month)<- c("year","month")
CPI_year_month<-CPI_year_month%>%
  mutate(month_number=ifelse(month=="Enero", 1, 
                             ifelse(month=="Febrero", 2, 
                                    ifelse(month=="Marzo", 3, 
                                           ifelse(month=="Abril", 4, 
                                                  ifelse(month=="Mayo", 5, 
                                                         ifelse(month=="Junio", 6, 
                                                                ifelse(month=="Julio", 7,
                                                                       ifelse(month=="Agosto", 8, 
                                                                              ifelse(month=="Septiembre", 9, 
                                                                                     ifelse(month=="Octubre", 10, 
                                                                                            ifelse(month=="Noviembre", 11, 
                                                                                                   12)
                                                                                            )
                                                                                     )
                                                                              )
                                                                       )
                                                                )
                                                         )
                                                  )
                                           )
                                    )
                             )
         )%>%
  select(year,month_number)%>%
  unite("Date", year:month_number, sep="-")%>%#Generate date variable by concatenating year and month
  mutate(mergeid=row_number())

CPI_index<-CPI_year_month%>%
  left_join(CPI_central)%>%
  left_join(CPI_pessimistic)%>%
  left_join(CPI_optimistic)%>%
  select(-c(mergeid))

##### Get mean retirement benefits -----

sim_cont_low<-read_sheet(id_adequacy,sheet="Retirement benefit values",range="O5:O108",col_names = FALSE)
sim_cont_central<-read_sheet(id_adequacy,sheet="Retirement benefit values",range="AK5:AK108",col_names = FALSE)
sim_cont_high<-read_sheet(id_adequacy,sheet="Retirement benefit values",range="BH5:BH108",col_names = FALSE)


sim_cont_Macri_low<-read_sheet(id_adequacy_Macri,sheet="Retirement benefit values",range="O5:O108",col_names = FALSE)
sim_cont_Macri_central<-read_sheet(id_adequacy_Macri,sheet="Retirement benefit values",range="AK5:AK108",col_names = FALSE)
sim_cont_Macri_high<-read_sheet(id_adequacy_Macri,sheet="Retirement benefit values",range="BH5:BH108",col_names = FALSE)

sim_cont_CFK_low<-read_sheet(id_adequacy_CFK,sheet="Retirement benefit values",range="O5:O108",col_names = FALSE)
sim_cont_CFK_central<-read_sheet(id_adequacy_CFK,sheet="Retirement benefit values",range="AK5:AK108",col_names = FALSE)
sim_cont_CFK_high<-read_sheet(id_adequacy_CFK,sheet="Retirement benefit values",range="BH5:BH108",col_names = FALSE)

head(sim_pension_levels)



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
    select(-c(152))%>%
    correct_csv()# #Remove last column with #REF!
  
  # mutate_all(~(str_replace(.,",","."))) #Keep variables as character, but replace "," by "." (needed for LIAM2)
  
  write_csv(csv_globals,output)
  drive_upload(output,path=ruta,overwrite = T) #Upload it corrected
  
}

leg<-"June_2022_legislation/"
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
setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")
unlink("MISSAR_output",recursive=TRUE)
rm(list=ls())

