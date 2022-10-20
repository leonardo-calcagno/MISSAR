
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

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 
id_globals_senate<- drive_get("Globals_moratorium_senate") 
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

urlFileExist <- function(url){ #Source: https://stackoverflow.com/questions/60318926/how-to-check-if-file-exists-in-the-url-before-use-download-file-in-r
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

rm(correct_CPI_url,alt_CPI_url,CPI_url,current_month_exists,last_month_exists)

df_latest_CPI<-read_excel("latest_CPI.xls",sheet="Índices IPC Cobertura Nacional") %>% 
  rename(CPI_index_type=1) %>%  #Rename the first column
  subset(CPI_index_type=="Nivel general") %>% 
  mutate(CPI_region=ifelse(row_number(CPI_index_type)==1, "Nacional",
                           ifelse(row_number(CPI_index_type)==2, "GBA", 
                                  ifelse(row_number(CPI_index_type)==3, "Pampeana", 
                                                    ifelse(row_number(CPI_index_type)==4, "NOA", 
                                                                      ifelse(row_number(CPI_index_type)==5, "NEA", 
                                                                                        ifelse(row_number(CPI_index_type)==6, "Cuyo",
                                                                                               "Patagonia")
                                                                             )
                                                           )
                                         )
                                  )
                           )
         ) %>% 
  select(c(CPI_region),everything()) %>% #Put the region name as first column
  select(-c(CPI_index_type))

df_CPI_for_globals<-df_latest_CPI %>% 
  subset(CPI_region %in% c("Nacional","GBA")) %>% 
  arrange(CPI_region)

df_CPI_for_globals<-as.data.frame(t(df_CPI_for_globals))
df_CPI_for_globals<-df_CPI_for_globals[-1,] #Remove first row
names(df_CPI_for_globals)<- c("GBA","nacional")
df_CPI_for_globals<-df_CPI_for_globals %>% 
  mutate(GBA=as.double(GBA),
         nacional=as.double(nacional)
         )
#Now we update the CPI index in the globals file

range_write(df_CPI_for_globals,ss=id_globals,range="E889",col_names =FALSE,sheet="Inflation and wages",reformat=FALSE) #Son las 3 células que hay que cambiar en el drive
rm(df_CPI_for_globals,df_latest_CPI)


#Cleanup -----
rm(output_name,sheet_name)
setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private/R_files_for_MISSAR/")
unlink("download_folder",recursive=TRUE)
rm(list=ls())
