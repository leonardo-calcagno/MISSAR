
#Update simulated number of pensions in globals file -----
correct_benefits<-function(input){
  sim_benefits<-input%>%
    select(period,Total_SIPA_benefits,Moratorium_senate_benefits,Total_PUAM_benefits,Total_non_moratorium_benefits)
  
  moratorium_jump<-sim_benefits%>%
    subset(period==79 | period==80)%>%
    mutate(Total_old_mor_benefits=Total_SIPA_benefits - Moratorium_senate_benefits - Total_PUAM_benefits - Total_non_moratorium_benefits)    
  
  last_uni<-moratorium_jump[1,4]%>%
    mutate(mergeid=1)%>%
    rename(last_PUAM=Total_PUAM_benefits)
  
  first_sen_mor<-moratorium_jump[2,3]%>%
    mutate(mergeid=1)%>%
    rename(moratorium_jump=Moratorium_senate_benefits)
  
  last_old_moratorium<-moratorium_jump[1,6]%>%
    mutate(mergeid=1)%>%
    rename(old_moratorium=Total_old_mor_benefits)
  
  old_moratorium_decrease<-moratorium_jump[2,6]%>%
    mutate(mergeid=1)%>%
    rename(old_moratorium_fall=Total_old_mor_benefits)
  
  correction<-last_uni%>%
    left_join(first_sen_mor)%>%
    left_join(last_old_moratorium)%>%
    left_join(old_moratorium_decrease)%>%
    mutate(old_moratorium_drop=old_moratorium-old_moratorium_fall)%>%
    mutate(correction_factor=moratorium_jump-last_PUAM-old_moratorium_drop)%>%
    select(c(mergeid,correction_factor))
  
  output<-sim_benefits%>%
    mutate(mergeid=1)%>%
    left_join(correction)%>%
    select(-c(mergeid))
}
test<-correct_benefits(csv_adequacy_central)
head(test)

sim_benefits_central<-csv_adequacy_central%>%
  select(period,Total_SIPA_benefits,Moratorium_senate_benefits,Total_PUAM_benefits,Total_non_moratorium_benefits)%>%
  rename(Central_total=Total_SIPA_benefits, 
         Central_uni=Total_PUAM_benefits, 
         Central_Sen_mor=Moratorium_senate_benefits, 
         Central_cont=Total_non_moratorium_benefits)

#Update simulated number of pensions in globals file -----
sim_benefits_low<-csv_adequacy_low%>%
  select(period,Total_SIPA_benefits,Moratorium_senate_benefits,Total_PUAM_benefits,Total_non_moratorium_benefits)%>%
  rename(Low_total=Total_SIPA_benefits, 
         Low_uni=Total_PUAM_benefits, 
         Low_Sen_mor=Moratorium_senate_benefits, 
         Low_cont=Total_non_moratorium_benefits)

#Update simulated number of pensions in globals file -----
sim_benefits_high<-csv_adequacy_high%>%
  select(period,Total_SIPA_benefits,Moratorium_senate_benefits,Total_PUAM_benefits,Total_non_moratorium_benefits)%>%
  rename(High_total=Total_SIPA_benefits, 
         High_uni=Total_PUAM_benefits, 
         High_Sen_mor=Moratorium_senate_benefits, 
         High_cont=Total_non_moratorium_benefits)

moratorium_jump_central<-sim_benefits_central%>%
  subset(period==79 | period==80)%>%
  mutate(Central_old_mor=Central_total - Central_uni - Central_cont - Central_Sen_mor)

moratorium_jump_low<-sim_benefits_low%>%
  subset(period==79 | period==80)%>%
  mutate(Low_old_mor=Low_total - Low_uni - Low_cont - Low_Sen_mor)

moratorium_jump_high<-sim_benefits_high%>%
  subset(period==79 | period==80)%>%
  mutate(High_old_mor=High_total - High_uni - High_cont - High_Sen_mor)
head(moratorium_jump_high)
last_uni<-moratorium_jump[1,4]%>%
  mutate(mergeid=1)%>%
  rename(last_PUAM=Central_uni)
first_sen_mor<-moratorium_jump[2,3]%>%
  mutate(mergeid=1)%>%
  rename(moratorium_jump=Central_Sen_mor)
last_old_moratorium<-moratorium_jump[1,6]%>%
  mutate(mergeid=1)%>%
  rename(temp_1=Central_old_mor)
old_moratorium_drop<-moratorium_jump[2,6]%>%
  mutate(mergeid=1)%>%
  rename(temp_2=Central_old_mor)

moratorium_drop<-last_old_moratorium%>%
  left_join(old_moratorium_drop)%>%
  mutate(Central_old_mor_drop=temp_1-temp_2)%>%
  select(-c(temp_1,temp_2))

constant_legislation_correction<-moratorium_drop%>%
  left_join(last_uni)%>%
  left_join(first_sen_mor)%>%
  mutate(Central_correction=moratorium_jump-last_PUAM-Central_old_mor_drop)
head(constant_legislation_correction)

rm(moratorium_jump,moratorium_drop,last_uni,first_sen_mor,last_old_moratorium,old_moratorium_drop)


sim_benefits_central<-sim_benefits_central%>%
  mutate(mergeid=1)%>%
  left_join(last_uni)%>%
  left_join(first_sen_mor)%>%
  select(-c(mergeid))%>%
  mutate(Central_constant_leg=ifelse(period<80, Central_total, 
                                     Central_total-moratorium_jump+last_PUAM))

view(sim_benefits_central)

view(sim_benefits_central)
mutate(Central_constant_leg=ifelse(period)) #SEGUIR AQUI, CORREGIR CON LEGISLACIÓN CONSTANTE
test<-first_sen_mor-last_uni

head(moratorium_jump)

sim_benefits_low<-csv_adequacy_low%>%
  select(period,Total_SIPA_benefits,Total_non_moratorium_benefits)%>%
  rename(Pesimista_total=Total_SIPA_benefits, 
         Pesimista_cont=Total_non_moratorium_benefits)

sim_benefits_high<-csv_adequacy_high%>%
  select(period,Total_SIPA_benefits,Total_non_moratorium_benefits)%>%
  rename(Optimista_total=Total_SIPA_benefits, 
         Optimista_cont=Total_non_moratorium_benefits)


sim_benefits<-sim_benefits_central%>%
  left_join(sim_benefits_low)%>%
  left_join(sim_benefits_high)%>%
  select(-c(period))
rm(sim_benefits_central,sim_benefits_low,sim_benefits_high)

sim_benefits<-sim_benefits[,c(1,3,5,2,4,6)] #Re-order columns

range_write(sim_benefits,ss=id_globals,sheet="Simulated_ANSES_contributions",range="AV3:BA107",reformat=FALSE)

rm(list=ls(pattern="^sim_"))
rm(list=ls(pattern="^csv_"))
