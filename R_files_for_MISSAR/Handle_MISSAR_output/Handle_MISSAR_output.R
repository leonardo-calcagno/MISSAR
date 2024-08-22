
# Packages -----------------
#install.packages("tidyverse")
#install.packages("readxl")
#install.packages("openxlsx")
#install.packages("ggplot2")
#install.packages('Rcpp')
#install.packages('questionr')
#install.packages('readr')
#install.packages('googlesheets4')
#install.packages('googledrive')

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
#setwd("C:/Users/lcalcagno/Documents/Investigaci?n/")
setwd("/Users/Leonardo/Documents/MISSAR/")
setwd("MISSAR_private/R_files_for_MISSAR")

#To verify working directory
#getwd()

if(!file.exists("MISSAR_output")) {
  dir.create("MISSAR_output")
}
setwd("MISSAR_output/")


#Functions and path ----
#Import errors may make variables with decimal spaces 1000 times bigger (read as if they were integers). We identify, for all variables with a non-null
#decimal part (.x%%1>0), those that are more than 100 times larger than their median, excluding null values, and correct them. 
correct_csv<-function(input){
 # leave_out<-"FAM_CAP"
  input<-input%>%
    mutate(across(where(is.double ),~ifelse(.x>median(.x[.x>0])*100 & .x%%1>0, .x/1000, 
                                           .x))
           
    )
  
}

leg<-"August_2024_legislation/"
sust<-"Sustainability_LIAM2_output/"
adeq<-"Adequacy_and_redistribution_LIAM2_output/"
#Google authentification may trigger here again, proceed with authentification before going further

#Import csv simulation results -----
sust_folder<-drive_get(paste0(leg,sust))
csv_files<-drive_ls(sust_folder,type="csv")
walk(csv_files$id, 
     ~ drive_download(as_id(.x)))
rm(sust_folder,csv_files)

adeq_folder<-drive_get(paste0(leg,adeq))
csv_files<-drive_ls(adeq_folder,type="csv")
walk(csv_files$id, 
     ~ drive_download(as_id(.x)))

rm(adeq_folder,csv_files)

##Load simulated csv to R -----
csv_workers_and_wage_central <- read_csv("workers_and_wage_central.csv")%>%
  correct_csv()
csv_workers_and_wage_low <- read_csv("workers_and_wage_low.csv")%>%
  correct_csv()
csv_workers_and_wage_high <- read_csv("workers_and_wage_high.csv")%>%
  correct_csv()

csv_central_v2_m <- read_csv("central_v2_m.csv")%>%
  correct_csv()
csv_low_v2_m <- read_csv("low_v2_m.csv")%>%
  correct_csv()
csv_high_v2_m <- read_csv("high_v2_m.csv")%>%
  correct_csv()

csv_central_v5_m <- read_csv("central_v5_m.csv")%>%
  correct_csv()
csv_low_v5_m <- read_csv("low_v5_m.csv")%>%
  correct_csv()
csv_high_v5_m <- read_csv("high_v5_m.csv")%>%
  correct_csv()

csv_central_SIPA_income <- read_csv("central_SIPA_income.csv")%>%
  correct_csv()
csv_low_SIPA_income <- read_csv("low_SIPA_income.csv")%>%
  correct_csv()
csv_high_SIPA_income <- read_csv("high_SIPA_income.csv")%>%
  correct_csv()


csv_temporary_pension_bonus_low <- read_csv("temporary_pension_bonus_low.csv")%>%
  correct_csv()
csv_temporary_pension_bonus_central <- read_csv("temporary_pension_bonus_central.csv")%>%
  correct_csv()
csv_temporary_pension_bonus_high <- read_csv("temporary_pension_bonus_high.csv")%>%
  correct_csv()

csv_IFE_cost_low <- read_csv("IFE_cost_low.csv")%>%
  correct_csv()
csv_IFE_cost_central <- read_csv("IFE_cost_central.csv")%>%
  correct_csv()
csv_IFE_cost_high <- read_csv("IFE_cost_high.csv")%>%
  correct_csv()


csv_central_buyback <- read_csv("buyback_mechanism_central.csv")%>%
  correct_csv()
csv_low_buyback <- read_csv("buyback_mechanism_low.csv")%>%
  correct_csv()
csv_high_buyback <- read_csv("buyback_mechanism_high.csv")%>%
  correct_csv()


#Modify results sheets -----

id_deficit<- drive_get(paste0(leg,"Deficit_computation_Milei_leg"))

write_sheet(csv_workers_and_wage_low,ss=id_deficit,sheet="workers_and_wage_low")
write_sheet(csv_workers_and_wage_central,ss=id_deficit,sheet="workers_and_wage_central")
write_sheet(csv_workers_and_wage_high,ss=id_deficit,sheet="workers_and_wage_high")

write_sheet(csv_temporary_pension_bonus_low,ss=id_deficit,sheet="temporary_pension_bonus_low")
write_sheet(csv_temporary_pension_bonus_central,ss=id_deficit,sheet="temporary_pension_bonus_central")
write_sheet(csv_temporary_pension_bonus_high,ss=id_deficit,sheet="temporary_pension_bonus_high")

write_sheet(csv_IFE_cost_low,ss=id_deficit,sheet="IFE_cost_low")
write_sheet(csv_IFE_cost_central,ss=id_deficit,sheet="IFE_cost_central")
write_sheet(csv_IFE_cost_high,ss=id_deficit,sheet="IFE_cost_high")


write_sheet(csv_low_v2_m,ss=id_deficit,sheet="low_v2_m")
write_sheet(csv_central_v2_m,ss=id_deficit,sheet="central_v2_m")
write_sheet(csv_high_v2_m,ss=id_deficit,sheet="high_v2_m")

write_sheet(csv_low_v5_m,ss=id_deficit,sheet="low_v5_m")
write_sheet(csv_central_v5_m,ss=id_deficit,sheet="central_v5_m")
write_sheet(csv_high_v5_m,ss=id_deficit,sheet="high_v5_m")

write_sheet(csv_low_SIPA_income,ss=id_deficit,sheet="low_SIPA_income")
write_sheet(csv_central_SIPA_income,ss=id_deficit,sheet="central_SIPA_income")
write_sheet(csv_high_SIPA_income,ss=id_deficit,sheet="high_SIPA_income")

write_sheet(csv_low_buyback,ss=id_deficit,sheet="low_buyback_mechanism")
write_sheet(csv_central_buyback,ss=id_deficit,sheet="central_buyback_mechanism")
write_sheet(csv_high_buyback,ss=id_deficit,sheet="high_buyback_mechanism")


rm(list=ls(pattern="^csv_"))


##Apply short-term growth, CPI and wage to results file -----
id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public") #Prepare globals csv with R to avoid formatting errors
id_deficit<- drive_get(paste0(leg,"Deficit_computation_Milei_leg"))

apply_short_term_macro<-function(scenario){
sheet_name<-paste0(scenario," macro hypothesis")
df<-read_sheet(id_globals,sheet=sheet_name,range="B4:G39",col_names = FALSE) %>% 
  select(c(1,4,6))
vector_GDP<-df[,1]
vector_CPI<-df[,2]
vector_wage<-df[,3]

range_write(vector_GDP,ss=id_deficit,sheet=sheet_name,range="B4",reformat=FALSE,col_names=FALSE)
range_write(vector_CPI,ss=id_deficit,sheet=sheet_name,range="D4",reformat=FALSE,col_names=FALSE)
range_write(vector_wage,ss=id_deficit,sheet=sheet_name,range="F4",reformat=FALSE,col_names=FALSE)
}
apply_short_term_macro("Central")
apply_short_term_macro("Pessimistic")
apply_short_term_macro("Optimist")

#Export projected GDP and ANSES income to the globals making sheet file ------

sim_GDP_central<-read_sheet(id_deficit,sheet="GDP evolution by scenario",range="E11:E114",col_names = FALSE)%>% #We import simulated GDP, since 2015
  rename(Central=c(1))%>%
  mutate(mergeid=row_number())
sim_GDP_high<-read_sheet(id_deficit,sheet="GDP evolution by scenario",range="K11:K114",col_names = FALSE)%>%
  rename(High=c(1))%>%
  mutate(mergeid=row_number())
sim_GDP_low<-read_sheet(id_deficit,sheet="GDP evolution by scenario",range="P11:P114",col_names = FALSE)%>%
  rename(Low=c(1))%>%
  mutate(mergeid=row_number())

sim_GDP<-sim_GDP_central%>%
  left_join(sim_GDP_low)%>%
  left_join(sim_GDP_high)%>%
  select(-c(mergeid))
rm(sim_GDP_central,sim_GDP_low,sim_GDP_high)
head(sim_GDP)



sim_income_central<-read_sheet(id_deficit,sheet="Central SIPA income",range="E9:E112",col_names = FALSE)%>% #We import simulated contributions
  rename(Central=c(1))%>%
  mutate(mergeid=row_number())
sim_income_low<-read_sheet(id_deficit,sheet="Low SIPA income",range="E9:E112",col_names = FALSE)%>%
  rename(Low=c(1))%>%
  mutate(mergeid=row_number())
sim_income_high<-read_sheet(id_deficit,sheet="High SIPA income",range="E9:E112",col_names = FALSE)%>%
  rename(High=c(1))%>%
  mutate(mergeid=row_number())



sim_income<-sim_income_central%>%
  left_join(sim_income_low)%>%
  left_join(sim_income_high)%>%
  select(-c(mergeid))
rm(sim_income_central,sim_income_low,sim_income_high)
head(sim_income)


sim_workers_central<-read_sheet(id_deficit,sheet="workers_and_wage_central",range="C2:C105",col_names = FALSE)%>% #We import simulated contributions
  rename(Central=c(1))%>%
  mutate(mergeid=row_number())
sim_workers_low<-read_sheet(id_deficit,sheet="workers_and_wage_low",range="C2:C105",col_names = FALSE)%>%
  rename(Low=c(1))%>%
  mutate(mergeid=row_number())
sim_workers_high<-read_sheet(id_deficit,sheet="workers_and_wage_high",range="C2:C105",col_names = FALSE)%>%
  rename(High=c(1))%>%
  mutate(mergeid=row_number())

sim_wage_central<-read_sheet(id_deficit,sheet="workers_and_wage_central",range="B2:B105",col_names = FALSE)%>% #We import simulated contributions
  rename(Central=c(1))%>%
  mutate(mergeid=row_number())
sim_wage_low<-read_sheet(id_deficit,sheet="workers_and_wage_low",range="B2:B105",col_names = FALSE)%>%
  rename(Low=c(1))%>%
  mutate(mergeid=row_number())
sim_wage_high<-read_sheet(id_deficit,sheet="workers_and_wage_high",range="B2:B105",col_names = FALSE)%>%
  rename(High=c(1))%>%
  mutate(mergeid=row_number())

sim_workers<-sim_workers_low%>%
  left_join(sim_workers_central)%>%
  left_join(sim_workers_high)%>%
  select(-c(mergeid))
rm(sim_workers_low,sim_workers_central,sim_workers_high)
head(sim_workers)


sim_wage<-sim_wage_low%>%
  left_join(sim_wage_central)%>%
  left_join(sim_wage_high)%>%
  select(-c(mergeid))
rm(sim_wage_central,sim_wage_low,sim_wage_high)
head(sim_wage)

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public")
range_write(sim_income,ss=id_globals,sheet="Simulated_ANSES_contributions",range="B3:D107",reformat=FALSE)
range_write(sim_GDP,ss=id_globals,sheet="Simulated_ANSES_contributions",range="H3:J107",reformat=FALSE)
range_write(sim_workers,ss=id_globals,sheet="Labour GDP participation",range="N3:P107",reformat=FALSE)
range_write(sim_wage,ss=id_globals,sheet="Labour GDP participation",range="Q3:S107",reformat=FALSE)

rm(list=ls(pattern="^sim_"))




#Update adequacy results file ----

csv_adequacy_low <- read_csv("adequacy_low.csv")%>%
  correct_csv()
csv_adequacy_central <- read_csv("adequacy_central.csv")%>%
  correct_csv()
csv_adequacy_high <- read_csv("adequacy_high.csv")%>%
  correct_csv()

csv_redistribution_low <- read_csv("redistribution_low.csv")%>%
  correct_csv()
csv_redistribution_central <- read_csv("redistribution_central.csv")%>%
  correct_csv()
csv_redistribution_high <- read_csv("redistribution_high.csv")%>%
  correct_csv()

csv_redistribution_low_sedlac <- read_csv("redistribution_low_sedlac.csv")%>%
  correct_csv()
csv_redistribution_central_sedlac <- read_csv("redistribution_central_sedlac.csv")%>%
  correct_csv()
csv_redistribution_high_sedlac <- read_csv("redistribution_high_sedlac.csv")%>%
  correct_csv()

csv_redistribution_low_insee <- read_csv("redistribution_low_insee.csv")%>%
  correct_csv()
csv_redistribution_central_insee <- read_csv("redistribution_central_insee.csv")%>%
  correct_csv()
csv_redistribution_high_insee <- read_csv("redistribution_high_insee.csv")%>%
  correct_csv()


#Modify the corresponding sheets
id_adequacy<- drive_get(paste0(leg,"Graphics_adequacy"))

write_sheet(csv_adequacy_central,ss=id_adequacy,sheet="Adequacy_central")
write_sheet(csv_adequacy_low,ss=id_adequacy,sheet="Adequacy_low")
write_sheet(csv_adequacy_high,ss=id_adequacy,sheet="Adequacy_high")

##Update wage figures ----

sim_wage_central<-read_sheet(id_deficit,sheet="workers_and_wage_central",range="B2:B105",col_names = FALSE)%>% #We import simulated contributions
  rename(Real_wages_central=c(1))
sim_wage_low<-read_sheet(id_deficit,sheet="workers_and_wage_low",range="B2:B105",col_names = FALSE)%>%
  rename(Real_wages_low=c(1))
sim_wage_high<-read_sheet(id_deficit,sheet="workers_and_wage_high",range="B2:B105",col_names = FALSE)%>%
  rename(Real_wages_high=c(1))

range_write(sim_wage_low,ss=id_adequacy,sheet="Retirement benefit values", range="B5:B108",reformat=FALSE,col_names = FALSE)
range_write(sim_wage_central,ss=id_adequacy,sheet="Retirement benefit values", range="R5:R108",reformat=FALSE,col_names = FALSE)
range_write(sim_wage_high,ss=id_adequacy,sheet="Retirement benefit values", range="AO5:AO108",reformat=FALSE,col_names = FALSE)

##Update minimum wage and minimum pension figures -----

id_globals<- drive_get("Inflation_RIPTE_and_ANSES_discounting_public")
csv_minima<-read_sheet(id_globals,sheet="copy_to_csv_2020_leg",col_names = FALSE)
csv_minima<-csv_minima%>%
  subset(...1 %in% c("PERIOD","MIN_PENSION_CENTRAL_2014_T4","MINIMUM_WAGE_CENTRAL_2014_T4",
                     "MIN_PENSION_HIGH_2014_T4","MINIMUM_WAGE_HIGH_2014_T4","MIN_PENSION_LOW_2014_T4","MINIMUM_WAGE_LOW_2014_T4"))%>%
  t()%>%
  as.data.frame()#Transposing gives a character string object, put it back to df
names(csv_minima)<-csv_minima[1,] #Put first row as column names
csv_minima<-csv_minima[-1,]%>%
  mutate(PERIOD=as.numeric(PERIOD))%>%
  subset(PERIOD>=49 & PERIOD<153)#We keep only projected periods
view(csv_minima)
minima_low<-csv_minima%>%
  select(c("MINIMUM_WAGE_LOW_2014_T4","MIN_PENSION_LOW_2014_T4"))%>%
  mutate(across(where(is.character),~as.numeric(.x))#Convert to numeric all character variables
  )

minima_central<-csv_minima%>%
  select(c("MINIMUM_WAGE_CENTRAL_2014_T4","MIN_PENSION_CENTRAL_2014_T4"))%>%
  mutate(across(where(is.character),~as.numeric(.x))#Convert to numeric all character variables
  )
minima_high<-csv_minima%>%
  select(c("MINIMUM_WAGE_HIGH_2014_T4","MIN_PENSION_HIGH_2014_T4"))%>%
  mutate(across(where(is.character),~as.numeric(.x))#Convert to numeric all character variables
  )

view(minima_low)
range_write(minima_low,ss=id_adequacy,sheet="Retirement benefit values", range="i5:j108",reformat=FALSE,col_names = FALSE)
range_write(minima_central,ss=id_adequacy,sheet="Retirement benefit values", range="AE5:AF108",reformat=FALSE,col_names = FALSE)
range_write(minima_high,ss=id_adequacy,sheet="Retirement benefit values", range="BB5:BC108",reformat=FALSE,col_names = FALSE)

rm(list=ls(pattern="^minima_"))
rm(csv_minima)




#Update redistribution sheets -----

id_redistribution<- drive_get(paste0(leg,"Graphics_redistribution_per_capita"))
id_redistribution_SEDLAC<- drive_get(paste0(leg,"Graphics_redistribution_SEDLAC"))
id_redistribution_INSEE<- drive_get(paste0(leg,"Graphics_redistribution_INSEE"))


write_sheet(csv_redistribution_central,ss=id_redistribution,sheet="Redistribution_central")
write_sheet(csv_redistribution_low,ss=id_redistribution,sheet="Redistribution_low")
write_sheet(csv_redistribution_high,ss=id_redistribution,sheet="Redistribution_high")

write_sheet(csv_redistribution_central_sedlac,ss=id_redistribution_SEDLAC,sheet="Redistribution_central")
write_sheet(csv_redistribution_low_sedlac,ss=id_redistribution_SEDLAC,sheet="Redistribution_low")
write_sheet(csv_redistribution_high_sedlac,ss=id_redistribution_SEDLAC,sheet="Redistribution_high")

write_sheet(csv_redistribution_central_insee,ss=id_redistribution_INSEE,sheet="Redistribution_central")
write_sheet(csv_redistribution_low_insee,ss=id_redistribution_INSEE,sheet="Redistribution_low")
write_sheet(csv_redistribution_high_insee,ss=id_redistribution_INSEE,sheet="Redistribution_high")

#Milei legislation does not use simulated number of pensions for future pension mobility, we stop here.

rm(list=ls(pattern="^sim_"))
rm(list=ls(pattern="^csv_"))

#Cleanup -----
setwd("../")
unlink("MISSAR_output",recursive=TRUE)
rm(list=ls())









