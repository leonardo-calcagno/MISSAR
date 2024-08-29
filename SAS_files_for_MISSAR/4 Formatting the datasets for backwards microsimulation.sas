/*********************************************At this point, we have taken out of the EPH (1974-2017) all the information necessary to 
		calibrate our microsimulation model, both at the micro and macro level. There are other calibration elements taken from outside 
		sources (mean wages, population projections, marriage / divorce probabilities...) that are explained in distinct excel files.******/

/************What we now do is finish the formatting of the EPHc waves (2003-2015) to make them fit for our backward simulation module. 
		We do it across the whole EPHc dataset even though we only use the later waves in our prospective projections (fourth quarter of 
		2014 and second quarters of 2014 and 2015). This is because in my working paper "Does the Introduction of Non-Contributory Social 
		Benefits Discourage Registered Labour? Testing the Impact of Pension Moratoriums on Unregistered Employment in Argentina (2003-2015)"
		(Calcagno, 2017) I run my backward model on all the EPHc waves throughout the 2003-2015 to tell apart seniors with complete careers
		from senior with incomplete formal careers. It can thus be interesting to re-run the backward microsimulation module on various
		EPHc waves, even if these are not used as the starting datasets of prospective social security projections.*/ 

/********First, we include in the starting dataset the individual error terms (or residuals) of the Mincer wage equations computed in file 
		2.1. We use them in both our prospective and retrospective modules when computing individual labour income, as explained in detail
		in section 2.3.3. of my PhD thesis.********************/

options nofmterr; 

DATA LEO.wage_residuals_back; 
set leo.outdata_back_men leo.outdata_back_women; 
keep person resid ano4 period; 
run; 
data leo.wage_residuals_forward; 
set leo.outdata_all_men leo.outdata_all_women; 
keep person resid ano4 period; 
run; 
proc sort data=leo.wage_residuals_forward; 
by person ano4 period; 
run; 
proc sort data=leo.wage_residuals_back; 
by person ano4 period; 
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
%macro microsimulation_formatting(indata,year,quarter,period,period_b); 
/* This macro adds some variables not required for the model's calibration, but that need to be present in the initial data sets before 
		simulation. It also outputs quarterly datasets compatible with LIAM2 and (almost) ready to be imported with LIAM2. */

options nofmterr; 
data the_studied_quarter_dataset; 
	length male $32.; 
set &indata.; 
where period=&period.;
run; 
data the_studied_quarter_dataset;
set the_studied_quarter_dataset; 
		if cat_inac=1 
			then retired=1; 
		if cat_inac^=1 
			then retired=0; 
/*We write the gender variable as a boolean */
		if ch04=1
			then male="True"; 
		if ch04=2
			then male="False"; 
/*We take out respondents that do not give their age.*/
		if ch06=99 
			then delete; 
/*Then, we identify the current education year of secondary students. This is a very important variable, as it is one of the determinants
		of the end of studies age for secondary students. 
It is a complicated variable to read in the EPHc however because of various differences in education systems between provinces,
		 and the unequal implementation of the 1993 and 2006 education reforms. Everything is thoroughly explained in Appendix P of 
		 my PhD thesis, and in particular in Appendix P.2. where you can see the consequences of these reforms on the legibility of
		 secondary education level in the EPHc.
The "polimodal" variable refers to "polimodal" education, introduced by the 1993 reform but only really implemented in some provinces.
		This was the name of the last three years of secondary education (usually from ages 15-16 to 17-18), which were specialised
		and not compulsory. The 2006 reform gradually eliminated polimodal education and replaced it by a primary / secondary education 
		split that covers the whole compulsory education, and brings it up to age 18. So until 2006, it was only compulsory to attend 
		school until age 16, and after that reform it is in theory compulsory to stay until completion of secondary education (so ages 
		17-18).
It can however be shown in the EPHc that, de facto, starting from age 16 a non-negligible proportion of students drop out of education 
		and start working, a reality that is less prevalent at ages 15 or lower. This is why we assume all respondents aged 15 or less
		are inactive students, and that individuals can only start working at age 16.
We thus need to know for our prospective simulations what education year students aged 15-16 to 17-18 (thus in their last three years 
		of secondary education) are attending. This is written in the "polimodal" variable below. The last year of secondary education 
		is the third year of polimodal.
For earlier waves of the EPHc, it is less important to know the exact secondary education year of students because we only use these as 
		the starting datasets of retrospective simulations. So the actual polymodal education year may differ from the one we compute 
		with post 2012 legislation in mind (when the polymodal education system was mostly abandonned), but it has no consequence on 
		our backwards microsimulations.*/ 
	polimodal=0; 
/*We only study students*/
	if cat_inac=3 
		then do;  
/*Some respondents, specially for earlier waves of the EPHc, directly give their current year of studies by using the polimodal terminology.
		In those cases, we directly know what their current year of education is and write it down in the polimodal variable accordingly.*/ 
			if ( ch12=5) 
				then do; 
					if ch14=00 
						then polimodal=1; 
					if ch14=01 
						then polimodal=2; 
					if ch14=02 
						then polimodal=3; 
					if ch14=03 
						then polimodal=3; 
					if ch14=04 
						then polimodal=3;
					if ch14=05 
						then polimodal=3; 
					if  ch14=06 | ch14=07 | ch14=08 | ch14=09 
						then polimodal=1;
/*To avoid confusing me, I temporarily translated these education years following the French numeration system. The last year of high school
		gets a 0 ("Terminale"), the second to last, a 1 ("Première"), the one before that, a 2 ("Seconde") etc.*/
					if polimodal=3 
						then french_numeration=0; 
					if polimodal=2 
						then french_numeration=1; 
					if polimodal=1 
						then french_numeration=2; 
				secondary_nomenclature=0;
				end; 
/*Most secondary students though refer to high school as "secondary education", and not polimodal. The problem is secondary education does
		not start at the same age among all provinces. This does not have any real impact on education levels or quality, it's just that 
		the nomenclature is not compatible from one province to the other. For instance, in the City of Buenos Aires primary education 
		lasts 7 years (the last year of primary education is what in France is called "cinquième", or the second year of middle school). In 
		the Province of Buenos Aires though, primary education lasts 6 years since 2011. Thus, in 2015 a first year secondary student in the
		Province of Buenos Aires would actually have been a seventh year of basic education student in the City of Buenos Aires. We thus 
		need to refer to the respondent's city of residence, see in what province it is located, and assume he/she studies in that same province.*/ 
			if ( ch12=4) 
				then do; 
					if aglomerado=2 | aglomerado=3 | aglomerado=6| aglomerado=9 |aglomerado=12 | aglomerado=13 | aglomerado=14 | aglomerado=15 | aglomerado=22 | 
						aglomerado=26 | aglomerado=27 | aglomerado=29 | aglomerado=30 | aglomerado=31 | aglomerado=33 | aglomerado=34| aglomerado=36 | aglomerado=91
						then secondary_nomenclature=6; /*These are the cities in provinces with 6 years of secondary education*/
					if aglomerado=4| aglomerado=5 | aglomerado=7 | aglomerado=8 | aglomerado=10 | aglomerado=17 | aglomerado=18 | aglomerado=19 | aglomerado=20 
						| aglomerado=23 | aglomerado=25 |aglomerado=32 
						then secondary_nomenclature=5; /*These are the cities in provinces with 5 years of secondary education*/
/*There are finally two agglomerations, Viedma / Carmen de Patagones and San Nicolás /Villa Constitución, that extend across two provinces
		with different secondary education nomenclature (respecively Río Negro and Buenos Aires, and Buenos Aires and Santa Fe). For 
		secondary students residing in those cities, we infer their education level from their age further down below.*/
					if aglomerado=38 | aglomerado=93 
						then secondary_nomenclature=99; 
					if secondary_nomenclature=6 
						then do; 
							if ch14=00
								then french_numeration=5; 
							if ch14=01 
								then french_numeration=4; 
							if ch14=02 
								then french_numeration=3; 
							if ch14=03 
								then french_numeration=2; 
							if ch14=04 	
								then french_numeration=1; 
							if ch14=05 
								then french_numeration=0; 
							if ch14=06 
								then french_numeration=0; 
 						end; 
					if secondary_nomenclature=5 
						then do;
							if ch14=00 
								then french_numeration=4; 
							if ch14=01 
								then french_numeration=3; 
							if ch14=02 
								then french_numeration=2; 
							if ch14=03 
								then french_numeration=1; 
							if ch14=04 
								then french_numeration=0; 
							if ch14=05 
								then french_numeration=0; 
						end; 
				end; 
			if (ch12=4 | ch12=5) & (secondary_nomenclature=99 | ch14=98 | ch14=99 | ch14=999 | ch14=9999) 
			/*In cases where we cannot know for sure what is the current education year of secondary students, we arbitrarily set it 
					following their age.*/
				then do; 
					if ageconti>=17 
						then french_numeration=0; 
					if ageconti=16 
						then french_numeration=1; 
					if ageconti=15 
						then french_numeration=2; 
					if ageconti=14 
						then french_numeration=3; 
					if ageconti=13 
						then french_numeration=4; 
					if ageconti=12 
						then french_numeration=5; 
				end; 
/*We finally translate the education year following french numeration following the polimodal nomenclature.*/
			if french_numeration=0 
				then polimodal=3; 
			if french_numeration=1 
				then polimodal=2; 
			if french_numeration=2 
				then polimodal=1; 
		end;
/*Next, we identify the year of study of university students. Values 6, 7 and 8 of variable ch12 correspond to university level studies. 
		By hypothesis, we assume only self-declared students aged 16 to 29 may be university students (our microsimulation model 
		assumes self-declared students aged 30 or more are not actually students). We also assume a university student can only have up to
		6 years of studies for the sake of simplicity, and due to the design of our prospective education module. This last hypothesis 
		may be lifted in future work.*/
		if ((agegroup=16|agegroup=20|agegroup=25) & (ch12=6|ch12=7|ch12=8) & cat_inac=3) 
			then do; 
				if ch14=00 
					then university_year=1; 
				if ch14=01 
					then university_year=2; 
				if ch14=02
					then university_year=3; 
				if ch14=03 
					then university_year=4; 
				if ch14=04 
					then university_year=5; 
				if ch14=05 
					then university_year=6; 
				if(ch14=06|ch14=07|ch14=08|ch14=09)  
					then university_year=6; 
/*We finally assume university students with unspecified year of studies are in their first year.*/
				if (ch14=98|ch14=99|ch14=999|missing(ch14))  
					then university_year=1;
		end;
		if missing(university_year)
			then university_year=0; 
/*We finally tag self-declared housewives / house-husbands. Only the former will be used in our retrospective module.*/
		if cat_inac=4 
			then housewife=1;
		if cat_inac^=4 
			then housewife=0;  
/*We assume those self-declared as stay-at-home wives that do not have children aged 4 or less are permanent housewives in our 
		backwards simnulations. This is explained in detail in section 2.3.2. of my PhD thesis. The code allows for male permanent
		housewives, but the backwards microsimulation module actually only applies this category to women (men may be tagged as such, 
		but it has no impact on their simulated individual careers).*/		
		if housewife=1 & little_children=0 
			then perm_housewife=1; 
		if housewife=0 | little_children^=0 
			then perm_housewife=0; 
		
run; 
/*Now we only want to keep the variables that will be input in our backwards microsimulation module. All input variables need to be 
		either floats, strings or booleans. 
Also, we need to input the short versions of individual id variables and family links. We had in file 1.3. kept in the both_id datasets 
		individual id and family links written both in their long and short versions. We will thus keep in the formatted version of the EPH 
		only the variables required for the retrospective simulation, and merge it to the both_id dataset corresponding to the studied period.*/
data micro_base; 
set the_studied_quarter_dataset;  
	keep pondera ano4 period person ageconti agegroup male ch04 labour_market_state formation marital_status ITL student polimodal university_year 
		underage_children little_children housewife perm_housewife v2_m ln_wage retired seniority sect_quartile; 
run; 
data micro_base;
set micro_base; 
	age_quarters=ageconti*4;
	rename person=id_long; 
	rename ageconti=age; 
run; 

proc sort data=micro_base; 
	by id_long; 
run; 
proc sort data=leo.both_id_&year._t&quarter.; 
	by id_long; 
run; 
/*We also add the residuals of the Mincer wage equations, which we had stocked in the datasets leo.wage_residuals and leo.wage_residuals_back.*/
data period_residuals_forward; 
set leo.wage_residuals_forward; 
	where period=&period.; 
		rename person=id_long; 
run; 
data period_residuals_back; 
set leo.wage_residuals_back; 
	where period=&period.; 
		rename person=id_long; 
		rename resid=resid_back; 
run; 
proc sort data=period_residuals_forward; 
	by id_long; 
run; 
proc sort data=period_residuals_back; 
	by id_long; 
run; 
data leo.microsim_base_&year._t&quarter.; 
merge leo.both_id_&year._t&quarter. micro_base period_residuals_forward period_residuals_back; 
	by id_long; 
run; 
data leo.microsim_base_&year._t&quarter.; 
set leo.microsim_base_&year._t&quarter.; 
	drop id_long household mother_id father_id id_shrinked partner_id; 
		rename id_short=id; 
		rename short_p_id=partner_id; 
		rename short_m_id=mother_id; 
		rename short_f_id=father_id; 
		rename household_short=household_id; 
		/*We give a null value to the wage equation residuals of people that were not working when surveyed. It may be better to give them a random value for the wage 
			equation residual variable, but it is far from trivial to choose the correct random distribution to do so. It is not either a priority of this PhD thesis. 
			As such, a better strategy for assigning wage residuals to individuals is left for future work.*/
		if missing(resid_back)
			then resid_back=0; 
		if missing(resid)
			then resid=0; 
run; 

/*We have a weird error where there sometimes are duplicate observations. We eliminate them with this piece of code.*/
proc sort data=leo.microsim_base_&year._t&quarter.;
	by id; 
run; 
data leo.microsim_base_&year._t&quarter.; 
set leo.microsim_base_&year._t&quarter.; 
	by id; 
		if first.id 
			then apparition=1; 
		else apparition+1; 
run; 
data leo.microsim_base_&year._t&quarter.; 
set leo.microsim_base_&year._t&quarter.; 
		if apparition=2 
			then delete; 
	drop apparition; 
run; 

/*This base dataset is almost complete for backwards microsimulations. For the prospective ones, 
		it still needs further variables, as well as inputting individual careers simulated by the
		backwards simulations.*/

/*We also need to input to LIAM2 a separate dataset including only the list of household_ids.*/
data leo.microsim_base_&year._t&quarter._hh; 
set leo.microsim_base_&year._t&quarter.; 
		period=&period.; 
run; 
proc sort data=leo.microsim_base_&year._t&quarter._hh; 
		by household_id; 
run; 
data leo.microsim_base_&year._t&quarter._hh; 
set leo.microsim_base_&year._t&quarter._hh; 
	by household_id;
		if last.household_id; 
run; 

data  leo.microsim_base_&year._t&quarter._hh;  
set  leo.microsim_base_&year._t&quarter._hh; 
id=household_id; 
run; 
data  leo.microsim_base_&year._t&quarter._hh; 
set  leo.microsim_base_&year._t&quarter._hh;  
keep pondera id ano4 period ; 
run; 

data  leo.microsim_base_&year._t&quarter._hh; 
set  leo.microsim_base_&year._t&quarter._hh;  
household_id2=id ; 
run;
/*We also change accordingly the period variable for our backwards microsimulations.*/
data  leo.microsim_base_&year._t&quarter._hh_b; 
set  leo.microsim_base_&year._t&quarter._hh;  
		period=&period_b.; 
		if missing(ano4) 
			then delete; 
run;
 data leo.microsim_base_&year._t&quarter._b; 
 set leo.microsim_base_&year._t&quarter.;
		if missing(ano4)
			then delete; 
		period=&period_b.; 
 run; 
/*This said, we format the seniority variable for prospective simulations (not used in backwards simulations).*/
 data leo.microsim_base_&year._t&quarter.; 
 set leo.microsim_base_&year._t&quarter.; 
 		if missing(marital_status) 
			then marital_status=5;
		if seniority="1" 
			then seniority_num=1; 
		if seniority="2" 
			then seniority_num=2; 
		if seniority="3" 
			then seniority_num=3; 
		if seniority="4" 
			then seniority_num=4; 
		if seniority="5" 
			then seniority_num=5; 
		if seniority="-1" | missing(seniority) 
			then seniority_num=0;  
 	drop seniority; 
		rename seniority_num=seniority; 
	/*Workers gain seniority one quarter at a time in our prospective simulations. As such, we translate the variables of the seniority variable in quarters. We have kept 
			five values for the seniority variable: 1) 3 months or less; 2) more than 3 up to 6 months; 3) more than 6 up to 12 months; 4) more than one year up to 
			five years; 5) more than five years. By hypothesis, we assume 3) corresponds to 3 quarters and 4) to 12 quarters (3 years).The actual value of 5)
			does not matter, since it is the maximum value for seniority as measured in the EPHc. We simply kept it at 21 quarters (5 years and 3 months). The
			only strong hypothesis was made for 4), and it could be argued the actual seniority as measured in quarters should be randomly drawn between 5 and 20 quarters.
			This is left for future work.*/ 
		if seniority=1 
			then quarterly_seniority=1; 
 		if seniority=2 
			then quarterly_seniority=2; 
 		if seniority=3 
			then quarterly_seniority=3; 
 		if seniority=4 
			then quarterly_seniority=12; 
 		if seniority=5 
			then quarterly_seniority=21; 
		if seniority=0 | missing(seniority) 
			then quarterly_seniority=0;  
		if missing(quarterly_seniority)
			then quarterly_seniority=0; 
 run; 
 
 /*We finally export the backwards datasets in a csv format, suitable for LIAM2 simulations. The base datasets for prospective simulations
 		are  at this point of the code execution not complete, simply because they still need the data on individual careers as simulated
 		by the backwards microsimulation module. We export the datasets for all the periods, even though in our PhD thesis only work 
 		with the second quarter of 2014, fourth quarter of 2014 and second quarter of 2015 waves. This is done to make easier future 
 		simulations with other starting datasets.*/
 /*Of course, choose the path of your liking.*/
 proc export data=leo.microsim_base_&year._t&quarter._b outfile="H:\LIAM2_commented_code\Retrospective_simulations\Import_files\SAS_input\microsim_base_&year._t&quarter._b.csv" dbms=csv replace; run;

 proc export data=leo.microsim_base_&year._t&quarter._hh_b outfile="H:\LIAM2_commented_code\Retrospective_simulations\Import_files\SAS_input\microsim_base_&year._t&quarter._hh_b.csv" dbms=csv replace; run;


%mend;
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2015,2,48,1000);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2015,1,47,1001);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2014,4,46,1002);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2014,3,45,1003);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2014,2,44,1004);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2014,1,43,1005);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2013,4,42,1006);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2013,3,41,1007);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2013,2,40,1008);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2013,1,39,1009);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2012,4,38,1010);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2012,3,37,1011);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2012,2,36,1012);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2012,1,35,1013);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2011,4,34,1014);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2011,3,33,1015);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2011,2,32,1016);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2011,1,31,1017);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2010,4,30,1018);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2010,3,29,1019);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2010,2,28,1020);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2010,1,27,1021);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2009,4,26,1022);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2009,3,25,1023);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2009,2,24,1024);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2009,1,23,1024);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2008,4,22,1025);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2008,3,21,1026);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2008,2,20,1027);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2008,1,19,1028);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2007,4,18,1029);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2007,2,16,1030);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2007,1,15,1031);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2006,4,14,1032);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2006,3,13,1033);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2006,2,12,1034);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2006,1,11,1035);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2005,4,10,1036);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2005,3,9,1037);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2005,2,8,1038);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2005,1,7,1039);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2004,4,6,1040);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2004,3,5,1041);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2004,2,4,1042);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2004,1,3,1043);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2003,4,2,1044);
%microsimulation_formatting(leo.eph_data_formatted_2003_2015,2003,3,1,1045);

/*This ends the formatting. If you have an error when importing these datasets to LIAM2, it is often because the age value for 
		people aged 98 or more is often written in characters ("98 y más años"). You will need to change that with a ctrl+h with 
		excel directly on the csv file. */
