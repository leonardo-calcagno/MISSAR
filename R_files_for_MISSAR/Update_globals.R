
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
##Generate temporary download folder----

setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private/R_files_for_MISSAR")

if(!file.exists("download_folder")) {
  dir.create("download_folder")
}
setwd("download_folder/")

###Update inflation figures -----
#We automate the URL for downloading the latest inflation figures: for figures of a given month (say, January), the URL is 
    #named after the following month (here, February).
date<-Sys.Date()
year<-substr(date,start=3,stop=4)
month<-substr(date,start=6,stop=7)
#day<-substr(date,start=9,stop=10)
lag_month<-as.integer(month)-1
lag_year<-as.integer(year)-1
lag_year<- as.character(lag_year)

lag_month<- if (lag_month>9) {as.character(lag_month)
} else {
paste0("0",lag_month)
}


CPI_url <- paste0("https://www.indec.gob.ar/ftp/cuadros/economia/sh_ipc_",month,"_",year,".xls")
alt_CPI_url<- if (month=="01") {paste0("https://www.indec.gob.ar/ftp/cuadros/economia/sh_ipc_",lag_month,"_",lag_year,".xls")
} else {paste0("https://www.indec.gob.ar/ftp/cuadros/economia/sh_ipc_",lag_month,"_",year,".xls")
}
rm(date,year,month,day,lag_year,lag_month)

urlFileExist <- function(url){
  HTTP_STATUS_OK <- 200
  hd <- httr::HEAD(url)
  status <- hd$all_headers[[1]]$status
  list(exists = status == HTTP_STATUS_OK, status = status)
}

current_month_exists<-urlFileExist(CPI_url)$exists
last_month_exists<-urlFileExist(alt_CPI_url)$exists

correct_CPI_url<- if(current_month_exists==TRUE){CPI_url
}else if(last_month_exists==TRUE) {alt_CPI_url
} else {"ERROR"
}

correct_CPI_url #Prints the URL, shows ERROR if neither exist

download.file(
  url = correct_CPI_url, 
  destfile = "latest_CPI.xls", mode='wb'
)

#Update distinct globals sheets with current legislation macroeconomic data and projections ---
id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 


id_globals_senate<- drive_get("Globals_moratorium_senate") 


sheet_delete(ss=id_globals_senate,sheet="Test1")
sheet_copy(from_ss=id_globals,from_sheet="Test1",to_ss=id_globals_senate,to_sheet="Test1")
test<-gs4_get(id_globals,sheet="Inflation and wages")
csv_inflation_wages<- read_sheet(id_globals,sheet="Inflation and wages")
head(csv_inflation_wages)


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
