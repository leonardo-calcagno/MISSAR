
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

#Para chequear y configurar directorio de trabajo
#getwd()

if(!file.exists("MISSAR_output")) {
  dir.create("MISSAR_output")
}
setwd("MISSAR_output/")
leg<-"June_2022_legislation/"
sust<-"Sustainability_LIAM2_output/"
adeq<-"Adequacy_and_redistribution_LIAM2_output/"

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




#Import csv simulation result
csv_workers_and_wage_central <- read_csv("workers_and_wage_central.csv")
csv_workers_and_wage_low <- read_csv("workers_and_wage_low.csv")
csv_workers_and_wage_high <- read_csv("workers_and_wage_high.csv")

csv_central_v2_m <- read_csv("central_v2_m.csv")
csv_low_v2_m <- read_csv("low_v2_m.csv")
csv_high_v2_m <- read_csv("high_v2_m.csv")

csv_central_v5_m <- read_csv("central_v5_m.csv")
csv_low_v5_m <- read_csv("low_v5_m.csv")
csv_high_v5_m <- read_csv("high_v5_m.csv")

csv_central_SIPA_income <- read_csv("central_SIPA_income.csv")
csv_low_SIPA_income <- read_csv("low_SIPA_income.csv")
csv_high_SIPA_income <- read_csv("high_SIPA_income.csv")

csv_temporary_pension_bonus_low <- read_csv("temporary_pension_bonus_low.csv")
csv_temporary_pension_bonus_central <- read_csv("temporary_pension_bonus_central.csv")
csv_temporary_pension_bonus_high <- read_csv("temporary_pension_bonus_high.csv")

csv_IFE_cost_low <- read_csv("IFE_cost_low.csv")
csv_IFE_cost_central <- read_csv("IFE_cost_central.csv")
csv_IFE_cost_high <- read_csv("IFE_cost_high.csv")



csv_adequacy_low <- read_csv("adequacy_low.csv")
csv_adequacy_central <- read_csv("adequacy_central.csv")
csv_adequacy_high <- read_csv("adequacy_high.csv")


csv_redistribution_low <- read_csv("redistribution_low.csv")
csv_redistribution_central <- read_csv("redistribution_central.csv")
csv_redistribution_high <- read_csv("redistribution_high.csv")

csv_redistribution_low_sedlac <- read_csv("redistribution_low_sedlac.csv")
csv_redistribution_central_sedlac <- read_csv("redistribution_central_sedlac.csv")
csv_redistribution_high_sedlac <- read_csv("redistribution_high_sedlac.csv")

csv_redistribution_low_insee <- read_csv("redistribution_low_insee.csv")
csv_redistribution_central_insee <- read_csv("redistribution_central_insee.csv")
csv_redistribution_high_insee <- read_csv("redistribution_high_insee.csv")


#Import Excel results file

id_deficit<- drive_get(paste0(leg,"Deficit_computation_50_1.03_trim.xlsx"))
drive_download(id_deficit)
rm(id_deficit)
wb_deficit<-loadWorkbook("Deficit_computation_50_1.03_trim.xlsx")



#Modify the corresponding sheet
writeData(wb_deficit,sheet="workers_and_wage_central",csv_workers_and_wage_central)
writeData(wb_deficit,sheet="workers_and_wage_low",csv_workers_and_wage_low)
writeData(wb_deficit,sheet="workers_and_wage_high",csv_workers_and_wage_high)

writeData(wb_deficit,sheet="temporary_pension_bonus_central",csv_temporary_pension_bonus_central)
writeData(wb_deficit,sheet="temporary_pension_bonus_low",csv_temporary_pension_bonus_low)
writeData(wb_deficit,sheet="temporary_pension_bonus_high",csv_temporary_pension_bonus_high)

writeData(wb_deficit,sheet="IFE_cost_low_central",csv_IFE_cost_low_central)
writeData(wb_deficit,sheet="IFE_cost_low_low",csv_IFE_cost_low_low)
writeData(wb_deficit,sheet="IFE_cost_low_high",csv_IFE_cost_low_high)

writeData(wb_deficit,sheet="central_v2_m",csv_central_v2_m)
writeData(wb_deficit,sheet="low_v2_m",csv_low_v2_m)
writeData(wb_deficit,sheet="high_v2_m",csv_high_v2_m)

writeData(wb_deficit,sheet="central_v5_m",csv_central_v5_m)
writeData(wb_deficit,sheet="low_v5_m",csv_low_v5_m)
writeData(wb_deficit,sheet="high_v5_m",csv_high_v5_m)

writeData(wb_deficit,sheet="central_SIPA_income",csv_central_SIPA_income)
writeData(wb_deficit,sheet="low_SIPA_income",csv_low_SIPA_income)
writeData(wb_deficit,sheet="high_SIPA_income",csv_high_SIPA_income)

#Save the modified excel file, changing only the required sheet
saveWorkbook(wb_deficit,"Deficit_output.xlsx", overwrite=T)

#Modify the excel file in google drive
drive_upload("Deficit_output.xlsx",paste0(leg),"Deficit_computation_50_1.03_trim.xlsx",overwrite=TRUE)

rm(wb_deficit)


#Import Excel adequacy results file

id_adequacy<- drive_get(paste0(leg,"Graphics_adequacy.xlsx"))
drive_download(id_adequacy)
rm(id_adequacy)
wb_adequacy<-loadWorkbook("Graphics_adequacy.xlsx")


#Modify the corresponding sheet
writeData(wb_adequacy,sheet="Adequacy_central",csv_adequacy_central)
writeData(wb_adequacy,sheet="Adequacy_low",csv_adequacy_low)
writeData(wb_adequacy,sheet="Adequacy_high",csv_adequacy_high)


#Save the modified excel file, changing only the required sheet
saveWorkbook(wb_adequacy,"Adequacy_output.xlsx", overwrite=T)

#Modify the excel file in google drive
drive_upload("Adequacy_output.xlsx",paste0(leg),"Graphics_adequacy.xlsx",overwrite=TRUE)

rm(wb_adequacy)



#Import Excel redistribution results files

#id_redistribution<- drive_get(paste0(leg,"Graphics_redistribution_per_capita.xlsx"))
id_redistribution_SEDLAC<- drive_get(paste0(leg,"Graphics_redistribution_SEDLAC.xlsx"))
#id_redistribution_INSEE<- drive_get(paste0(leg,"Graphics_redistribution_INSEE.xlsx"))

#drive_download(id_redistribution)
#drive_download(id_redistribution_INSEE)
drive_download(id_redistribution_SEDLAC)

rm(id_redistribution,id_redistribution_INSEE,id_redistribution_SEDLAC)

#wb_redistribution<-loadWorkbook("Graphics_redistribution_per_capita.xlsx")
wb_redistribution_SEDLAC<-loadWorkbook("Graphics_redistribution_SEDLAC.xlsx")
#wb_redistribution_INSEE<-loadWorkbook("Graphics_redistribution_INSEE.xlsx")

###Need to modify the redistribution excel files for per capita and INSEE

#Modify the corresponding sheet
#writeData(wb_redistribution,sheet="Redistribution_central",csv_redistribution_central)
#writeData(wb_redistribution,sheet="redistribution_low",csv_redistribution_low)
#writeData(wb_redistribution,sheet="Redistribution_high",csv_redistribution_high)

writeData(wb_redistribution_SEDLAC,sheet="Redistribution_central",csv_redistribution_central_sedlac)
writeData(wb_redistribution_SEDLAC,sheet="redistribution_low",csv_redistribution_low_sedlac)
writeData(wb_redistribution_SEDLAC,sheet="Redistribution_high",csv_redistribution_high_sedlac)

#writeData(wb_redistribution_INSEE,sheet="Redistribution_central",csv_redistribution_central_insee)
#writeData(wb_redistribution_INSEE,sheet="redistribution_low",csv_redistribution_low_insee)
#writeData(wb_redistribution_INSEE,sheet="Redistribution_high",csv_redistribution_high_insee)


#Save the modified excel file, changing only the required sheet
#saveWorkbook(wb_redistribution,"Redistribution_output.xlsx", overwrite=T)
#saveWorkbook(wb_redistribution_INSEE,"Redistribution_INSEE_output.xlsx", overwrite=T)
saveWorkbook(wb_redistribution_SEDLAC,"Redistribution_SEDLAC_output.xlsx", overwrite=T)

#Modify the excel file in google drive
#drive_upload("Redistribution_output.xlsx",paste0(leg),"Graphics_redistribution_per_capita.xlsx",overwrite=TRUE)
#drive_upload("Redistribution_INSEE_output.xlsx",paste0(leg),"Graphics_redistribution_INSEE.xlsx",overwrite=TRUE)
drive_upload("Redistribution_SEDLAC_output.xlsx",paste0(leg),"Graphics_redistribution_SEDLAC.xlsx",overwrite=TRUE)

rm(wb_redistribution,wb_redistribution_INSEE,wb_redistribution_SEDLAC)



#Cleanup
setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")
unlink("MISSAR_output",recursive=TRUE)
rm(list=ls())









