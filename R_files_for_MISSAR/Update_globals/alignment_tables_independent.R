#Load workspace------
##Packages -----
rm(list=ls())
gc()

# Open packages
library(tidyverse)
library(readxl)
library(googlesheets4)
library(googledrive)
id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") 

#Set the working directory to the folder with the downloaded monthly social security bulletin excel files
setwd("C:/Users/lcalcagno/Documents/Investigacion/")
setwd("MISSAR_private/R_files_for_MISSAR/Scraped_datasets/bol_men_ss")
getwd()
#Independent workers -----
#We made the historical excel manually with data from https://www.afip.gob.ar/estudios/anuario-estadisticas-tributarias/ 
#from 1998 to 2003.
#The objective here is to get these cal_auton_h_p , cal_auton_f_p, cal_mono_h_p and cal_mono_f_p alignment tables automatically. 
#We take from the same excel than social security contributions the amount of autonomous workers and monotributistas since 2003.

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


rm(list_xls,df_list_xls)

read_cuadro_1<-function(path){
  nm_1 <- try(grep("Cuadro 1", excel_sheets(path), 
                   ignore.case = TRUE, value = TRUE)
  )
  nm_1<-nm_1[[1]]
  x <- try(read_excel(path=path, sheet = nm_1))#No relevant information, and sometimes causes bugs
}

###2003-2017 files

gc()
df_list_2003_2008_ind<-sapply(list_xls_pre_2008,read_cuadro_1,simplify=FALSE)#This keeps the file names 
df_list_2008_2016_ind<-sapply(list_xls_2008_2016,read_cuadro_1,simplify=FALSE)#This keeps the file names 
correct<-df_list_2008_2016_ind$"2013_07.xls" %>% 
  select(-c(1,2))#There are two columns with useless data in this excel
df_list_2008_2016_ind$"2013_07.xls"<-correct
rm(correct)
### Post 2017 files
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
 # print(i)
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
##Get contributors data-----
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
download.file(df_URL[[1,1]],destfile="trabajo_registrado.xlsx",mode="wb")
rm(URL,df_URL)
df_workers<-read_excel("trabajo_registrado.xlsx",sheet=4) %>% 
  janitor::row_to_names(row_number=1,remove_row=TRUE)
unlink("trabajo_registrado.xlsx",recursive=TRUE)

has_num<-colSums(mapply(grepl,"[0-9]",df_workers)) #Detects, for each column, how many lines have at least one integer
has_char<-colSums(mapply(grepl,"^[A-Za-z]",df_workers)) #Detects, for each column, how many lines have at least one character
row_has_num<-rowSums(mapply(grepl,"[0-9]",df_workers)) #Detects, for each row, how many lines have at least one integer

df_workers<-df_workers[row_has_num>0,has_char>0 | has_num>0] %>%  #Drop rows and columns with no numbers
  as.data.frame()

detect_variables<-names(df_workers)
autonomos<-grepl("(?=.*indep)(?=.*aut)",detect_variables,ignore.case=TRUE,perl=TRUE)
monotributistas<-grepl("(?=.*monotribut)",detect_variables,ignore.case=TRUE,perl=TRUE)
mono_soc<-grepl("(?=.*social)",detect_variables,ignore.case=TRUE,perl=TRUE)
monotributistas<-monotributistas & !mono_soc
monotributistas<-df_workers[,monotributistas ]
mono_soc<-df_workers[,mono_soc]
autonomos<-df_workers[,autonomos]
periodo<-df_workers[,1]
df_indep_lab<-periodo %>% 
  cbind(autonomos) %>% 
  cbind(monotributistas) %>% 
  cbind(mono_soc) %>% 
  as.data.frame() %>% 
  rename(mes=1) %>%  
  mutate(across(-c(mes),~1000*as.double(.x))) %>% 
  subset(!is.na(autonomos)) %>% 
  mutate(monotributo=monotributistas+mono_soc)
rm(autonomos,monotributistas,mono_soc,periodo,detect_variables)
#Verify the first row is January 2012
first_date<-as.Date(as.integer(df_indep_lab[[1,1]]), origin = "1899-12-30")
if(substr(first_date,start=1,stop=4)!="2012" | substr(first_date,start=6,stop=7)!="01"){
  print("ERROR: Not January 2012, revise code")  
}
rm(first_date)
rm(has_char,has_num,row_has_num)

#Add year data on labour ministry information
df_indep_lab<-df_indep_lab %>% 
  mutate(mes=gsub(pattern="\\*",replacement="",mes),
         mes_date=as.Date(as.integer(mes), origin = "1899-12-30"),
         mes=ifelse(is.na(mes_date), mes, 
                    substr(start=6,stop=7,mes_date)),
         anio=ifelse(is.na(mes_date),as.integer(paste0("20",substr(start=nchar(mes)-1,stop=nchar(mes),mes))),
                     as.integer(substr(start=1,stop=4,mes_date))
         )
  ) %>% 
  rename(auton_tot=autonomos
  )

##Population data----
###2000-2009-----
#id_carpeta<-drive_get("Computed_proportions_of_monotributistas_and_autonomous_workers") 
#For years 2000 to 2009, we use population projections of the Ministry of Health. 
#For 2010 to 2040 it's population projections from the INDEC. 
#We copied data from 2000 to 2009 out of pdfs and into the following sheet that we import here
id_indep<-drive_get("Auton_monotributo_simple_labour_ministry")
df_pop<-read_sheet(ss=id_indep,sheet="pop_2000_2040")
df_men<-df_pop[,1:19]
df_wom<-df_pop[,22:ncol(df_pop)]
df_list_pop<-list()
df_list_pop[[1]]<-df_pop[1:34,] %>% 
  as.data.frame()#2000
df_list_pop[[2]]<-df_pop[35:63,] %>% 
  as.data.frame()#2001
df_list_pop[[3]]<-df_pop[71:99,] %>% 
  as.data.frame() #2002
df_list_pop[[4]]<-df_pop[100:106,] %>% 
  as.data.frame() #2003
df_list_pop[[5]]<-df_pop[107:112,] %>% 
  as.data.frame() #2004
df_list_pop[[6]]<-df_pop[113:118,] %>% 
  as.data.frame() #2005
df_list_pop[[7]]<-df_pop[119:124,] %>% 
  as.data.frame() #2006
df_list_pop[[8]]<-df_pop[125:130,] %>% 
  as.data.frame() #2007
df_list_pop[[9]]<-df_pop[131:136,] %>% 
  as.data.frame() #2008
df_list_pop[[10]]<-df_pop[137:143,] %>% 
  as.data.frame() #2009
df_list_men<-list()
df_list_wom<-list()
for(i in 1:10){
  df<-df_list_pop[[i]]
  vector_names<-c("agegroups","total","age_0_4","age_5_9","age_10_14","age_15_19"
                  ,"age_20_24","age_25_29","age_30_34","age_35_39","age_40_44","age_45_49"
                  ,"age_50_54","age_55_59","age_60_64","age_65_69","age_70_74","age_75_79",
                  "age_80")
  df_men<-df[,1:19] %>% 
    as.data.frame()
  names(df_men)<-vector_names
  df_wom<-df[,22:ncol(df)] %>% 
    as.data.frame()
  names(df_wom)<-vector_names
  
  df_list_men[[i]]<-df_men
  df_list_wom[[i]]<-df_wom
  rm(df,df_men,df_wom)
}
df_active_pop<-data.frame(matrix(nrow=10,ncol=3))
names(df_active_pop)<-c("anio","active_men","active_women")
for (i in 1:10){
  anio<-i+1999
  df_active_pop[[i,1]]<-anio
  indata<-df_list_men[[i]]%>% 
    subset(grepl(pattern="total del",.[[1]],ignore.case=TRUE)) %>% 
    mutate(across(-c(agegroups),~as.double(.x)),
           active_pop=age_15_19*4/5+age_20_24+age_25_29+age_30_34+age_35_39+age_40_44+age_45_49+
             age_50_54+age_55_59+age_60_64+age_65_69)
  df_active_pop[[i,2]]<-indata[[1,ncol(indata)]]
  
  indata<-df_list_wom[[i]]%>% 
    subset(grepl(pattern="total del",.[[1]],ignore.case=TRUE)) %>% 
    mutate(across(-c(agegroups),~as.double(.x)),
           active_pop=age_15_19*4/5+age_20_24+age_25_29+age_30_34+age_35_39+age_40_44+age_45_49+
             age_50_54+age_55_59+age_60_64+age_65_69)
  df_active_pop[[i,3]]<-indata[[1,ncol(indata)]]
}
rm(indata,anio,i)
#filter(!if_any(everything(), ~ grepl("*Anses", .x,ignore.case=TRUE))) %>%  #This keeps rows where the "Anses" pattern appears at least once
###2010-2040-------
URL<-"https://www.indec.gob.ar/ftp/cuadros/poblacion/c2_proyecciones_nac_2010_2040.xls"
download.file(url=URL,destfile="pop_2010_2040.xls",mode="wb")
df_pop_2010_2040<-read_excel("pop_2010_2040.xls",sheet=1)
unlink("pop_2010_2040.xls",recursive=TRUE)
names(df_pop_2010_2040)<-c("agegroups",paste0("year_",2010:2040))

df_men_2010_2040<-df_pop_2010_2040[32:61,] %>% 
  subset(!is.na(year_2011) & !is.na(agegroups)) %>% 
  mutate(year_2010=as.integer(year_2010),
         agegroups=gsub(pattern=" ",replacement="",agegroups),
         agegroups=gsub(pattern="-",replacement="_",agegroups),
         agegroups=paste0("age_",agegroups)
  ) %>% 
  t() %>% 
  as.data.frame() %>% 
  janitor::row_to_names(row_number=1,remove_row=TRUE) %>% 
  mutate(anio=2010:2040,
         across(starts_with("age_"),~as.double(.x)),
         active_men=age_15_19*4/5+age_20_24+age_25_29+age_30_34+age_35_39+age_40_44+age_45_49+
           age_50_54+age_55_59+age_60_64+age_65_69
  ) %>% 
  select(c(anio,active_men))

df_wom_2010_2040<-df_pop_2010_2040[62:91,] %>% 
  subset(!is.na(year_2011) & !is.na(agegroups)) %>% 
  mutate(year_2010=as.integer(year_2010),
         agegroups=gsub(pattern=" ",replacement="",agegroups),
         agegroups=gsub(pattern="-",replacement="_",agegroups),
         agegroups=paste0("age_",agegroups)
  )%>% 
  t() %>% 
  as.data.frame()%>% 
  janitor::row_to_names(row_number=1,remove_row=TRUE)%>% 
  mutate(anio=2010:2040,
         across(starts_with("age_"),~as.double(.x)),
         active_women=age_15_19*4/5+age_20_24+age_25_29+age_30_34+age_35_39+age_40_44+age_45_49+
           age_50_54+age_55_59+age_60_64+age_65_69
  ) %>%  
  select(c(anio,active_women))

df_active_pop_2010<-df_men_2010_2040 %>% 
  left_join(df_wom_2010_2040)
df_active_pop<-df_active_pop %>% 
  rbind(df_active_pop_2010)

##Import 1998-2003 independent data ------
#From https://www.afip.gob.ar/institucional/estudios/serie%2Danual/ we have monthly information on independent workers taken from 
#yearly AFIP tax series. We compiled them in an excel we import here
df_indep_98_03<-read_sheet(ss=id_indep,sheet="Datos mensuales",range="D1:BF35",col_names=FALSE)
col_auton<-df_indep_98_03[10,] %>% 
  t() %>% 
  as.data.frame()
col_mono<-df_indep_98_03[35,] %>% 
  t() %>% 
  as.data.frame()
col_mixto<-df_indep_98_03[28,] %>% 
  t() %>% 
  as.data.frame()
col_anio<-df_indep_98_03[1,]%>% 
  t() %>% 
  as.data.frame()
col_mes<-df_indep_98_03[2,]%>% 
  t() %>% 
  as.data.frame()
col_sal<-df_indep_98_03[20,]%>% 
  t() %>% 
  as.data.frame()
df_indep_98_03<-col_mes %>% 
  cbind(col_anio) %>% 
  cbind(col_auton) %>% 
  cbind(col_sal) %>% 
  cbind(col_mixto) %>% 
  cbind(col_mono)
names(df_indep_98_03)<-c("mes","anio","auton_tot","sal_tot","mixto_tot","monotributo")
rm(list=ls(pattern="col_*"))

#Consolidated indep df--------
df_indep_cal<-df_indep_98_03 %>% 
  select(c(mes,anio,auton_tot,mixto_tot,monotributo))
df_temp<-df_indep_afjp%>% 
  select(c(mes,anio,auton_tot,mixto_tot,monotributo))
df_indep_cal<-df_indep_cal %>% 
  rbind(df_temp)
df_temp<-df_indep%>% 
  subset(anio<=2011) %>%  #From January 2012 onward, we use labour ministry data
  select(c(mes,anio,auton_tot,mixto_tot,monotributo))
df_indep_cal<-df_indep_cal %>% 
  rbind(df_temp)
df_indep_lab_cal<-df_indep_lab %>% 
  select(c(mes,anio,auton_tot,monotributo))

#We get mixt contributors from AFJP data
df_indep_mixto<-df_indep %>% 
  subset(anio>=2012) %>% 
  select(c(mixto_tot))
while(nrow(df_indep_mixto)<nrow(df_indep_lab_cal)){
  df_indep_mixto<-df_indep_mixto %>% 
    rbind(NA)
}
df_indep_lab_cal<-df_indep_lab_cal %>% 
  cbind(df_indep_mixto)%>% 
  select(c(mes,anio,auton_tot,mixto_tot,monotributo))
df_indep_cal<-df_indep_cal %>% 
  rbind(df_indep_lab_cal)

rm(df_indep,df_indep_2003_2008,df_indep_2008_2016,df_indep_98_03,df_indep_lab,df_indep_lab_cal,df_indep_afjp,df_indep_mixto,df_indep_post_2017)
##Independent proportions by gender-----
#From December 2021, the Boletin Estadistico de Seguridad Social made by the Labour Ministry informs the gender of registered 
#independent workers. We take these statistics (not available at earlier dates) to get an approximation of independent workers 
#by gender
auton_men<-356248/486287
auton_wom<-130033/486287
mono_men<- 1081168/2168511
mono_wom<-1087187/2168511
df_active_pop_98<-df_active_pop %>% 
  subset(anio==2000) %>% 
  mutate(anio=1998)
df_active_pop_99<-df_active_pop %>% 
  subset(anio==2000) %>% 
  mutate(anio=1999)
df_active_pop_ext<-df_active_pop_98 %>% 
  rbind(df_active_pop_99) %>% 
  rbind(df_active_pop)
rm(df_active_pop_99,df_active_pop_98)

df_indep_propor<-df_indep_cal %>% 
  left_join(df_active_pop_ext) %>% 
  mutate(auton_tot=ifelse(is.na(auton_tot)&anio==1999,
                          (362804+376896)/2, auton_tot),
         perc_mono_indep=monotributo/(monotributo+auton_tot-mixto_tot),
         perc_auton=(auton_tot+mixto_tot/2)/(active_men+active_women),
         perc_mono=monotributo/(active_men+active_women),
         perc_mono_men=monotributo*mono_men/active_men,
         perc_mono_wom=monotributo*mono_wom/active_women,
         perc_auton_men=(auton_tot+mixto_tot/2)*auton_men/active_men,
         perc_auton_wom=(auton_tot+mixto_tot/2)*auton_wom/active_women
  )
rm(df_aportantes,df_indep_cal,df_temp,URL,vector_names)
rm(list=ls(pattern="auton*|mono*|df_active*|df_pop*"))
#EPH Independents------
#Here we make the cal_auton_h_p, cal_auton_f_p, cal_mono_h_p, cal_mono_f_p csv files 
getwd()
setwd("../../")
setwd("Update_globals/EPH_alignment/") #We get population proportions from the EPH, see get_alingment_tables_EPH.R
df_independent_men<-read_excel("independent_men.xlsx")
df_independent_women<-read_excel("independent_women.xlsx")
df_demographic_men<-read_excel("demographic_men.xlsx")
df_demographic_women<-read_excel("demographic_women.xlsx")

id_indep<-drive_get("17_indep_men_03_15")
df_indep_03_15_men<-read_sheet(ss=id_indep)
rm(id_indep)
id_indep<-drive_get("18_indep_wom_03_15")
df_indep_03_15_women<-read_sheet(ss=id_indep)
rm(id_indep)
id_indep<-drive_get("19_demographic_men")
df_demo_03_15_men<-read_sheet(ss=id_indep)
rm(id_indep)
id_indep<-drive_get("20_demographic_women")
df_demo_03_15_women<-read_sheet(ss=id_indep)
rm(id_indep)


pattern_trim1<-"\\b1\\b|\\b2\\b|\\b3\\b|01|02|03|ene|feb|mar"
pattern_trim2<-"\\b4\\b|\\b5\\b|\\b6\\b|04|05|06|abr|may|jun"
pattern_trim3<-"\\b7\\b|\\b8\\b|\\b9\\b|07|08|09|jul|ago|sep|set"
pattern_trim4<-"10|11|12|oct|nov|dic"
df_indep_propor<-df_indep_propor %>%
  unique() %>% 
  mutate(TRIMESTRE=ifelse(grepl(pattern_trim1,mes,ignore.case=TRUE),1, 
                          ifelse(grepl(pattern_trim2,mes,ignore.case=TRUE),2, 
                                 ifelse(grepl(pattern_trim3,mes,ignore.case=TRUE),3, 
                                        ifelse(grepl(pattern_trim4,mes,ignore.case=TRUE),4, 
                                               NA)
                                 )
                          )
  )
  )
df_indep_propor<-df_indep_propor %>% 
  mutate(TRIMESTRE=ifelse(is.na(TRIMESTRE), data.table::shift(TRIMESTRE,12L,type="lag"),  
                          TRIMESTRE) #Put value from 12 rows prior, for quarter variable, if missing
  )
rm(list=ls(pattern="pattern_trim*"))

df_indep_quarter_propor<-df_indep_propor %>% 
  group_by(anio,TRIMESTRE) %>% 
  summarise(perc_mono_men=mean(perc_mono_men),
            perc_mono_wom=mean(perc_mono_wom),
            perc_auton_men=mean(perc_auton_men),
            perc_auton_wom=mean(perc_auton_wom)
  ) %>% 
  ungroup() %>% 
  mutate(period=paste0(anio,"q",TRIMESTRE))

first_col<-df_demographic_men %>% 
  subset(ANO4==2016 & TRIMESTRE==3) %>% 
  select(c(agegroup)) #Keep one column with possible age groups
empty_line<-data.frame(1) %>% 
  rename(agegroup=1)
empty_line[[1,1]]<-NA
first_col<-empty_line %>% 
  rbind(first_col) 
rm(empty_line)

df_EPH_indep<-df_demographic_men %>% 
  rename(active_men=PONDERA)
df_demographic_women<-df_demographic_women %>% 
  rename(active_women=PONDERA)
df_independent_men<-df_independent_men %>% 
  rename(indep_men=indep)
df_independent_women<-df_independent_women %>% 
  rename(indep_women=indep)
df_EPH_indep<-df_EPH_indep %>% 
  left_join(df_demographic_women) %>% 
  left_join(df_independent_men) %>% 
  left_join(df_independent_women)
rm(df_demographic_men,df_demographic_women,df_independent_men,df_independent_women)
df_EPH_indep<-df_EPH_indep %>% 
  mutate(period=paste0(ANO4,"q",TRIMESTRE))

##Add 2003-2015 EPH data------

col_period<-data.frame(2003:2015) 
duptimes<-c(2,4,4,4,4,4,4,4,4,4,4,4,2)
idx<-rep(1:nrow(col_period),duptimes)
col_period<-col_period[idx,] %>% 
  as.data.frame() %>% 
  rename(ANO4=1) %>% 
  mutate(TRIMESTRE=ifelse(row_number()%%4==0, 2, #row number modulo 4
                          ifelse(row_number()%%4==1, 3, 
                                 ifelse(row_number()%%4==2, 4, 
                                        1)
                                 )
                          ),
         period=paste0(ANO4,"q",TRIMESTRE)
         )
rm(idx,duptimes)


array_period<-as.data.frame(table(df_EPH_indep$period)) %>% 
  select(c(1)) %>% 
  t()
array_period_MISSAR<-55:152 #Period in MISSAR format, third quarter 2016 fourth quarter 2040

for (i in 1:length(array_period)){
  input<-df_EPH_indep %>% 
    subset(period==array_period[[i]])
  base_proportion<-input %>% 
    subset(agegroup==35)
  input<-input %>% 
    mutate(age_prop_men=indep_men*100/base_proportion[[1,6]],
           age_prop_women=indep_women*100/base_proportion[[1,7]],
           indep_pop_men=active_men*age_prop_men/100,
           indep_pop_women=active_women*age_prop_women/100
    )
  indep_propor<-df_indep_quarter_propor %>% 
    subset(period==array_period[[i]])
  
  period_constants<-input %>% 
    summarise(active_sum_men=sum(active_men),
              active_sum_women=sum(active_women),
              indep_sum_men=sum(indep_pop_men),
              indep_sum_women=sum(indep_pop_women)
    ) %>% 
    ungroup()
  
  #col 3 for monotributo men, 4 monotributo women, 5 autonomous men, 6 autonomous women
  period_constants<-period_constants %>% 
    mutate(auton_men_35=(period_constants[[1,1]]*indep_propor[[1,5]]/period_constants[[1,3]]),
           mono_men_35=(period_constants[[1,1]]*indep_propor[[1,3]]/period_constants[[1,3]]),
           auton_women_35=(period_constants[[1,2]]*indep_propor[[1,6]]/period_constants[[1,4]]),
           mono_women_35=(period_constants[[1,2]]*indep_propor[[1,4]]/period_constants[[1,4]]),
    )
  input<-input %>% 
    mutate(cal_auton_h=age_prop_men*period_constants[[1,5]]/100,
           cal_mono_h=age_prop_men*period_constants[[1,6]]/100,
           cal_auton_f=age_prop_women*period_constants[[1,7]]/100,
           cal_mono_f=age_prop_women*period_constants[[1,8]]/100,
           control_auton_h=cal_auton_h*active_men,
           control_mono_h=cal_mono_h*active_men,
           control_auton_f=cal_auton_f*active_women,
           control_mono_f=cal_mono_f*active_women)
  #These columns are the proportions for the alignment table. We control that, when applied to the 
  #microsimulated population, they actually result in the known proportions of autonomous or monotributista 
  #populations for the period. 
  
  control<-input %>% 
    summarise(control_auton_h=sum(control_auton_h),
              control_mono_h=sum(control_mono_h),
              control_auton_f=sum(control_auton_f),
              control_mono_f=sum(control_mono_f)
    ) %>% 
    ungroup() %>% 
    mutate(control_1=control_auton_h/period_constants[[1,1]]-indep_propor[[1,5]],
           control_2=control_mono_h/period_constants[[1,1]]-indep_propor[[1,3]],
           control_3=control_auton_f/period_constants[[1,2]]-indep_propor[[1,6]],
           control_4=control_mono_f/period_constants[[1,2]]-indep_propor[[1,4]],
           control_1=round(control_1,5),
           control_2=round(control_2,5),
           control_3=round(control_3,5),
           control_4=round(control_4,5)) %>% 
    select(c(control_1,control_2,control_3,control_4))
  
  if(!identical(control[[1,1]]+control[[1,2]]+control[[1,3]]+control[[1,4]],0)
  ){
    print("ERROR")
    print(array_period_MISSAR[[i]])
  }
  rm(control)
  period_MISSAR<-array_period_MISSAR[[i]] #Fourth quarter of 2021. Period 3 is third quarter of 2003
  output<-input %>% 
    select(c(cal_auton_h,cal_mono_h,cal_auton_f,cal_mono_f))
  names(output)<-c(paste0("auton_h_",period_MISSAR),
                   paste0("mono_h_",period_MISSAR),
                   paste0("auton_f_",period_MISSAR),
                   paste0("mono_f_",period_MISSAR)
  )
  first_line<-output[1,]
  for(j in 1:4){
    first_line[[1,j]]<-as.double(array_period_MISSAR[[i]])
  }
  output<-first_line %>% 
    rbind(output)
  
  if(i==1){
    df_indep_cal<-first_col %>% 
      cbind(output)
  }
  if(i>1){
    df_indep_cal<-df_indep_cal %>% 
      cbind(output)
  }
 # print(i)
  rm(i,j,input,period_constants,indep_propor,base_proportion,period_MISSAR)
}

rm(list=ls(pattern="df_list*|*_2010_2040|*list_xls"))
rm(df_indep_propor,first_col,array_period,array_period_MISSAR,first_line,df_indep_quarter_propor,output,df_workers,df_EPH_indep)
##Cal Mono and Auton------
cal_mono_h<-df_indep_cal %>% 
  select(starts_with("mono")) %>% 
  select(contains("_h_"))
cal_mono_f<-df_indep_cal %>% 
  select(starts_with("mono")) %>% 
  select(contains("_f_"))
cal_auton_h<-df_indep_cal %>% 
  select(starts_with("auto")) %>% 
  select(contains("_h_"))
cal_auton_f<-df_indep_cal %>% 
  select(starts_with("auto")) %>% 
  select(contains("_f_"))
rm(df_indep_cal)

prospective_indep<-function(indata,varname){
  indata<-cal_mono_h
  varname<-"mono_h_"
  if(ncol(indata)<=41){ #Up to 10 years of data since 2016
  average<-indata [2:nrow(indata),2:ncol(indata)] 
  average<-rowMeans(average) %>% 
    as.data.frame() %>% 
    rename(average_indep=1)}
  if(ncol(indata)>41){ #More than 10 years of data since 2016
    average<-indata [2:nrow(indata),(ncol(indata)-41):ncol(indata)] 
    average<-rowMeans(average) %>% 
      as.data.frame() %>% 
      rename(average_indep=1)
  }
  
  max_empirical_period<-indata[[1,ncol(indata)]]
  for(i in max_empirical_period:152){
    add_period<-data.frame(i) 
    names(add_period)<-c(paste0(varname,i))
    col_proj<-average
    names(col_proj)<-c(paste0(varname,i))
    col_proj<-add_period %>% 
      rbind(col_proj)
    indata<-indata %>% 
      cbind(col_proj)
  }
  output<-indata
}

cal_mono_h<-prospective_indep(cal_mono_h,"mono_h")
cal_mono_f<-prospective_indep(cal_mono_f,"mono_f")
cal_auton_h<-prospective_indep(cal_auton_h,"auton_h")
cal_auton_f<-prospective_indep(cal_auton_f,"auton_f")
#Importar datos 2003-2015 y hacer misma operación con esos datos, capaz integrar esos períodos má arriba. 
    #SEGUIR AQUÍ
