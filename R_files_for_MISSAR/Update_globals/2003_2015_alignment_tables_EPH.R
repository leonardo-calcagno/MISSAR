<<<<<<< HEAD
####This code is the R transcription of the SAS file: "3.3 Import EPH post 2016 and get alignment datasets"
#It updates the alignment csv files with labour-market participation, education levels, marital status 
#and proportion of students
#We take data from the Permanent Household Survey (EPH) post 2016.

# Packages -----------------
rm(list=ls())
gc()
library(tidyverse)
library(eph)
library(googlesheets4)
library(googledrive)
setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private")
setwd("R_files_for_MISSAR/Update_globals")

# Import datasets ------------------
closeAllConnections() #Else, you risk the "all connections are in use" error.
vars_to_import<-c("PONDERA", #Weighting
                  "TRIMESTRE", #Quarter
                  "ANO4", #Year
                  "CODUSU",#Dwelling id
                  "NRO_HOGAR",#Household id
                  "COMPONENTE",#Individual id
                  "ESTADO", #Labour-market situation
                  "CAT_OCUP",#Occupation category
                  "CAT_INAC",#Inactivity category
                  "NIVEL_ED", #Education level
                  # "CH03", #Kinship to family head
                  "CH04", #Gender
                  "CH06", #Age
                  "CH07", #Marital status
                  "PP07H",# Compulsory contributions to SS
                  "PP07I", #Voluntary contributions to SS
                  "PP04D_COD", #Position's characteristics
                  "PP04A", #Public or private sector
                  "PP04C" #Total workers in workplace
)
gc()

#Takes 2.4 minutes to download everything
start.time=Sys.time()
options(warn=1)#Set your warning level to 1; else, any missing quarter will cause an error and stop the download.
dl_EPH_2003_2015<-get_microdata(year=2003:2015, #Years
                                trimester=1:4, #Quarters
                                type="individual", #Individual base
                                vars=vars_to_import)

table(dl_EPH_2003_2015$ANO4,dl_EPH_2003_2015$TRIMESTRE) #Shows which periods were downloaded. There should 
    #be everything from the third quarter of 2003 to the second quarter of 2015, except the third quarter of 2007, 
    #which is missing because of a strike. Sometimes the third quarter of 2012 is not downloaded, in which case 
    #run the code below: 


#dl_2012_q3<-get_microdata(year=2012, 
#                          trimester=3,
  #                        type="individual",
  #                        vars=vars_to_import)

#dl_EPH_2003_2015<-dl_EPH_2003_2015 %>% 
 # bind_cols(dl_2012_q3)
#table(dl_EPH_2003_2015$ANO4,dl_EPH_2003_2015$TRIMESTRE) 
end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)
rm(start.time,end.time,time.taken,vars_to_import)

#Variables of interest -----
vector_periods<-dl_EPH_2003_2015 %>% 
  select(c(ANO4,TRIMESTRE)) %>% 
  unique() %>% 
  arrange(ANO4,TRIMESTRE) %>% 
  mutate(period=row_number()+2) #Period format used in MISSAR, 3 is the third quarter of 2003.

df_EPH_2003_2015<-dl_EPH_2003_2015 %>% 
  left_join(vector_periods) %>% 
  mutate(formation=ifelse(NIVEL_ED==6, 3, #University degree
                          ifelse(NIVEL_ED==4 | NIVEL_ED==5, 2, #At least high-school degree
                                 1)#Did not finish high school, or unknown
  ),
  ageconti=ifelse(CH06==-1, 0, 
                  CH06),
  PP07H=ifelse(is.na(PP07H), 0, #When missing, consider no contributions are made
               PP07H), 
  PP07I=ifelse(is.na(PP07I), 0, 
               PP07I),
  # contributes=ifelse((PP07H==2 | PP07H==0) &  (PP07I==2 | PP07I==0), FALSE, #Previous error, non-respondents made to contribute
  #                    TRUE)
  contributes=ifelse(PP07H==1 | PP07I==1, TRUE, #Compulsory or voluntary contributions
                     FALSE),
  student=ifelse(CAT_INAC==3, 1, 
                 0)
  #  contributes=ifelse(PP04A==1, TRUE, #Make public-sector workers contribute to social security, even when they declare otherwise
  #                    contributes)
  
  )
rm(vector_periods)
#Run this to control variables run as intended
#table(df_EPH_2003_2015$contributes,df_EPH_2003_2015$PP07H)
#table(df_EPH_2003_2015$contributes,df_EPH_2003_2015$PP07I)
#table(df_EPH_2003_2015$formation,df_EPH_2003_2015$NIVEL_ED)

df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  select(-c(PP07H,PP07I,CH06,NIVEL_ED,CAT_INAC))


#Run to verify independent workers in the EPH don't report social security contributions
# control<-dl_EPH_2003_2015 %>% 
#    subset(ESTADO==1 & (CAT_OCUP==1|CAT_OCUP==2)) 
#  table(control$PP07H,control$PP07I)
#  rm(control)

#Since the EPH does not ask independent workers whether they contribute to social security, we identify independent workers of the formal sector following
#Maurizio, Roxana. 2012. Labour informality in Latin America: the case of Argentina, Chile, Brazil and Peru. Brooks World Poverty Institute Working Paper. 
#Independent workers that are either in skilled positions (of professional or technical qualification),  in the public sector, 
#or have 6 or more  employees, are considered to be in the formal sector. 
df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  mutate(is_indep=ifelse(ESTADO==1 & (CAT_OCUP==1|CAT_OCUP==2),TRUE,
                         FALSE), #Identify independent workers
         qualification_char=substr(start=nchar(PP04D_COD),stop=nchar(PP04D_COD),PP04D_COD),#The last digit of PP04D_COD gives the position's qualification level
         qualif_indep=ifelse(is_indep, 
                             ifelse(qualification_char!=1 & qualification_char!=2, FALSE, #Independents working in positions with professional or technical qualifications are skilled 
                                    TRUE),
                             FALSE
         ),
         contributes=ifelse(is_indep,
                            ifelse(qualif_indep,TRUE, 
                                   ifelse(PP04A==1, TRUE, #Independents in the public sector 
                                          ifelse(PP04C!=99 & PP04C>=6,TRUE,#With 6 or more employee
                                                 contributes)
                                   )
                            ),
                            contributes)
  )

#control<-df_EPH_2003_2015 %>% #Run this to control variables run as intended
#  subset(is_indep)
#table(control$contributes,control$PP04A)
#table(control$contributes,control$qualification_char)
#table(control$contributes,control$PP04C)
# 

#We create the labour_market_state variable. For MISSAR V1: 1, formal wage-earner; 
#2, formal sector independent worker; 3, informal worker; 4, unemployed; 5, inactive
df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  select(-c(qualif_indep,qualification_char)) %>% 
  mutate(labour_market_state=ifelse(ESTADO==2, 4, #Unemployed
                                    ifelse(ESTADO==1 & CAT_OCUP==3 & contributes, 1, #Wage-earners with soc. sec. contributions
                                           ifelse(is_indep & contributes, 2, #Formal sector independents
                                                  ifelse(CAT_OCUP==4 | (ESTADO==1 & !contributes ), 3, #Wage-earners with no soc. sec. contributions and informal sector independents
                                                         5)#Inactive
                                           )
                                    )
  ),
  labour_market_state=ifelse(ESTADO==3 | ESTADO==4, 5, #Avoids errors when CAT_OCUP is missing
                             labour_market_state)
  )

#Run the following to verify the labour-market state variable was correctly created

#control<-df_EPH_2003_2015 %>% 
#  select(c(labour_market_state,ESTADO,CAT_OCUP,contributes,is_indep)) %>% 
#  unique()
#table(control$labour_market_state,control$ESTADO)
#table(control$labour_market_state,control$CAT_OCUP)
#table(control$labour_market_state,control$contributes)
#table(control$labour_market_state,control$is_indep)
#rm(control)

#Run the following to verify each individual has a labour-market state

#control<-df_EPH_2003_2015 %>% 
#  subset(is.na(labour_market_state)) 
#head(control)


df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  select(-c(contributes,is_indep,ESTADO,CAT_OCUP,PP04C,PP04D_COD,PP04A))
head(df_EPH_2003_2015)
#Finally, we create 5-year age groups for MISSAR's age-dependent alignment
make_5y_agegroup<-function(indata,agevariable){
  indata<-indata %>% 
    mutate(dizaines=get(agevariable)/10,
           dizaines=floor(dizaines),
           tranche=ifelse(as.integer(substr(start=nchar(get(agevariable)),stop=nchar(get(agevariable)),get(agevariable)))<5, 0, 
                          5),
           agegroup_ext=as.integer(paste0(dizaines,tranche)),
           agegroup_ext=ifelse(agegroup_ext==15, 16,#We work with the 16-19 age group
                               ifelse(agegroup_ext<15, 1, 
                                      ifelse(agegroup_ext>=95, 95, #Up to 2016, the maximum recorded age was 98, for consistency we keep 95 as the maximum age-group
                                             agegroup_ext
                                      )
                               )
           ),
           agegroup=agegroup_ext,
           agegroup=ifelse(agegroup_ext>65, 300, 
                           agegroup)
    ) %>% 
    select(-c(dizaines,tranche))
}



df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  make_5y_agegroup("ageconti")
gc()
#Base alignment tables ------


cal_base<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=69 & CH04!=0) %>% #Use ageconti for subsetting, else age 15 is included
  group_by(period,CH04) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

cal_base_agegroup<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=69  & CH04!=0) %>%
  group_by(period,CH04,agegroup) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

cal_base_agegroup_ext<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16  & CH04!=0) %>%
  group_by(period,CH04,agegroup_ext) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

cal_base_age<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=29 & CH04!=0 ) %>%
  group_by(period,CH04,ageconti) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

#Alignment tables 2003-2015-----


cal_LMS<-df_EPH_2003_2015 %>% #Labour-market state
  subset(ageconti>=16 & ageconti<=69  & CH04!=0) %>%
  group_by(period,CH04,agegroup,labour_market_state) %>% 
  summarise(total_LMS=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup) %>% 
  mutate(cal_perc=ifelse(total!=0, total_LMS/total, #LMS weighted participation by age group and gender
                         0)
  )

cal_mar<-df_EPH_2003_2015 %>%  #Marital status
  subset(ageconti>=16 & !is.na(CH07) & CH04!=0) %>%
  group_by(period,CH04,agegroup_ext,CH07) %>% 
  summarise(total_mar=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup_ext) %>% 
  mutate(cal_perc=ifelse(total!=0, total_mar/total, #LMS weighted participation by age group and gender
                         0)
  )

cal_stu<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=29) %>%
  group_by(period,CH04,ageconti,student) %>% 
  summarise(total_stu=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_age) %>% 
  mutate(cal_perc=ifelse(total!=0, total_stu/total, #LMS weighted participation by age group and gender
                         0)
  )
rm(cal_base,cal_base_age,cal_base_agegroup,cal_base_agegroup_ext)
gc()
align_table_03_15<-function(indata,agevar,varmode,varvalue,gender){
  
age_list<-indata %>% 
  select(c(agevar)) %>% 
  unique() %>% 
  t() %>% 
  as.character() #We make an agegroup list, for the align_table() function


  
  outdata<-indata %>% 
    select(c(period)) %>% 
    unique() %>% 
    t() %>% 
    as.data.frame() %>% 
    mutate(agevar=NA) %>% 
    select(c(agevar,everything()))  #This outputs a line with one variable per period, and period number
  
  
  for(j in age_list){ #We loop over age groups, for a given gender, the percentage of people in the studied state, by period
    age_group<-as.integer(j)
    
    temp_df<-indata %>% 
      subset(CH04==gender & get(varmode)==varvalue & get(agevar)==age_group) %>% 
      select(c(cal_perc)) %>% 
      t() %>% 
      as.data.frame() %>% 
      mutate(agevar=age_group) %>% 
      select(c(agevar),everything())
    
    outdata<-bind_rows(outdata,temp_df) #We append the age group's participation to the output file
  }
  outdata<-outdata %>% 
    janitor::row_to_names(row_number=1)
  
  
  outdata<-outdata%>% 
    janitor::clean_names() %>% 
    mutate(q3_2007=(x18+x19)/2#2007 third quarter data is missing, we extrapolate it
    ) %>% 
    select(c(na,x3:x18,q3_2007,everything()#We put third quarter 2007 data in its correct place
             )
           )
  
  
  correct_names<-c("agegroup",paste0("period_",3:50)) #Rename variables
  names(outdata)<-correct_names
  
  outdata<-outdata
}





list_cal_LMS_male<-list()
for (i in 1:5){
  list_cal_LMS_male [[i]]<-align_table_03_15(cal_LMS,"agegroup","labour_market_state",i,1)
}
#If the names() step throws an error, it's because not all quarters were properly downloaded. Go back 
    #to line 43 and re-download the missing quarter(s)



list_cal_LMS_female<-list()
for (i in 1:5){
  list_cal_LMS_female [[i]]<-align_table_03_15(cal_LMS,"agegroup","labour_market_state",i,2)
}


list_cal_mar_male<-list() #We only care about common-law (1) and married (2) people
for (i in 1:2){
  list_cal_mar_male [[i]]<-align_table_03_15(cal_mar,"agegroup_ext","CH07",i,1)
}

list_cal_mar_female<-list()
for (i in 1:2){
  list_cal_mar_female [[i]]<-align_table_03_15(cal_mar,"agegroup_ext","CH07",i,2)
}


list_cal_student<-list() #We put together alignment for male and female students
for (i in 1:2){
  list_cal_student [[i]]<-align_table_03_15(cal_stu,"ageconti","student",1,i)
}





#We name the output alignment tables
#list_lms<-c("sal","ind","aun","cho","ina")
#list_cal_names<-paste0("cal_",list_lms,"_h")
#list_fem<-paste0("cal_",list_lms,"_f")

#list_cal_names<- c(list_cal_names,list_fem) 
#rm(list_lms,list_fem)

df_list_cal_LMS_03_15<-c(list_cal_LMS_male,list_cal_LMS_female) 
df_list_cal_mar_03_15<-c(list_cal_mar_male,list_cal_mar_female)
df_list_cal_stu_03_15<-list_cal_student

rm(list=ls(pattern="^list_"))
rm(i)
rm(list=ls(pattern="^cal_"))
#Drive export------
#It is possible to use df_list_cal_LMS_03_15 directly in the get_alignment_tables_EPH file. It would however
    #mean every time you update alignment tables, you would need to launch this file. To avoid this, we rather
    #store in a drive file 2003-2015 alignment tables, which can then be imported in the update routine. 


id_alignment_folder<- drive_get("Alignment_tables_update") 
##Define names -----
#We want data sets to be ordered, and have the 03_15 suffix

stu_names<-c("15_stu_men_03_15","16_stu_wom_03_15")
             
LMS_names<-c("wag","ind","inf","une","ina")
LMS_names_short<-c("wag","ind","inf","une")
mar_names<-c("uni","mar")

men<-paste0("0",1:5,"_",LMS_names,"_men_","03_15") #We add a 0 to allow sorting dataframes by name in R.
women<-paste0("0",6:9,"_",LMS_names_short,"_wom_","03_15")
LMS_names<-c(men,women,"10_ina_wom_03_15")

men<-paste0(11:12,"_",mar_names,"_men_","03_15")
women<-paste0(13:14,"_",mar_names,"_wom_","03_15")
mar_names<-c(men,women)
rm(men,women)

#Run if the files had already been uploaded
#for (i in 1:10){
#  drive_trash(LMS_names[i]) 
#}         
for (i in 1:10){
  gs4_create(name=LMS_names[i],sheets=df_list_cal_LMS_03_15[i])
  drive_mv(file=LMS_names[i],path=id_alignment_folder)
}


for (i in 1:4){
  gs4_create(name=mar_names[i],sheets=df_list_cal_mar_03_15[i])
  drive_mv(file=mar_names[i],path=id_alignment_folder)
}

for (i in 1:2){
  gs4_create(name=stu_names[i],sheets=df_list_cal_stu_03_15[i])
  drive_mv(file=stu_names[i],path=id_alignment_folder)
}
rm(i)
rm(list=ls(pattern="*_names"))
=======
####This code is the R transcription of the SAS file: "3.3 Import EPH post 2016 and get alignment datasets"
#It updates the alignment csv files with labour-market participation, education levels, marital status 
#and proportion of students
#We take data from the Permanent Household Survey (EPH) post 2016.

# Packages -----------------
rm(list=ls())
gc()
library(tidyverse)
library(eph)
library(googlesheets4)
library(googledrive)
setwd("C:/Users/lcalcagno/Documents/Investigacion/MISSAR_private")
setwd("R_files_for_MISSAR/Update_globals")

# Import datasets ------------------
closeAllConnections() #Else, you risk the "all connections are in use" error.
vars_to_import<-c("PONDERA", #Weighting
                  "TRIMESTRE", #Quarter
                  "ANO4", #Year
                  "CODUSU",#Dwelling id
                  "NRO_HOGAR",#Household id
                  "COMPONENTE",#Individual id
                  "ESTADO", #Labour-market situation
                  "CAT_OCUP",#Occupation category
                  "CAT_INAC",#Inactivity category
                  "NIVEL_ED", #Education level
                  # "CH03", #Kinship to family head
                  "CH04", #Gender
                  "CH06", #Age
                  "CH07", #Marital status
                  "PP07H",# Compulsory contributions to SS
                  "PP07I", #Voluntary contributions to SS
                  "PP04D_COD", #Position's characteristics
                  "PP04A", #Public or private sector
                  "PP04C" #Total workers in workplace
)
gc()
#Takes 2.4 minutes to download everything
start.time=Sys.time()
options(warn=1)#Set your warning level to 1; else, any missing quarter will cause an error and stop the download.
dl_EPH_2003_2015<-get_microdata(year=2003:2015, #Years
                                trimester=1:4, #Quarters
                                type="individual", #Individual base
                                vars=vars_to_import)

table(dl_EPH_2003_2015$ANO4,dl_EPH_2003_2015$TRIMESTRE) #Shows which periods were downloaded. There should 
    #be everything from the third quarter of 2003 to the second quarter of 2015, except the third quarter of 2007, 
    #which is missing because of a strike. Sometimes the third quarter of 2012 is not downloaded, in which case 
    #run the code below: 


#dl_2012_q3<-get_microdata(year=2012, 
#                          trimester=3,
  #                        type="individual",
  #                        vars=vars_to_import)

#dl_EPH_2003_2015<-dl_EPH_2003_2015 %>% 
 # bind_cols(dl_2012_q3)
#table(dl_EPH_2003_2015$ANO4,dl_EPH_2003_2015$TRIMESTRE) 
end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)
rm(start.time,end.time,time.taken,vars_to_import)

#Variables of interest -----
vector_periods<-dl_EPH_2003_2015 %>% 
  select(c(ANO4,TRIMESTRE)) %>% 
  unique() %>% 
  arrange(ANO4,TRIMESTRE) %>% 
  mutate(period=row_number()+2) #Period format used in MISSAR, 3 is the third quarter of 2003.

df_EPH_2003_2015<-dl_EPH_2003_2015 %>% 
  left_join(vector_periods) %>% 
  mutate(formation=ifelse(NIVEL_ED==6, 3, #University degree
                          ifelse(NIVEL_ED==4 | NIVEL_ED==5, 2, #At least high-school degree
                                 1)#Did not finish high school, or unknown
  ),
  ageconti=ifelse(CH06==-1, 0, 
                  CH06),
  PP07H=ifelse(is.na(PP07H), 0, #When missing, consider no contributions are made
               PP07H), 
  PP07I=ifelse(is.na(PP07I), 0, 
               PP07I),
  # contributes=ifelse((PP07H==2 | PP07H==0) &  (PP07I==2 | PP07I==0), FALSE, #Previous error, non-respondents made to contribute
  #                    TRUE)
  contributes=ifelse(PP07H==1 | PP07I==1, TRUE, #Compulsory or voluntary contributions
                     FALSE),
  student=ifelse(CAT_INAC==3, 1, 
                 0)
  #  contributes=ifelse(PP04A==1, TRUE, #Make public-sector workers contribute to social security, even when they declare otherwise
  #                    contributes)
  )
rm(vector_periods)
#Run this to control variables run as intended
#table(df_EPH_2003_2015$contributes,df_EPH_2003_2015$PP07H)
#table(df_EPH_2003_2015$contributes,df_EPH_2003_2015$PP07I)
#table(df_EPH_2003_2015$formation,df_EPH_2003_2015$NIVEL_ED)

df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  select(-c(PP07H,PP07I,CH06,NIVEL_ED,CAT_INAC))


#Run to verify independent workers in the EPH don't report social security contributions
# control<-dl_EPH_2003_2015 %>% 
#    subset(ESTADO==1 & (CAT_OCUP==1|CAT_OCUP==2)) 
#  table(control$PP07H,control$PP07I)
#  rm(control)

#Since the EPH does not ask independent workers whether they contribute to social security, we identify independent workers of the formal sector following
#Maurizio, Roxana. 2012. Labour informality in Latin America: the case of Argentina, Chile, Brazil and Peru. Brooks World Poverty Institute Working Paper. 
#Independent workers that are either in skilled positions (of professional or technical qualification),  in the public sector, 
#or have 6 or more  employees, are considered to be in the formal sector. 
df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  mutate(is_indep=ifelse(ESTADO==1 & (CAT_OCUP==1|CAT_OCUP==2),TRUE,
                         FALSE), #Identify independent workers
       #  debug_indep=ifelse((CAT_OCUP==1|CAT_OCUP==2),TRUE, #A previous error added to the independent some unemployed
        #                    FALSE),
         qualification_char=substr(start=nchar(PP04D_COD),stop=nchar(PP04D_COD),PP04D_COD),#The last digit of PP04D_COD gives the position's qualification level
         qualif_indep=ifelse(is_indep, 
                             ifelse(qualification_char!=1 & qualification_char!=2, FALSE, #Independents working in positions with professional or technical qualifications are skilled 
                                    TRUE),
                             FALSE
         ),
         contributes=ifelse(is_indep,
                            ifelse(qualif_indep,TRUE, 
                                   ifelse(PP04A==1, TRUE, #Independents in the public sector 
                                          ifelse(PP04C!=99 & PP04C>=6,TRUE,#With 6 or more employee
                                                 contributes)
                                   )
                            ),
                            contributes)
  )

#control<-df_EPH_2003_2015 %>% #Run this to control variables run as intended
#  subset(is_indep)
#table(control$contributes,control$PP04A)
#table(control$contributes,control$qualification_char)
#table(control$contributes,control$PP04C)
# 

#We create the labour_market_state variable. For MISSAR V1: 1, formal wage-earner; 
#2, formal sector independent worker; 3, informal worker; 4, unemployed; 5, inactive
df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  select(-c(qualif_indep,qualification_char)) %>% 
  mutate(labour_market_state=ifelse(ESTADO==2, 4, #Unemployed
                                    ifelse(ESTADO==1 & CAT_OCUP==3 & contributes, 1, #Wage-earners with soc. sec. contributions
                                           ifelse(is_indep & contributes, 2, #Formal sector independents
                                                  ifelse(CAT_OCUP==4 | (ESTADO==1 & !contributes ), 3, #Wage-earners with no soc. sec. contributions and informal sector independents
                                                         5)#Inactive
                                           )
                                    )
  ),
  labour_market_state=ifelse(ESTADO==3 | ESTADO==4, 5, #Avoids errors when CAT_OCUP is missing
                             labour_market_state)
  )

#Run the following to verify the labour-market state variable was correctly created

#control<-df_EPH_2003_2015 %>% 
#  select(c(labour_market_state,ESTADO,CAT_OCUP,contributes,is_indep)) %>% 
#  unique()
#table(control$labour_market_state,control$ESTADO)
#table(control$labour_market_state,control$CAT_OCUP)
#table(control$labour_market_state,control$contributes)
#table(control$labour_market_state,control$is_indep)
#rm(control)

#Run the following to verify each individual has a labour-market state

#control<-df_EPH_2003_2015 %>% 
#  subset(is.na(labour_market_state)) 
#head(control)


df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  select(-c(contributes,ESTADO,CAT_OCUP,PP04C,PP04D_COD,PP04A))
head(df_EPH_2003_2015)
#Finally, we create 5-year age groups for MISSAR's age-dependent alignment
make_5y_agegroup<-function(indata,agevariable){
  indata<-indata %>% 
    mutate(dizaines=get(agevariable)/10,
           dizaines=floor(dizaines),
           tranche=ifelse(as.integer(substr(start=nchar(get(agevariable)),stop=nchar(get(agevariable)),get(agevariable)))<5, 0, 
                          5),
           agegroup_ext=as.integer(paste0(dizaines,tranche)),
           agegroup_ext=ifelse(agegroup_ext==15, 16,#We work with the 16-19 age group
                               ifelse(agegroup_ext<15, 1, 
                                      ifelse(agegroup_ext>=95, 95, #Up to 2016, the maximum recorded age was 98, for consistency we keep 95 as the maximum age-group
                                             agegroup_ext
                                      )
                               )
           ),
           agegroup=agegroup_ext,
           agegroup=ifelse(agegroup_ext>65, 300, 
                           agegroup)
    ) %>% 
    select(-c(dizaines,tranche))
}



df_EPH_2003_2015<-df_EPH_2003_2015 %>% 
  make_5y_agegroup("ageconti")
gc()
#Base alignment tables ------


cal_base<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=69 & CH04!=0) %>% #Use ageconti for subsetting, else age 15 is included
  group_by(period,CH04) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

#df_demographic_women<-df_EPH_post_2016 %>% 
#  subset(ageconti>15 & ageconti<70 & CH04==2) %>% 
#  group_by(ANO4,TRIMESTRE,agegroup) %>% 
#  summarise(PONDERA=sum(PONDERA)) %>% 
#  ungroup()

cal_base_agegroup<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=69  & CH04!=0) %>%
  group_by(period,CH04,agegroup) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

cal_base_agegroup_ext<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16  & CH04!=0) %>%
  group_by(period,CH04,agegroup_ext) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

cal_base_age<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=29 & CH04!=0 ) %>%
  group_by(period,CH04,ageconti) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

#Alignment tables 2003-2015-----


cal_LMS<-df_EPH_2003_2015 %>% #Labour-market state
  subset(ageconti>=16 & ageconti<=69  & CH04!=0) %>%
  group_by(period,CH04,agegroup,labour_market_state) %>% 
  summarise(total_LMS=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup) %>% 
  mutate(cal_perc=ifelse(total!=0, total_LMS/total, #LMS weighted participation by age group and gender
                         0)
  )

cal_mar<-df_EPH_2003_2015 %>%  #Marital status
  subset(ageconti>=16 & !is.na(CH07) & CH04!=0) %>%
  group_by(period,CH04,agegroup_ext,CH07) %>% 
  summarise(total_mar=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup_ext) %>% 
  mutate(cal_perc=ifelse(total!=0, total_mar/total, #LMS weighted participation by age group and gender
                         0)
  )

cal_stu<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=29) %>%
  group_by(period,CH04,ageconti,student) %>% 
  summarise(total_stu=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_age) %>% 
  mutate(cal_perc=ifelse(total!=0, total_stu/total, #LMS weighted participation by age group and gender
                         0)
  )

cal_indep<-df_EPH_2003_2015 %>% 
  subset(ageconti>=16 & ageconti<=69  & CH04!=0) %>%
  group_by(period,CH04,agegroup,is_indep) %>% 
  summarise(total_indep=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup) %>% 
  mutate(cal_perc=ifelse(total!=0, total_indep/total, #Independent work weighted participation by age group and gender
                         0)
  )
rm(cal_base,cal_base_age,cal_base_agegroup_ext
   #,cal_base_agegroup
   )
gc()
align_table_03_15<-function(indata,agevar,varmode,varvalue,gender){
  
age_list<-indata %>% 
  select(c(agevar)) %>% 
  unique() %>% 
  t() %>% 
  as.character() #We make an agegroup list, for the align_table() function


  
  outdata<-indata %>% 
    select(c(period)) %>% 
    unique() %>% 
    t() %>% 
    as.data.frame() %>% 
    mutate(agevar=NA) %>% 
    select(c(agevar,everything()))  #This outputs a line with one variable per period, and period number
  
  
  for(j in age_list){ #We loop over age groups, for a given gender, the percentage of people in the studied state, by period
    age_group<-as.integer(j)
    
    temp_df<-indata %>% 
      subset(CH04==gender & get(varmode)==varvalue & get(agevar)==age_group) %>% 
      select(c(cal_perc)) %>% 
      t() %>% 
      as.data.frame() %>% 
      mutate(agevar=age_group) %>% 
      select(c(agevar),everything())
    
    outdata<-bind_rows(outdata,temp_df) #We append the age group's participation to the output file
  }
  outdata<-outdata %>% 
    janitor::row_to_names(row_number=1)
  
  
  outdata<-outdata%>% 
    janitor::clean_names() %>% 
    mutate(q3_2007=(x18+x19)/2#2007 third quarter data is missing, we extrapolate it
    ) %>% 
    select(c(na,x3:x18,q3_2007,everything()#We put third quarter 2007 data in its correct place
             )
           )
  
  
  correct_names<-c("agegroup",paste0("period_",3:50)) #Rename variables
  names(outdata)<-correct_names
  
  outdata<-outdata
}

list_cal_LMS_male<-list()
for (i in 1:5){
  list_cal_LMS_male [[i]]<-align_table_03_15(cal_LMS,"agegroup","labour_market_state",i,1)
}
#If the names() step throws an error, it's because not all quarters were properly downloaded. Go back 
    #to line 43 and re-download the missing quarter(s)



list_cal_LMS_female<-list()
for (i in 1:5){
  list_cal_LMS_female [[i]]<-align_table_03_15(cal_LMS,"agegroup","labour_market_state",i,2)
}


list_cal_mar_male<-list() #We only care about common-law (1) and married (2) people
for (i in 1:2){
  list_cal_mar_male [[i]]<-align_table_03_15(cal_mar,"agegroup_ext","CH07",i,1)
}

list_cal_mar_female<-list()
for (i in 1:2){
  list_cal_mar_female [[i]]<-align_table_03_15(cal_mar,"agegroup_ext","CH07",i,2)
}


list_cal_student<-list() #We put together alignment for male and female students
for (i in 1:2){
  list_cal_student [[i]]<-align_table_03_15(cal_stu,"ageconti","student",1,i)
}


list_cal_indep<-list() #We put together alignment for male and female students
for (i in 1:2){
  list_cal_indep [[i]]<-align_table_03_15(cal_indep,"agegroup","is_indep",1,i)
}

#We name the output alignment tables
#list_lms<-c("sal","ind","aun","cho","ina")
#list_cal_names<-paste0("cal_",list_lms,"_h")
#list_fem<-paste0("cal_",list_lms,"_f")

#list_cal_names<- c(list_cal_names,list_fem) 
#rm(list_lms,list_fem)

df_list_cal_LMS_03_15<-c(list_cal_LMS_male,list_cal_LMS_female) 
df_list_cal_mar_03_15<-c(list_cal_mar_male,list_cal_mar_female)
df_list_cal_stu_03_15<-list_cal_student
df_list_cal_indep_03_15<-list_cal_indep

rm(list=ls(pattern="^list_"))
rm(i)
#Drive export------
#It is possible to use df_list_cal_LMS_03_15 directly in the get_alignment_tables_EPH file. It would however
    #mean every time you update alignment tables, you would need to launch this file. To avoid this, we rather
    #store in a drive file 2003-2015 alignment tables, which can then be imported in the update routine. 


id_alignment_folder<- drive_get("Alignment_tables_update") 
##Define names -----
#We want data sets to be ordered, and have the 03_15 suffix

stu_names<-c("15_stu_men_03_15","16_stu_wom_03_15")
             
LMS_names<-c("wag","ind","inf","une","ina")
LMS_names_short<-c("wag","ind","inf","une")
mar_names<-c("uni","mar")
indep_names<-c("17_indep_men_03_15","18_indep_wom_03_15")

men<-paste0("0",1:5,"_",LMS_names,"_men_","03_15") #We add a 0 to allow sorting dataframes by name in R.
women<-paste0("0",6:9,"_",LMS_names_short,"_wom_","03_15")
LMS_names<-c(men,women,"10_ina_wom_03_15")

men<-paste0(11:12,"_",mar_names,"_men_","03_15")
women<-paste0(13:14,"_",mar_names,"_wom_","03_15")
mar_names<-c(men,women)
rm(men,women)

#Run if the files had already been uploaded
#for (i in 1:10){
#  drive_trash(LMS_names[i]) 
#}         
for (i in 1:10){
  gs4_create(name=LMS_names[i],sheets=df_list_cal_LMS_03_15[i])
  drive_mv(file=LMS_names[i],path=id_alignment_folder)
}


for (i in 1:4){
  gs4_create(name=mar_names[i],sheets=df_list_cal_mar_03_15[i])
  drive_mv(file=mar_names[i],path=id_alignment_folder)
}

for (i in 1:2){
  gs4_create(name=stu_names[i],sheets=df_list_cal_stu_03_15[i])
  drive_mv(file=stu_names[i],path=id_alignment_folder)
}

for (i in 1:2){
  gs4_create(name=indep_names[i],sheets=df_list_cal_indep_03_15[i])
  drive_mv(file=indep_names[i],path=id_alignment_folder)
}
#Period 19, the third quarter of 2007, is actually missing. We correct periods values in cal_base_agegroup
cal_base_agegroup<-cal_base_agegroup %>% 
  mutate(period=ifelse(period<=18, period, 
                       period+1)
         )
q2_2007<-cal_base_agegroup %>% 
  subset(period==18) %>% 
  rename(period_18=total) %>% 
  select(-c(period))
q4_2007<-cal_base_agegroup %>% 
  subset(period==20)%>% 
  rename(period_20=total)%>% 
  select(-c(period))
q3_2007<-q2_2007 %>% 
  left_join(q4_2007) %>% 
  mutate(total=(period_18+period_20)/2,
         period=19) %>% 
  select(c(period,CH04,agegroup,total))
cal_base_agegroup<-cal_base_agegroup %>% 
  rbind(q3_2007)
rm(q2_2007,q3_2007,q4_2007)

first_col<-cal_base_agegroup %>% 
  select(c(agegroup)) %>% 
  unique()
for ( i in 3:50){
  #print(i)
  quarter_data_men<-cal_base_agegroup%>% 
    subset(period==i & CH04==1) %>% 
    select(c(total)) 
  quarter_data_women<-cal_base_agegroup%>% 
      subset(period==i & CH04==2) %>% 
      select(c(total)) 
  names(quarter_data_men)<-paste0("period_",i)
  names(quarter_data_women)<-paste0("period_",i)
    if(i==3){
    cal_demographic_men<-first_col %>% 
      cbind(quarter_data_men)
    cal_demographic_women<-first_col %>% 
      cbind(quarter_data_women)
    }
    if(i>3){
      cal_demographic_men<-cal_demographic_men %>% 
        cbind(quarter_data_men)
      cal_demographic_women<-cal_demographic_women %>% 
        cbind(quarter_data_women)
    }
}
rm(first_col,quarter_data_men,quarter_data_women,i)
gs4_create(name="19_demographic_men",sheets=cal_demographic_men)
drive_mv(file="19_demographic_men",path=id_alignment_folder)
gs4_create(name="20_demographic_women",sheets=cal_demographic_women)
drive_mv(file="20_demographic_women",path=id_alignment_folder)
rm(list=ls(pattern="*_names"))
rm(list=ls(pattern="^cal_"))
>>>>>>> 12f2b92332c8cca169e4072a1b1ee4ea607764e3
