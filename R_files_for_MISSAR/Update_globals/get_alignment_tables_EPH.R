####This code is the R transcription of the SAS file: "3.3 Import EPH post 2016 and get alignment datasets"
  #It updates the alignment csv files with labour-market participation, education levels, marital status 
  #and proportion of students
  #We take data from the Permanent Household Survey (EPH) post 2016.


# Packages -----------------
rm(list=ls())
gc()
library(tidyverse)
library(eph)
setwd("C:/Users/lcalcagno/Documents/Investigación/MISSAR_private")
setwd("R_files_for_MISSAR/Update_globals")
# Import datasets ------------------
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
  mutate(period=row_number()+51) #Period format used in MISSAR, 52 is the second quarter of 2016.

df_EPH_post_2016<-dl_EPH_post_2016 %>% 
  left_join(vector_periods) %>% 
  mutate(formation=ifelse(NIVEL_ED==6, 3, #University degree
                          ifelse(NIVEL_ED==4 | NIVEL_ED==5, 2, #At least high-school degree
                                 1)#Did not finish high school, or unknown
                          ),
         ageconti=ifelse(CH06==-1, 0, 
                         CH06),
         contributes=ifelse(PP07H==1 | PP07I==1, TRUE, #Compulsory or voluntary contributions
                            FALSE)
    
        )
#Run this to control variables run as intended
#table(df_EPH_post_2016$contributes,df_EPH_post_2016$PP07H)
#table(df_EPH_post_2016$contributes,df_EPH_post_2016$PP07I)
#table(df_EPH_post_2016$formation,df_EPH_post_2016$NIVEL_ED)
df_EPH_post_2016<-df_EPH_post_2016 %>% 
  select(-c(PP07H,PP07I,CH06,NIVEL_ED))


#We verify independent workers in the EPH don't report social security contributions
control<-dl_EPH_post_2016 %>% 
  subset(ESTADO==1 & (CAT_OCUP==1|CAT_OCUP==2)) 

table(control$PP07H,control$PP07I)
rm(control)
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
                                    )
       )
  
#Run the following to verify the labour-market state variable was correctly created
control<-df_EPH_post_2016 %>% 
  select(c(labour_market_state,ESTADO,CAT_OCUP,contributes,is_indep)) %>% 
  unique()
table(control$labour_market_state,control$ESTADO)
table(control$labour_market_state,control$CAT_OCUP)
table(control$labour_market_state,control$contributes)
table(control$labour_market_state,control$is_indep)
rm(control)

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

#control<-df_EPH_post_2016 %>% #Controls the function works well
#  select(c(ageconti,agegroup,agegroup_ext)) %>% 
#  unique() %>% 
#  arrange(ageconti)
#view(control)
#rm(control)

#Descriptive statistics ----

id_freq<-df_EPH_post_2016 %>% 
  mutate(person=paste0(CODUSU,NRO_HOGAR,COMPONENTE)) %>% 
  group_by(person) %>% 
  tally() %>% 
  unique() %>% 
  ungroup()

table(id_freq$n)
rm(id_freq)
