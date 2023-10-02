#Load workspace------
##Packages -----
rm(list=ls())
gc()

# Open packages
library(tidyverse)
library(readxl)
library(openxlsx)
library(Rcpp)
library(questionr)
library(readr)
library(googlesheets4)
library(googledrive)
library(glue)
library(rlist)
library(xml2)
library(rvest)
library(RSelenium)

gs4_auth() #Connection to google account

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 
id_globals_senate<- drive_get("Globals_moratorium_senate") 
##Generate temporary download folder----
setwd("C:/Users/lcalcagno/Documents/Investigaci?n/")
setwd("MISSAR_private/R_files_for_MISSAR/Update_globals")

if(!file.exists("download_folder")) {
  dir.create("download_folder")
}
setwd("download_folder/")

#Inflation figures -----
##Find correct URL-----
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
rm(date,year,month,lag_year,lag_month)

urlFileExist <- function(url){ #Source: https://stackoverflow.com/questions/60318926/how-to-check-if-file-exists-in-the-url-before-use-download-file-in-r
  HTTP_STATUS_OK <- 200
  hd <- httr::HEAD(url)
  status <- hd$all_headers[[1]]$status
  list(exists = status == HTTP_STATUS_OK, status = status)
}

current_month_exists<-urlFileExist(CPI_url)$exists
last_month_exists<-urlFileExist(alt_CPI_url)$exists
#The INDEC usually creates the future URL a couple of days before releasing the CPI index, so the URL might exist even though the downloaded
    #excel file is wrong. We run this function to verify the downloaded file is correct. Returns FALSE when the URL does not exist.
is_excel<-function(url){
  get_file<-try(download.file(url,destfile="verify.xls",mode="wb"),silent=FALSE,outFile="")
  open_file<-try(read_excel("verify.xls"),silent=FALSE,outFile="")
  is_file_correct<-if("try-error" %in% class(open_file)) {FALSE}
  else{TRUE}
  is_file_correct<-is_file_correct
}

#fake_URL<-"VerifyFakeUrl"
#should_be_false<-is_excel(fake_URL)

current_month_is_excel<-is_excel(CPI_url)
unlink("verify.xls",recursive=TRUE)
last_month_is_excel<-is_excel(alt_CPI_url)
unlink("verify.xls",recursive=TRUE)

correct_CPI_url<- if(current_month_exists==TRUE & current_month_is_excel==TRUE){CPI_url
}else if(last_month_exists==TRUE & last_month_is_excel==TRUE) {alt_CPI_url
} else {"ERROR"
}

correct_CPI_url #Prints the URL, shows ERROR if neither exist

download.file(
  url = correct_CPI_url, 
  destfile = "latest_CPI.xls", mode='wb'
)

rm(correct_CPI_url,alt_CPI_url,CPI_url,current_month_exists,last_month_exists)
##Update sheet----
df_latest_CPI<-read_excel("latest_CPI.xls",sheet="?ndices IPC Cobertura Nacional") %>% 
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

range_write(df_CPI_for_globals,ss=id_globals,range="E889",col_names =FALSE,sheet="Inflation and wages",reformat=FALSE)
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


#RIPTE wage index --------

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

#ANSES fiscal income, from Savings-Investment-Funding Account----

#On 4 GB Ram laptop, 7.6 minutes. 
start.time=Sys.time()

##Go to the folder with updated AIF files (see download_all_AIF)
setwd("C:/Users/lcalcagno/Documents/Investigaci?n/")
setwd("MISSAR_private/R_files_for_MISSAR/Scraped_datasets/AIF")
getwd()
###The only month that does not work is January 2000, it is a weird xml file. You need to open it with 
#excel, and save it as an excel file in the AIF folder with a different name (2000_enero for instance). 

list_xls <- list.files(pattern='*.xls')
list_xls<-list_xls[!list_xls %in% "2000_01.xls"]

###Import all downloaded excel files (from https://stackoverflow.com/questions/32888757/how-can-i-read-multiple-excel-files-into-r)
#We added manual corrections in 2017 to account for 2017 fiscal amnesty tax income. Thus, we only
    #want ANSES fiscal income starting from 2018
#This function lets us specify we only want to upload files from 2018 onward.
load_some_years<-function(min_year,max_year){
  df_list_xls <- as.data.frame(list.files(pattern='*.xls')) %>%
    rename(file_name=1) %>% 
    mutate(year=as.integer(substr(start=1,stop=4,file_name))) %>% 
    subset(year>=min_year & year<=max_year) %>%  #The comparative sheet is only available starting from January 2017
    select(c(file_name)) %>% 
    t()
  
  list_xls<-as.character(df_list_xls)
}

list_xls<-load_some_years(2018,2100)
view(list_xls)
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


###Detect AIF columns, even when in disorder------

n.cols_xls<-unlist(lapply(df_list_xls, function(t) dim(t) [2])) #[1] for rows, [2] for columns
n.rows_xls<-unlist(lapply(df_list_xls, function(t) dim(t) [1])) #[1] for rows, [2] for columns
view(n.rows_xls)
#The fourth quarter of 2015 datasets have too many rows, we take it into account in the get_col_names() function

track_index<-0
##We detect AIF columns with the get_col_names() function
get_col_names<-function(indata){
  track_index<<-track_index+1
  print(track_index)
  #Fourth quarter of 2015 dataframe have too many rows, which causes bugs: we take only the first 
  #160 rows 
  if(nrow(indata)>160){
    indata<-indata[1:160,]  
  }else{
    indata<-indata
  }
  last_column<-length(indata)
  #The last column is always the total for the whole national administration; 
  #The first column is always useless, and the second has the row name 
  row_name<-indata %>% 
    select(c(1,2))
  names(row_name)<-c("sec_hacienda","concepto") 
  row_name<-row_name %>% 
    mutate(concepto=ifelse(is.na(concepto), sec_hacienda, 
                           concepto)#Sometimes the row name ends up in the first, instead of second, column
    ) %>% 
    select(c(concepto))
  
  total_APN<-indata %>% 
    select(c(all_of(last_column))
    )
  names(total_APN)<-c("total")
  
  indata<-indata %>% 
    select(-c(1,2,all_of(last_column)))
  
  list_patterns<-c("TES","AFECT","DESC","INST","CAJAS","TOTAL","OTROS|EMPRESAS")
  detect_names<-indata[(!grepl("[0-9]", indata$...3)) & !is.na(indata$...3), ] #Only keep rows with characters
  correct_names<-c("tesoro_nac","recursos_afect","org_desc","ISS","Ex_cajas_prov","total_AN","PAMI_otros")
  #head(detect_names)
  #detect_names<-detect_names %>% 
  # select(c("...5",everything())) #We check this function works with out-of-order datasets
  
  for(i in 1:7) {
    for (j in 1:7){
      #This keeps only rows where the ith pattern is present in the jth column; there, we rename the  
      #jth column following the ith correct name
      #First we keep rows where the ith pattern is present in the jth column  
      is_name_in_pattern<-detect_names [grepl(list_patterns[i],detect_names[[j]],ignore.case=TRUE),]
      #Second, we keep only the column where the ith pattern is present
      is_name_in_pattern<-is_name_in_pattern[,grepl(list_patterns[i],detect_names,ignore.case=TRUE)]
      is_name_in_pattern<-as.data.frame(is_name_in_pattern)
      #  print(is_name_in_pattern)
      
      #When the ith pattern is present in the jth column, we get a 1x1 df 
      newcol<-correct_names[i]
      oldcol<-colnames(detect_names)[j]
      # print(newcol)
      #print(oldcol)
      
      if((nrow(is_name_in_pattern)>=1 & nrow(is_name_in_pattern)<=2 ) & ncol(is_name_in_pattern)==1){ #So if we have a 1x1 or 1x2 df
        detect_names<-detect_names %>%
          rename(!!newcol := !!oldcol) #We rename the jth column with the ith correct column name
      }else{ detect_names<-detect_names
      } 
    }
  }
  names(indata)<-names(detect_names)
  outdata<-as.data.frame(c(row_name,indata,total_APN))
}
#We now apply this function to all the data frames
options(error = NULL)
track_index<-0
df_list_xls<-sapply(df_list_xls,get_col_names,simplify=FALSE)
#debug<-df_list_xls[85], for instance, gives the 85th element of df_list_xls
track_index<-0
df_list_s2_xls<-sapply(df_list_s2_xls,get_col_names,simplify=FALSE)
track_index<-0
df_list_s3_xls<-sapply(df_list_s3_xls,get_col_names,simplify=FALSE)

#It is now safe to use bind_rows on all lists of data frames
df_AIF <- bind_rows(c(df_list_xls), .id = "file")
df_AIF_s2<-bind_rows (c(df_list_s2_xls), .id="file")
df_AIF_s3<-bind_rows (c(df_list_s3_xls), .id="file")

df_AIF<-rbind(df_AIF,df_AIF_s2,df_AIF_s3) #We concatenate all AIF table into one dataset
###We check all periods are in the df. It is true for the 1997-Sep. 2022 period. The only missing month
#is September 2007. 
table(df_AIF$file)

rm(list=ls(pattern="*df_list"))
rm(list=ls(pattern="*n.cols"))
rm(list_xls,keep_s2_xls,keep_s3_xls,df_AIF_s2,df_AIF_s3,names_first_sheet,track_index)



##Format AIF dataset ------

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
  select(c(file,month,year,everything())) 

control<-df_AIF %>% 
  subset(!grepl("[0-9]",total)) %>% 
  subset(grepl("[0-9]",total_AN)) #We show there is no relevant information when the "total" variable is blank
head(control)
rm(control)

####Control: colummns have correct names-----
list_AIF<-c("concepto","tesoro_nac","recursos_afect","org_desc","ISS","Ex_cajas_prov","total_AN","PAMI_otros","total")
list_patterns<-c("TES","AFECT","DESC","INST","CAJAS","TOTAL","OTROS|EMPRESAS")
list_control<-list_AIF[list_AIF!="concepto" & list_AIF!="total"]
list_control_subset<-append(list_control,"file")

control<-df_AIF %>% 
  select(c(all_of(list_control_subset))) %>% 
  mutate(across(all_of(list_control),~gsub("\\d+",NA,.x)) #We delete all numbers
  ) 
control<-control[rowSums(is.na(control)) != ncol(control)-1,] #We delete all rows where only the file name remains


df_loop<-as.data.frame(cbind(list_control,list_patterns))
control<-control %>% 
  mutate(has_error=0)

for (i in 1:7){
  incorrect_patterns<-list_patterns[list_patterns!=df_loop[i,2]] #We check for all the wrong patterns for the column
  print(df_loop[i,2])
  incorrect_patterns<-paste(incorrect_patterns,collapse="|")
  print(incorrect_patterns)
  control<-control %>% 
    mutate(has_error=ifelse(grepl(incorrect_patterns,df_loop[i,1],ignore.case=TRUE),1, 
                            has_error)
    )
  print(df_loop[i,1])
}

errors<-control %>% 
  subset(has_error==1)
head(errors) #Shows files with errors in column names. 
rm(control,errors,incorrect_patterns,list_patterns,df_loop)


###Get numeric data -----
df_AIF<-df_AIF %>% 
  subset(grepl("[0-9]",total)) %>%  #We delete lines with no information (no numeric data on the total variable)
  mutate(across(all_of(list_AIF[list_AIF!="concepto"]),~as.double(.x) #The remaining lines are converted to numeric
  )) %>% 
  group_by(file) %>% 
  mutate(table_line=row_number()) %>% 
  ungroup() %>%   #Row number keeps the integrity of each table even when arranged
  select(c("file","year","month","table_line",everything()))

table_file_size<-df_AIF %>% 
  group_by(file) %>% 
  tally() %>% 
  ungroup() %>%  #The most recent monthly AIF often lacks financial sources and applications, beware. 
  rename(table_line=n)



##This gives us a concatenation of each monthly Savings-Investment-Funding account for Argentina, 
#for the wanted period. Here we are only interested in fiscal income for social security


#Concept names may change; run this to check how the concept you are interested in may be named. 
#Combine with row number for some concepts that may be repeated (such as "transferencias corrientes)

missing_concept<-df_AIF %>% 
  subset(is.na(concepto)) #Verify if the concepto column is missing
head(missing_concept)
df_AIF<-df_AIF %>% 
  subset(!is.na(concepto))

concept_names<- as.data.frame(df_AIF$concepto) %>% 
  distinct()
view(concept_names)

##Update global----
#Here, we are only interested in ANSES fiscal income, used for pension mobility computation. 



df_ISS_fiscal_income<-df_AIF %>% 
  mutate(is_fiscal_income=ifelse(grepl("*INGRESOS TRIBUTARIOS",concepto), 1, 
                                 0)
  )%>% 
  subset(is_fiscal_income==1 ) %>% 
  mutate(month_num=as.numeric(month)) %>% 
  arrange(year,month) %>% 
  select(c(year,month,concepto,ISS))
#Here we check is_fiscal_income captures all rows that correspond to fiscal income, and only 
#those rows.
total_files<-nrow(as.data.frame(table(df_AIF$file)))
head(total_files)
table(df_ISS_fiscal_income$concepto) 

#We update ANSES fiscal income information in the global file
vector_ISS_fiscal_income<-df_ISS_fiscal_income %>% 
  select(c(ISS))

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 
range_write(vector_ISS_fiscal_income,ss=id_globals,range="I284",col_names =FALSE,sheet="Pessimistic projection",reformat=FALSE) #

rm(total_files,control,list_AIF,table_file_size,concept_names,vector_ISS_fiscal_income,df_ISS_fiscal_income)

end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)


# Social security contributions----
#Set the working directory to the folder with the downloaded monthly social security bulletin excel files

#On 4 GB Ram laptop, 2 minutes. 
start.time=Sys.time()
setwd("C:/Users/lcalcagno/Documents/Investigaci?n/")
setwd("MISSAR_private/R_files_for_MISSAR/Scraped_datasets/bol_men_ss")
getwd()
##Load bulletin files----
#List all social-security bulletin excel files
list_xls<-list.files(pattern='*.xls')
###Import all downloaded excel files (from https://stackoverflow.com/questions/32888757/how-can-i-read-multiple-excel-files-into-r)

#Social security contributions for ANSES are always on sheet "Cuadro 9" from May 2003 to November 2008; 
    #after that date, they are always on sheet "Cuadro 8". We thus identify for which df we import sheet "Cuadro 9", 
    #and for which others we import sheet "Cuadro 8". 

df_list_xls <- as.data.frame(list.files(pattern='*.xls')) %>%
  rename(file_name=1) %>% 
  mutate(title_length=str_count(file_name), #File names have either 2 or 4 digit years, we identify them
         year=ifelse(title_length!=9, as.integer(substr(start=1,stop=4,file_name)), #4 digit years
                     as.integer(paste0("20",substr(start=1,stop=2,file_name)) #2 digit years
                     )
                     ), 
         alt_name=gsub("[^0-9_]","",file_name), #deletes everything except _ and numbers
         month=as.integer(substr(start=str_count(alt_name)-1,stop=str_count(alt_name),alt_name))
         )

list_xls_pre_2008<-df_list_xls %>% 
  subset(year<=2007 | (year==2008 & month!=12)) %>%  #For all datasets up to November 2008
  #You can restrict imported years or months with another subset() instruction
  select(c(file_name)) %>% 
  t() %>% 
  as.character()


list_xls_2008_2016<-df_list_xls %>% 
  subset((year<2017 & year>=2009) | (year==2008 & month==12)) %>%  #For all datasets since December 2008
  #You can restrict imported years or months with another subset() instruction
  select(c(file_name)) %>% 
  t() %>% 
  as.character()

list_xls_post_2017<-df_list_xls %>% 
  subset(year>=2017) %>%  #For all datasets since December 2008
  #You can restrict imported years or months with another subset() instruction
  select(c(file_name)) %>% 
  t() %>% 
  as.character()


read_cuadro_8<-function(path){
  nm_8 <- try(grep("Cuadro 8", excel_sheets(path), 
               ignore.case = TRUE, value = TRUE)
              )
  x <- try(read_excel(path=path, sheet = nm_8,skip=9))#No relevant information, and sometimes causes bugs
  
}

read_cuadro_9<-function(path){
  
  nm_9 <- try(grep("Cuadro 9", excel_sheets(path), 
               ignore.case = TRUE, value = TRUE)
              )
  x <- try(read_excel(path=path, sheet = nm_9))
  x<-x %>% 
    filter(if_any(everything(), ~ grepl("*Anses", .x,ignore.case=TRUE))) %>%  #This keeps rows where the "Anses" pattern appears at least once
    rename(destino=3,
           monto=4) %>% 
    mutate(monto=as.double(monto)) %>% 
    select(c(destino,monto)) #Keeps only the destination and total pesos transferred
}

rm(list_xls,df_list_xls)
##Pre-2017 files----
gc()
df_list_pre_2008<-sapply(list_xls_pre_2008,read_cuadro_9,simplify=FALSE)#This keeps the file names 
gc()
df_list_2008_2016<-sapply(list_xls_2008_2016,read_cuadro_8,simplify=FALSE)#This keeps the file names 

format_cuadro_8_monthly<-function(x){
  x<-x %>% 
    filter(if_any(everything(), ~ grepl("*Anses", .x,ignore.case=TRUE))) %>%  #This keeps rows where the "Anses" pattern appears at least once
    rename(destino=3,
           monto=4) %>% 
    mutate(monto=as.double(monto)) %>% 
    select(c(destino,monto)) #Keeps only the destination and total pesos transferred
}

df_list_2008_2016<-sapply(df_list_2008_2016,format_cuadro_8_monthly,simplify=FALSE)
gc()

df_2003_2016<- bind_rows(c(df_list_pre_2008,df_list_2008_2016), .id = "file_name") %>% 
  mutate(title_length=str_count(file_name), #File names have either 2 or 4 digit years, we identify them
         year=ifelse(title_length!=9, as.integer(substr(start=1,stop=4,file_name)), #4 digit years
                     as.integer(paste0("20",substr(start=1,stop=2,file_name)) #2 digit years
                     )
         ), 
         alt_name=gsub("[^0-9_]","",file_name), #deletes everything except _ and numbers
         month=as.integer(substr(start=str_count(alt_name)-1,stop=str_count(alt_name),alt_name))
        ) %>% 
  select(c(year,month,monto)) %>% 
  mutate(monto=ifelse(year==2016 & month==12, monto*1000, #December 2016, the imported data is in millions, not in thousands
                      monto),
         monto=monto/1000 #Puts transfers in millions of pesos
         )
head(df_2003_2016)
gc()

##Post- 2017 files----
df_list_post_2017<-sapply(list_xls_post_2017,read_cuadro_8,simplify=FALSE)


format_cuadro_8_yearly<-function(x){
  x<-x %>% 
    filter(if_any(everything(), ~ grepl("*Anses", .x,ignore.case=TRUE)))     #This keeps rows where the "Anses" pattern appears at least once
  
  column_names<-as.data.frame(names(x)) %>% 
    rename(month=1) %>% 
    mutate(idmerge=row_number())
  
  x<-x %>% 
    t() %>% 
    as.data.frame()%>% 
    rename(monto=1) %>% 
    mutate(idmerge=row_number()) %>% 
    left_join(column_names) %>% 
    select(-c(idmerge))
  
  x<-x[(grepl("[0-9]", x$monto)),]#Keeps only lines with numeric data
  x<-x %>% 
    mutate(numeric_month=row_number(), #Puts numeric months, for compatibility with pre-2017 datasets
           monto=as.double(monto)
           )   
  }

df_list_post_2017<-sapply(df_list_post_2017,format_cuadro_8_yearly,simplify=FALSE)

df_post_2017<-bind_rows(c(df_list_post_2017), .id="file_name") %>% 
  mutate(year=as.integer(substr(start=1,stop=4,file_name))) %>% 
  select(c(year,month,numeric_month,monto))

#table(df_post_2017$numeric_month,df_post_2017$month) #run this to verify the numeric months are correct
df_post_2017<-df_post_2017 %>% 
  select(-c(month)) %>% 
  rename(month=numeric_month)

#Time series of monthly ANSES contributions, in millions of current pesos
df_ANSES_contributions<-rbind(df_2003_2016,df_post_2017) 
rm(df_2003_2016,df_post_2017)
rm(list=ls(pattern="df_list_*"))
##Independent workers -----
  #We made the historical excel manually with data from https://www.afip.gob.ar/estudios/anuario-estadisticas-tributarias/ 
     #from 1998 to 2003.
  #The objective here is to get these cal_auton_h_p , cal_auton_f_p, cal_mono_h_p and cal_mono_f_p alignment tables automatically. 
#We take from the same excel than social security contributions the amount of autonomous workers and monotributistas since 2003.

read_cuadro_1<-function(path){
  nm_1 <- try(grep("Cuadro 1", excel_sheets(path), 
                   ignore.case = TRUE, value = TRUE)
  )
  nm_1<-nm_1[[1]]
  x <- try(read_excel(path=path, sheet = nm_1))#No relevant information, and sometimes causes bugs
}

###2003-2017 files ------

gc()
df_list_2003_2008_ind<-sapply(list_xls_pre_2008,read_cuadro_1,simplify=FALSE)#This keeps the file names 
df_list_2008_2016_ind<-sapply(list_xls_2008_2016,read_cuadro_1,simplify=FALSE)#This keeps the file names 
correct<-df_list_2008_2016_ind$"2013_07.xls" %>% 
  select(-c(1,2))#There are two columns with useless data in this excel
df_list_2008_2016_ind$"2013_07.xls"<-correct
rm(correct)

df_list_post_2017_ind<-sapply(list_xls_post_2017,read_cuadro_1,simplify=FALSE)#This keeps the file names 

drop_all_na<-function(indata){
  outdata<-indata[,colSums(is.na(indata))<nrow(indata)] #Drop cols with all missing
  outdata<-outdata[rowSums(is.na(outdata))<ncol(outdata),] #Drop rows with all missing
}
format_cuadro_1_monthly<-function(indata,corr_nrow){
 # for(i in 1:length(df_list_2008_2016_ind)){
 # indata<-df_list_2008_2016_ind[[i]]
#  corr_nrow<-99
  has_num<-colSums(mapply(grepl,"[0-9]",indata)) #Detects, for each column, how many lines have at least one integer
  has_char<-colSums(mapply(grepl,"^[A-Za-z]",indata)) #Detects, for each column, how many lines have at least one character
  output<-indata[,has_char>4 | has_num>=6] %>%  #Relevant columns have at least 5 lines with text or 8 lines with integers
    as.data.frame() %>% 
    drop_all_na()
  
  is_percent<-colSums(mapply(grepl,"VARIAC|Variac",output))#We take out columns with percent variations
  output<-output[,!is_percent] 
  if(nrow(output)==corr_nrow){ #Two dfs have useless information in the first row, we trim them
    output<-output[2:nrow(output),]
  }
  output<-output %>% 
    drop_all_na()
  #print(i)
#  }
}
df_list_2003_2008_ind<-sapply(df_list_2003_2008_ind,format_cuadro_1_monthly,22,simplify=FALSE)
df_list_2008_2016_ind<-sapply(df_list_2008_2016_ind,format_cuadro_1_monthly,99,simplify=FALSE)
get_contributors_monthly<-function(indata){
  output<-indata %>% 
    subset(!is.na(.[[2]]))#Keep, from second column, only non-missing lines
  #We want an output with 9 rows, so we can cbind() later in one data frame  
  if(nrow(output)<9){
     output<-NA %>% #First row normally includes the month
       rbind(output)  
  }
  if(nrow(output)==8) #This happens for later datasets, where "cotizantes totales seguridad social" are no longer informed 
  {first_half<-output[1:3,]
  second_half<-output[4:nrow(output),]
  output<-first_half %>% 
    rbind(NA) %>% 
    rbind(second_half)
  }
  output<-output
  
}
df_list_2008_2016_ind<-sapply(df_list_2008_2016_ind,get_contributors_monthly,simplify=FALSE)
df_list_post_2017_ind<-sapply(df_list_post_2017_ind,format_cuadro_1_monthly,99,simplify=FALSE)

gc()
first_col<-df_list_2003_2008_ind[[1]] %>% 
  rename(indep_type=1, 
         subsystem=2)
for (i in 2:length(df_list_2003_2008_ind)){
  extract_data<-df_list_2003_2008_ind[[i]] %>% 
    select(c(3))
  first_col<-first_col %>% 
    cbind(extract_data)
}
df_indep_2003_2008<-first_col #Monthly information on registered independent workers
rm(first_col,i,extract_data)

first_col<-df_list_2008_2016_ind[[1]] %>% 
  select(c(1)) %>% 
  rename(indep_type=1) %>% 
  mutate(indep_type=ifelse(row_number()==1, "Mes", 
                           ifelse(row_number()==2, "Anio", 
                                  indep_type)
                           )
  )

for (i in 1:length(df_list_2008_2016_ind)){
  print(i)
  extract_data<-df_list_2008_2016_ind[[i]] %>% 
    select(c(2))
  first_col<-first_col %>% 
    cbind(extract_data)
}

df_indep_2008_2016<-first_col #Monthly information on registered independent workers
rm(first_col,i,extract_data)


first_col<-df_list_post_2017_ind[[1]] %>% 
  rename(indep_type=1) %>% 
  subset(!is.na(.[[2]])) %>% 
  select(c(1)) 
first_col<-rbind(c("Year"),first_col) #Add year in first row
first_col[[2,1]]<-"Month"
for (i in 1:length(df_list_post_2017_ind)){
format_df<-df_list_post_2017_ind[[i]]
format_df<-format_df %>% 
  subset(!is.na(.[[2]])) %>% #Keep, from second column, only non-missing lines
  select(-c(1))
format_df<-rbind(c(2016+i),format_df)#Add year in first row
first_col<-first_col %>% 
  cbind(format_df)
}
df_indep_post_2017<-first_col
rm(first_col,format_df,i)

format_aportantes<-function(indata,last_row){
  df_aportantes<-indata[1:last_row,] 
  df_aportantes<-df_aportantes %>% 
    t() %>% 
    as.data.frame() %>% 
    subset(grepl(pattern="[0-9]",.[[3]],ignore.case=TRUE))
  if(ncol(df_aportantes)==5){
    df_aportantes<-df_aportantes %>% 
      rename(mes=1,
             anio=2,
             aportantes=3,
             cot_tot_ss=4,
             cot_SIPA=5
      )
  }
  if(ncol(df_aportantes)==4){
    df_aportantes[,5]<-NA
    df_aportantes<-df_aportantes %>% 
      rename(mes=2,
             anio=1,
             aportantes=3,
             cot_SIPA=4,
             cot_tot_ss=5
      ) %>% 
      select(c(mes,anio,aportantes,cot_tot_ss,cot_SIPA))
    
  }
 df_aportantes<-df_aportantes %>% 
    mutate(anio=gsub(pattern="[A-Z]",replacement="",ignore.case=TRUE,anio),
           across(-c(mes),~as.integer(.x)))
  
}

df_aportantes_2003_2008<-format_aportantes(df_indep_2003_2008,5)
df_aportantes_2008_2016<-format_aportantes(df_indep_2008_2016,5)
df_aportantes_post_2017<-format_aportantes(df_indep_post_2017,4)
df_aportantes<-df_aportantes_2003_2008 %>% 
  rbind(df_aportantes_2008_2016) %>% 
  rbind(df_aportantes_post_2017)
rm(df_aportantes_2003_2008,df_aportantes_2008_2016,df_aportantes_post_2017)

df_indep_afjp<-df_indep_2003_2008[-c(3:5),] %>%
  subset(!is.na(.[[3]])) %>% 
  select(-c(1)) %>% 
  t() %>% 
  as.data.frame() %>% 
  rename(mes=1,
         anio=2,
         auton_tot=3,
         auton_rep=4,
         auton_afjp=5,
         auton_ns=6,
         sal_tot=7,
         sal_rep=8,
         sal_afjp=9,
         sal_ns=10,
         mixto_tot=11,
         mixto_rep=12,
         mixto_afjp=13,
         monotributo=14
         ) %>% 
  subset(!is.na(anio)) %>% 
  mutate(anio=gsub(pattern="[A-Z]",replacement="",ignore.case=TRUE,anio),
         across(-c(mes),~as.integer(.x)))
  
df_indep_1<-df_indep_2008_2016[-c(3:5),] 
df_indep_2<-df_indep_post_2017[-c(3:4),-c(1)] 
mes<-df_indep_2[2,]
df_indep_2<-df_indep_2[-c(2),]
df_indep_2<-rbind(mes,df_indep_2)#Put month in first row
rm(mes)
names(df_indep_2)<-paste0("V",c(1:ncol(df_indep_2)))

df_indep<-df_indep_1 %>% 
  cbind(df_indep_2)
rm(df_indep_1,df_indep_2)

df_indep<-df_indep%>% 
  t() %>% 
  as.data.frame() %>% 
  rename(mes=1,
         anio=2,
         auton_tot=3,
         sal_tot=4,
         mixto_tot=5,
         monotributo=6
  )
df_indep<-df_indep[-c(1),] %>% 
  mutate(anio=gsub(pattern="[A-Z]",replacement="",ignore.case=TRUE,anio),
         across(-c(mes),~as.integer(.x)))

##Labour ministry data-----

get_href<-function(html){
  pg<-read_html(html)
  
  vector_urls<-as.data.frame(html_attr(html_nodes(pg, "a"), "href"))
}
URL<-"https://www.trabajo.gob.ar/estadisticas/" %>% 
  get_href() 

df_URL<-URL%>% 
  subset(grepl(pattern=".xls",.[[1]]) & grepl(pattern="registrado",.[[1]]))


#filter(!if_any(everything(), ~ grepl("*Anses", .x,ignore.case=TRUE))) %>%  #This keeps rows where the "Anses" pattern appears at least once

##Update globals file -----

vector_ANSES_contributions<-df_ANSES_contributions %>% 
  select(c(monto)) %>% 
  mutate(monto=monto*1000) #The excel format is in thousands of pesos

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 
range_write(vector_ANSES_contributions,ss=id_globals,range="H108",col_names =FALSE,sheet="Pessimistic projection",reformat=FALSE) #

rm(vector_ANSES_contributions,df_2003_2016,df_post_2017,
   format_cuadro_8_monthly,format_cuadro_8_yearly,read_cuadro_8,read_cuadro_9)
rm(list=ls(pattern="*df_list"))
rm(list=ls(pattern="*list_"))

end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)


#ANSES benefits-----
setwd("MISSAR_private/R_files_for_MISSAR/Scraped_datasets")
URL <- "https://www.argentina.gob.ar/trabajo/seguridadsocial/bess"


prefix<-"https://www.argentina.gob.ar"


rD <- rsDriver(browser="firefox", port=4545L, verbose=F)
remDr <- rD[["client"]]
remDr$navigate(URL)

##Retirement benefits ------
pasivos <- "Pasivos"
remDr$findElement(using = "id", value = "ponchoTableSearch")$sendKeysToElement(list(pasivos))


Sys.sleep(3) # give the page time to fully load
html <- remDr$getPageSource()[[1]]

pg<-read_html(html)

vector_urls<-as.data.frame(html_attr(html_nodes(pg, "a"), "href"))

vector_pasivos<-vector_urls %>% 
  rename(URL=1) %>% 
  subset(grepl(".xls",URL) & (!grepl("bessj",URL)) & grepl("bess",URL)& grepl("pasivos",URL) ) 

head(vector_pasivos)
rm(vector_urls,pg)

#To get to next page, you need to clicka button referenced with an xpath. You inspect the element, 
    #then right click copy, xpath, and copy it there 
next_page<-"/html/body/main/div[2]/div/section[2]/div/div[1]/div/div/div/div[3]/div/div[3]/div/div/ul/li[4]/a" 
remDr$findElement(using="xpath",value=next_page)$clickElement() #Here you click the next page button

Sys.sleep(3) # give the page time to fully load
html <- remDr$getPageSource()[[1]]

pg<-read_html(html)

vector_urls<-as.data.frame(html_attr(html_nodes(pg, "a"), "href"))


vector_pasivos_2<-vector_urls %>% 
  rename(URL=1) %>% 
  subset(grepl(".xls",URL) & (!grepl("bessj",URL)) & grepl("bess",URL)& grepl("pasivos",URL) ) 

vector_pasivos<-vector_pasivos %>% 
  bind_rows(vector_pasivos_2) %>% 
  unique() %>% 
  mutate(full_URL=paste0(prefix,URL)
         )

vector_pasivos<-vector_pasivos %>% 
  mutate(year=9999,  
         actual_year=year,
        quarter="not_present",
        actual_quarter=quarter
        )

list_quarters<-c("03","06","09","12")

current_year<-Sys.Date() %>% 
  substr(start=1,stop=4) %>% 
  as.integer()


#URLs change, as often excels are updated, and that date appears in the URL as well; it throws off grepl. So we give priority to strings 
    #in the YYYYQQ or YYYY_QQ format

for (i in 2020:current_year) #Excels start in 2020, pdfs are available from 2011
{
  for (j in list_quarters)
  {
    vector_pasivos<-vector_pasivos %>% 
      mutate(year_quarter=paste0(i,j), 
             year_quarter_2=paste0(i,"_",j), 
             quarter=ifelse(grepl(j, URL), j, 
                                   quarter),
             year=ifelse(grepl(i, URL), i, 
                                year),
             actual_quarter=ifelse(grepl(year_quarter,URL),j, 
                            ifelse(grepl(year_quarter_2,URL),j,
                                   actual_quarter
                                   )
                           ),
             actual_year=ifelse(grepl(year_quarter,URL),i, 
                         ifelse(grepl(year_quarter_2,URL),i,
                                actual_year
                                )
                        )
             ) %>% 
      select(-c(year_quarter,year_quarter_2))
     }
}

vector_pasivos<-vector_pasivos %>% 
  mutate(quarter=ifelse(actual_quarter=="not_present", quarter, 
                        actual_quarter), 
         year=ifelse(actual_year==9999, year, 
                     actual_year)
         ) %>% 
  select(-c(actual_quarter,actual_year,URL))

#if(!file.exists("download_folder")) {
#  dir.create("download_folder")
#}
#setwd("download_folder/")


vector_pasivos<-vector_pasivos %>% 
  arrange(year,quarter) %>% 
  mutate(destfile=paste0("pasivos_",year,"_",quarter,".xlsx"))

head(vector_pasivos)

list_URL<-vector_pasivos %>% 
  select(c(full_URL)) %>% 
  t() %>% 
  as.character()
  
dl_benefits<-data.frame()

for (i in 1:nrow(vector_pasivos)){
  download.file(vector_pasivos[[i,1]],destfile=vector_pasivos[[i,4]],mode="wb",overwrite=TRUE)
  
  
  input<-read_excel(vector_pasivos[[i,4]],sheet="2.3.1")  #Reads the sheet with total pension benefits, contributive and non-contributive
 
  
  input<-input[complete.cases(input[,2:(ncol(input)-1)]),] %>% #Keeps only rows with no missing values
    select(-c(ncol(input))) %>% 
    janitor::row_to_names(row_number=1) %>% 
    janitor::clean_names()
  
  input<-input[nrow(input),]
  input<-input %>% 
    mutate(across(everything(),~as.integer(.x)), #We put variables as integer
    ) %>% 
    select(c(2),c(4)) %>% 
    mutate(year=vector_pasivos[[i,2]],
           quarter=vector_pasivos[[i,3]]) %>% 
    select(c(year,quarter,everything()))
  
  dl_benefits<-dl_benefits %>% 
    bind_rows(input)
}
rm(input,pg,vector_pasivos,vector_pasivos_2,vector_urls)
  

#The fourth quarter value is actually a yearly average, we correct this. 
get_4q_value<-function(indata, ano4){
  
indata<-indata %>% 
  subset(year==ano4) %>% 
  select(-c(year)) %>% 
  t() %>%
  as.data.frame()%>%  
  janitor::row_to_names(row_number=1) %>% 
  janitor::clean_names() %>% 
  mutate(across(everything(),~as.integer(.x)) #We put variables as integer
        )

total_quarters<-ncol(indata)
if (total_quarters==4){
  indata<-indata %>% 
    mutate(corr_12=4*x12-x09-x06-x03, #The fourth quarter value is actually a yearly average, we correct this. 
           x12=corr_12) %>% 
    select(-c(corr_12))
}else{
  indata<-indata
}

quarters<-c(3*1:total_quarters)
quarters<-paste0("_q",quarters)
indata_names<-c(paste0("y_",ano4,quarters))
names(indata)<-indata_names
output<-indata
}

df_list_ben<-list()
year<-as.integer(substr(start=1,stop=4,Sys.Date()))

for (i in 2020:year){
  index<-i-2019
  df_list_ben[[index]]<-get_4q_value(dl_benefits,i)
}

df_benefits<-bind_cols(df_list_ben)
rm(df_list_ben)

months_from_quarters<-function(indata){

original_ncols<-ncol(indata)

for(i in 1:(ncol(indata)-1)){
  
  store_names<-names(indata)
  indata<-indata %>% 
    mutate(first_month=indata[,i]*2/3+indata[,i+1]*1/3,
           second_month=indata[,i]*1/3+indata[,i+1]*2/3
          ) 
  
  names(indata)<-c(store_names,paste0("first_month",i),paste0("second_month",i))
 
 
}
head(indata)
for(i in 1:(original_ncols-1)){
   if(i==1){
     indata<-indata %>% 
      select(c(1),c(original_ncols+1),c(original_ncols+2),everything())  
  }else{
    indata<-indata %>% 
    select(all_of(c(1:(1+3*(i-1)))),c(original_ncols+i*2-1),c(original_ncols+2*i),everything())
  }
}
output<-indata
}

df_benefits<-months_from_quarters(df_benefits)

rm(list_quarters,i,j)

##Non-contributive benefits ------
remDr$navigate(URL)
no_contributivo<- "no contributivo"
remDr$findElement(using = "id", value = "ponchoTableSearch")$sendKeysToElement(list(no_contributivo))

Sys.sleep(3) # give the page time to fully load
html <- remDr$getPageSource()[[1]]

pg<-read_html(html)

vector_urls<-as.data.frame(html_attr(html_nodes(pg, "a"), "href"))



vector_PNC<-vector_urls %>% 
  rename(URL=1) %>% 
  subset(grepl(".xls",URL) & (!grepl("bessj",URL)) & grepl("bess",URL)& grepl("pnc",URL) ) 

head(vector_PNC)
rm(vector_urls,pg)


rm(input,pg,vector_pasivos,vector_pasivos_2,vector_urls)

next_page<-"/html/body/main/div[2]/div/section[2]/div/div[1]/div/div/div/div[3]/div/div[3]/div/div/ul/li[4]/a" 
remDr$findElement(using="xpath",value=next_page)$clickElement() #Here you click the next page button


Sys.sleep(3) # give the page time to fully load
html <- remDr$getPageSource()[[1]]

pg<-read_html(html)

vector_urls<-as.data.frame(html_attr(html_nodes(pg, "a"), "href"))

vector_PNC_2<-vector_urls %>% 
  rename(URL=1) %>% 
  subset(grepl(".xls",URL) & (!grepl("bessj",URL)) & grepl("bess",URL)& grepl("pnc",URL) ) 

rm(vector_urls,pg)

#May be best to make a function here, ONGOING


vector_PNC<-vector_PNC %>% 
  bind_rows(vector_PNC_2) %>% 
  unique() %>% 
  mutate(full_URL=paste0(prefix,URL)
  )

vector_PNC<-vector_PNC %>% 
  mutate(year=9999,  
         actual_year=year,
         quarter="not_present",
         actual_quarter=quarter
  )

list_quarters<-c("03","06","09","12")

current_year<-Sys.Date() %>% 
  substr(start=1,stop=4) %>% 
  as.integer()



#If you need to go to previous page


previous_page<-"/html/body/main/div[2]/div/section[2]/div/div[1]/div/div/div/div[3]/div/div[3]/div/div/ul/li[1]/a"
remDr$findElement(using="xpath",value=previous_page)$clickElement() #Here you click the next page button


#Cleanup -----
rm(output_name,sheet_name)
setwd("C:/Users/lcalcagno/Documents/Investigaci?n/")
setwd("MISSAR_private/R_files_for_MISSAR/Update_globals")
unlink("download_folder",recursive=TRUE)
rm(list=ls())
>>>>>>> cd35606c53ff0550008365af624eaaab355f025c
