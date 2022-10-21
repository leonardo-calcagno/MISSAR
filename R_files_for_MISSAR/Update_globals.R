
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

lag_month<- if(lag_month==0) {12
}else {lag_month
}

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

####INDEC wage index ------
 #URL: https://www.indec.gob.ar/ftp/cuadros/sociedad/variaciones_salarios_09_22.xls for July data


#We automate the URL for downloading the latest INDEC wage index: for figures of a given month (say, January), the URL is 
#named two months after  (here, March).
date<-Sys.Date()
year<-substr(date,start=3,stop=4)
month<-substr(date,start=6,stop=7)
month<-as.integer(month)-1
month<- if(month==0){12
}else {month
}


#day<-substr(date,start=9,stop=10)
lag_month<-month-1
lag_month<- if(lag_month==0){12
}else {lag_month
}

month<- if (month>9) {as.character(month)
} else {
  paste0("0",month)
}
lag_year<-as.integer(year)-1
lag_year<- as.character(lag_year)

lag_month<- if (lag_month>9) {as.character(lag_month)
} else {
  paste0("0",lag_month)
}


wage_url <- paste0("https://www.indec.gob.ar/ftp/cuadros/sociedad/variaciones_salarios_",month,"_",year,".xls")

alt_wage_url<- if (month=="01") {paste0("https://www.indec.gob.ar/ftp/cuadros/sociedad/variaciones_salarios_",lag_month,"_",lag_year,".xls")
} else {paste0("https://www.indec.gob.ar/ftp/cuadros/sociedad/variaciones_salarios_",lag_month,"_",year,".xls")
}
rm(date,year,month,day,lag_year,lag_month)


current_month_exists<-urlFileExist(wage_url)$exists
last_month_exists<-urlFileExist(alt_wage_url)$exists

correct_wage_url<- if(current_month_exists==TRUE){wage_url
}else if(last_month_exists==TRUE) {alt_wage_url
} else {"ERROR"
}

correct_wage_url #Prints the URL, shows ERROR if neither exist

download.file(
  url = correct_wage_url, 
  destfile = "latest_INDEC_wage.xls", mode='wb'
)


rm(correct_wage_url,alt_wage_url,wage_url,current_month_exists,last_month_exists)

df_latest_wage<-read_excel("latest_INDEC_wage.xls")
names(df_latest_wage)[length(names(df_latest_wage))]<-"wage_index" 

df_latest_wage<-df_latest_wage%>% 
  rename(year=1,
         month=2) %>% 
  select(c(year,month,wage_index)) %>% 
  mutate(keep=ifelse(as.integer(substr(wage_index,start=1,stop=1))>0, 1, 
                     0)
         ) %>% 
  subset(keep==1) %>% 
  select(-c(keep)) %>% 
  mutate(wage_index=as.double(wage_index))

vector_wage_index<-df_latest_wage %>% 
  select(c(wage_index))

range_write(vector_wage_index,ss=id_globals,range="G269",col_names =FALSE,sheet="Pessimistic projection",reformat=FALSE) #

rm(vector_wage_index,df_latest_wage)


#### Actualise RIPTE wage index -----

url_RIPTE<-"https://infra.datos.gob.ar/catalog/sspm/dataset/158/distribution/158.1/download/remuneracion-imponible-promedio-trabajadores-estables-ripte-total-pais-pesos-serie-mensual.csv"


download.file(
  url = url_RIPTE, 
  destfile = "RIPTE_index.csv", mode='wb'
)
vector_RIPTE <- read_csv("RIPTE_index.csv") %>% 
  select(c(ripte))

head(vector_RIPTE)

range_write(vector_RIPTE,ss=id_globals,range="N620",col_names =FALSE,sheet="Inflation and wages",reformat=FALSE) #
rm(vector_RIPTE)
unlink("RIPTE_index.csv",recursive=TRUE) #Delete downloaded file, important as .csv is not in gitignore


#Cleanup -----
rm(output_name,sheet_name)
setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private/R_files_for_MISSAR/")
unlink("download_folder",recursive=TRUE)
rm(list=ls())
