/*We import the continous EPH datasets released between the second quarter of 2016 and the first quarter of 2017, after the (slight) 
		methodological changes introduced in 2016. These datasets are purposefully not compatible with the 2003-2015 waves of the EPH 
		(which the INDEC administration appointed in 2016 claims were fraudulently altered during the peronist 2003-2015 government). 
		They have their problems of their own, mainly a very high No-response for the labour income variable: between the second quarter
		of 2016 and the first quarter of 2017, 25% of working respondents that were not family workers had a null or missing labour income. 
		This figure was equal to 2.7% for the 2003-2015 version of the EPHc.*/
/*Therefore, we only use these last waves ffor the aggregate calibration of our simulations in the 2016-2017 period. This period is small, 
		but it plays an important role in the design of our prospective scenarios.*/

PROC IMPORT OUT=leo.ephc_2016_t02
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2016\usu_individual_t216.xls"
            DBMS=xls REPLACE;
RUN;


PROC IMPORT OUT=leo.ephc_2016_t03
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2016\usu_individual_t316.xls"
            DBMS=xls REPLACE;
RUN;

PROC IMPORT OUT=leo.ephc_2016_t04
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2016\usu_individual_t416.xlsx"
            DBMS=xlsX REPLACE;
RUN;

PROC IMPORT OUT=leo.ephc_2017_t01
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2017\usu_individual_t117_ult.xlsx"
            DBMS=xlsX REPLACE;
RUN;

/*A major problem with the post-2016 EPHc is that they thought it would be nice to make the data available on an excel (xls, xlsx). This 
		introduces serious format issues. This is mainly the case for the second and third quarters of 2016, released in a xls format. 
		We thus added some code to make these datasets formatting compatible with that of the fourth base of 2016.*/

proc contents data=leo.ephc_2016_t02; run; 
proc contents data=leo.ephc_2016_t04; run; 
/*We first run a proc contents on the fourth quarter of 2016 to figure out that sets variables' format. */
/*We then correct the formats on the second quarter of 2016*/
data leo.ephc_2016_t02; 
set leo.ephc_2016_t02; 
adecindr_num=input (adecindr, best.); drop adecindr; rename adecindr_num=adecindr; 
adecocur_num=input (ADECOCUR, best.); drop adecocur; rename adecocur_num=adecocur; 
format AGLOMERADO best.; 
format ano4 best.; 
format cat_inac best.; 
format cat_ocup best.; 
format ch03 best.; 
format ch04 best.; 
format ch05 MMDDYY10.; 
format ch06 best.; 
format ch07 best.; 
format ch08 best.; 
format ch09 best.; 
format ch10 best.; 
format ch11 best.; 
format ch12 best.; 
format ch13 best.; 
CH14_num=input (CH14, best.); drop CH14; rename CH14_num=CH14; 
format ch15 best.; 
format ch16 best.; 
format componente best.; 
decindr_num=input (decindr, best.); drop decindr; rename decindr_num=decindr; 
decocur_num=input (decOCUR, best.); drop decocur; rename decocur_num=decocur; 
format estado best.; 
format h15 best.; 
format imputa best.; 
format intensi best.; 
format ipcf best.; 
format itf best.; 
format nivel_ed best.; 
format nro_household best.; 
format p21 best.; 
format p47t best.; 
format pondera best.;
format pondih best.; 
format pondih best.; 
format pondii best.; 
format pondiio best.; 
format PP02C1 best.; 
format PP02C2 best.; 
format PP02C3 best.; 
format PP02C4 best.; 
format PP02C5 best.; 
format PP02C6 best.; 
format PP02C7 best.; 
format PP02C8 best.; 
format PP02E best.; 
format PP02h best.; 
format PP02I best.; 
format PP03C best.; 
format PP03D best.; 
format PP03G best.; 
format PP03H best.; 
format PP03I best.; 
format PP03J best.; 
format PP04A best.; 
format PP04B1 best.; 
format PP04B2 best.; 
format PP04B3_ANO best.; 
format PP04B3_DIA best.; 
format PP04B3_MES best.; 
format PP04B_COD best.; 
format PP04C best.; 
format PP04C99 best.; 
PP04D_COD_num=input (PP04D_COD, best.); drop PP04D_COD; rename PP04D_COD_num=PP04D_COD; 
format PP04G best.; 
format PP05B2_ANO best.;  
format PP05B2_DIA best.;  
format PP05B2_MES best.;  
format PP05C_1 best.;  
format PP05C_2 best.;  
format PP05C_3 best.;  
format PP05E best.;   
format PP05F best.;  
format PP05H best.;   
format PP06A best.;
format PP06C best.;
format PP06D best.;
format PP06E best.;
format PP06H best.;
format PP07A best.;
format PP07C best.;
format PP07D best.;
format PP07E best.;
format PP07F1 best.;
format PP07F2 best.;
format PP07F3 best.;
format PP07F4 best.;
format PP07F5 best.;
format PP07G1 best.;
format PP07G2 best.;
format PP07G3 best.;
format PP07G4 best.;
format PP07G_59 best.;
format PP07H best.;
format PP07I best.;
format PP07J best.;
format PP07K best.;
format PP08D1 best.;
format PP08D4 best.;
format PP08F1 best.;
format PP08F2 best.;
format PP08J1 best.;
format PP08J2 best.;
format PP08J3 best.;
format PP09A best.;
format PP09B best.;
format PP09C best.;
format PP09C_ESP $42.;
format PP10A best.;
format PP10C best.;
format PP10D best.;
format PP10E best.;
format PP11A best.;
format PP11B1 best.;
format PP11B2_ANO best.;
format PP11B2_DIA best.;
format PP11B2_MES best.;
format PP11B_COD best.;
format PP11C best.;
format PP11C99 best.;
PP11D_COD_num=input (PP11D_COD, best.); drop PP11D_COD; rename PP11D_COD_num=PP11D_COD; 
format PP11G_ANO best.;
format PP11G_DIA best.;
format PP11G_MES best.;
format PP11L best.;
format PP11L1 best.;
format PP11M best.;
format PP11N best.;
format PP11O best.;
format PP11P best.;
format PP11Q best.;
format PP11R best.;
format PP11S best.;
format PP11T best.;
format PP3E_TOT best.;
format PP3F_TOT best.;
rdecindr_num=input (rdecindr, best.); drop rdecindr; rename rdecindr_num=rdecindr; 
rdecocur_num=input (rdecOCUR, best.); drop rdecocur; rename rdecocur_num=rdecocur; 
format REGION best.;
format TOT_P12 best.;
format TRIMESTRE best.;
format T_VI best.;
format V10_M best.;
format V11_M best.;
format V12_M best.;
format V18_M best.;
format V19_AM best.;
format V21_M best.;
format V2_M best.;
format V3_M best.;
format V4_M best.;
format V5_M best.;
format V8_M best.;
format V9_M best.;

run; 
/*We apply the same corrections for the third quarter of 2016*/
data leo.ephc_2016_t03; 
set leo.ephc_2016_t03; 
adecindr_num=input (adecindr, best.); drop adecindr; rename adecindr_num=adecindr; 
adecocur_num=input (ADECOCUR, best.); drop adecocur; rename adecocur_num=adecocur; 
format AGLOMERADO best.; 
format ano4 best.; 
format cat_inac best.; 
format cat_ocup best.; 
format ch03 best.; 
format ch04 best.; 
format ch05 MMDDYY10.; 
format ch06 best.; 
format ch07 best.; 
format ch08 best.; 
format ch09 best.; 
format ch10 best.; 
format ch11 best.; 
format ch12 best.; 
format ch13 best.; 
CH14_num=input (CH14, best.); drop CH14; rename CH14_num=CH14; 
format ch15 best.; 
format ch16 best.; 
format componente best.; 
decindr_num=input (decindr, best.); drop decindr; rename decindr_num=decindr; 
decocur_num=input (decOCUR, best.); drop decocur; rename decocur_num=decocur; 
format estado best.; 
format h15 best.; 
format imputa best.; 
format intensi best.; 
format ipcf best.; 
format itf best.; 
format nivel_ed best.; 
format nro_household best.; 
format p21 best.; 
format p47t best.; 
format pondera best.;
format pondih best.; 
format pondih best.; 
format pondii best.; 
format pondiio best.; 
format PP02C1 best.; 
format PP02C2 best.; 
format PP02C3 best.; 
format PP02C4 best.; 
format PP02C5 best.; 
format PP02C6 best.; 
format PP02C7 best.; 
format PP02C8 best.; 
format PP02E best.; 
format PP02h best.; 
format PP02I best.; 
format PP03C best.; 
format PP03D best.; 
format PP03G best.; 
format PP03H best.; 
format PP03I best.; 
format PP03J best.; 
format PP04A best.; 
format PP04B1 best.; 
format PP04B2 best.; 
format PP04B3_ANO best.; 
format PP04B3_DIA best.; 
format PP04B3_MES best.; 
format PP04B_COD best.; 
format PP04C best.; 
format PP04C99 best.; 
PP04D_COD_num=input (PP04D_COD, best.); drop PP04D_COD; rename PP04D_COD_num=PP04D_COD; 
format PP04G best.; 
format PP05B2_ANO best.;  
format PP05B2_DIA best.;  
format PP05B2_MES best.;  
format PP05C_1 best.;  
format PP05C_2 best.;  
format PP05C_3 best.;  
format PP05E best.;   
format PP05F best.;  
format PP05H best.;   
format PP06A best.;
format PP06C best.;
format PP06D best.;
format PP06E best.;
format PP06H best.;
format PP07A best.;
format PP07C best.;
format PP07D best.;
format PP07E best.;
format PP07F1 best.;
format PP07F2 best.;
format PP07F3 best.;
format PP07F4 best.;
format PP07F5 best.;
format PP07G1 best.;
format PP07G2 best.;
format PP07G3 best.;
format PP07G4 best.;
format PP07G_59 best.;
format PP07H best.;
format PP07I best.;
format PP07J best.;
format PP07K best.;
format PP08D1 best.;
format PP08D4 best.;
format PP08F1 best.;
format PP08F2 best.;
format PP08J1 best.;
format PP08J2 best.;
format PP08J3 best.;
format PP09A best.;
format PP09B best.;
format PP09C best.;
format PP09C_ESP $42.;
format PP10A best.;
format PP10C best.;
format PP10D best.;
format PP10E best.;
format PP11A best.;
format PP11B1 best.;
format PP11B2_ANO best.;
format PP11B2_DIA best.;
format PP11B2_MES best.;
format PP11B_COD best.;
format PP11C best.;
format PP11C99 best.;
PP11D_COD_num=input (PP11D_COD, best.); drop PP11D_COD; rename PP11D_COD_num=PP11D_COD; 
format PP11G_ANO best.;
format PP11G_DIA best.;
format PP11G_MES best.;
format PP11L best.;
format PP11L1 best.;
format PP11M best.;
format PP11N best.;
format PP11O best.;
format PP11P best.;
format PP11Q best.;
format PP11R best.;
format PP11S best.;
format PP11T best.;
format PP3E_TOT best.;
format PP3F_TOT best.;
rdecindr_num=input (rdecindr, best.); drop rdecindr; rename rdecindr_num=rdecindr; 
rdecocur_num=input (rdecOCUR, best.); drop rdecocur; rename rdecocur_num=rdecocur; 
format REGION best.;
format TOT_P12 best.;
format TRIMESTRE best.;
format T_VI best.;
format V10_M best.;
format V11_M best.;
format V12_M best.;
format V18_M best.;
format V19_AM best.;
format V21_M best.;
format V2_M best.;
format V3_M best.;
format V4_M best.;
format V5_M best.;
format V8_M best.;
format V9_M best.;

run; 


data leo.new_eph_2016; 
set leo.ephc_2016_t02 leo.ephc_2016_t03 leo.ephc_2016_t04; 
run; 
data leo.new_eph_2016; 
 set leo.new_eph_2016; 
 person=catx(',',codusu,nro_household,componente);
 run; 
 /*Here we quickly count how many times an individual appears in the base, as a descriptive statistic.*/
 proc sort data=leo.new_eph_2016; 
 by person; 
 run;

 data leo.new_eph_2016_2; 
set leo.new_eph_2016; 
by  person ;  
if first.person  then apparition=1; 
else apparition+1;
if last.person; 
run;
proc freq data=leo.new_eph_2016_2; 
table apparition; run; 
 data leo.new_eph_2016; 
set leo.new_eph_2016; 
by person ;  
if first.person  then apparition=1; 
else apparition+1;
run;



data leo.new_eph_2016;
length contributes_vol $20.; 
length contributes_comp $20.;
length contributes $20.;
 set leo.new_eph_2016;
 if ano4=2016 & trimestre=2 then period=52; 
 if ano4=2016 & trimestre=3 then period=53; 
if ano4=2016 & trimestre=4 then period=54; 
if ano4=2017 & trimestre=1 then period=55; 
if ano4=2017 & trimestre=2 then period=56; 

if nivel_ed=6 then formation="3"; 
if nivel_ed=4 | nivel_ed=5 then formation="2"; 
if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 then formation="1";
ageconti=ch06*1;
if ch06=-1 then ageconti=0; 
if pp07h=1 then contributes_comp="True";
if pp07h=2 or pp07h=0  then contributes_comp="False";
if pp07i=1 then contributes_vol="True";
if pp07i=2 or pp07i=0  then contributes_vol="False";
 if contributes_comp= "False"& contributes_vol="False" then contributes="False"; 
 else contributes="True";  
run; 


data leo.ephc_2017; 
set leo.ephc_2017_t01; 
run; 

data leo.new_eph_2017; 
 set leo.ephc_2017; 
 person=catx(',',codusu,nro_household,componente);
 run; 
data leo.new_eph_2017;
length contributes_vol $20.; 
length contributes_comp $20.;
length contributes $20.;
 set leo.new_eph_2017;
 if ano4=2016 & trimestre=2 then period=52; 
 if ano4=2016 & trimestre=3 then period=53; 
if ano4=2016 & trimestre=4 then period=54; 
if ano4=2017 & trimestre=1 then period=55; 
if ano4=2017 & trimestre=2 then period=56; 

if nivel_ed=6 then formation="3"; 
if nivel_ed=4 | nivel_ed=5 then formation="2"; 
if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 then formation="1";
ageconti=ch06*1;
if ch06=-1 then ageconti=0;
if pp07h=1 then contributes_comp="True";
if pp07h=2 or pp07h=0  then contributes_comp="False";
if pp07i=1 then contributes_vol="True";
if pp07i=2 or pp07i=0  then contributes_vol="False";
 if contributes_comp= "False"& contributes_vol="False" then contributes="False"; 
 else contributes="True";  

run; 

options nofmterr;

/*The dataset has two problems: the variable year of birth is wrong (some people born in 2014 for instance appear as having been borne 
		in 1914...). This is not a problem for our analysis, since we do not use it. 
	However, variables ch15_cod and ch16_cod respectively indicate the country / province of birth and of residence, but their coding 
		changes between 2016 and 2017 (!), shifting from character in 2016 to numeric in 2017. We thus simply dropped them from the 
		initial data, else we cannot study together the waves of 2016 and of 2017.*/
/* You can see this mess if you uncomment the code below.
proc freq data=leo.new_eph_2017; 
table ch15_cod ch16_cod; run; 
proc freq data=leo.new_eph_2016; 
table ch15_cod ch16_cod; run; 
proc contents data=leo.new_eph_2016; run; 
proc contents data=leo.new_eph_2017; run;*/
data drop_variables_2016; 
set leo.new_eph_2016; 
drop ch15_cod ch16_cod; 
run; 

data drop_variables_2017; 
set leo.new_eph_2017; 
drop ch15_cod ch16_cod; 
run; 

data leo.new_eph_2016_2017; 
set drop_variables_2016 drop_variables_2017; run; 
/*Then, we endogenously determine the proportion of independent contributors */
%macro indep_endo_2016(indata,outdata);
data independent_workers; 
length qualif_indep $20.; 
set &indata.; 
where (estado=1)&(cat_ocup=1|cat_ocup=2); 
position_char=put(pp04d_cod,5.); 
 qualification_char=substr(position_char,5);

if qualification_char^=1 & qualification_char^=2 then qualif_indep="Non_qualif"; 
else qualif_indep="Qualif"; 
run; 
data independent_workers; 
length contributes $20.; 
set independent_workers; 
if qualif_indep="Non_qualif" &((pp04a^=1)&(pp04c=1|pp04c=2|pp04c=3|pp04c=4|pp04c=5|pp04c=99))
then contributes="False" ; 
else contributes="True" ; 
drop position_char qualification_char; 
run; 
 

data independent_workers; 
set independent_workers; 
where (estado=1)&(cat_ocup=1|cat_ocup=2);
if pp04a=1 then do; 
contributes="True"; 
qualif_indep="Qualif"; 
end; 
if pp04c=6|pp04c=7|pp04c=8|pp04c=9|pp04c=10|pp04c=11|pp04c=12  then do; 
contributes="True"; 
qualif_indep="Qualif"; 
end;  
if contributes="True" then qualif_indep="Qualif"; 
run; 
proc sort data=&indata. ;
by person period; 
run; 
proc sort data=independent_workers;
by person period; 
run; 
data &outdata.; 
merge &indata. independent_workers; 
by person period; 
/*Reminder for labour_market_state variable: 1, formal wage-earner; 2, formal sector independent worker; 3, informal worker; 4, unemployed;
		5; inactive.*/
if estado=2 then labour_market_state=4;
if estado=1 & cat_ocup=3 & contributes="True"  then labour_market_state=1;
if qualif_indep="Qualif" then labour_market_state=2; 
if qualif_indep="Qualif" then contributes="True"; 
if estado=1 & contributes="False" | cat_ocup=4 then labour_market_state=3;
if estado=3 | estado=4 | estado=0 then labour_market_state=5; 
run; 
/*On trouve des chiffres réalistes, avec une plus grande cotisation des patrons que des travailleurs indépendants*/

%mend; 


%indep_endo_2016(leo.new_eph_2016,leo.eph_formatted_2016);
%indep_endo_2016(leo.new_eph_2017,leo.eph_formatted_2017);
%indep_endo_2016(leo.new_eph_2016_2017,leo.eph_formatted_2016_2017);
/*Next, we format other variables, trying to be consistent with what we did for the 2003-2015 period.*/
data leo.eph_formatted_2016; 
set leo.eph_formatted_2016; 
household=cats(codusu,nro_household);
 id=cats(codusu,nro_household,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
if (ageconti>19 and ageconti<25) then agegroup_ext=20;
if (ageconti>24 and ageconti<30) then agegroup_ext=25;
if (ageconti>29 and ageconti<35) then agegroup_ext=30;
if (ageconti>34 and ageconti<40) then agegroup_ext=35;
if (ageconti>39 and ageconti<45) then agegroup_ext=40;
if (ageconti>44 and ageconti<50) then agegroup_ext=45;
if (ageconti>49 and ageconti<55) then agegroup_ext=50;
if (ageconti>54 and ageconti<60) then agegroup_ext=55;
if (ageconti>59 and ageconti<65) then agegroup_ext=60;
if (ageconti>64 and ageconti<70) then agegroup_ext=65;
if (ageconti>69 and ageconti<75) then agegroup_ext=70;
if (ageconti>74 and ageconti<80) then agegroup_ext=75;
if (ageconti>79 and ageconti<85) then agegroup_ext=80;
if (ageconti>84 and ageconti<90) then agegroup_ext=85;
if (ageconti>89 and ageconti<95) then agegroup_ext=90;
if ageconti>94 then agegroup_ext=95;

if (ageconti>=-1 and ageconti<16) then agegroup=1;
if (ageconti>15 and ageconti<20) then agegroup=16;
if (ageconti>19 and ageconti<25) then agegroup=20;
if (ageconti>24 and ageconti<30) then agegroup=25;
if (ageconti>29 and ageconti<35) then agegroup=30;
if (ageconti>34 and ageconti<40) then agegroup=35;
if (ageconti>39 and ageconti<45) then agegroup=40;
if (ageconti>44 and ageconti<50) then agegroup=45;
if (ageconti>49 and ageconti<55) then agegroup=50;
if (ageconti>54 and ageconti<60) then agegroup=55;
if (ageconti>59 and ageconti<65) then agegroup=60;
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
run; 

data leo.eph_formatted_2017; 
set leo.eph_formatted_2017; 

household=cats(codusu,nro_household);
 id=cats(codusu,nro_household,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
if (ageconti>19 and ageconti<25) then agegroup_ext=20;
if (ageconti>24 and ageconti<30) then agegroup_ext=25;
if (ageconti>29 and ageconti<35) then agegroup_ext=30;
if (ageconti>34 and ageconti<40) then agegroup_ext=35;
if (ageconti>39 and ageconti<45) then agegroup_ext=40;
if (ageconti>44 and ageconti<50) then agegroup_ext=45;
if (ageconti>49 and ageconti<55) then agegroup_ext=50;
if (ageconti>54 and ageconti<60) then agegroup_ext=55;
if (ageconti>59 and ageconti<65) then agegroup_ext=60;
if (ageconti>64 and ageconti<70) then agegroup_ext=65;
if (ageconti>69 and ageconti<75) then agegroup_ext=70;
if (ageconti>74 and ageconti<80) then agegroup_ext=75;
if (ageconti>79 and ageconti<85) then agegroup_ext=80;
if (ageconti>84 and ageconti<90) then agegroup_ext=85;
if (ageconti>89 and ageconti<95) then agegroup_ext=90;
if ageconti>94 then agegroup_ext=95;


if (ageconti>=-1 and ageconti<16) then agegroup=1;
if (ageconti>15 and ageconti<20) then agegroup=16;
if (ageconti>19 and ageconti<25) then agegroup=20;
if (ageconti>24 and ageconti<30) then agegroup=25;
if (ageconti>29 and ageconti<35) then agegroup=30;
if (ageconti>34 and ageconti<40) then agegroup=35;
if (ageconti>39 and ageconti<45) then agegroup=40;
if (ageconti>44 and ageconti<50) then agegroup=45;
if (ageconti>49 and ageconti<55) then agegroup=50;
if (ageconti>54 and ageconti<60) then agegroup=55;
if (ageconti>59 and ageconti<65) then agegroup=60;
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
 run; 

data leo.eph_formatted_2016_2017; 
set leo.eph_formatted_2016_2017; 

household=cats(codusu,nro_household);
 id=cats(codusu,nro_household,componente);  
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
if (ageconti>19 and ageconti<25) then agegroup_ext=20;
if (ageconti>24 and ageconti<30) then agegroup_ext=25;
if (ageconti>29 and ageconti<35) then agegroup_ext=30;
if (ageconti>34 and ageconti<40) then agegroup_ext=35;
if (ageconti>39 and ageconti<45) then agegroup_ext=40;
if (ageconti>44 and ageconti<50) then agegroup_ext=45;
if (ageconti>49 and ageconti<55) then agegroup_ext=50;
if (ageconti>54 and ageconti<60) then agegroup_ext=55;
if (ageconti>59 and ageconti<65) then agegroup_ext=60;
if (ageconti>64 and ageconti<70) then agegroup_ext=65;
if (ageconti>69 and ageconti<75) then agegroup_ext=70;
if (ageconti>74 and ageconti<80) then agegroup_ext=75;
if (ageconti>79 and ageconti<85) then agegroup_ext=80;
if (ageconti>84 and ageconti<90) then agegroup_ext=85;
if (ageconti>89 and ageconti<95) then agegroup_ext=90;
if ageconti>94 then agegroup_ext=95;

if (ageconti>=-1 and ageconti<16) then agegroup=1;
if (ageconti>15 and ageconti<20) then agegroup=16;
if (ageconti>19 and ageconti<25) then agegroup=20;
if (ageconti>24 and ageconti<30) then agegroup=25;
if (ageconti>29 and ageconti<35) then agegroup=30;
if (ageconti>34 and ageconti<40) then agegroup=35;
if (ageconti>39 and ageconti<45) then agegroup=40;
if (ageconti>44 and ageconti<50) then agegroup=45;
if (ageconti>49 and ageconti<55) then agegroup=50;
if (ageconti>54 and ageconti<60) then agegroup=55;
if (ageconti>59 and ageconti<65) then agegroup=60;
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
run; 


proc export data=leo.structure_coefficients_74_90 
outfile="H:\LIAM2_commented_code\globals\structure_coefficients_74_90.csv"
dbms=csv replace; 
run; 
/*********************************************************************************************************************************/
/***********************************Next, we compute the aggregate alignment variables.*************************/
/*************************************************************************************************************************************/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=52) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_52;
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=53) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=54) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=55) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_55; 
run; 
data lms_52; set lms_52; period=54; percent_col=pct_col/100; run;
data lms_53; set lms_53; period=55; percent_col=pct_col/100; run;
data lms_54; set lms_54; period=56; percent_col=pct_col/100; run;
data lms_55; set lms_55; period=57; percent_col=pct_col/100; run; 

data lms_52; set lms_52; keep percent_col labour_market_state agegroup period; run; 
data lms_53; set lms_53; keep percent_col labour_market_state agegroup period; run; 
data lms_54; set lms_54; keep percent_col labour_market_state agegroup period; run; 
data lms_55; set lms_55; keep percent_col labour_market_state agegroup period; run; 
data lms_men_base; 
set lms_52 lms_53 lms_54 lms_55; run; 
/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data wage_earners_men;
set lms_men_base (where=(labour_market_state=1));
run; 
proc sort data=wage_earners_men; 
by agegroup; 
run; 
 
proc transpose data=wage_earners_men out=transp_wage_earners_men; 
by agegroup;
id period ;
run;
data transp_wage_earners_men; 
set transp_wage_earners_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_wage_earners_men; 
set transp_wage_earners_men ; 
drop _name_ _label_ ; 
RUN; 
data formal_indep_menendent;
set lms_men_base (where=(labour_market_state=2));
run; 
proc sort data=formal_indep_menendent; 
by agegroup; 
run; 
proc transpose data=formal_indep_menendent out=transp_formal_indep_men; 
by agegroup;
id period ;
run;

data transp_formal_indep_men; 
set transp_formal_indep_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_formal_indep_men; 
set transp_formal_indep_men ; 
drop _name_ _label_ ; 
RUN; 
data informal;
set lms_men_base (where=(labour_market_state=3));
run; 
proc sort data=informal; 
by agegroup; 
run; 
proc transpose data=informal out=transp_informal_men; 
by agegroup;
id period ;
run;
data transp_informal_men; 
set transp_informal_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_informal_men; 
set transp_informal_men ; 
drop _name_ _label_ ; 
RUN; 

data unemployed_men;
set lms_men_base (where=(labour_market_state=4));
run; 
proc sort data=unemployed_men; 
by agegroup; 
run; 
proc transpose data=unemployed_men out=transp_unemployed_men; 
by agegroup;
id period ;
run;

data transp_unemployed_men; 
set transp_unemployed_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_unemployed_men; 
set transp_unemployed_men ; 
drop _name_ _label_ ; 
RUN; 
data inactive_men;
set lms_men_base (where=(labour_market_state=5));
run; 
proc sort data=inactive_men; 
by agegroup; 
run; 
proc transpose data=inactive_men out=transp_inactive_men; 
by agegroup;
id period ;
run;

data transp_inactive_men; 
set transp_inactive_men (where= (_NAME_="percent_col")); 
RUN; 
data transp_inactive_men; 
set transp_inactive_men ; 
drop _name_ _label_ ; 
RUN; 

proc print data=transp_wage_earners_men; run; 
proc print data=transp_formal_indep_men; run; 
proc print data=transp_informal_men; run; 
proc print data=transp_unemployed_men; run; 
proc print data=transp_inactive_men; run; 
data leo.cal_post_2016_wag_men; 
retain agegroup _54 _55 _56 _57;
set transp_wage_earners_men;
if missing(agegroup) then delete; 
run; 
data leo.cal_post_2016_ind_men; 
retain agegroup _54 _55 _56 _57;
set transp_formal_indep_men;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_inf_men; 
retain agegroup _54 _55 _56 _57;
set transp_informal_men;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_une_men; 
retain agegroup _54 _55 _56 _57;
set transp_unemployed_men;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_ina_men; 
retain agegroup _54 _55 _56 _57;
set transp_inactive_men;
if missing(agegroup) then delete;
run; 

 %Macro M_Zero (ds) ;
     data &ds. (drop=_i);
          set &ds. ;
          array A_VarNum[*] _NUMERIC_ ;     

          do _i=1 to dim( A_VarNum ) ;
          If A_VarNum (_i)=. then A_VarNum (_i)=0 ;
     End ;
   run ;
%Mend ; 


%m_zero(leo.cal_post_2016_wag_men); 
%m_zero(leo.cal_post_2016_ind_men); 
%m_zero(leo.cal_post_2016_inf_men); 
%m_zero(leo.cal_post_2016_une_men); 
%m_zero(leo.cal_post_2016_ina_men); 
/*we do the same thing, but among women*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=52) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_52;
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=53) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=54) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=55) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_55; 
run; 
data lms_52; set lms_52; period=54; percent_col=pct_col/100; run;
data lms_53; set lms_53; period=55; percent_col=pct_col/100; run;
data lms_54; set lms_54; period=56; percent_col=pct_col/100; run;
data lms_55; set lms_55; period=57; percent_col=pct_col/100; run; 

data lms_52; set lms_52; keep percent_col labour_market_state agegroup period; run; 
data lms_53; set lms_53; keep percent_col labour_market_state agegroup period; run; 
data lms_54; set lms_54; keep percent_col labour_market_state agegroup period; run; 
data lms_55; set lms_55; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_base; 
set lms_52 lms_53 lms_54 lms_55; run; 
/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data wage_earners_wom;
set lms_wom_base (where=(labour_market_state=1));
run; 
proc sort data=wage_earners_wom; 
by agegroup; 
run; 
 
proc transpose data=wage_earners_wom out=transp_wage_earners_wom; 
by agegroup;
id period ;
run;
data transp_wage_earners_wom; 
set transp_wage_earners_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_wage_earners_wom; 
set transp_wage_earners_wom ; 
drop _name_ _label_ ; 
RUN; 
data formal_independent_wom;
set lms_wom_base (where=(labour_market_state=2));
run; 
proc sort data=formal_independent_wom; 
by agegroup; 
run; 
proc transpose data=formal_independent_wom out=transp_formal_indep_wom; 
by agegroup;
id period ;
run;

data transp_formal_indep_wom; 
set transp_formal_indep_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_formal_indep_wom; 
set transp_formal_indep_wom ; 
drop _name_ _label_ ; 
RUN; 
data informal;
set lms_wom_base (where=(labour_market_state=3));
run; 
proc sort data=informal; 
by agegroup; 
run; 
proc transpose data=informal out=transp_informal_wom; 
by agegroup;
id period ;
run;
data transp_informal_wom; 
set transp_informal_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_informal_wom; 
set transp_informal_wom ; 
drop _name_ _label_ ; 
RUN; 

data unemployed_wom;
set lms_wom_base (where=(labour_market_state=4));
run; 
proc sort data=unemployed_wom; 
by agegroup; 
run; 
proc transpose data=unemployed_wom out=transp_unemployed_wom; 
by agegroup;
id period ;
run;

data transp_unemployed_wom; 
set transp_unemployed_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_unemployed_wom; 
set transp_unemployed_wom ; 
drop _name_ _label_ ; 
RUN; 
data inactive_wom;
set lms_wom_base (where=(labour_market_state=5));
run; 
proc sort data=inactive_wom; 
by agegroup; 
run; 
proc transpose data=inactive_wom out=transp_inactive_wom; 
by agegroup;
id period ;
run;

data transp_inactive_wom; 
set transp_inactive_wom (where= (_NAME_="percent_col")); 
RUN; 
data transp_inactive_wom; 
set transp_inactive_wom ; 
drop _name_ _label_ ; 
RUN; 
data leo.cal_post_2016_wag_wom; 
retain agegroup _54 _55 _56 _57;
set transp_wage_earners_wom;
if missing(agegroup) then delete; 
run; 
data leo.cal_post_2016_ind_wom; 
retain agegroup _54 _55 _56 _57;
set transp_formal_indep_wom;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_inf_wom; 
retain agegroup _54 _55 _56 _57;
set transp_informal_wom;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_une_wom; 
retain agegroup _54 _55 _56 _57;
set transp_unemployed_wom;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_ina_wom; 
retain agegroup _54 _55 _56 _57;
set transp_inactive_wom;
if missing(agegroup) then delete;
run; 
%m_zero(leo.cal_post_2016_wag_wom); 
%m_zero(leo.cal_post_2016_ind_wom); 
%m_zero(leo.cal_post_2016_inf_wom); 
%m_zero(leo.cal_post_2016_une_wom); 
%m_zero(leo.cal_post_2016_ina_wom); 

proc print data=leo.cal_post_2016_wag_f; run; 
proc print data=leo.cal_post_2016_wag_wom; run; 
proc print data=leo.cal_post_2016_ind_f; run; 
proc print data=leo.cal_post_2016_ind_wom; run; 
proc print data=leo.cal_post_2016_inf_f; run; 
proc print data=leo.cal_post_2016_inf_wom; run; 
proc print data=leo.cal_post_2016_une_f; run; 
proc print data=leo.cal_post_2016_une_wom; run; 
proc print data=leo.cal_post_2016_ina_f; run; 
proc print data=leo.cal_post_2016_ina_wom; run; 

/*Finally, we export these calibration datasets in a csv format. You still need to make minor changes by hand to the csv file to mimic 
		the alignment datasets input in our microsimulation module. As usual, put the path of your liking.*/
proc export data=leo.cal_post_2016_wag_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_wag_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ind_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_inf_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_une_men.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ina_men.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_wag_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_wag_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ind_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_inf_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_une_wom.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ina_wom.csv' 
dbms=csv replace; 
run; 
/*We format them to help for future backwards microsimulations that would start with surveys carried out post 2016. I do not actually 
		used these in my PhD thesis though.*/
 
%macro cal_post_2016_backward(indata, variable); 



data &indata._b; 
set &indata.; 
Rename _57=x3;
Rename _56=x4;
Rename _55=x5;
Rename _54=x6;
run;
data &indata._b; 
retain &variable. x3 x4 x5 x6 ; 
set &indata._b; 
run; 
%mend; 


%cal_post_2016_backward(leo.cal_post_2016_wag_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_ind_men,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_inf_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_une_men,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_ina_men,agegroup);
 
%cal_post_2016_backward(leo.cal_post_2016_wag_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_ind_wom,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_inf_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_une_wom,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_ina_wom,agegroup);



proc export data=leo.cal_post_2016_wag_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_wag_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ind_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_inf_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_une_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ina_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_wag_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_wag_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ind_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_inf_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_une_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ina_wom_b.csv' 
dbms=csv replace; 
run; 

/**************We compute now the alignment data for the proportions of students in 2016-2017.*/
options nofmterr; 
data leo.eph_formatted_2016; 
set leo.eph_formatted_2016; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
data leo.eph_formatted_2017; 
set leo.eph_formatted_2017; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
data leo.eph_formatted_2016_2017; 
set leo.eph_formatted_2016_2017; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table student*ch06 / noprint outpct out=student_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_55; 
run; 
data student_52; set student_52; period=54; percent_col=pct_col/100; run; 
data student_53; set student_53; period=55; percent_col=pct_col/100; run; 
data student_54; set student_54; period=56; percent_col=pct_col/100; run; 
data student_55; set student_55; period=57; percent_col=pct_col/100; run; 

data student_52; set student_52; keep percent_col student ch06 period; run; 
data student_53; set student_53; keep percent_col student ch06 period; run; 
data student_54; set student_54; keep percent_col student ch06 period; run; 
data student_55; set student_55; keep percent_col student ch06 period; run; 
data student_men_base; 
set student_52
student_53
student_54
student_55; run; 

/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data student_men;
set student_men_base (where=(student="True"));
run; 
proc sort data=student_men; 
by ch06; 
run; 
 
proc transpose data=student_men out=transp_student_men; 
by ch06;
id period ;
run;
data transp_student_men; 
set transp_student_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_student_men; 
set transp_student_men ; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_stu_men; 
retain ch06 _54 _55 _56 _57;
set transp_student_men;
rename ch06=age; 
run; 
proc print data=leo.cal_post_2016_stu_men; run; 
proc print data=leo.cal_mau_est_m; rUN;
/*We do the same thing for women.*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table student*ch06 / noprint outpct out=student_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_55; 
run; 
data student_52; set student_52; period=54; percent_col=pct_col/100; run; 
data student_53; set student_53; period=55; percent_col=pct_col/100; run; 
data student_54; set student_54; period=56; percent_col=pct_col/100; run; 
data student_55; set student_55; period=57; percent_col=pct_col/100; run; 

data student_52; set student_52; keep percent_col student ch06 period; run; 
data student_53; set student_53; keep percent_col student ch06 period; run; 
data student_54; set student_54; keep percent_col student ch06 period; run; 
data student_55; set student_55; keep percent_col student ch06 period; run; 
data student_wom_base; 
set student_52
student_53
student_54
student_55; run; 

/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data student_wom;
set student_wom_base (where=(student="True"));
run; 
proc sort data=student_wom; 
by ch06; 
run; 
 
proc transpose data=student_wom out=transp_student_wom; 
by ch06;
id period ;
run;
data transp_student_wom; 
set transp_student_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_student_wom; 
set transp_student_wom ; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_stu_wom; 
retain ch06 _54 _55 _56 _57;
set transp_student_wom;
rename ch06=age; 
run; 
proc print data=leo.cal_post_2016_stu_wom; run; 
proc print data=leo.cal_mau_est_f; rUN;


proc export data=leo.cal_post_2016_stu_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_stu_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_stu_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_stu_wom.csv' 
dbms=csv replace; 
run; 

/*Now we compute the alignment values for education levels.*/

proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table formation*ch06 / noprint outpct out=formation_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_55; 
run; 
data formation_52; set formation_52; period=54; percent_col=pct_col/100; run; 
data formation_53; set formation_53; period=55; percent_col=pct_col/100; run; 
data formation_54; set formation_54; period=56; percent_col=pct_col/100; run; 
data formation_55; set formation_55; period=57; percent_col=pct_col/100; run; 
data formation_52; set formation_52; keep percent_col formation ch06 period; run; 
data formation_53; set formation_53; keep percent_col formation ch06 period; run; 
data formation_54; set formation_54; keep percent_col formation ch06 period; run; 
data formation_55; set formation_55; keep percent_col formation ch06 period; run; 
data formation_men_base; 
set formation_52
formation_53
formation_54
formation_55; run; 

/*proc sort data=leo.cal_wag_f_for3; 
by agegroup; 
run; */
/*On prend ensuite de la base uniquement les différents états dans le marché du travail et on les transpose. 
Le résultat for une série de tableaux en format LIAM2 selon l'état dans le marché du travail*/

data for_1_men;
set formation_men_base (where=(formation="1"));
run; 

data for_2_men;
set formation_men_base (where=(formation="2"));
run; 

data for_3_men;
set formation_men_base (where=(formation="3"));
run; 

proc sort data=for_1_men; 
by ch06; 
run; 
proc sort data=for_2_men; 
by ch06; 
run; 
 
proc sort data=for_3_men; 
by ch06; 
run; 
 
proc transpose data=for_1_men out=transp_for_1_men; 
by ch06;
id period ;
run;
data transp_for_1_men; 
set transp_for_1_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_for_1_men; 
set transp_for_1_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_for_1_men; 
retain ch06 _54 _55 _56 _57;
set transp_for_1_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_1_men); 
proc export data=leo.cal_post_2016_for_1_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_1_men.csv' 
dbms=csv replace; 
run; 
proc transpose data=for_2_men out=transp_for_2_men; 
by ch06;
id period ;
run;
data transp_for_2_men; 
set transp_for_2_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_for_2_men; 
set transp_for_2_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_for_2_men; 
retain ch06 _54 _55 _56 _57;
set transp_for_2_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_2_men);  
proc export data=leo.cal_post_2016_for_2_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_2_men.csv' 
dbms=csv replace; 
run; 

 proc print data=leo.cal_post_2016_for_2_men; 
 run; 
 proc print data=leo.cal_mau_for_2_m; 
 run; 
 
proc transpose data=for_3_men out=transp_for_3_men; 
by ch06;
id period ;
run;
data transp_for_3_men; 
set transp_for_3_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_for_3_men; 
set transp_for_3_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_for_3_men; 
retain ch06 _54 _55 _56 _57;
set transp_for_3_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_3_men); 
proc export data=leo.cal_post_2016_for_3_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_3_men.csv' 
dbms=csv replace; 
run; 
/*Now, we do the same thing for the formation of women.*/

proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table formation*ch06 / noprint outpct out=formation_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_55; 
run; 
data formation_52; set formation_52; period=54; percent_col=pct_col/100; run; 
data formation_53; set formation_53; period=55; percent_col=pct_col/100; run; 
data formation_54; set formation_54; period=56; percent_col=pct_col/100; run; 
data formation_55; set formation_55; period=57; percent_col=pct_col/100; run; 
data formation_52; set formation_52; keep percent_col formation ch06 period; run; 
data formation_53; set formation_53; keep percent_col formation ch06 period; run; 
data formation_54; set formation_54; keep percent_col formation ch06 period; run; 
data formation_55; set formation_55; keep percent_col formation ch06 period; run; 
data formation_wom_base; 
set formation_52
formation_53
formation_54
formation_55; run; 

/*proc sort data=leo.cal_wag_f_for3; 
by agegroup; 
run; */
/*On prend ensuite de la base uniquewomt les différents états dans le marché du travail et on les transpose. 
Le résultat for une série de tableaux en format LIAM2 selon l'état dans le marché du travail*/

data for_1_wom;
set formation_wom_base (where=(formation="1"));
run; 

data for_2_wom;
set formation_wom_base (where=(formation="2"));
run; 

data for_3_wom;
set formation_wom_base (where=(formation="3"));
run; 

proc sort data=for_1_wom; 
by ch06; 
run; 
proc sort data=for_2_wom; 
by ch06; 
run; 
 
proc sort data=for_3_wom; 
by ch06; 
run; 
 
proc transpose data=for_1_wom out=transp_for_1_wom; 
by ch06;
id period ;
run;
data transp_for_1_wom; 
set transp_for_1_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_for_1_wom; 
set transp_for_1_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_for_1_wom; 
retain ch06 _54 _55 _56 _57;
set transp_for_1_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_1_wom); 
proc export data=leo.cal_post_2016_for_1_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_1_wom.csv' 
dbms=csv replace; 
run; 
proc transpose data=for_2_wom out=transp_for_2_wom; 
by ch06;
id period ;
run;
data transp_for_2_wom; 
set transp_for_2_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_for_2_wom; 
set transp_for_2_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_for_2_wom; 
retain ch06 _54 _55 _56 _57;
set transp_for_2_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_2_wom);  
proc export data=leo.cal_post_2016_for_2_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_2_wom.csv' 
dbms=csv replace; 
run; 

 proc print data=leo.cal_post_2016_for_2_wom; 
 run; 
 proc print data=leo.cal_mau_for_2_m; 
 run; 
 
proc transpose data=for_3_wom out=transp_for_3_wom; 
by ch06;
id period ;
run;
data transp_for_3_wom; 
set transp_for_3_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_for_3_wom; 
set transp_for_3_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_for_3_wom; 
retain ch06 _54 _55 _56 _57;
set transp_for_3_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_3_wom); 
proc export data=leo.cal_post_2016_for_3_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_3_wom.csv' 
dbms=csv replace; 
run; 
/* We then compute the alignment rates for marital status, first among men.*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=1 & (period=52) & (100>agegroup>15)) ;
table ch07*agegroup / noprint outpct out=marital_status_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=1 & (period=53)& (100>agegroup>15));
table ch07*agegroup / noprint outpct out=marital_status_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=1 & (period=54)& (100>agegroup>15));
table ch07*agegroup / noprint outpct out=marital_status_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=1 & (period=55)& (100>agegroup>15));
table ch07*agegroup / noprint outpct out=marital_status_55; 
run; 
data marital_status_52; set marital_status_52; period=54; percent_col=pct_col/100; run; 
data marital_status_53; set marital_status_53; period=55; percent_col=pct_col/100; run; 
data marital_status_54; set marital_status_54; period=56; percent_col=pct_col/100; run; 
data marital_status_55; set marital_status_55; period=57; percent_col=pct_col/100; run; 
data marital_status_52; set marital_status_52; keep percent_col agegroup ch07 period; run; 
data marital_status_53; set marital_status_53; keep percent_col agegroup ch07 period; run; 
data marital_status_54; set marital_status_54; keep percent_col agegroup ch07 period; run; 
data marital_status_55; set marital_status_55; keep percent_col agegroup ch07 period; run; 
data marital_status_base_men; 
set marital_status_52
marital_status_53
marital_status_54
marital_status_55; run; 
data mar_stat_1_men;
set marital_status_base_men (where=(ch07=1));
run; 


data mar_stat_2_men;
set marital_status_base_men (where=(ch07=2));
run; 
data mar_stat_3_men;
set marital_status_base_men (where=(ch07=3));
run; 

data mar_stat_4_men;
set marital_status_base_men (where=(ch07=4));
run; 

data mar_stat_5_men;
set marital_status_base_men (where=(ch07=5));
run; 

proc sort data=mar_stat_1_men; 
by agegroup; 
run; 
proc sort data=mar_stat_2_men; 
by agegroup; 
run; 
 
proc sort data=mar_stat_3_men; 
by agegroup; 
run; 
 
proc sort data=mar_stat_4_men; 
by agegroup; 
run; 
 
proc sort data=mar_stat_5_men; 
by agegroup; 
run; 
 
 
proc transpose data=mar_stat_1_men out=transp_mar_stat_1_men; 
by agegroup;
id period ;
run;
data transp_mar_stat_1_men; 
set transp_mar_stat_1_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_1_men; 
set transp_mar_stat_1_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_1_men; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_1_men; 
run; 
%m_zero(leo.cal_post_2016_mar_stat_1_men); 
proc export data=leo.cal_post_2016_mar_stat_1_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_1_men.csv' 
dbms=csv replace; 
run; 


proc sort data=mar_stat_2_men; 
by agegroup; 
run; 
 
proc sort data=mar_stat_3_men; 
by agegroup; 
run; 
 
 
proc transpose data=mar_stat_2_men out=transp_mar_stat_2_men; 
by agegroup;
id period ;
run;
data transp_mar_stat_2_men; 
set transp_mar_stat_2_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_2_men; 
set transp_mar_stat_2_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_2_men; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_2_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_2_men); 
proc export data=leo.cal_post_2016_mar_stat_2_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_2_men.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=mar_stat_3_men out=transp_mar_stat_3_men; 
by agegroup;
id period ;
run;
data transp_mar_stat_3_men; 
set transp_mar_stat_3_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_3_men; 
set transp_mar_stat_3_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_3_men; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_3_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_3_men); 
proc export data=leo.cal_post_2016_mar_stat_3_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_3_men.csv' 
dbms=csv replace; 
run; 

proc transpose data=mar_stat_4_men out=transp_mar_stat_4_men; 
by agegroup;
id period ;
run;
data transp_mar_stat_4_men; 
set transp_mar_stat_4_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_4_men; 
set transp_mar_stat_4_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_4_men; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_4_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_4_men); 
proc export data=leo.cal_post_2016_mar_stat_4_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_4_men.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=mar_stat_5_men out=transp_mar_stat_5_men; 
by agegroup;
id period ;
run;
data transp_mar_stat_5_men; 
set transp_mar_stat_5_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_5_men; 
set transp_mar_stat_5_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_5_men; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_5_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_5_men); 
proc export data=leo.cal_post_2016_mar_stat_5_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_5_men.csv' 
dbms=csv replace; 
run; 
/* Now we compute the marital status alignment ratios among women.*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=2 & (period=52) & (100>agegroup>15)) ;
table ch07*agegroup / noprint outpct out=marital_status_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=2 & (period=53)& (100>agegroup>15));
table ch07*agegroup / noprint outpct out=marital_status_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=2 & (period=54)& (100>agegroup>15));
table ch07*agegroup / noprint outpct out=marital_status_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=2 & (period=55)& (100>agegroup>15));
table ch07*agegroup / noprint outpct out=marital_status_55; 
run; 
data marital_status_52; set marital_status_52; period=54; percent_col=pct_col/100; run; 
data marital_status_53; set marital_status_53; period=55; percent_col=pct_col/100; run; 
data marital_status_54; set marital_status_54; period=56; percent_col=pct_col/100; run; 
data marital_status_55; set marital_status_55; period=57; percent_col=pct_col/100; run; 
data marital_status_52; set marital_status_52; keep percent_col agegroup ch07 period; run; 
data marital_status_53; set marital_status_53; keep percent_col agegroup ch07 period; run; 
data marital_status_54; set marital_status_54; keep percent_col agegroup ch07 period; run; 
data marital_status_55; set marital_status_55; keep percent_col agegroup ch07 period; run; 
data marital_status_base_wom; 
set marital_status_52
marital_status_53
marital_status_54
marital_status_55; run; 
data mar_stat_1_wom;
set marital_status_base_wom (where=(ch07=1));
run; 


data mar_stat_2_wom;
set marital_status_base_wom (where=(ch07=2));
run; 
data mar_stat_3_wom;
set marital_status_base_wom (where=(ch07=3));
run; 

data mar_stat_4_wom;
set marital_status_base_wom (where=(ch07=4));
run; 

data mar_stat_5_wom;
set marital_status_base_wom (where=(ch07=5));
run; 

proc sort data=mar_stat_1_wom; 
by agegroup; 
run; 
proc sort data=mar_stat_2_wom; 
by agegroup; 
run; 
 
proc sort data=mar_stat_3_wom; 
by agegroup; 
run; 
 
proc sort data=mar_stat_4_wom; 
by agegroup; 
run; 
 
proc sort data=mar_stat_5_wom; 
by agegroup; 
run; 
 
 
proc transpose data=mar_stat_1_wom out=transp_mar_stat_1_wom; 
by agegroup;
id period ;
run;
data transp_mar_stat_1_wom; 
set transp_mar_stat_1_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_1_wom; 
set transp_mar_stat_1_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_1_wom; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_1_wom; 
run; 
%m_zero(leo.cal_post_2016_mar_stat_1_wom); 
proc export data=leo.cal_post_2016_mar_stat_1_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_1_wom.csv' 
dbms=csv replace; 
run; 


proc sort data=mar_stat_2_wom; 
by agegroup; 
run; 
 
proc sort data=mar_stat_3_wom; 
by agegroup; 
run; 
 
 
proc transpose data=mar_stat_2_wom out=transp_mar_stat_2_wom; 
by agegroup;
id period ;
run;
data transp_mar_stat_2_wom; 
set transp_mar_stat_2_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_2_wom; 
set transp_mar_stat_2_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_2_wom; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_2_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_2_wom); 
proc export data=leo.cal_post_2016_mar_stat_2_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_2_wom.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=mar_stat_3_wom out=transp_mar_stat_3_wom; 
by agegroup;
id period ;
run;
data transp_mar_stat_3_wom; 
set transp_mar_stat_3_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_3_wom; 
set transp_mar_stat_3_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_3_wom; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_3_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_3_wom); 
proc export data=leo.cal_post_2016_mar_stat_3_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_3_wom.csv' 
dbms=csv replace; 
run; 

proc transpose data=mar_stat_4_wom out=transp_mar_stat_4_wom; 
by agegroup;
id period ;
run;
data transp_mar_stat_4_wom; 
set transp_mar_stat_4_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_4_wom; 
set transp_mar_stat_4_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_4_wom; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_4_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_4_wom); 
proc export data=leo.cal_post_2016_mar_stat_4_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_4_wom.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=mar_stat_5_wom out=transp_mar_stat_5_wom; 
by agegroup;
id period ;
run;
data transp_mar_stat_5_wom; 
set transp_mar_stat_5_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_5_wom; 
set transp_mar_stat_5_wom; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_5_wom; 
retain agegroup _54 _55 _56 _57;
set transp_mar_stat_5_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_5_wom); 
proc export data=leo.cal_post_2016_mar_stat_5_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_5_wom.csv' 
dbms=csv replace; 
run; 
/*Finally, we format these alignment datasets so as to get them ready for backward simulations. We did not actually use post-2016 datasets
		as the starting point of backward simulations, but it is possible to do so with our model (after slight adjustments, the 
		formatting of pre and post-2016 datasets being slightly different as seen earlier in this file).*/

%cal_post_2016_backward(leo.cal_post_2016_stu_men,age);
%cal_post_2016_backward(leo.cal_post_2016_stu_wom,age);

%cal_post_2016_backward(leo.cal_post_2016_for_1_men,age);
%cal_post_2016_backward(leo.cal_post_2016_for_2_men,age);
%cal_post_2016_backward(leo.cal_post_2016_for_3_men,age);
%cal_post_2016_backward(leo.cal_post_2016_for_1_wom,age);
%cal_post_2016_backward(leo.cal_post_2016_for_2_wom,age);
%cal_post_2016_backward(leo.cal_post_2016_for_3_wom,age);


%cal_post_2016_backward(leo.cal_post_2016_mar_stat_1_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_2_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_3_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_4_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_5_men,agegroup);
 
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_1_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_2_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_3_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_4_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_5_wom,agegroup);



proc export data=leo.cal_post_2016_mar_stat_1_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_1_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_2_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_2_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_3_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_3_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_4_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_4_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_5_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_5_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_mar_stat_1_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_1_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_2_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_2_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_3_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_3_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_4_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_4_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_mar_stat_5_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_5_wom_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_for_1_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_1_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_2_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_2_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_3_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_3_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_for_1_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_1_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_2_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_2_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_3_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_3_wom_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_stu_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_stu_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_stu_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_stu_wom_b.csv' 
dbms=csv replace; 
run; 


/****A last element we need is the structure coefficient to correct the RIPTE index by gender for the four periods that go from the 
		second quarter of 2016 to the first quarter of 2017******/



%macro ITL_centiles_post_2016(indata,tvar,t);
data &indata.; 
set &indata.; 	
		ITL=p21+tot_p12;
run; 
proc univariate data=&indata. noprint;
where labour_market_state=1 & &tvar.=&t.;
   var ITL;
   output out=leo.formal_we_&t. pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
where labour_market_state=2 & &tvar.=&t.;
   var ITL;
   output out=leo.formal_ind_&t. pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
where labour_market_state=3 & &tvar.=&t.;
   var ITL;
   output out=leo.informal_&t. pctlpts=2 98 pctlpre=cent; 
run;
data leo.formal_we_&t.; 
set leo.formal_we_&t.; 
labour_market_state=1; 
run; 
data leo.formal_ind_&t.; 
set leo.formal_ind_&t.; 
labour_market_state=2; 
run; 

data leo.informal_&t.; 
set leo.informal_&t.; 
labour_market_state=3; 
run; 
data income_centiles_&t.; 
set leo.formal_we_&t. leo.formal_ind_&t. leo.informal_&t.; 
run; 
proc sort data=&indata.; 
by labour_market_state; 
run; 
data &indata._&t.; 
set &indata.; 
where &tvar.=&t.; 
run; 
data &indata._&t.; 
merge &indata._&t. income_centiles_&t.; 
by labour_market_state; 
run; 
%mend; 
%macro mean_var_post_2016(indata,varname,lmsvar,periodname,period,gender); 
options nofmterr;

	/*We only took men and women of working age, but for the sake of consistency with our study of labour-market behaviour until age 70, 
			introduced later, it might be better to compute these coefficients among people aged 16 to 69 instead. This is left for future 
			work*/
options nofmterr; 
proc means data=&indata. noprint; 
	weight pondera; 
	where (&periodname.=&period. & ageconti>15 & ((ch04=1 & ageconti<65)) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3) & &varname. >cent2 & &varname.<cent98); 
		var &varname.; 
	output out=mean_&varname._men  mean=mean_&varname._men;
run;
proc means data=&indata. noprint; 
	weight pondera; 
	where (&periodname.=&period. & ageconti>15 & ((ch04=2 & ageconti<60)) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3) & &varname. >cent2 & &varname.<cent98); 
		var &varname.; 
	output out=mean_&varname._women  mean=mean_&varname._women;
run;
proc means data=&indata. noprint; 
weight pondera; 
	where (&periodname.=&period. & ageconti>15 & ((ch04=1 & ageconti<65)|(ch04=2 & ageconti<60)) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3) & &varname. >cent2 & &varname.<cent98); 
		var &varname.; 
	output out=mean_&varname._all  mean=mean_&varname._all;
run;

data leo.&varname._mean_&period.;
merge mean_&varname._men mean_&varname._women mean_&varname._all;
	by _TYPE_;
run; 
	/*We first divide the mean wage for a given gender by the mean overall wage*/

 data leo.&varname._mean_&period.;
 set leo.&varname._mean_&period.;
		&periodname.=&period.; 
		perc_&varname._men=mean_&varname._men/mean_&varname._all; 
		perc_&varname._women=mean_&varname._women/mean_&varname._all; 
run; 
 /*Then we take into account the percentage of men / women among all workers of working age*/
proc freq data=&indata. noprint; 
	weight pondera; 
	where (&periodname.=&period. & ageconti>15 & ((ch04=1 & ageconti<65)| (ch04=2 & ageconti<60))) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3); 
		table ch04 /outpct out=workers_by_gender; 
run; 

data working_men; 
set workers_by_gender; 
	where ch04=1; 
		rename percent=percent_male_workers; 
		&periodname.=&period.; 
	drop ch04 count; 
run; 

data working_women; 
set workers_by_gender;
	where ch04=2; 
		rename percent=percent_female_workers; 
		&periodname.=&period.; 
	drop ch04 count; 
run; 

data leo.&varname._mean_&period.; 
merge leo.&varname._mean_&period. working_men working_women; 
	by &periodname.; 
run; 

%mend;
%ITL_centiles_post_2016(leo.eph_formatted_2016,period,52);
%mean_var_post_2016(leo.eph_formatted_2016_52,ITL,labour_market_state,period,52,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2016,period,53);
%mean_var_post_2016(leo.eph_formatted_2016_53,ITL,labour_market_state,period,53,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2016,period,54);
%mean_var_post_2016(leo.eph_formatted_2016_54,ITL,labour_market_state,period,54,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2017,period,55);
%mean_var_post_2016(leo.eph_formatted_2017_55,ITL,labour_market_state,period,55,ch04); 
proc print data=leo.itl_mean_52; run; 
proc print data=leo.itl_mean_53; run; 
proc print data=leo.itl_mean_54; run; 
proc print data=leo.itl_mean_55; run; 

data leo.itl_mean_post_2016; 
set leo.itl_mean_52 - leo.itl_mean_55; 
		coefficient_men=mean_ITL_men/mean_ITL_all; 
		coefficient_women=mean_ITL_women/mean_ITL_all; 
run; 
data leo.coeffs_ripte_post_2016; 
set leo.itl_mean_post_2016; 
keep coefficient_men coefficient_women period; 
run;
proc print data=leo.coeffs_ripte_post_2016(obs=150); run;  
proc print data=leo.coeffs_ripte_mau (obs=150); run; 
proc export data=leo.coeffs_ripte_post_2016
outfile='H:\LIAM2_commented_code\globals\structure_coefficients_post_2016.csv' 
dbms=csv replace; 
run; 
