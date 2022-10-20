
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
setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private/R_files_for_MISSAR")


#Update distinct globals sheets with current legislation macroeconomic data and projections ---

id_globals_senate<- drive_get("Globals_moratorium_senate") 
#We get from the globals generating sheet values updated manually

update_inflation<-read_sheet(ss=id_globals,sheet="Inflation and wages")
head(update_inflation)

sheet_delete(ss=id_globals_senate,sheet="Test1")
sheet_copy(from_ss=id_globals,from_sheet="Test1",to_ss=id_globals_senate,to_sheet="Test1")
test<-gs4_get(id_globals,sheet="Inflation and wages")
csv_inflation_wages<- read_sheet(id_globals,sheet="Inflation and wages")
head(csv_inflation_wages)



download.file(
  url = "https://www.afip.gob.ar/aduana/arancelintegrado/archivos/arancel.zip", 
  destfile = "Bases_afip/arancel.zip", mode='wb'
)

unzip(zipfile = 'Bases_afip/arancel.zip', exdir = "Bases_afip")
unlink('Bases_afip/arancel.zip') # Borra el archivo zip

fecha<-Sys.Date()
anio<-substr(fecha,start=1,stop=4)
mes<-substr(fecha,start=6,stop=7)
dia<-substr(fecha,start=9,stop=10)
ruta_base<-"Bases_afip/nomenclador_"

nomenclador <- readr::read_delim(paste0(ruta_base,dia,mes,anio,".txt"), 
                                 delim = "@", escape_double = FALSE, col_names = FALSE, 
                                 trim_ws = TRUE) #El archivo de AFIP lleva la fecha de hoy





#Cleanup -----
rm(output_name,sheet_name)
setwd("C:/Users/Ministerio/Documents/MISSAR_private/R_files_for_MISSAR")
unlink("MISSAR_output",recursive=TRUE)
rm(list=ls())
