/**************************IMPORTING AND FORMATTING THE DATASETS******************************/
/*To run this file, first change all the pathfiles to your convenience, then press F3*/
/*This file imports the EPHc waves and starts formatting these datasets. The waves carried out since 2016 are not SAV files and have 
		various other formatting differences, so we import and treat them in a distinct dataset. These differences make them uncompatible
		with the waves carried out between 2003 and 2015. Finally, the discrete EPH survey carried out before 2003 is imported and 
		formatted in a different datafile*/
/*If at any point you want to erase the log file, type 
dm 'clear log'; 
To erase the results window, type 

dm 'odsresults; clear'; */
libname leo "H:\Leonardo_orléans\EPH_base\lib";

/*****************************************1- First, we import all the datasets************************************************************/
%macro import_EPH(path,year,quarter); 

/*individual_t&quarter.&year..sav is the name of the datafiles as downloaded from INDEC's website https://www.indec.gov.ar/bases-de-datos.asp */
PROC IMPORT OUT=leo.eph_20&year._t0&quarter.
            DATAFILE="&path.individual_t&quarter.&year..sav"
            DBMS=sav REPLACE;
RUN;


%mend; 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2003\,03,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2003\,03,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2004\,04,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2004\,04,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2004\,04,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2004\,04,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2005\,05,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2005\,05,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2005\,05,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2005\,05,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2006\,06,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2006\,06,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2006\,06,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2006\,06,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2007\,07,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2007\,07,2);
/*In 2007, there was a strike of INDEC workers that made carrying out the survey during the third quarter of that year impossible. This is 
		why this wave is missing.*/
/*
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2007\,07,3); */
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2007\,07,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2008\,08,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2008\,08,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2008\,08,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2008\,08,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2009\,09,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2009\,09,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2009\,09,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2009\,09,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2010\,10,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2010\,10,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2010\,10,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2010\,10,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2011\,11,1);
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2011\,11,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2011\,11,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2011\,11,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2012\,12,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2012\,12,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2012\,12,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2012\,12,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2013\,13,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2013\,13,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2013\,13,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2013\,13,4); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2014\,14,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2014\,14,2); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2014\,14,3); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2014\,14,4); 
 /*Only the two first quarters of 2015 were ever released. The administration sworn in December 2015 accused the previous INDEC administration
		to have manipulated EPHc statistics (a claim unverifiable by external observers, although there should be an ongoing lawsuit to 
		judge on this matter) and thus proposed a new survey starting from the second quarter of 2016. As a result, there were no EPHc 
		surveys for the second semester of 2015 and the first quarter of 2016. Pundits accuse this is part of a statistical blackout in order
		to hide the nefarious effects of the significant devaluation of December 2015 on inflation, employment and poverty. */

%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2015\,15,1); 
%import_EPH(H:\Leonardo_orléans\EPH_base\EPH_2015\,15,2); 



		/*We import household datasets just to show there is a problem with the second quarter of 2014 dataset.*/
PROC IMPORT OUT=leo.eph_hh_2014_t01
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2014\hogar_t114.sav"
            DBMS=sav REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_hh_2014_t02
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2014\hogar_t214.sav"
            DBMS=sav REPLACE;
RUN;
/************************************************** DATABASE ERROR***********************************************************
The variable CODUSU, which identifies a given household, is broken for the second quarter of 2014 wave. Any pannel comparisons using this
		survey are thus impossible. This is proven by the code below, where the same CODUSU (which is supposed to be invariable across
		periods) is used to refer to two different households between the first and second quarters of 2014. 
proc print data=leo.eph_hh_2014_t02 (obs=10); 
where codusu="393354"; 
run; 
proc print data=leo.eph_hh_2014_t01 (obs=10); 
where codusu="393354"; run; 
proc print data=leo.eph_2014_t02 (obs=10); 
where codusu="393354"; 
run; 
proc print data=leo.eph_2014_t01 (obs=10); 
where codusu="393354"; run; */
 /*Thankfully, this error only affects the second quarter of 2014. You can see it with the datasets below.*/
PROC IMPORT OUT=leo.eph_hh_2014_t03
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2014\hogar_t314.sav"
            DBMS=sav REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_hh_2014_t04
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2014\hogar_t414.sav"
            DBMS=sav REPLACE;
RUN;



/***********************2- Re-load the formats to avoid any formatting error. See file 0- import formats for more details on the code below.************/
libname formats "h:\Leonardo_orléans\EPH_base\formats";
/*There is a problem with the formats of 2015, so we have to use those of the other waves. */
options fmtsearch=(formats.formats_all);
proc print data=leo.eph_2015_t02(obs=10); 
run;
options fmtsearch=(formats.formats_2014);
proc print data=leo.eph_2014_t02(obs=10); 
run;
options fmtsearch=(formats.formats_2013);
proc print data=leo.eph_2013_t02(obs=10); 
run;/*
options fmtsearch=(format.formats_2012);
proc print data=leo.eph_2012(obs=10); 
run;*/

options fmtsearch=(format.formats_2012);
proc print data=leo.eph_2012_t02(obs=10); 
run;
 /*
options fmtsearch=(format.formats_2011);
proc print data=leo.eph_2011(obs=10); 
run; 
*/

options fmtsearch=(format.formats_2011);
proc print data=leo.eph_2011_t02(obs=10); 
run;/*
options fmtsearch=(format.formats_2010);
proc print data=leo.eph_2010(obs=10); 
run;*/


options fmtsearch=(format.formats_2010);
proc print data=leo.eph_2010_t02(obs=10); 
run;
options fmtsearch=(format.formats_2009);
proc print data=leo.eph_2009_t02(obs=10); 
run; 

options fmtsearch=(format.formats_2008);
proc print data=leo.eph_2008_t02(obs=10); 
run; 

options fmtsearch=(format.formats_2007);
proc print data=leo.eph_2007_t02(obs=10); 
run; 

options fmtsearch=(format.formats_2006);
proc print data=leo.eph_2006_t02(obs=10); 
run;

options fmtsearch=(format.formats_2005);
proc print data=leo.eph_2005_t02(obs=10); 
run; 
options fmtsearch=(format.formats_2004);
proc print data=leo.eph_2004_t02(obs=10); 
run; 
/*There is a problem with the formats of the 2003 waves, so we have to use those of all the other datasets*/
options fmtsearch=(format.formats_all);
proc print data=leo.eph_2003_t03(obs=10); 
run; 


/******************************************3- Format the imported datasets*************************************/
/*First, we regroup quarterly surveys in more manageable yearly datasets, and introduce an individual id variable.*/
/*In the EPHc, CODUSU is the variable that personentifies a given dwelling throughout the surveys. It is never reused by another dwelling, 
				except in the second quarter of 2014 where we saw there was a database error in that respect. 
			NRO_HOGAR is useful when there are various different households that share the same dwelling. Most of the time it is equal to 1. 
			COMPONENTE finally is different for each household member. It is incremental (if there are five household members, COMPONENTE
					goes from 1 to 5) and is fixed for a given individual even if the number of household members changes (if in period t there 
					are 5 households members and in t+1 household member with the COMPONENTE equal to 3 leaves the household, the COMPONENTE
					variable stays equal to 4 and 5 for the last two members of the household). 
		Thus, the concatenation of CODUSU, NRO_HOGAR and COMPONENTE results in the individual person variable. Without the COMPONENTE, 
				it becomes the household id variable.*/ 
data leo.eph_data_2003; 
length student $8.;
set leo.eph_2003_t03 leo.eph_2003_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2003 & trimestre=3 then period=1;
		if ano4=2003 & trimestre=4 then period=2; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 

run; 
proc contents data=leo.eph_data_2003; run; 
data leo.eph_data_2004; 
length student $8.;
set leo.eph_2004_t01 leo.eph_2004_t02 leo.eph_2004_t03 leo.eph_2004_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
		if ano4=2004 & trimestre=1 then period=3;
		if ano4=2004 & trimestre=2 then period=4; 
		if ano4=2004 & trimestre=3 then period=5;
		if ano4=2004 & trimestre=4 then period=6; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
run; 

data leo.eph_data_2005; 
length student $8.;
set leo.eph_2005_t01 leo.eph_2005_t02 leo.eph_2005_t03 leo.eph_2005_t04;
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2005 & trimestre=1 then period=7;
		if ano4=2005 & trimestre=2 then period=8; 
		if ano4=2005 & trimestre=3 then period=9;
		if ano4=2005 & trimestre=4 then period=10; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1; 
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
run; 

data leo.eph_data_2006; 
length student $8.;
set leo.eph_2006_t01 leo.eph_2006_t02 leo.eph_2006_t03 leo.eph_2006_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2006 & trimestre=1 then period=11;
		if ano4=2006 & trimestre=2 then period=12; 
		if ano4=2006 & trimestre=3 then period=13;
		if ano4=2006 & trimestre=4 then period=14; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1; 
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
run; 

data leo.eph_data_2007; 
length student $8.;
set leo.eph_2007_t01 leo.eph_2007_t02 leo.eph_2007_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2007 & trimestre=1 then period=15;
		if ano4=2007 & trimestre=2 then period=16; 
		if ano4=2007 & trimestre=3 then period=17;
		if ano4=2007 & trimestre=4 then period=18;  
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;   
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 

run; 

data leo.eph_data_2008; 
length student $8.;
set leo.eph_2008_t01 leo.eph_2008_t02 leo.eph_2008_t03 leo.eph_2008_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2008 & trimestre=1 then period=19;
		if ano4=2008 & trimestre=2 then period=20; 
		if ano4=2008 & trimestre=3 then period=21;
		if ano4=2008 & trimestre=4 then period=22;  
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	
run; 

data leo.eph_data_2009; 
length student $8.;
set leo.eph_2009_t01 leo.eph_2009_t02 leo.eph_2009_t03 leo.eph_2009_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2009 & trimestre=1 then period=23;
		if ano4=2009 & trimestre=2 then period=24; 
		if ano4=2009 & trimestre=3 then period=25;
		if ano4=2009 & trimestre=4 then period=26;  
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	
run; 

data leo.eph_data_2010; 
length student $8.;
set leo.eph_2010_t01 leo.eph_2010_t02 leo.eph_2010_t03 leo.eph_2010_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2010 & trimestre=1 then period=27;
		if ano4=2010 & trimestre=2 then period=28; 
		if ano4=2010 & trimestre=3 then period=29;
		if ano4=2010 & trimestre=4 then period=30;  
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	
run; 
data leo.eph_data_2011;
length student $8.; 
set leo.eph_2011_t01 leo.eph_2011_t02 leo.eph_2011_t03 leo.eph_2011_t04;
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2011 & trimestre=1 then period=31;
		if ano4=2011 & trimestre=2 then period=32; 
		if ano4=2011 & trimestre=3 then period=33;
		if ano4=2011 & trimestre=4 then period=34; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	
run; 
data leo.eph_data_2012; 
length student $8.;
set leo.eph_2012_t01 leo.eph_2012_t02 leo.eph_2012_t03 leo.eph_2012_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2012 & trimestre=1 then period=35;
		if ano4=2012 & trimestre=2 then period=36; 
		if ano4=2012 & trimestre=3 then period=37;
		if ano4=2012 & trimestre=4 then period=38;  
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 

run; 
data leo.eph_data_2013; 
length student $8.;
set leo.eph_2013_t01 leo.eph_2013_t02 leo.eph_2013_t03 leo.eph_2013_t04; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2013 & trimestre=1 then period=39;
		if ano4=2013 & trimestre=2 then period=40; 
		if ano4=2013 & trimestre=3 then period=41;
		if ano4=2013 & trimestre=4 then period=42; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1;  
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	
run; 
data leo.eph_data_2014; 
length student $8.;
set leo.eph_2014_t01 leo.eph_2014_t02 leo.eph_2014_t03 leo.eph_2014_t04 ; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2014 & trimestre=1 then period=43;
		if ano4=2014 & trimestre=2 then period=44; 
		if ano4=2014 & trimestre=3 then period=45;
		if ano4=2014 & trimestre=4 then period=46; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1; 
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	
run;
data leo.eph_data_2015; 
length student $8.;
set leo.eph_2015_t01 leo.eph_2015_t02; 
		household=cats(codusu,nro_hogar)*1;
 		person=cats(codusu,nro_hogar,componente)*1;
		/*We also add a period variable, t, an education variable and turn the age variable into a continuous variable.*/
 		if ano4=2015 & trimestre=1 then period=47;
		if ano4=2015 & trimestre=2 then period=48; 
 		/*We define three education levels: the highest is complete university studies, then complete secondary studies, then 
				incomplete secondary education. These are respectively referenced as 3, 2 and 1. */
		if nivel_ed=6
			then formation="3"; 
		if nivel_ed=4 | nivel_ed=5 
			then formation="2"; 
		if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 
			then formation="1";
		/*We make the age variable continous. People aged 0 end up having a value of -1, and the maximum age in the dataset is 98.*/
		ageconti=ch06*1;
		if ageconti=-1 
			then ageconti=0; 
		/*Finally, we identify individuals that contribute to a pension system, either voluntarily (pp07i) or as a compulsory obligation
				(pp07h).*/
		if pp07h=1 
			then contributes_obl=1;
		if pp07h=2 or pp07h=0  
			then contributes_obl=0;
		if pp07i=1 
			then contributes_vol=1;
		if pp07i=2 or pp07i=0 
			then contributes_vol=0;
 		if contributes_obl= 0& contributes_vol=0 
			then contributes=0; 
 		else contributes=1; 
	/*We put all labour income earned in all occupations under one variable, the 
			Total Labour Income (ITL in Spanish).*/
	/*This "Ingreso Total Laboral" was defined by Lindenboim, Borroni, Valdez and Vázquez (2007). Itt is the sum of the main occupation income
			and of secondary occupations (including income coming from past occupied positions). 
	/*Following the pension Law 24241, all these sources of income contribute to social security, and are the basis for the computation of the
			reference income (Art. 24). The thirteenth month on the other hand pays social security contributions, but is not taken into account
			for determining the reference income of the future pension. We take this into account in our simulations, but we cannot directly 
			measure the thirteenth month in the EPHc (only respondents surveyed exactly in December or June report their thirteenth month income), 
			under variable pp08j1).*/
		ITL=p21+tot_p12; 
	/*We flag students within the dataset*/
		if cat_inac=3 
			then student="True"; 
		if cat_inac=0 |cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7
			then student="False"; 
	/*We delete respondents that do not give their age*/
		if ch06=99 
			then delete; 
	 
run; 


/*****************************************We then make a macro to format these datasets********************************************/

	/*First, we make a macro to tell apart independent workers of the formal sector from those of the informal sector. We also 
			identify formal wage-earners. See Appendix H and Section 1.2.2. of the thesis for the full details. */

%macro formality(indata,outdata);
		/*We start by identifying formal independent workers, following Maurizio (2012)*/
options nofmterr; 
data formality; 
	length qualif_indep $32.; 
set &indata.; 
			/*Here we take only independent workers*/
	where (estado=1)&(cat_ocup=1|cat_ocup=2); 
				/*We tag independent workers that occupy a position that needs a professional or a technical qualification. Those who 
						have only an operative qualification or no qualification at all are non qualified*/
 		qualification=substr(pp04d_cod,5);
		if qualification^=1 & qualification^=2 
			then qualif_indep="Non_qualif"; 
		else qualif_indep="Qualif"; 
run; 
	/*Then, among independents with low qualifiaction, those who work in the private sector (pp04a^=1) and employ 5 persons or less,
			or an unknown amount of persons (pp04c), are considered as informal. The rest is considered formal.*/
data formality; 
set formality; 
		if qualif_indep="Non_qualif" &((pp04a^=1)&(pp04c=1|pp04c=2|pp04c=3|pp04c=4|pp04c=5|pp04c=99))
			then contributes=0 ; 
		else contributes=1 ; 
	drop qualification; 
run; 
 
	
data formality; 
set formality; 
		/*We ascertain all independent workers of the public sector are formal...*/
	where (estado=1)&(cat_ocup=1|cat_ocup=2);
		if pp04a=1 
			then do; 
				contributes=1; 
				qualif_indep="Qualif"; 
			end; 
		/*... that all independent workers that employ 6 or more workers are formal...*/
		if pp04c=6|pp04c=7|pp04c=8|pp04c=9|pp04c=10|pp04c=11|pp04c=12  
			then do; 
				contributes=1; 
				qualif_indep="Qualif"; 
			end;  
		/*... and that all those who contribute are qualified independent workers, even if their actual qualification is low.*/
		if contributes=1
			then qualif_indep="Qualif"; 
run; 
	/*Finally, we add the new information on labour informality to the output dataset.*/
proc sort data=&indata. ;
	by person period; 
run; 
proc sort data=formality; 
	by person period; 
run; 
	
data &outdata.; 
length seniority $32.; 
merge &indata. formality; 
	by person period; 
		/*We define five labour-market states. Formal wage-earners (1), Independent workers of the formal sector (2), Informal workers (3),
				the Unemployed (4) and the Inactive (5). See section 1.2.2. page 76 for the rationale behind these categories.*/
		if estado=2 
			then labour_market_state=4;
		if estado=1 & cat_ocup=3 & contributes=1 
			then labour_market_state=1;
		if qualif_indep="Qualif" 
			then labour_market_state=2; 
		if qualif_indep="Qualif"
			then contributes=1; 
		if estado=1 & contributes=0 | cat_ocup=4 
			then labour_market_state=3;
		if estado=3 | estado=4 | estado=0 
			then labour_market_state=5; 
				/*We finally add the information on the seniory each worker has in their occupation. 
		1: 3 months or less or unknown. 2: ]3;6] months. 3: ]6;12] months. 4: ]1;5] years. 5: 5 years or more.*/
				/*Unpaid family workers (cat_ocup=4) do not report their seniority. We leave that information untouched for now, as it will 
						be tackled further down the formatting of our dataset. We consider they have the minimum seniority possible, so you can 
						uncomment cat_ocup=4 in the code below if you wish, to allow missing seniority observations.*/
		if /*cat_ocup=4|*/ pp07a=1 | pp07a=2 | pp05h=1 | pp05h=2 |  ((pp07a=0 & cat_ocup=3) | (pp05h=0 & (cat_ocup=1 | cat_ocup=2))) | ((missing(pp07a) | missing(pp05h)| pp07a=9 | pp05h=9) & (labour_market_state=1  | labour_market_state=2 | labour_market_state=3)) 
			then seniority="1"; 
		if pp07a=3 | pp05h=3 
			then seniority="2";
		if pp07a=4 | pp05h=4 
			then seniority="3";
		if pp07a=5 | pp05h=5 
			then seniority="4"; 
		if pp07a=6 | pp05h=6 
			then seniority="5"; 
		if labour_market_state=4 | labour_market_state=5 
			then seniority="-1";  
run; 
/*On trouve des chiffres réalistes, avec une plus grande cotisation des patrons que des travailleurs indépendants*/

%mend; 

%formality(leo.eph_data_2003,leo.eph_data_formatted_2003);
%formality(leo.eph_data_2004,leo.eph_data_formatted_2004);
%formality(leo.eph_data_2005,leo.eph_data_formatted_2005);
%formality(leo.eph_data_2006,leo.eph_data_formatted_2006);
%formality(leo.eph_data_2007,leo.eph_data_formatted_2007);
%formality(leo.eph_data_2008,leo.eph_data_formatted_2008);
%formality(leo.eph_data_2009,leo.eph_data_formatted_2009);
%formality(leo.eph_data_2010,leo.eph_data_formatted_2010);
%formality(leo.eph_data_2011,leo.eph_data_formatted_2011);
%formality(leo.eph_data_2012,leo.eph_data_formatted_2012);
%formality(leo.eph_data_2013,leo.eph_data_formatted_2013);
%formality(leo.eph_data_2014,leo.eph_data_formatted_2014);
%formality(leo.eph_data_2015,leo.eph_data_formatted_2015);


