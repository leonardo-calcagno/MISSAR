####This code is the R transcription of the SAS file: "3.3 Import EPH post 2016 and get alignment datasets"
  #It updates the alignment csv files with labour-market participation, education levels, marital status 
  #and proportion of students
  #We take data from the Permanent Household Survey (EPH) post 2016.

# Packages -----------------
rm(list=ls())
gc()
library(tidyverse)
library(eph)
library(readr)
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

#Takes 6 minutes to download everything
#start.time=Sys.time()
#options(warn=1)#Set your warning level to 1; else, any missing quarter will cause an error and stop the download.
#dl_EPH_2003_2015<-get_microdata(year=2003:2015, #Years
#                                trimester=1:4, #Quarters
#                                type="individual", #Individual base
#                                vars=vars_to_import)

#table(dl_EPH_2003_2015$ANO4,dl_EPH_2003_2015$TRIMESTRE) #Shows which periods were downloaded
#end.time=Sys.time()
#time.taken=end.time-start.time
#head(time.taken)

start.time=Sys.time()
year<-substr(start=1,stop=4,Sys.Date())
#Takes 1 minute to download everything
options(warn=1)#Set your warning level to 1; else, any missing quarter will cause an error and stop the download.
dl_EPH_post_2016<-get_microdata(year=2016:year, #Years
                        trimester=1:4, #Quarters
                        type="individual", #Individual base
                        vars=vars_to_import)

table(dl_EPH_post_2016$ANO4,dl_EPH_post_2016$TRIMESTRE) #Shows which periods were downloaded
end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)
rm(start.time,end.time,time.taken,year,vars_to_import)
#Variables of interest -----
vector_periods<-dl_EPH_post_2016 %>% 
  select(c(ANO4,TRIMESTRE)) %>% 
  unique() %>% 
  arrange(ANO4,TRIMESTRE) %>% 
  mutate(period=row_number()+53) #Period format used in MISSAR, 54 is the second quarter of 2016.
  
  df_EPH_post_2016<-dl_EPH_post_2016 %>% 
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
  #table(df_EPH_post_2016$contributes,df_EPH_post_2016$PP07H)
  #table(df_EPH_post_2016$contributes,df_EPH_post_2016$PP07I)
  #table(df_EPH_post_2016$formation,df_EPH_post_2016$NIVEL_ED)
  
  df_EPH_post_2016<-df_EPH_post_2016 %>% 
    select(-c(PP07H,PP07I,CH06,NIVEL_ED,CAT_INAC))
  
  
  #Run to verify independent workers in the EPH don't report social security contributions
 # control<-dl_EPH_post_2016 %>% 
#    subset(ESTADO==1 & (CAT_OCUP==1|CAT_OCUP==2)) 
#  table(control$PP07H,control$PP07I)
#  rm(control)
 
   #Since the EPH does not ask independent workers whether they contribute to social security, we identify independent workers of the formal sector following
      #Maurizio, Roxana. 2012. Labour informality in Latin America: the case of Argentina, Chile, Brazil and Peru. Brooks World Poverty Institute Working Paper. 
      #Independent workers that are either in skilled positions (of professional or technical qualification),  in the public sector, 
      #or have 6 or more  employees, are considered to be in the formal sector. 
  df_EPH_post_2016<-df_EPH_post_2016 %>% 
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
             
  #control<-df_EPH_post_2016 %>% #Run this to control variables run as intended
  #  subset(is_indep)
  #table(control$contributes,control$PP04A)
  #table(control$contributes,control$qualification_char)
  #table(control$contributes,control$PP04C)
   # 
  
  #We create the labour_market_state variable. For MISSAR V1: 1, formal wage-earner; 
      #2, formal sector independent worker; 3, informal worker; 4, unemployed; 5, inactive
  df_EPH_post_2016<-df_EPH_post_2016 %>% 
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
  
  #control<-df_EPH_post_2016 %>% 
  #  select(c(labour_market_state,ESTADO,CAT_OCUP,contributes,is_indep)) %>% 
  #  unique()
  #table(control$labour_market_state,control$ESTADO)
  #table(control$labour_market_state,control$CAT_OCUP)
  #table(control$labour_market_state,control$contributes)
  #table(control$labour_market_state,control$is_indep)
  #rm(control)
  
  #Run the following to verify each individual has a labour-market state
  
  #control<-df_EPH_post_2016 %>% 
  #  subset(is.na(labour_market_state)) 
  #head(control)
  

df_EPH_post_2016<-df_EPH_post_2016 %>% 
  select(-c(contributes,is_indep,ESTADO,CAT_OCUP,PP04C,PP04D_COD,PP04A))
head(df_EPH_post_2016)
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



df_EPH_post_2016<-df_EPH_post_2016 %>% 
  make_5y_agegroup("ageconti")
gc()
#Base alignment tables ------
cal_base<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=69) %>% #Use ageconti for subsetting, else age 15 is included
  group_by(period,CH04) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()
  
cal_base_agegroup<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=69 ) %>%
  group_by(period,CH04,agegroup) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

cal_base_agegroup_ext<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 ) %>%
  group_by(period,CH04,agegroup_ext) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()


cal_base_age<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=29 ) %>%
  group_by(period,CH04,ageconti) %>% 
  summarise(total=sum(PONDERA)) %>% 
  ungroup()

#Hist. align tables-----
cal_LMS<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=69 ) %>%
  group_by(period,CH04,agegroup,labour_market_state) %>% 
  summarise(total_LMS=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup) %>% 
  mutate(cal_perc=ifelse(total!=0, total_LMS/total, #LMS weighted participation by age group and gender
                         0)
  )


cal_mar<-df_EPH_post_2016 %>%  #Marital status
  subset(ageconti>=16 & !is.na(CH07) & CH04!=0) %>%
  group_by(period,CH04,agegroup_ext,CH07) %>% 
  summarise(total_mar=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup_ext) %>% 
  mutate(cal_perc=ifelse(total!=0, total_mar/total, #LMS weighted participation by age group and gender
                         0)
  )

cal_stu<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=29) %>%
  group_by(period,CH04,ageconti,student) %>% 
  summarise(total_stu=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_age) %>% 
  mutate(cal_perc=ifelse(total!=0, total_stu/total, #LMS weighted participation by age group and gender
                         0)
  )

align_table<-function(indata,agevar,varmode,varvalue,gender){
  
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
}



list_cal_LMS_male<-list()
for (i in 1:5){
  list_cal_LMS_male [[i]]<-align_table(cal_LMS,"agegroup","labour_market_state",i,1)
}

list_cal_LMS_female<-list()
for (i in 1:5){
  list_cal_LMS_female [[i]]<-align_table(cal_LMS,"agegroup","labour_market_state",i,2)
}


list_cal_mar_male<-list() #We only care about common-law (1) and married (2) people
for (i in 1:2){
  list_cal_mar_male [[i]]<-align_table(cal_mar,"agegroup_ext","CH07",i,1)
}

list_cal_mar_female<-list()
for (i in 1:2){
  list_cal_mar_female [[i]]<-align_table(cal_mar,"agegroup_ext","CH07",i,2)
}


list_cal_student<-list() #We put together alignment for male and female students
for (i in 1:2){
  list_cal_student [[i]]<-align_table(cal_stu,"ageconti","student",1,i)
}




#We name the output alignment tables
#list_lms<-c("sal","ind","aun","cho","ina")
#list_cal_names<-paste0("cal_",list_lms,"_h")
#list_fem<-paste0("cal_",list_lms,"_f")

#list_cal_names<- c(list_cal_names,list_fem) 
#rm(list_lms,list_fem)

df_list_cal_LMS<-c(list_cal_LMS_male,list_cal_LMS_female) #%>% 
# setNames(list_cal_names)

df_list_cal_mar<-c(list_cal_mar_male,list_cal_mar_female)
df_list_cal_stu<-list_cal_student

rm(list=ls(pattern="^list_"))
rm(i)
#rm(list=ls(pattern="^cal_"))

#LMS scenarios ------
cal_LMS_all_ages<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=69) %>%
  group_by(period,CH04,labour_market_state) %>% 
  summarise(total_LMS=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base) %>% 
  mutate(cal_perc=ifelse(total!=0, total_LMS/total, #LMS weighted participation by age group and gender
                         0)
        )

cal_men<- cal_LMS_all_ages %>% 
  subset(CH04==1) %>% 
  select(c(labour_market_state,period,cal_perc)) 
cal_women<- cal_LMS_all_ages %>% 
  subset(CH04==2) %>% 
  select(c(labour_market_state,period,cal_perc)) 

LMS_names<-c("wag","ind","inf","une","ina")

table_LMS<-function(indata){
  
  list_periods<-cal_LMS_all_ages %>% 
    select(c(period)) %>% 
    unique() 
  
for (i in 1:5){
  temp<-indata %>% 
    subset(labour_market_state==i) %>% 
    select(-c(labour_market_state))
  
  temp_name<-LMS_names[i]
  
  row_names<-c("period",temp_name)
  names(temp)<-row_names
  
list_periods<-list_periods %>% 
  left_join(temp)
}
outdata<-list_periods %>% 
  select(-c(period))
}
##Update LMS data----
#We update the LMS scenarios file with the latest available EPH data
update_men<-table_LMS(cal_men) 
update_women<-table_LMS(cal_women)
rm(LMS_names)

id_LMS_scenario<- drive_get("LMS_scenarios_16_69") 
range_write(update_men,ss=id_LMS_scenario,range="F173",col_names =FALSE,reformat=FALSE) 
range_write(update_women,ss=id_LMS_scenario,range="AK173",col_names =FALSE,reformat=FALSE)
rm(cal_men,cal_women,update_men,update_women,cal_LMS_all_ages)

##New LMS scenarios-----
#We then fetch the prospective labour-market participation, for the central, pessimistic and optimistic scenario. 
    #This depends on the percentage input on line 271 across all five labour-market states. Make sure the sum equals 100%.
names_LMS_proj<-c("trimestre","ano4","sal_central","ind_central","aun_central","cho_central","ina_central",
                  "sal_low","aun_low","cho_low","ina_low",
                  "sal_high","aun_high","cho_high","ina_high"
                  )
df_LMS_scenario_men<-read_sheet(ss=id_LMS_scenario,range="C196:w271",col_names = FALSE) %>% 
  select(-c(2,4,5,6,7,8))  #Remove measured proportions of LMS
names(df_LMS_scenario_men)<-names_LMS_proj
df_LMS_scenario_men<-df_LMS_scenario_men %>% #Add period number
  mutate(period=row_number()+76) %>% 
  select(c(period),everything()) %>% 
  mutate(ind_low=ind_central,  #This is so prosp_align_tables() works
         ind_high=ind_central)

df_LMS_scenario_women<-read_sheet(ss=id_LMS_scenario,range="AL196:BF271",col_names = FALSE) %>% 
  select(-c(2,4,5,6,7,8))  #Remove measured proportions of LMS
names(df_LMS_scenario_women)<-names_LMS_proj
df_LMS_scenario_women<-df_LMS_scenario_women %>% 
  mutate(period=row_number()+76)%>% 
  select(c(period),everything())%>% 
  mutate(ind_low=ind_central,  #This is so prosp_align_tables() works
         ind_high=ind_central)


rm(id_LMS_scenario,names_LMS_proj)

#Prosp. LMS tables------
##Projected population structure-----

leg<-"June_2022_legislation/"
sust<-"Sustainability_LIAM2_output/"

#correct_csv<-function(input){
#  input<-input%>%
#    mutate(across(where(is.double),~ifelse(.x>median(.x[.x>0])*100 & .x%%1>0, .x/1000, 
#                                           .x))
#           
#    )
#  
#}


if(!file.exists("download_folder")) {
  dir.create("download_folder")
}
setwd("download_folder/")

drive_download(file=paste0(leg,sust,"active_age_men.csv"), overwrite = TRUE)
drive_download(file=paste0(leg,sust,"active_age_women.csv"), overwrite = TRUE)
rm(leg,sust)

df_sim_pop_men<-read_csv("active_age_men.csv")
df_sim_pop_women<-read_csv("active_age_women.csv")

setwd("../")
unlink("download_folder",recursive=TRUE)

##Average LMS-----
#Average LMS by agevar and gender
post_2016_mean<-function(indata,agevar,varmode,varvalue,gender){
  
  #We average, by agevar and gender, labour-market state participation, from the second quarter of 2016 onward
  cal_average_agevar<-indata %>% 
    #subset(period>=70)%>% #To average over more recent years, uncomment this line 
    group_by(CH04,get(varmode),get(agevar)) %>% 
    summarise(mean_var=mean(cal_perc)) %>% 
    ungroup()
  names(cal_average_agevar)<-c("CH04",varmode,agevar,"mean_var")
  
  output<-cal_average_agevar

  list_agevar<-indata %>% 
    select(c(agevar)) %>% 
    unique() %>% 
    t() %>% 
    as.character() #We make an agegroup list, for the align_table() function
print(list_agevar)
  #This shows averaged labour-market participation sums to 1
  control<-data.frame(sum_freq=double(),agevar=integer())
  for (i in list_agevar)
  {
    only_one_agevar<-cal_average_agevar%>% 
      subset(CH04==gender & get(agevar)==i)
    
    add_row<-as.data.frame(sum(only_one_agevar$mean_var)) %>% 
      rename(sum_freq=1) %>% 
      mutate(agevar=as.integer(i))
    
    control<-bind_rows(control,add_row)  
  }
  output<-data.frame()
  for (i in 1:varvalue){
    add_row<-cal_average_agevar %>% 
      subset(CH04==gender & get(varmode)==i) %>% 
      select(-c(CH04,varmode,agevar)) %>% 
      t() %>% 
      as.data.frame()
    output<-bind_rows(output,add_row)
  }
  
  output_name<-paste0("_",list_agevar)
  names(output)<-output_name
  output<-output
}
mean_LMS_men<-post_2016_mean(cal_LMS,"agegroup","labour_market_state",5,1) #previously cal_average_men
mean_LMS_women<-post_2016_mean(cal_LMS,"agegroup","labour_market_state",5,2) #previously cal_average_women

mean_mar_men<-post_2016_mean(cal_mar,"agegroup_ext","CH07",2,1) #previously cal_average_men
mean_mar_women<-post_2016_mean(cal_mar,"agegroup_ext","CH07",2,2) #previously cal_average_women

mean_stu_men<-post_2016_mean(cal_stu,"ageconti","student",1,1)
mean_stu_women<-post_2016_mean(cal_stu,"ageconti","student",1,2)

rm(cal_LMS,cal_mar,cal_stu)
##Ratio [35-40[----
#We need to get for each LMS, percentage of age group x as a factor of percentage of age group 35 (equals 100) 

ratio_agegroups<-function(indata){
names(indata)<-paste0("agegroup_",1:ncol(indata))

base_agegroup<-indata %>% 
  select(c(agegroup_5)) #Age-group 35-39 is the base group

output<-as.data.frame(lapply(indata[,1:ncol(indata)], 
                           function(x) {x/base_agegroup} 
                          )
                         )
names(output)<-paste0("agegroup_",1:ncol(indata))
output<-output

}
ratio_men<-ratio_agegroups(mean_LMS_men)
ratio_women<-ratio_agegroups(mean_LMS_women)

#This gives LMS totals when applying average LMS participation

df_sim_pop_men<-df_sim_pop_men %>% 
  select(c(1,7,8,9,10,11,12,13,14,15,16,17)) #Keep only active ages

df_sim_pop_women<-df_sim_pop_women %>% 
  select(c(1,7,8,9,10,11,12,13,14,15,16,17)) #Keep only active ages

ratio_to_sim_pop<-function(pop_table, alignment_table){
list_periods<-data.frame(49:152) %>%  
  rename(period=1)

names_agegroup<-names(pop_table)[-1] #Removes "Period"
names(alignment_table)<-names_agegroup
print(names_agegroup)
for(i in names_agegroup){ #For each age group
  for(j in 1:5){ #For each labour-market state
  cal_line<-alignment_table[j,]  
  sim_pop<-as.data.frame(pop_table[[i]]*cal_line[[i]]) # Multiplies population by the alignment frequency
  names(sim_pop)<-paste0(i,"_",j)
  
  list_periods<-bind_cols(list_periods,sim_pop)
  }
}
output<-list_periods
}

df_pop_to_ratio_men<-ratio_to_sim_pop(df_sim_pop_men,ratio_men)
df_pop_to_ratio_women<-ratio_to_sim_pop(df_sim_pop_women,ratio_women)


##Prosp. alignment tables-----
latest_period<-max(cal_base$period) 

tot_active_men<-df_sim_pop_men %>% 
  mutate(tot_active=select(.,c(2):c(12)) %>% 
           rowSums(na.rm=TRUE)) %>% #Simulated total active-age male population
  select(c(Period,tot_active)) %>% 
  subset(Period>latest_period) %>% #Keep only periods with no measured proportions
  rename(period=Period)


tot_active_women<-df_sim_pop_women %>% 
  mutate(tot_active=select(.,c(2):c(12)) %>% 
           rowSums(na.rm=TRUE)) %>% 
  select(c(Period,tot_active)) %>%
  subset(Period>latest_period)%>% #Keep only periods with no measured proportions
  rename(period=Period)

rm(df_sim_pop_men,df_sim_pop_women)
list_lms<-c("sal","ind","aun","cho","ina")

#This function outputs the projected LMS participation by gender and age-group in a LIAM2 compatible format, 
    #up to the fourth quarter of 2040 (period 152).
#The age-group specific percentages are adjusted so that the  16-69 LMS participation rates are consistent with 
    #the scenario at an aggregate level. 

prosp_align_tables<-function(pop_to_ratio,scenario,list_names,total_pop,ratio_df,varvalue){
tot_active_LMS<-pop_to_ratio[,c("period",grep(paste0("_",varvalue),names(pop_to_ratio),value=TRUE))] %>%  #Keeps population ratios for LMS==1
  mutate(tot_active_LMS=select(.,c(2:c(12)))
         %>% rowSums(na.rm=TRUE)) %>% 
  select(c(period,tot_active_LMS)) %>% 
  subset(period>latest_period) #Keep only periods with no measured proportions

scenario_LMS<-scenario %>% 
  subset(period>latest_period) %>%  #Keep only periods with no measured proportions
  select(c(period,paste0(list_names[varvalue],"_central"),paste0(list_names[varvalue],"_low"),paste0(list_names[varvalue],"_high")))


df_35<-scenario_LMS %>% #Gets for agegroup 35 LMS==i frequency consistent with population projections. 
                                #You can next deduce LMS participation for other age groups using the ratio df. 
  left_join(tot_active_LMS) %>% 
  left_join(total_pop) %>% 
  mutate(freq_35_central=get(paste0(list_names[varvalue],"_central"))*tot_active/tot_active_LMS,
         freq_35_low=get(paste0(list_names[varvalue],"_low"))*tot_active/tot_active_LMS,
         freq_35_high=get(paste0(list_names[varvalue],"_high"))*tot_active/tot_active_LMS) %>% 
  select(c(period, freq_35_central,freq_35_low,freq_35_high))

output<-total_pop %>% 
  select(c(period))
for (j in 1:11){
  central<-as.data.frame(df_35[[2]]*ratio_df[varvalue,j]) 
  var_name<-paste0(list_names[varvalue],"_central_",j)
  names(central)<-var_name
  
  low<-as.data.frame(df_35[[3]]*ratio_df[varvalue,j])
  var_name<-paste0(list_names[varvalue],"_low_",j)
  names(low)<-var_name
  
  high<-as.data.frame(df_35[[4]]*ratio_df[varvalue,j])
  var_name<-paste0(list_names[varvalue],"_high_",j)
  names(high)<-var_name
  
  output<-bind_cols(output,central,low,high)
}
output<-output
}

list_prosp_cal_LMS_male<-list()
list_prosp_cal_LMS_female<-list()

for (i in 1:5){
  list_prosp_cal_LMS_male [[i]]<-prosp_align_tables(pop_to_ratio=df_pop_to_ratio_men,scenario=df_LMS_scenario_men,list_names=list_lms,total_pop=tot_active_men,ratio_df=ratio_men,
                                                    varvalue=i)
  list_prosp_cal_LMS_female [[i]]<-prosp_align_tables(pop_to_ratio=df_pop_to_ratio_women,scenario=df_LMS_scenario_women,list_names=list_lms,total_pop=tot_active_women,ratio_df=ratio_women,
                                                    varvalue=i)
  }
rm(ratio_men,df_pop_to_ratio_men,tot_active_men,df_LMS_scenario_men,
   ratio_women,df_pop_to_ratio_women,tot_active_women,df_LMS_scenario_women)

get_prosp_LMS<-function(indata,scenario){
only_scenario<-indata[,c("period",grep(paste0("_",scenario),names(indata),value=TRUE))] %>% 
  t() %>% 
  as.data.frame() %>% 
  janitor::row_to_names(1) #Works! Now try to put it in function and merge with align_table() SEGUIR AQUI

}
list_central_LMS_male<-lapply(list_prosp_cal_LMS_male,get_prosp_LMS,scenario="central")
list_low_LMS_male<-lapply(list_prosp_cal_LMS_male,get_prosp_LMS,scenario="low")
list_high_LMS_male<-lapply(list_prosp_cal_LMS_male,get_prosp_LMS,scenario="high")

list_central_LMS_female<-lapply(list_prosp_cal_LMS_female,get_prosp_LMS,scenario="central")
list_low_LMS_female<-lapply(list_prosp_cal_LMS_female,get_prosp_LMS,scenario="low")
list_high_LMS_female<-lapply(list_prosp_cal_LMS_female,get_prosp_LMS,scenario="high")

df_list_prosp_LMS_central<-c(list_central_LMS_male,list_central_LMS_female)
df_list_prosp_LMS_low<-c(list_low_LMS_male,list_low_LMS_female)
df_list_prosp_LMS_high<-c(list_high_LMS_male,list_high_LMS_female)
rm(list_prosp_cal_LMS_female,list_prosp_cal_LMS_male,
   list_central_LMS_female,list_central_LMS_male,list_low_LMS_female,list_low_LMS_male,list_high_LMS_female,list_high_LMS_male)

df_list_cal_LMS_central<-list()
df_list_cal_LMS_low<-list()
df_list_cal_LMS_high<-list()
for (i in 1:10){
  df_list_cal_LMS_central[[i]]<-df_list_cal_LMS[[i]] %>% 
    bind_cols(df_list_prosp_LMS_central[[i]])
  
  df_list_cal_LMS_low[[i]]<-df_list_cal_LMS[[i]] %>% 
    bind_cols(df_list_prosp_LMS_low[[i]])
  
  df_list_cal_LMS_high[[i]]<-df_list_cal_LMS[[i]] %>% 
    bind_cols(df_list_prosp_LMS_high[[i]])
}

rm(list=ls(pattern="^list_"))
rm(list=ls(pattern="^cal_"))
rm(list=ls(pattern="^df_list_prosp_"))
rm(df_list_cal_LMS,i,latest_period)
rm(mean_LMS_men,mean_LMS_women)

#Student and marital status tables-----
get_prosp_non_LMS<-function(df_list,index_number,mean_data,varmode){

mean_data<-mean_data %>% #Get a vector for only one gender and marital-education status
  t() %>% 
  as.data.frame() %>% 
  mutate(period=row_number()) %>% 
  select(c(varmode)) %>% 
  rename(mean_var=1) 


projected_periods<-ncol(df_list[[index_number]])+52 #Total projected periods

prosp_values<-mean_data %>% 
  cbind(replicate(152-(projected_periods)-1,mean_data$mean_var)) #Copy mean values for all projected periods

names_prosp_values<-c(projected_periods+1:(152-projected_periods))
names(prosp_values)<-names_prosp_values #Rename the duplicated columns

output<-df_list[[index_number]] %>% #Bind with measured values
  cbind(prosp_values) 
blank<-data.frame()
for (i in 1:nrow(mean_data)){
  add_row<-output[i,] %>% 
    replace(is.na(.),mean_data[i,1]) #Replace missing values by the age group's average
  
  blank<-blank %>% 
    bind_rows(add_row)
}
output<-blank

}
#This gives measured marital status and education proportions in the EPH post 2016, and a projection up to period 152 
    #(fourth quarter of 2040) equal to the post-2016 average.
df_uni_men<-get_prosp_non_LMS(df_list=df_list_cal_mar,index_number=1,mean_data=mean_mar_men,varmode=1)#1, common-law union
df_mar_men<-get_prosp_non_LMS(df_list=df_list_cal_mar,index_number=2,mean_data=mean_mar_men,varmode=2)#2, married
df_uni_women<-get_prosp_non_LMS(df_list=df_list_cal_mar,index_number=3,mean_data=mean_mar_women,varmode=1)
df_mar_women<-get_prosp_non_LMS(df_list=df_list_cal_mar,index_number=4,mean_data=mean_mar_women,varmode=2)
df_stu_men<-get_prosp_non_LMS(df_list=df_list_cal_stu,index_number=1,mean_data=mean_stu_men,varmode=1)#1, student
df_stu_women<-get_prosp_non_LMS(df_list=df_list_cal_stu,index_number=2,mean_data=mean_stu_women,varmode=1)

rm(df_list_cal_mar,df_list_cal_stu)
rm(list=ls(pattern="*mean_"))
#CSV tables ----
##Get 2003-2015 tables ----
id_alignment_folder<- drive_get("Alignment_tables_update") 
dl_list<-drive_ls(path=id_alignment_folder) %>% 
  subset(grepl("*03_15",name))

#sheet_id<-drive_get(id=dl_list[[1,2]])
df_list_03_15<-list()
gc()
for (i in 1:nrow(dl_list)){
  get_name<-c(dl_list[[i,1]])
  sheet_id<-drive_get(id=dl_list[[i,2]])
 df_list_03_15[[i]]<- read_sheet(ss=sheet_id) 
 
}
get_names<-t(dl_list[,1])
names(df_list_03_15)<-get_names
rm(i,sheet_id)



##Post-2016  names----
get_names_LMS<-

#OLD CSV tables-
setwd("../../")
setwd("LIAM2_commented_code/Prospective_simulations/Seed_17101945/2014_t4_start/End_of_term_legislations")

list_csv_files <- as.data.frame(list.files(pattern="*.csv")) %>% 
  rename(file_name=1) %>% 
  subset(grepl("central|low|high",file_name))


test<-list()
test2<-list()


start.time=Sys.time()


for (i in 1:1){
  test[[i]]<-read_csv(list_csv_files[i,1])  
}

end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)

start.time=Sys.time()

for (i in 1:1){
  test2[[i]]<-vroom(list_csv_files[i,1])  
}

end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)
rm(start.time,end.time,time.taken)

first_line<-data.frame(1:151) %>% 
  t() %>% 
  as.data.frame() 
names(first_line)<-names(control)

first_line<-first_line %>% 
  mutate(across(everything(),~.x==NA),
         agegroup="agegroup",
         period="period"
         )

test<-control

df_list_cal_LMS_central[[]]

head(control)
list_csv_files

cal_aun_f_central_p.csv


control<-test[[1]] 
control2<-test2[[1]]

for (i in 1:30){
  test[[i]]<-read_csv(list_csv_files[i,1])
}
df<-read_csv(list_csv_files[1,1])
head(df)

test<-sapply(list_csv_files,read_csv(),simplify=TRUE)
test<-read_csv(list_csv_files,id="file_name")

test<-list()
list_csv_files[3]

for (i in 1:30){
  test[[i]]<-read.csv(list_csv_files[i])
}
lapply(list_csv_files,read.csv())

df2 <- readr::read_csv(list_csv_files, id = "file_name")



walk(csv_files$id, 
     ~ drive_download(as_id(.x)))

getwd()
cal_aun_f_central_p <- read_csv("~/Investigación/MISSAR_private/LIAM2_commented_code/Prospective_simulations/Seed_17101945/2014_t4_start/End_of_term_legislations/cal_aun_f_central_p.csv")
View(cal_aun_f_central_p)

#We name the output alignment tables
list_lms<-c("sal","ind","aun","cho","ina")
list_cal_names<-paste0("cal_",list_lms,"_h")
list_fem<-paste0("cal_",list_lms,"_f")

list_cal_names<- c(list_cal_names,list_fem) 
rm(list_lms,list_fem)

df_list_cal_LMS<-c(list_cal_LMS_male,list_cal_LMS_female) %>% 
  setNames(list_cal_names)






#Descriptive statistics ----

id_freq<-df_EPH_post_2016 %>% 
  mutate(person=paste0(CODUSU,NRO_HOGAR,COMPONENTE)) %>% 
  group_by(person) %>% 
  tally() %>% 
  unique() %>% 
  ungroup()

table(id_freq$n)
rm(id_freq)
