
# Packages -----------------
install.packages("tidyverse")
install.packages("readxl")
install.packages("openxlsx")
install.packages("ggplot2")
install.packages('Rcpp')
install.packages('questionr')
install.packages('readr')

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


path_external_files<-"C:/Users/Ministerio/Documents/June_2022_legislation/"


#Import Excel results file
wb_deficit <- loadWorkbook(paste0(path_external_files,"/Deficit_computation_50_1.03_trim.xlsx"))

#Import csv simulation result
df_work_wage_central <- read_csv(paste0(path_external_files,"Sustainability_LIAM2_output/workers_and_wage_central.csv"))
#Modify the corresponding sheet
writeData(wb_deficit,sheet="workers_and_wage_central",df_work_wage_central)
#Save the modified excel file, changing only the required sheet
saveWorkbook(wb_deficit,paste0(path_external_files,"/Deficit_output.xlsx"), overwrite=T)

