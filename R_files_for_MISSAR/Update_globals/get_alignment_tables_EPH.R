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

#Takes 1 minute to download everything
options(warn=1)#Set your warning level to 1; else, any missing quarter will cause an error and stop the download.
dl_EPH_post_2016<-get_microdata(year=2016:2022, #Years
                        trimester=1:4, #Quarters
                        type="individual", #Individual base
                        vars=vars_to_import)

table(dl_EPH_post_2016$ANO4,dl_EPH_post_2016$TRIMESTRE) #Shows which periods were downloaded
end.time=Sys.time()
time.taken=end.time-start.time
head(time.taken)
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
                              FALSE)#,
         #  contributes=ifelse(PP04A==1, TRUE, #Make public-sector workers contribute to social security, even when they declare otherwise
          #                    contributes)
      
          )

rm(vector_periods)
  #Run this to control variables run as intended
  #table(df_EPH_post_2016$contributes,df_EPH_post_2016$PP07H)
  #table(df_EPH_post_2016$contributes,df_EPH_post_2016$PP07I)
  #table(df_EPH_post_2016$formation,df_EPH_post_2016$NIVEL_ED)
  
  df_EPH_post_2016<-df_EPH_post_2016 %>% 
    select(-c(PP07H,PP07I,CH06,NIVEL_ED))
  
  
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
  subset(ageconti>=16 & ageconti<=69 ) %>% #Use ageconti for subsetting, else age 15 is included
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

#Hist. LMS tables-----
cal_LMS<-df_EPH_post_2016 %>% 
  subset(ageconti>=16 & ageconti<=69 ) %>%
  group_by(period,CH04,agegroup,labour_market_state) %>% 
  summarise(total_LMS=sum(PONDERA)) %>% 
  ungroup() %>% 
  left_join(cal_base_agegroup) %>% 
  mutate(cal_perc=ifelse(total!=0, total_LMS/total, #LMS weighted participation by age group and gender
                         0)
  )

list_agegroup<-as.data.frame(table(cal_LMS$agegroup)) %>% 
  select(-c(Freq)) %>% 
  t() %>% 
  as.character() #We make an agegroup list, for the align_table() function


align_table<-function(indata,agelist,agevar,varmode,varvalue,gender){
  
  outdata<-indata %>% 
    select(c(period)) %>% 
    unique() %>% 
    t() %>% 
    as.data.frame() %>% 
    mutate(agevar=NA) %>% 
    select(c(agevar,everything()))  #This outputs a line with one variable per period, and period number
  
  
  for(j in list_agegroup){ #We loop over age groups, for a given gender, the percentage of people in the studied state, by period
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
  list_cal_LMS_male [[i]]<-align_table(cal_LMS,list_agegroup,"agegroup","labour_market_state",i,1)
}

list_cal_LMS_female<-list()
for (i in 1:5){
  list_cal_LMS_female [[i]]<-align_table(cal_LMS,list_agegroup,"agegroup","labour_market_state",i,2)
}

#We name the output alignment tables
list_lms<-c("sal","ind","aun","cho","ina")
list_cal_names<-paste0("cal_",list_lms,"_h")
list_fem<-paste0("cal_",list_lms,"_f")

list_cal_names<- c(list_cal_names,list_fem) 
rm(list_lms,list_fem)

df_list_cal_LMS<-c(list_cal_LMS_male,list_cal_LMS_female) %>% 
  setNames(list_cal_names)

rm(list_cal_LMS_male,list_cal_LMS_female,list_cal_names,i)
##Marital status
##Education level 


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


id_pop_men<-drive_get(path=paste0(leg,sust),id="active_age_men.csv") #This is LIAM2 output
id_pop_women<-drive_get(path=paste0(leg,sust),id="active_age_women.csv")

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
#Average LMS by agegroup and gender

#We average, by agegroup and gender, labour-market state participation, from the second quarter of 2016 onward
cal_average_agegroup_LMS<-cal_LMS %>% 
  #subset(period>=70)%>% #To average over more recent years, uncomment this line 
  group_by(CH04,labour_market_state,agegroup) %>% 
  summarise(mean_LMS=mean(cal_perc)) %>% 
  ungroup()
#This shows averaged labour-market participation sums to 1
control_men<-data.frame(sum_LMS_freq=double(),agegroup=integer())
for (i in list_agegroup)
  {
  only_one_agegroup<-cal_average_agegroup_LMS %>% 
      subset(CH04==1 & agegroup==i)
  
  add_row<-as.data.frame(sum(only_one_agegroup$mean_LMS)) %>% 
      rename(sum_LMS_freq=1) %>% 
      mutate(agegroup=as.integer(i))
  
  control_men<-bind_rows(control_men,add_row)  
}
head(control_men)
rm(only_one_agegroup,add_row,control_men)


control_women<-data.frame(sum_LMS_freq=double(),agegroup=integer())
for (i in list_agegroup)
{
  only_one_agegroup<-cal_average_agegroup_LMS %>% 
    subset(CH04==2 & agegroup==i)
  
  add_row<-as.data.frame(sum(only_one_agegroup$mean_LMS)) %>% 
    rename(sum_LMS_freq=1) %>% 
    mutate(agegroup=as.integer(i))
  
  control_women<-bind_rows(control_women,add_row)  
}
head(control_women)
rm(only_one_agegroup,add_row,control_women)

cal_average_men<-data.frame()

for (i in 1:5){
  add_row<-cal_average_agegroup_LMS %>% 
    subset(CH04==1 & labour_market_state==i) %>% 
    select(-c(CH04,labour_market_state,agegroup)) %>% 
    t() %>% 
    as.data.frame()
  cal_average_men<-bind_rows(cal_average_men,add_row)
}

cal_average_women<-data.frame()

for (i in 1:5){
  add_row<-cal_average_agegroup_LMS %>% 
    subset(CH04==2 & labour_market_state==i) %>% 
    select(-c(CH04,labour_market_state,agegroup)) %>% 
    t() %>% 
    as.data.frame()
  cal_average_women<-bind_rows(cal_average_women,add_row)
}

rm(add_row)
##Ratio [35-40[----
#We need to get for each LMS, percentage of age group x as a factor of percentage of age group 35 (equals 100) ONGOING

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
ratio_men<-ratio_agegroups(cal_average_men)
ratio_women<-ratio_agegroups(cal_average_women)

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
rm(latest_period)

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
rm(df_list_cal_LMS,i)


#rm(list=setdiff(ls(),pattern="^df_list"))

#CSV tables-----
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
