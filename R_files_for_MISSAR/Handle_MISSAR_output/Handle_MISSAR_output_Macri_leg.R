
# Packages -----------------
<<<<<<< HEAD
install.packages("tidyverse")
install.packages("readxl")
install.packages("openxlsx")
install.packages("ggplot2")
install.packages('Rcpp')
install.packages('questionr')
install.packages('readr')
install.packages('googlesheets4')
install.packages('googledrive')
=======
#install.packages("tidyverse")
#install.packages("readxl")
#install.packages("openxlsx")
#install.packages("ggplot2")
#install.packages('Rcpp')
#install.packages('questionr')
#install.packages('readr')
#install.packages('googlesheets4')
#install.packages('googledrive')
>>>>>>> 12f2b92332c8cca169e4072a1b1ee4ea607764e3

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
<<<<<<< HEAD
setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")

=======
#setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")
setwd("/Users/Leonardo/Documents/MISSAR/")
setwd("MISSAR_private/R_files_for_MISSAR/")
>>>>>>> 12f2b92332c8cca169e4072a1b1ee4ea607764e3
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

leg<-"Macri_legislation/"
sust<-"Sustainability_LIAM2_output/"
adeq<-"Adequacy_and_redistribution_LIAM2_output/"
#Google authentification may trigger here again, proceed with authentification before going further

#Import csv simulation results -----

#Google authentification may trigger here again, proceed with authentification before going further
sust_folder<-drive_get(paste0(leg,sust))
csv_files<-drive_ls(sust_folder,type="csv")
walk(csv_files$id, 
     ~ drive_download(as_id(.x)))
rm(sust_folder,csv_files)

adeq_folder<-drive_get(paste0(leg,adeq))
csv_files<-drive_ls(adeq_folder,type="csv")
walk(csv_files$id, 
     ~ drive_download(as_id(.x)))

rm(adeq_folder,csv_files)

csv_workers_and_wage_central <- read_csv("workers_and_wage_central.csv")%>%
  correct_csv()
csv_workers_and_wage_low <- read_csv("workers_and_wage_low.csv")%>%
  correct_csv()
csv_workers_and_wage_high <- read_csv("workers_and_wage_high.csv")%>%
  correct_csv()

csv_central_v2_m <- read_csv("central_v2_m.csv")%>%
  correct_csv()
csv_low_v2_m <- read_csv("low_v2_m.csv")%>%
  correct_csv()
csv_high_v2_m <- read_csv("high_v2_m.csv")%>%
  correct_csv()

csv_central_v5_m <- read_csv("central_v5_m.csv")%>%
  correct_csv()
csv_low_v5_m <- read_csv("low_v5_m.csv")%>%
  correct_csv()
csv_high_v5_m <- read_csv("high_v5_m.csv")%>%
  correct_csv()

csv_central_SIPA_income <- read_csv("central_SIPA_income.csv")%>%
  correct_csv()
csv_low_SIPA_income <- read_csv("low_SIPA_income.csv")%>%
  correct_csv()
csv_high_SIPA_income <- read_csv("high_SIPA_income.csv")%>%
  correct_csv()


csv_temporary_pension_bonus_low <- read_csv("temporary_pension_bonus_low.csv")%>%
  correct_csv()
csv_temporary_pension_bonus_central <- read_csv("temporary_pension_bonus_central.csv")%>%
  correct_csv()
csv_temporary_pension_bonus_high <- read_csv("temporary_pension_bonus_high.csv")%>%
  correct_csv()

#Modify results sheets -----

id_deficit<- drive_get(paste0(leg,"Deficit_computation_Macri_leg"))

write_sheet(csv_workers_and_wage_low,ss=id_deficit,sheet="workers_and_wage_low")
write_sheet(csv_workers_and_wage_central,ss=id_deficit,sheet="workers_and_wage_central")
write_sheet(csv_workers_and_wage_high,ss=id_deficit,sheet="workers_and_wage_high")

write_sheet(csv_temporary_pension_bonus_low,ss=id_deficit,sheet="temporary_pension_bonus_low")
write_sheet(csv_temporary_pension_bonus_central,ss=id_deficit,sheet="temporary_pension_bonus_central")
write_sheet(csv_temporary_pension_bonus_high,ss=id_deficit,sheet="temporary_pension_bonus_high")


write_sheet(csv_low_v2_m,ss=id_deficit,sheet="low_v2_m")
write_sheet(csv_central_v2_m,ss=id_deficit,sheet="central_v2_m")
write_sheet(csv_high_v2_m,ss=id_deficit,sheet="high_v2_m")

write_sheet(csv_low_v5_m,ss=id_deficit,sheet="low_v5_m")
write_sheet(csv_central_v5_m,ss=id_deficit,sheet="central_v5_m")
write_sheet(csv_high_v5_m,ss=id_deficit,sheet="high_v5_m")

write_sheet(csv_low_SIPA_income,ss=id_deficit,sheet="low_SIPA_income")
write_sheet(csv_central_SIPA_income,ss=id_deficit,sheet="central_SIPA_income")
write_sheet(csv_high_SIPA_income,ss=id_deficit,sheet="high_SIPA_income")


rm(list=ls(pattern="^csv_"))

#Update adequacy results file ----

csv_adequacy_low <- read_csv("adequacy_low.csv")%>%
  correct_csv()
csv_adequacy_central <- read_csv("adequacy_central.csv")%>%
  correct_csv()
csv_adequacy_high <- read_csv("adequacy_high.csv")%>%
  correct_csv()

csv_redistribution_low <- read_csv("redistribution_low.csv")%>%
  correct_csv()
csv_redistribution_central <- read_csv("redistribution_central.csv")%>%
  correct_csv()
csv_redistribution_high <- read_csv("redistribution_high.csv")%>%
  correct_csv()

csv_redistribution_low_sedlac <- read_csv("redistribution_low_sedlac.csv")%>%
  correct_csv()
csv_redistribution_central_sedlac <- read_csv("redistribution_central_sedlac.csv")%>%
  correct_csv()
csv_redistribution_high_sedlac <- read_csv("redistribution_high_sedlac.csv")%>%
  correct_csv()

csv_redistribution_low_insee <- read_csv("redistribution_low_insee.csv")%>%
  correct_csv()
csv_redistribution_central_insee <- read_csv("redistribution_central_insee.csv")%>%
  correct_csv()
csv_redistribution_high_insee <- read_csv("redistribution_high_insee.csv")%>%
  correct_csv()


#Modify the corresponding sheets
id_adequacy<- drive_get(paste0(leg,"Graphics_adequacy_Macri_leg"))

write_sheet(csv_adequacy_central,ss=id_adequacy,sheet="Adequacy_central")
write_sheet(csv_adequacy_low,ss=id_adequacy,sheet="Adequacy_low")
write_sheet(csv_adequacy_high,ss=id_adequacy,sheet="Adequacy_high")


#Update wage figures in adequacy sheets

sim_wage_central<-read_sheet(id_deficit,sheet="workers_and_wage_central",range="B2:B105",col_names = FALSE)%>% #We import simulated contributions
  rename(Real_wages_central=c(1))
sim_wage_low<-read_sheet(id_deficit,sheet="workers_and_wage_low",range="B2:B105",col_names = FALSE)%>%
  rename(Real_wages_low=c(1))
sim_wage_high<-read_sheet(id_deficit,sheet="workers_and_wage_high",range="B2:B105",col_names = FALSE)%>%
  rename(Real_wages_high=c(1))

range_write(sim_wage_low,ss=id_adequacy,sheet="Retirement benefit values", range="B5:B108",reformat=FALSE,col_names = FALSE)
range_write(sim_wage_central,ss=id_adequacy,sheet="Retirement benefit values", range="R5:R108",reformat=FALSE,col_names = FALSE)
range_write(sim_wage_high,ss=id_adequacy,sheet="Retirement benefit values", range="AO5:AO108",reformat=FALSE,col_names = FALSE)

#Update minimum wage and minimum pension figures in adequacy sheets

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public")
csv_minima<-read_sheet(id_globals,sheet="copy_to_csv_Macri_leg",col_names = FALSE)
csv_minima<-csv_minima%>%
  subset(...1 %in% c("PERIOD","MIN_PENSION_CENTRAL_2014_T4","MINIMUM_WAGE_CENTRAL_2014_T4",
                     "MIN_PENSION_HIGH_2014_T4","MINIMUM_WAGE_HIGH_2014_T4","MIN_PENSION_LOW_2014_T4","MINIMUM_WAGE_LOW_2014_T4"))%>%
  t()%>%
  as.data.frame()#Transposing gives a character string object, put it back to df
names(csv_minima)<-csv_minima[1,] #Put first row as column names
csv_minima<-csv_minima[-1,]%>%
  mutate(PERIOD=as.numeric(PERIOD))%>%
  subset(PERIOD>=49 & PERIOD<153)#We keep only projected periods
view(csv_minima)
minima_low<-csv_minima%>%
  select(c("MINIMUM_WAGE_LOW_2014_T4","MIN_PENSION_LOW_2014_T4"))%>%
  mutate(across(where(is.character),~as.numeric(.x))#Convert to numeric all character variables
  )

minima_central<-csv_minima%>%
  select(c("MINIMUM_WAGE_CENTRAL_2014_T4","MIN_PENSION_CENTRAL_2014_T4"))%>%
  mutate(across(where(is.character),~as.numeric(.x))#Convert to numeric all character variables
  )
minima_high<-csv_minima%>%
  select(c("MINIMUM_WAGE_HIGH_2014_T4","MIN_PENSION_HIGH_2014_T4"))%>%
  mutate(across(where(is.character),~as.numeric(.x))#Convert to numeric all character variables
  )

view(minima_low)
range_write(minima_low,ss=id_adequacy,sheet="Retirement benefit values", range="i5:j108",reformat=FALSE,col_names = FALSE)
range_write(minima_central,ss=id_adequacy,sheet="Retirement benefit values", range="AE5:AF108",reformat=FALSE,col_names = FALSE)
range_write(minima_high,ss=id_adequacy,sheet="Retirement benefit values", range="BB5:BC108",reformat=FALSE,col_names = FALSE)

rm(list=ls(pattern="^minima_"))
rm(csv_minima)




#Update values on redistribution sheets

id_redistribution<- drive_get(paste0(leg,"Graphics_redistribution_per_capita_Macri_leg"))
id_redistribution_SEDLAC<- drive_get(paste0(leg,"Graphics_redistribution_SEDLAC_Macri_leg"))
id_redistribution_INSEE<- drive_get(paste0(leg,"Graphics_redistribution_INSEE_Macri_leg"))


write_sheet(csv_redistribution_central,ss=id_redistribution,sheet="Redistribution_central")
write_sheet(csv_redistribution_low,ss=id_redistribution,sheet="Redistribution_low")
write_sheet(csv_redistribution_high,ss=id_redistribution,sheet="Redistribution_high")

write_sheet(csv_redistribution_central_sedlac,ss=id_redistribution_SEDLAC,sheet="Redistribution_central")
write_sheet(csv_redistribution_low_sedlac,ss=id_redistribution_SEDLAC,sheet="Redistribution_low")
write_sheet(csv_redistribution_high_sedlac,ss=id_redistribution_SEDLAC,sheet="Redistribution_high")

write_sheet(csv_redistribution_central_insee,ss=id_redistribution_INSEE,sheet="Redistribution_central")
write_sheet(csv_redistribution_low_insee,ss=id_redistribution_INSEE,sheet="Redistribution_low")
write_sheet(csv_redistribution_high_insee,ss=id_redistribution_INSEE,sheet="Redistribution_high")


#Cleanup -----
<<<<<<< HEAD
setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")
=======
#setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")
setwd("../")
>>>>>>> 12f2b92332c8cca169e4072a1b1ee4ea607764e3
unlink("MISSAR_output",recursive=TRUE)
rm(list=ls())









