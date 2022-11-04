
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
install.packages('glue')
install.packages('rlist')

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
library(glue)
library(rlist)

gs4_auth() #Connection to google account

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 
id_globals_senate<- drive_get("Globals_moratorium_senate") 
##Generate temporary download folder----

setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private/R_files_for_MISSAR")

if(!file.exists("download_folder")) {
  dir.create("download_folder")
}
setwd("download_folder/")

#Update inflation figures -----
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

#INDEC wage index ------
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


# Update RIPTE wage index --------

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

# Update ANSES fiscal income, from Savings-Investment-Funding Account----

start.time=Sys.time()

##Folder creation

if(!file.exists("AIF")) {
  dir.create("AIF")
}

setwd("AIF/")
getwd()

#Possible imported months and years names
month <- c("ene", "feb", "mar", "abr", "may", "jun", "jul",
         "ago", "sep", "oct", "nov", "dic", 
         "enero", "febrero", "marzo", "abril", "mayo", "junio", "julio",
         "agosto", "septiembre", "octubre", "noviembre", "diciembre")


#Put different names for each option, or they get overwritten
numeric_month <- c("01", "02", "03", "04", "05", "06", "07",
             "08", "09", "10", "11", "12", 
             "enero", "febrero", "marzo", "abril", "mayo", "junio", "julio",
             "agosto", "septiembre", "octubre", "noviembre", "diciembre")

#We have manually corrected 2017 fiscal income for ANSES for fiscal amnesty tax recollection, 
    #so we'd rather run this from 2018 onward. This code is verified to work for periods 2014
    #onward. 
year <- c("18","19", "20", "21", "22") 


##Possible names and links, with and without .xls
urls_xls <- 
  tidyr::expand_grid(month, year) %>%
  glue_data("https://www.economia.gob.ar/onp/documentos/resultado/caja/c20{year}/archivos/{month}{year}.xls")

urls_xlsx <- 
  tidyr::expand_grid(month, year) %>%
  glue_data("https://www.economia.gob.ar/onp/documentos/resultado/caja/c20{year}/archivos/{month}{year}.xlsx")

# File names for xls y xlsx
names_xls <- 
  tidyr::expand_grid(numeric_month, year) %>%
  glue_data("20{year}_{numeric_month}.xls")

names_xlsx <- 
  tidyr::expand_grid(numeric_month, year) %>% 
  glue_data("20{year}_{numeric_month}.xlsx")

#---- Download excels with purrr library

walk2(urls_xls,names_xls,safely(download.file), mode = "wb")

walk2(urls_xlsx,names_xlsx,safely(download.file), mode = "wb")


###Import all downloaded excel files (from https://stackoverflow.com/questions/32888757/how-can-i-read-multiple-excel-files-into-r)


list_xls <- list.files(pattern='*.xls')

read_third_sheet <- function(path) { #Sometimes, the correct table is in the third sheet
  x <-try(read_excel(path=path, sheet = 3)) #Some tables have only one sheet: try() keeps the code running even through errors
}

read_second_sheet <- function(path) { #Sometimes, the correct table is in the second sheet
  x <-try(read_excel(path=path, sheet = 2)) #Some tables have only one sheet: try() keeps the code running even through errors
}
read_excel_as_df <- function(path) {
 x<-try(as.data.frame(read_excel(path=path)))  
}

df_list_xls <- sapply(list_xls, read_excel,simplify=FALSE)#This keeps the file names 
df_list_s2_xls <- sapply(list_xls, read_second_sheet,simplify=FALSE)
df_list_s3_xls <- sapply(list_xls, read_third_sheet,simplify=FALSE)

##The read_second_sheet() and read_third_sheet() function allow for errors, so the end result is a list with both characters
    #and lists. We thus need to first remove non-list elements from the list of lists. 
keep_s2_xls<-sapply(df_list_s2_xls,is.list)
keep_s3_xls<-sapply(df_list_s3_xls,is.list)
df_list_s2_xls<- df_list_s2_xls [which(keep_s2_xls==TRUE)]
df_list_s3_xls<- df_list_s3_xls [which(keep_s3_xls==TRUE)]

##We only want the sheet with the AIF table, which has 10 columns.
n.cols_xls<-unlist(lapply(df_list_xls, function(t) dim(t) [2])) #[1] for rows, [2] for columns
n.cols_s2_xls<-unlist(lapply(df_list_s2_xls, function(t) dim(t) [2]))
n.cols_s3_xls<-unlist(lapply(df_list_s3_xls, function(t) dim(t) [2]))

df_list_xls<-df_list_xls[which(n.cols_xls==10)]
df_list_s2_xls<-df_list_s2_xls[which(n.cols_s2_xls==10)]
df_list_s3_xls<-df_list_s3_xls[which(n.cols_s3_xls==10)]

#Sometimes, the second or third sheet has 10 columns, but is not the sheet with the AIF Table. 
    #This causes duplicates, as the sheet with the AIF table is, in that case, correctly in  
    #respectively the first and second sheet. 

names_first_sheet<-names(df_list_xls)

df_list_s2_xls<- df_list_s2_xls[- which(names(df_list_s2_xls) %in% names_first_sheet) ]

#For May 2018, the correct sheet is the third one, and the second one has 10 columns. It is the only case, so we correct it manually.
#If rbind fails because the sixth column is double for a given table, it means that table needs to be 
#reloaded manually. 
df_list_s2_xls<-within(df_list_s2_xls, rm("2018_05.xls"))

df_list_s3_xls<- df_list_s3_xls[- which(names(df_list_s3_xls) %in% names_first_sheet) ]


df_AIF <- bind_rows(c(df_list_xls), .id = "file")
df_AIF_s2<-bind_rows (c(df_list_s2_xls), .id="file")
df_AIF_s3<-bind_rows (c(df_list_s3_xls), .id="file")

df_AIF<-df_AIF[,1:11] #We keep only the first 11 columns: the file name and the 10 columns with relevant data.
df_AIF_s2<-df_AIF_s2[,1:11] 
df_AIF_s3<-df_AIF_s3[,1:11] 

df_AIF<-rbind(df_AIF,df_AIF_s2,df_AIF_s3) #We concatenate all AIF table into one dataset
table(df_AIF$file) ###We check all periods are in the df, true at least for the 2014- Sep. 2022 period


rm(list=ls(pattern="*df_list"))
rm(list=ls(pattern="*n.cols"))
rm(list_xls,keep_s2_xls,keep_s3_xls,df_AIF_s2,df_AIF_s3,names_first_sheet)




df_AIF<-df_AIF %>% 
  mutate(file=gsub(".xlsx","",file),
         file=gsub(".xls","",file),
    year=as.integer(substr(start=1,stop=4,file)), 
    month=substr(start=5,stop=length(file),file), 
    month=gsub("_","",month),
    month=gsub("enero","01",month),  
    month=gsub("febrero","02",month),  
    month=gsub("marzo","03",month),  
    month=gsub("abril","04",month),  
    month=gsub("mayo","05",month),  
    month=gsub("junio","06",month),  
    month=gsub("julio","07",month),  
    month=gsub("agosto","08",month),  
    month=gsub("septiembre","09",month),  
    month=gsub("octubre","10",month),  
    month=gsub("noviembre","11",month),  
    month=gsub("diciembre","12",month) 
    ) %>%
  select(c(file,month,year,everything())) %>% 
  select(-c(4))

list_AIF<-c("concepto","tesoro_nac","recursos_afect","org_desc","ISS","Ex-cajas_prov","total_AN","PAMI_otros","total")
names(df_AIF)<-c("archivo","mes","ano4",list_AIF)
control<-df_AIF %>% 
  subset(!grepl("[0-9]",total)) %>% 
  subset(grepl("[0-9]",total_AN)) #We show there is no relevant information when the "total" variable is blank
head(control)
rm(control)

list_AIF<-list_AIF[list_AIF!="concepto"]

df_AIF<-df_AIF %>% 
  subset(grepl("[0-9]",total)) %>%  #We delete lines with no information (no numeric data on the total variable)
  mutate(across(list_AIF ,~as.double(.x) #The remaining lines are converted to numeric
         )) %>% 
  group_by(archivo) %>% 
  mutate(numero_linea=row_number()) %>% 
  ungroup() %>%   #Row number keeps the integrity of each table even when arranged
  select(c("archivo","ano4","mes","numero_linea",everything()))

table_file_size<-df_AIF %>% 
  group_by(archivo) %>% 
  tally() %>% 
  ungroup() %>%  #The most recent monthly AIF lacks financial sources and applications, beware. 
  rename(total_lineas=n)



##This gives us a concatenation of each monthly Savings-Investment-Funding account for Argentina, 
#for the wanted period. Here we are only interested in fiscal income for social security


#Concept names may change; run this to check how the concept you are interested in may be named. 
    #Combine with row number for some concepts that may be repeated (such as "transferencias corrientes)
concept_names<- as.data.frame(df_AIF$concepto)
view(concept_names)
#Here, we are only interested in ANSES fiscal income, used for pension mobiliy computation. 

df_ISS_fiscal_income<-df_AIF %>% 
  mutate(is_fiscal_income=ifelse(grepl("*INGRESOS TRIBUTARIOS",concepto), 1, 
                                 0)
         )%>% 
  subset(is_fiscal_income==1 ) %>% 
  mutate(mes_num=as.numeric(mes)) %>% 
  arrange(ano4,mes) %>% 
  select(c(ano4,mes,concepto,ISS))
#Here we check is_fiscal_income captures all rows that correspond to fiscal income, and only 
#those rows.
total_files<-nrow(as.data.frame(table(df_AIF$archivo)))
head(total_files)
table(df_ISS_fiscal_income$concepto) 

#We update ANSES fiscal income information in the global file
vector_ISS_fiscal_income<-df_ISS_fiscal_income %>% 
  subset(ano4>=2018) %>%  #We added manual corrections in 2017 to account for 2017 fiscal amnesty tax income
  select(c(ISS))

range_write(vector_ISS_fiscal_income,ss=id_globals,range="I284",col_names =FALSE,sheet="Pessimistic projection",reformat=FALSE) #

rm(total_files,control,list_AIF,table_file_size,concept_names,vector_ISS_fiscal_income,df_ISS_fiscal_income)

end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)
#On 4 GB Ram laptop, 7.6 minutes. 
#Cleanup -----
rm(output_name,sheet_name)
setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private/R_files_for_MISSAR/")
unlink("download_folder",recursive=TRUE)
rm(list=ls())
