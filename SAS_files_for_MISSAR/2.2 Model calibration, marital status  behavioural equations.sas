/*Here we estimate behavioural equations that portray individual developments in the marital status sphere: marriage, divorce, 
		formation of new couples.*/

/*First, we exploit the yearly pannel aspect of the EPH for some of these transitions. We thus format the dataset accordingly.*/

	/*We invoke the macro for giving a null value to missing values*/
 %Macro M_Zero (ds) ;
     data &ds. (drop=_i);
          set &ds. ;
          array A_VarNum[*] _NUMERIC_ ;     

          do _i=1 to dim( A_VarNum ) ;
          If A_VarNum (_i)=. then A_VarNum (_i)=0 ;
     End ;
   run ;
%Mend ; 
data leo.eph_past_state; 
set leo.eph_past_state; 
if ano4=2003 & trimestre=3 then quarterly_RIPTE=944;
if ano4=2003 & trimestre=4 then quarterly_RIPTE=1023;
if ano4=2004 & trimestre=1 then quarterly_RIPTE=1086;
if ano4=2004 & trimestre=2 then quarterly_RIPTE=1096;
if ano4=2004 & trimestre=3 then quarterly_RIPTE=1085;
if ano4=2004 & trimestre=4 then quarterly_RIPTE=1094;
if ano4=2005 & trimestre=1 then quarterly_RIPTE=1106;
if ano4=2005 & trimestre=2 then quarterly_RIPTE=1174;
if ano4=2005 & trimestre=3 then quarterly_RIPTE=1271;
if ano4=2005 & trimestre=4 then quarterly_RIPTE=1364;
if ano4=2006 & trimestre=1 then quarterly_RIPTE=1413;
if ano4=2006 & trimestre=2 then quarterly_RIPTE=1498;
if ano4=2006 & trimestre=3 then quarterly_RIPTE=1578;
if ano4=2006 & trimestre=4 then quarterly_RIPTE=1650;
if ano4=2007 & trimestre=1 then quarterly_RIPTE=1729;
if ano4=2007 & trimestre=2 then quarterly_RIPTE=1828;
if ano4=2007 & trimestre=3 then quarterly_RIPTE=1928;
if ano4=2007 & trimestre=4 then quarterly_RIPTE=2027;
if ano4=2008 & trimestre=1 then quarterly_RIPTE=2124;
if ano4=2008 & trimestre=2 then quarterly_RIPTE=2373;
if ano4=2008 & trimestre=3 then quarterly_RIPTE=2534;
if ano4=2008 & trimestre=4 then quarterly_RIPTE=2615;
if ano4=2009 & trimestre=1 then quarterly_RIPTE=2618;
if ano4=2009 & trimestre=2 then quarterly_RIPTE=2737;
if ano4=2009 & trimestre=3 then quarterly_RIPTE=2795;
if ano4=2009 & trimestre=4 then quarterly_RIPTE=2867;
if ano4=2010 & trimestre=1 then quarterly_RIPTE=3119;
if ano4=2010 & trimestre=2 then quarterly_RIPTE=3349;
if ano4=2010 & trimestre=3 then quarterly_RIPTE=3592;
if ano4=2010 & trimestre=4 then quarterly_RIPTE=3841;
if ano4=2011 & trimestre=1 then quarterly_RIPTE=4081;
if ano4=2011 & trimestre=2 then quarterly_RIPTE=4476;
if ano4=2011 & trimestre=3 then quarterly_RIPTE=4876;
if ano4=2011 & trimestre=4 then quarterly_RIPTE=5213;
if ano4=2012 & trimestre=1 then quarterly_RIPTE=5521;
if ano4=2012 & trimestre=2 then quarterly_RIPTE=6113;
if ano4=2012 & trimestre=3 then quarterly_RIPTE=6486;
if ano4=2012 & trimestre=4 then quarterly_RIPTE=6879;
if ano4=2013 & trimestre=1 then quarterly_RIPTE=7285;
if ano4=2013 & trimestre=2 then quarterly_RIPTE=7839;
if ano4=2013 & trimestre=3 then quarterly_RIPTE=8291;
if ano4=2013 & trimestre=4 then quarterly_RIPTE=8679;
if ano4=2014 & trimestre=1 then quarterly_RIPTE=9223;
if ano4=2014 & trimestre=2 then quarterly_RIPTE=10282;
if ano4=2014 & trimestre=3 then quarterly_RIPTE=11078;
if ano4=2014 & trimestre=4 then quarterly_RIPTE=11798;
if ano4=2015 & trimestre=1 then quarterly_RIPTE=12426; 
if ano4=2015 & trimestre=2 then quarterly_RIPTE=13580; 
run; 
%macro couple_year(library,indata,outdata,unit_var,date_var,from,to);

options nofmterr; 
data &library..&outdata.;
set &library..&indata. 
	(where=(&date_var.=&from. | &date_var.=&to.));
run;  
 
data &library..&outdata.;
set &library..&outdata.;  
		person_year=cats(person,ano4,trimestre); 
	drop apparition; 
run; 
proc sort data=&library..&outdata.; 
	by person_year;
run; 
data &library..&outdata.; 
set &library..&outdata.; 
	by person_year; 
	if last.person_year; 
run; 
proc sort data=&library..&outdata.;
by  &unit_var. &date_var.;  
run; 
%m_zero(&library..&outdata.); 
data bis; 
set &library..&outdata.; 
	by  &unit_var. &date_var.;  
		if first.&unit_var. 
			then apparition=1; 
		else apparition+1;
	if last.&unit_var.; 
run;
data ter; 
set bis; 
		if apparition=1 
			then delete; 
run; 
data ter; 
set ter; 
	keep &unit_var. apparition; 
run; 
proc sort data=ter; 
	by &unit_var.;
run; 
proc sort data=&library..&outdata.; 
	by &unit_var.; 
run; 
data  
data &library..&outdata.; 
merge &library..&outdata. ter; 
	by &unit_var.; 
run; 

data &library..&outdata.; 
set &library..&outdata.; 
	if missing(apparition) 
		then delete; 
run; 
%mend;




%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2003_2004,person,period,1,5);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2003_2004,person,period,2,6);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2004_2005,person,period,3,7);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2004_2005,person,period,4,8);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2004_2005,person,period,5,9);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2004_2005,person,period,6,10);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2005_2006,person,period,7,11);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2005_2006,person,period,8,12);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2005_2006,person,period,9,13);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2005_2006,person,period,10,14);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2006_2007,person,period,11,15);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2006_2007,person,period,12,16);/*
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2006_2007,person,period,13,17);*/
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2006_2007,person,period,14,18);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2007_2008,person,period,15,19);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2007_2008,person,period,16,20);/*
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2007_2008,person,period,17,21);*/
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2007_2008,person,period,18,22);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2008_2009,person,period,19,23);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2008_2009,person,period,20,24);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2008_2009,person,period,21,25);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2008_2009,person,period,22,26);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2009_2010,person,period,23,27);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2009_2010,person,period,24,28);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2009_2010,person,period,25,29);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2009_2010,person,period,26,30);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2010_2011,person,period,27,31);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2010_2011,person,period,28,32);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2010_2011,person,period,29,33);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2010_2011,person,period,30,34);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2011_2012,person,period,31,35);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2011_2012,person,period,32,36);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2011_2012,person,period,33,37);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2011_2012,person,period,34,38);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2012_2013,person,period,35,39);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2012_2013,person,period,36,40);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2012_2013,person,period,37,41);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2012_2013,person,period,38,42);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2013_2014,person,period,39,43);/*
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t2_2013_2014,person,period,40,44);*/
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t3_2013_2014,person,period,41,45);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t4_2013_2014,person,period,42,46);
%couple_year(leo,eph_data_formatted_2003_2015,eph_yearly_t1_2014_2015,person,period,43,47);


%macro past_state(indata,outdata,estado,from_time,to_time);
options nofmterr; 
data last_quarter; 
set &indata.; where period=&from_time.; 
		if missing(seniority) 
			then seniority="1"; 
run; 

data current_quarter; 
set &indata.; where period=&to_time.; 
		if missing(seniority)
			then seniority="1"; 
run; 

data last_quarter; 
set last_quarter; 
keep person &estado. student ch07 ITL seniority
ageconti partner_id underage_children partner_formation formation partner_age partner_lab_mar_state little_children
sect_quartile quartile_all partner_student; 
run; 
data last_quarter; 
set last_quarter; 
lag_labour_market_state=&estado.;
rename student=lag_student; 
rename partner_student=lag_partner_student; 
rename ch07=lag_marital_status; 
rename itl=lag_itl; 
rename seniority=lag_seniority; 
rename ageconti=lag_age; 
rename partner_id=lag_partner_id; 
rename underage_children=lag_und_child; 
rename little_children= lag_lil_child; 
rename partner_formation=lag_part_for; 
rename formation=lag_for; 
rename partner_age=lag_part_age; 
rename partner_lab_mar_state=lag_part_lms; 
rename sect_quartile=lag_sect_quartile; 
rename quartile_all=lag_quartile_all; 
run; 
data last_quarter;
set last_quarter; 
drop &estado. student ch07 ITL; 
run; 
data &outdata._period_&to_time.; 
merge current_quarter last_quarter;
by person; run;  
%mend;


%past_state(leo.eph_yearly_t3_2003_2004,leo.temp_year,labour_market_state,1,5);
%past_state(leo.eph_yearly_t4_2003_2004,leo.temp_year,labour_market_state,2,6);
%past_state(leo.eph_yearly_t1_2004_2005,leo.temp_year,labour_market_state,3,7);
%past_state(leo.eph_yearly_t2_2004_2005,leo.temp_year,labour_market_state,4,8);
%past_state(leo.eph_yearly_t3_2004_2005,leo.temp_year,labour_market_state,5,9);
%past_state(leo.eph_yearly_t4_2004_2005,leo.temp_year,labour_market_state,6,10);
%past_state(leo.eph_yearly_t1_2005_2006,leo.temp_year,labour_market_state,7,11);
%past_state(leo.eph_yearly_t2_2005_2006,leo.temp_year,labour_market_state,8,12);
%past_state(leo.eph_yearly_t3_2005_2006,leo.temp_year,labour_market_state,9,13);
%past_state(leo.eph_yearly_t4_2005_2006,leo.temp_year,labour_market_state,10,14);
%past_state(leo.eph_yearly_t1_2006_2007,leo.temp_year,labour_market_state,11,15);
%past_state(leo.eph_yearly_t2_2006_2007,leo.temp_year,labour_market_state,12,16);/*
%past_state(leo.eph_yearly_t3_2006_2007,leo.temp_year,labour_market_state,13,17);*/
%past_state(leo.eph_yearly_t4_2006_2007,leo.temp_year,labour_market_state,14,18);
%past_state(leo.eph_yearly_t1_2007_2008,leo.temp_year,labour_market_state,15,19);
%past_state(leo.eph_yearly_t2_2007_2008,leo.temp_year,labour_market_state,16,20);/*
%past_state(leo.eph_yearly_t3_2007_2008,leo.temp_year,labour_market_state,17,21);*/
%past_state(leo.eph_yearly_t4_2007_2008,leo.temp_year,labour_market_state,18,22);
%past_state(leo.eph_yearly_t1_2008_2009,leo.temp_year,labour_market_state,19,23);
%past_state(leo.eph_yearly_t2_2008_2009,leo.temp_year,labour_market_state,20,24);
%past_state(leo.eph_yearly_t3_2008_2009,leo.temp_year,labour_market_state,21,25);
%past_state(leo.eph_yearly_t4_2008_2009,leo.temp_year,labour_market_state,22,26);
%past_state(leo.eph_yearly_t1_2009_2010,leo.temp_year,labour_market_state,23,27);
%past_state(leo.eph_yearly_t2_2009_2010,leo.temp_year,labour_market_state,24,28);
%past_state(leo.eph_yearly_t3_2009_2010,leo.temp_year,labour_market_state,25,29);
%past_state(leo.eph_yearly_t4_2009_2010,leo.temp_year,labour_market_state,26,30);
%past_state(leo.eph_yearly_t1_2010_2011,leo.temp_year,labour_market_state,27,31);
%past_state(leo.eph_yearly_t2_2010_2011,leo.temp_year,labour_market_state,28,32);
%past_state(leo.eph_yearly_t3_2010_2011,leo.temp_year,labour_market_state,29,33);
%past_state(leo.eph_yearly_t4_2010_2011,leo.temp_year,labour_market_state,30,34);
%past_state(leo.eph_yearly_t1_2011_2012,leo.temp_year,labour_market_state,31,35);
%past_state(leo.eph_yearly_t2_2011_2012,leo.temp_year,labour_market_state,32,36);
%past_state(leo.eph_yearly_t3_2011_2012,leo.temp_year,labour_market_state,33,37);
%past_state(leo.eph_yearly_t4_2011_2012,leo.temp_year,labour_market_state,34,38);
%past_state(leo.eph_yearly_t1_2012_2013,leo.temp_year,labour_market_state,35,39);
%past_state(leo.eph_yearly_t2_2012_2013,leo.temp_year,labour_market_state,36,40);
%past_state(leo.eph_yearly_t3_2012_2013,leo.temp_year,labour_market_state,37,41);
%past_state(leo.eph_yearly_t4_2012_2013,leo.temp_year,labour_market_state,38,42);
%past_state(leo.eph_yearly_t1_2013_2014,leo.temp_year,labour_market_state,39,43);/*
%past_state(leo.eph_yearly_t2_2013_2014,leo.temp_year,labour_market_state,40,44);*/
%past_state(leo.eph_yearly_t3_2013_2014,leo.temp_year,labour_market_state,41,45);
%past_state(leo.eph_yearly_t4_2013_2014,leo.temp_year,labour_market_state,42,46);
%past_state(leo.eph_yearly_t1_2014_2015,leo.temp_year,labour_market_state,43,47);
data leo.eph_past_year_state; 
set leo.temp_year_period_5-leo.temp_year_period_16 leo.temp_year_period_18-leo.temp_year_period_20 leo.temp_year_period_22-leo.temp_year_period_43 leo.temp_year_period_45-leo.temp_year_period_47; 
		if 15<ageconti<20 then agegroup=16; 
		if 19<ageconti<25 then agegroup=20; 
		if 24<ageconti<30 then agegroup=25; 
		if 29<ageconti<35 then agegroup=30; 
		if 34<ageconti<40 then agegroup=35; 
		if 39<ageconti<45 then agegroup=40;
		if 44<ageconti<50 then agegroup=45; 
		if 49<ageconti<55 then agegroup=50;  
		if 54<ageconti<60 then agegroup=55; 
		if 59<ageconti<65 then agegroup=60;
		if 64<ageconti<70 then agegroup=65;
		if 16>ageconti then agegroup=1; 
		if ageconti>69 then agegroup=300;  
	/*We make sure all unpaid workers or those with null reported income are in the informal sector, which is actually the case of 84% 
			of unpaid workers*/
		if itl=0 & estado=1 then labour_Market_state=3; 
		if labour_market_state=4 | labour_market_state=5 then sect_quartile=0; 
	/*We put people with unreported marital status as single*/
		if marital_status=0 then marital_status=5; 
		if lag_marital_status=9 then lag_marital_status=5; 
		if lag_und_child>=1 then lag_has_children=1; 
		if lag_und_child=0 then lag_has_children=0; 
		/*A dummy to identify people that just entered a common-law union*/
if partner_id^=0 & marital_status=1 & lag_partner_id^=partner_id & lag_marital_status^=1 & lag_marital_status^=2 then new_couple="1"; 
if partner_id=0 | marital_status^=1 | lag_partner_id=partner_id | lag_marital_status=1 | lag_marital_status=2 then new_couple="0"; 
run; 
/*First, we determine which single (or out of a relationship) people enter a common-law union. We start with a yearly step, although 
		we adopt a quarterly one in our simulations. As shown in Appendix O of this thesis, it is this step that has the strongest 
		explanatory power. For the sake of the robustness of our analysis, we still compute these marital status behavioural equations 
		with a yearly step.*/
options nofmterr; 

data train valid;
set leo.eph_past_year_state;
/*We only select people that were not in a couple or married last year and are not currently married. This way we study all people that 
		could have entered a common-law union in a given year.*/
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2)& lag_part_lms=-1 & marital_status^=2 & (ch04=1&(90>ageconti & ageconti>15))/*& formation_difference^="999"*/;
call streaminit(17101945);/*A negative number makes the seed change at each run.*/
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;
data train; 
set train; 

/*Belonging to a given labour-market state, and within that state to a specific sectorial labour income quartile, is an important 
		explanatory variable for entering a common-law union, and for selecting the partner.*/
if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 


data valid; 
set valid; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 

data train_women valid_women;
set leo.eph_past_year_state;
/*We only select people that were not in a couple or married last year and are not currently married. This way we study all people that 
		could have entered a common-law union in a given year.*/
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2)& lag_part_lms=-1 & marital_status^=2 & (ch04=2&(90>ageconti & ageconti>15))/*& formation_difference^="999"*/;
call streaminit(17101945);/*A negative number makes the seed change at each run.*/
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;
data train_women; 
set train_women; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 


data valid_women; 
set valid_women; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 

/*We estimate these regressions separately by gender, as it is to be expected explanatory variables for entering a new couple differ 
		from one gender to the other.*/
/********** Uncomment if you want to export the details of the 5-fold stepwise logistic regression to a pdf file. If so, also uncomment
		ods pdf close;
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_matching_mmkt_h.pdf"; 

ods trace on; */
title "Entering a common-law union, men, yearly step"; 
proc logistic data=train;
 weight pondera /norm; 
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2) & marital_status^=2 & (ch04=1&(90>lag_age & lag_age>15));
class 
lag_has_children (param=ref ref="0")
/*lag_labour_market_state (param=ref ref="1")
lag_sect_quartile (param=ref ref="2") */

/*inwork_partner (param=ref ref="1")*/
/*age_quinquennal(param=ref ref="[20;25[")*/
/*age_diff_char (param=ref ref="[-1;1]")*/
/*formation_difference (param=ref ref="1")*/
lag_for (param=ref ref="2")
lag_marital_status (param=ref ref="5")


lag_sec_qua_1_lms_1 (param=ref ref="1")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="0")
lag_sec_qua_0_lms_2 (param=ref ref="0")
lag_sec_qua_2_lms_2 (param=ref ref="0")
lag_sec_qua_3_lms_2 (param=ref ref="0")
lag_sec_qua_4_lms_2 (param=ref ref="0")
lag_sec_qua_1_lms_3 (param=ref ref="0")
lag_sec_qua_0_lms_3 (param=ref ref="0")
lag_sec_qua_2_lms_3 (param=ref ref="0")
lag_sec_qua_3_lms_3 (param=ref ref="0")
lag_sec_qua_4_lms_3 (param=ref ref="0")
lag_sec_qua_1_lms_4 (param=ref ref="0")
lag_sec_qua_0_lms_4 (param=ref ref="0")
lag_sec_qua_2_lms_4 (param=ref ref="0")
lag_sec_qua_3_lms_4 (param=ref ref="0")
lag_sec_qua_4_lms_4 (param=ref ref="0")
lag_sec_qua_1_lms_5 (param=ref ref="0")
lag_sec_qua_0_lms_5 (param=ref ref="0")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")


;/*formation_c*/
model new_couple(ref="0")=lag_age lag_age*lag_age lag_has_children /*lag_sect_quartile*/ lag_for /*lag_inwork age_quinquennal*/ lag_marital_status /*lag_labour_market_state*/ 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; 
/*ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="coupling_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="coupling_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_men"; if last then delete; run;
data leo.auc_train_logit_new_couple_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_new_couple_men; 
set auc2; 
run;
data leo.par_est_new_couple_men; 
set _pe; 
run;
/*These datasets have all the relevant variables for our model. */
/*Normally you would hard-code the estimated parameters for determining who enters a common-law union, only we preferred to keep the 
		quarterly step. These, together with the AUC statistics for the training and validation datasets, are used to build Table O.4. 
		The parameters estimated here are slightly different than the ones written in Appendix O for a yet unspecified reason. The 
		parameters estimated in this commented code should however be preferred for further versions of the model.*/
proc print data=leo.par_est_new_couple_men; run; 
proc print data=leo.auc_valid_logit_new_couple_men; run; 
proc print data=leo.auc_train_logit_new_couple_men; run; 

proc export data=leo.par_est_new_couple_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_new_couple_men.csv' 
dbms=csv replace; 
run; 

/*We make the same analysis at the yearly step for women only*/
/* Uncomment if you want to export the details of the logistic regression in a pdf file. Also uncomment the ods pdf close; further down.
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_matching_mmkt_f.pdf"; 
title " Mise en couple, women"; 
ods trace on; */
title "Entering a common-law union, women, yearly step"; 
proc logistic data=train_women;
 weight pondera /norm; 
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2) & marital_status^=2 & (ch04=2&(90>lag_age & lag_age>15))/*& formation_difference^="999"*/;
class 
lag_has_children (param=ref ref="0")
/*lag_labour_market_state (param=ref ref="1")
lag_sect_quartile (param=ref ref="2") */

/*inwork_partner (param=ref ref="1")*/
/*age_quinquennal(param=ref ref="[20;25[")*/
/*age_diff_char (param=ref ref="[-1;1]")*/
/*formation_difference (param=ref ref="1")*/
lag_for (param=ref ref="2")
lag_marital_status (param=ref ref="5")


lag_sec_qua_1_lms_1 (param=ref ref="1")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="0")
lag_sec_qua_0_lms_2 (param=ref ref="0")
lag_sec_qua_2_lms_2 (param=ref ref="0")
lag_sec_qua_3_lms_2 (param=ref ref="0")
lag_sec_qua_4_lms_2 (param=ref ref="0")
lag_sec_qua_1_lms_3 (param=ref ref="0")
lag_sec_qua_0_lms_3 (param=ref ref="0")
lag_sec_qua_2_lms_3 (param=ref ref="0")
lag_sec_qua_3_lms_3 (param=ref ref="0")
lag_sec_qua_4_lms_3 (param=ref ref="0")
lag_sec_qua_1_lms_4 (param=ref ref="0")
lag_sec_qua_0_lms_4 (param=ref ref="0")
lag_sec_qua_2_lms_4 (param=ref ref="0")
lag_sec_qua_3_lms_4 (param=ref ref="0")
lag_sec_qua_4_lms_4 (param=ref ref="0")
lag_sec_qua_1_lms_5 (param=ref ref="0")
lag_sec_qua_0_lms_5 (param=ref ref="0")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")


;/*formation_c*/
model new_couple(ref="0")=lag_age lag_age*lag_age lag_has_children /*lag_sect_quartile*/ lag_for /*lag_inwork age_quinquennal*/ lag_marital_status /*lag_labour_market_state*/ 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="coupling_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="coupling_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_wom"; if last then delete; run;
data leo.auc_train_logit_new_couple_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_new_couple_wom; 
set auc2; 
run;
data leo.par_est_new_couple_wom; 
set _pe; 
run;
proc print data=leo.par_est_new_couple_wom; run; 
proc print data=leo.auc_valid_logit_new_couple_wom; run; 
proc print data=leo.auc_train_logit_new_couple_wom; run; 

proc export data=leo.par_est_new_couple_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_new_couple_wom.csv' 
dbms=csv replace; 
run; 

/*We now estimate the above regressions with a quarterly step. The parameters estimated from these regressions are the one we actually 
		hard code in our prospective microsimulation model, in the score_couple instruction. They also take part in the building of Table 
		O.4 of Appendix O.*/

options nofmterr;
data leo.eph_past_state; 
set leo.eph_past_state; 
if 15<ageconti<20 then agegroup=16; 
		if 19<ageconti<25 then agegroup=20; 
		if 24<ageconti<30 then agegroup=25; 
		if 29<ageconti<35 then agegroup=30; 
		if 34<ageconti<40 then agegroup=35; 
		if 39<ageconti<45 then agegroup=40;
		if 44<ageconti<50 then agegroup=45; 
		if 49<ageconti<55 then agegroup=50;  
		if 54<ageconti<60 then agegroup=55; 
		if 59<ageconti<65 then agegroup=60;
		if 64<ageconti<70 then agegroup=65;
		if 16>ageconti then agegroup=1; 
		if ageconti>69 then agegroup=300;  
	/*We make sure all unpaid workers or those with null reported income are in the informal sector, which is actually the case of 84% 
			of unpaid workers*/
		if itl=0 & estado=1 then labour_Market_state=3; 
		if labour_market_state=4 | labour_market_state=5 then sect_quartile=0; 
	/*We put people with unreported marital status as single*/
		if marital_status=0 then marital_status=5; 
		if lag_marital_status=9 then lag_marital_status=5; 
		if lag_und_child>=1 then lag_has_children=1; 
		if lag_und_child=0 then lag_has_children=0; 
		/*A dummy to identify people that just entered a common-law union*/
if partner_id^=0 & marital_status=1 & lag_partner_id^=partner_id & lag_marital_status^=1 & lag_marital_status^=2 then new_couple="1"; 
if partner_id=0 | marital_status^=1 | lag_partner_id=partner_id | lag_marital_status=1 | lag_marital_status=2 then new_couple="0"; 
run; 
options nofmterr; 
data train valid;
set leo.eph_past_state;
/*We only select people that were not in a couple or married last year and are not currently married. This way we study all people that 
		could have entered a common-law union in a given year.*/
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2)& lag_part_lms=-1 & marital_status^=2 & (ch04=1&(90>ageconti & ageconti>15))/*& formation_difference^="999"*/;
call streaminit(17101945);/*A negative number makes the seed change at each run.*/
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;
data train; 
set train; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 


data valid; 
set valid; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 

data train_women valid_women;
set leo.eph_past_state;
/*We only select people that were not in a couple or married last year and are not currently married. This way we study all people that 
		could have entered a common-law union in a given year.*/
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2)& lag_part_lms=-1 & marital_status^=2 & (ch04=2&(90>ageconti & ageconti>15))/*& formation_difference^="999"*/;
call streaminit(17101945);/*A negative number makes the seed change at each run.*/
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;
data train_women; 
set train_women; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 


data valid_women; 
set valid_women; 


if lag_labour_market_state^=4 & lag_labour_market_state^=5 then do;  
if lag_sect_quartile=0 then lag_sect_quartile=1; 
end; 
if lag_sect_quartile=0 & lag_labour_market_state=1 then lag_sec_qua_0_lms_1=1; if lag_sect_quartile^=0 | lag_labour_market_state^=1 then lag_sec_qua_0_lms_1=0; 
if lag_sect_quartile=1 & lag_labour_market_state=1 then lag_sec_qua_1_lms_1=1; if lag_sect_quartile^=1 | lag_labour_market_state^=1 then lag_sec_qua_1_lms_1=0; 
if lag_sect_quartile=2 & lag_labour_market_state=1 then lag_sec_qua_2_lms_1=1; if lag_sect_quartile^=2 | lag_labour_market_state^=1 then lag_sec_qua_2_lms_1=0; 
if lag_sect_quartile=3 & lag_labour_market_state=1 then lag_sec_qua_3_lms_1=1; if lag_sect_quartile^=3 | lag_labour_market_state^=1 then lag_sec_qua_3_lms_1=0; 
if lag_sect_quartile=4 & lag_labour_market_state=1 then lag_sec_qua_4_lms_1=1; if lag_sect_quartile^=4 | lag_labour_market_state^=1 then lag_sec_qua_4_lms_1=0; 

if lag_sect_quartile=0 & lag_labour_market_state=2 then lag_sec_qua_0_lms_2=1; if lag_sect_quartile^=0 | lag_labour_market_state^=2 then lag_sec_qua_0_lms_2=0; 
if lag_sect_quartile=1 & lag_labour_market_state=2 then lag_sec_qua_1_lms_2=1; if lag_sect_quartile^=1 | lag_labour_market_state^=2 then lag_sec_qua_1_lms_2=0; 
if lag_sect_quartile=2 & lag_labour_market_state=2 then lag_sec_qua_2_lms_2=1; if lag_sect_quartile^=2 | lag_labour_market_state^=2 then lag_sec_qua_2_lms_2=0; 
if lag_sect_quartile=3 & lag_labour_market_state=2 then lag_sec_qua_3_lms_2=1; if lag_sect_quartile^=3 | lag_labour_market_state^=2 then lag_sec_qua_3_lms_2=0; 
if lag_sect_quartile=4 & lag_labour_market_state=2 then lag_sec_qua_4_lms_2=1; if lag_sect_quartile^=4 | lag_labour_market_state^=2 then lag_sec_qua_4_lms_2=0; 

if lag_sect_quartile=0 & lag_labour_market_state=3 then lag_sec_qua_0_lms_3=1; if lag_sect_quartile^=0 | lag_labour_market_state^=3 then lag_sec_qua_0_lms_3=0; 
if lag_sect_quartile=1 & lag_labour_market_state=3 then lag_sec_qua_1_lms_3=1; if lag_sect_quartile^=1 | lag_labour_market_state^=3 then lag_sec_qua_1_lms_3=0; 
if lag_sect_quartile=2 & lag_labour_market_state=3 then lag_sec_qua_2_lms_3=1; if lag_sect_quartile^=2 | lag_labour_market_state^=3 then lag_sec_qua_2_lms_3=0; 
if lag_sect_quartile=3 & lag_labour_market_state=3 then lag_sec_qua_3_lms_3=1; if lag_sect_quartile^=3 | lag_labour_market_state^=3 then lag_sec_qua_3_lms_3=0; 
if lag_sect_quartile=4 & lag_labour_market_state=3 then lag_sec_qua_4_lms_3=1; if lag_sect_quartile^=4 | lag_labour_market_state^=3 then lag_sec_qua_4_lms_3=0; 

if lag_sect_quartile=0 & lag_labour_market_state=4 then lag_sec_qua_0_lms_4=1; if lag_sect_quartile^=0 | lag_labour_market_state^=4 then lag_sec_qua_0_lms_4=0; 
if lag_sect_quartile=1 & lag_labour_market_state=4 then lag_sec_qua_1_lms_4=1; if lag_sect_quartile^=1 | lag_labour_market_state^=4 then lag_sec_qua_1_lms_4=0; 
if lag_sect_quartile=2 & lag_labour_market_state=4 then lag_sec_qua_2_lms_4=1; if lag_sect_quartile^=2 | lag_labour_market_state^=4 then lag_sec_qua_2_lms_4=0; 
if lag_sect_quartile=3 & lag_labour_market_state=4 then lag_sec_qua_3_lms_4=1; if lag_sect_quartile^=3 | lag_labour_market_state^=4 then lag_sec_qua_3_lms_4=0; 
if lag_sect_quartile=4 & lag_labour_market_state=4 then lag_sec_qua_4_lms_4=1; if lag_sect_quartile^=4 | lag_labour_market_state^=4 then lag_sec_qua_4_lms_4=0; 

if lag_sect_quartile=0 & lag_labour_market_state=5 then lag_sec_qua_0_lms_5=1; if lag_sect_quartile^=0 | lag_labour_market_state^=5 then lag_sec_qua_0_lms_5=0; 
if lag_sect_quartile=1 & lag_labour_market_state=5 then lag_sec_qua_1_lms_5=1; if lag_sect_quartile^=1 | lag_labour_market_state^=5 then lag_sec_qua_1_lms_5=0; 
if lag_sect_quartile=2 & lag_labour_market_state=5 then lag_sec_qua_2_lms_5=1; if lag_sect_quartile^=2 | lag_labour_market_state^=5 then lag_sec_qua_2_lms_5=0; 
if lag_sect_quartile=3 & lag_labour_market_state=5 then lag_sec_qua_3_lms_5=1; if lag_sect_quartile^=3 | lag_labour_market_state^=5 then lag_sec_qua_3_lms_5=0; 
if lag_sect_quartile=4 & lag_labour_market_state=5 then lag_sec_qua_4_lms_5=1; if lag_sect_quartile^=4 | lag_labour_market_state^=5 then lag_sec_qua_4_lms_5=0; 
run; 

/********** Uncomment if you want to export the details of the 5-fold stepwise logistic regression to a pdf file. If so, also uncomment 
		ods pdf close; 
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_matching_mmkt_men_qua.pdf"; 
ods trace on; */
title "Entering a common-law union, men, quarterly step"; 
proc logistic data=train;
 weight pondera /norm; 
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2) & marital_status^=2 & (ch04=1&(90>lag_age & lag_age>15))/*& formation_difference^="999"*/;
class 
lag_has_children (param=ref ref="0")
/*lag_labour_market_state (param=ref ref="1")
lag_sect_quartile (param=ref ref="2") */

/*inwork_partner (param=ref ref="1")*/
/*age_quinquennal(param=ref ref="[20;25[")*/
/*age_diff_char (param=ref ref="[-1;1]")*/
/*formation_difference (param=ref ref="1")*/
lag_for (param=ref ref="2")
lag_marital_status (param=ref ref="5")


lag_sec_qua_1_lms_1 (param=ref ref="1")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="0")
lag_sec_qua_0_lms_2 (param=ref ref="0")
lag_sec_qua_2_lms_2 (param=ref ref="0")
lag_sec_qua_3_lms_2 (param=ref ref="0")
lag_sec_qua_4_lms_2 (param=ref ref="0")
lag_sec_qua_1_lms_3 (param=ref ref="0")
lag_sec_qua_0_lms_3 (param=ref ref="0")
lag_sec_qua_2_lms_3 (param=ref ref="0")
lag_sec_qua_3_lms_3 (param=ref ref="0")
lag_sec_qua_4_lms_3 (param=ref ref="0")
lag_sec_qua_1_lms_4 (param=ref ref="0")
lag_sec_qua_0_lms_4 (param=ref ref="0")
lag_sec_qua_2_lms_4 (param=ref ref="0")
lag_sec_qua_3_lms_4 (param=ref ref="0")
lag_sec_qua_4_lms_4 (param=ref ref="0")
lag_sec_qua_1_lms_5 (param=ref ref="0")
lag_sec_qua_0_lms_5 (param=ref ref="0")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")


;/*formation_c*/
model new_couple(ref="0")=lag_age lag_age*lag_age lag_has_children /*lag_sect_quartile*/ lag_for /*lag_inwork age_quinquennal*/ lag_marital_status /*lag_labour_market_state*/ 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="coupling_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="coupling_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_men"; if last then delete; run;
data leo.auc_train_log_new_couple_qua_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_log_new_couple_qua_men; 
set auc2; 
run;
data leo.par_est_new_couple_qua_men; 
set _pe; 
run;
proc print data=leo.par_est_new_couple_qua_men; run; 
proc print data=leo.auc_valid_log_new_couple_qua_men; run; 
proc print data=leo.auc_train_log_new_couple_qua_men; run; 

proc export data=leo.par_est_new_couple_qua_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_new_couple_qua_men.csv' 
dbms=csv replace; 
run; 
proc print data=leo.par_est_new_couple_qua_men; run; 


/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_matching_mmkt_wom_qua.pdf"; 
ods trace on;*/
title "Entering a common-law union, women, quarterly step"; 

proc logistic data=train_women;
 weight pondera /norm; 
where /*(partner_lab_mar_state ^=-1) & */(lag_marital_status^=1 & lag_marital_status ^=2) & marital_status^=2 & (ch04=2&(90>lag_age & lag_age>15))/*& formation_difference^="999"*/;
class 
lag_has_children (param=ref ref="0")
/*lag_labour_market_state (param=ref ref="1")
lag_sect_quartile (param=ref ref="2") */

/*inwork_partner (param=ref ref="1")*/
/*age_quinquennal(param=ref ref="[20;25[")*/
/*age_diff_char (param=ref ref="[-1;1]")*/
/*formation_difference (param=ref ref="1")*/
lag_for (param=ref ref="2")
lag_marital_status (param=ref ref="5")


lag_sec_qua_1_lms_1 (param=ref ref="1")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="0")
lag_sec_qua_0_lms_2 (param=ref ref="0")
lag_sec_qua_2_lms_2 (param=ref ref="0")
lag_sec_qua_3_lms_2 (param=ref ref="0")
lag_sec_qua_4_lms_2 (param=ref ref="0")
lag_sec_qua_1_lms_3 (param=ref ref="0")
lag_sec_qua_0_lms_3 (param=ref ref="0")
lag_sec_qua_2_lms_3 (param=ref ref="0")
lag_sec_qua_3_lms_3 (param=ref ref="0")
lag_sec_qua_4_lms_3 (param=ref ref="0")
lag_sec_qua_1_lms_4 (param=ref ref="0")
lag_sec_qua_0_lms_4 (param=ref ref="0")
lag_sec_qua_2_lms_4 (param=ref ref="0")
lag_sec_qua_3_lms_4 (param=ref ref="0")
lag_sec_qua_4_lms_4 (param=ref ref="0")
lag_sec_qua_1_lms_5 (param=ref ref="0")
lag_sec_qua_0_lms_5 (param=ref ref="0")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")


;/*formation_c*/
model new_couple(ref="0")=lag_age lag_age*lag_age lag_has_children /*lag_sect_quartile*/ lag_for /*lag_inwork age_quinquennal*/ lag_marital_status /*lag_labour_market_state*/ 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="coupling_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="coupling_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_wom"; if last then delete; run;
data leo.auc_train_log_new_couple_qua_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_log_new_couple_qua_wom; 
set auc2; 
run;
data leo.par_est_new_couple_qua_wom; 
set _pe; 
run;
proc print data=leo.par_est_new_couple_qua_wom; run; 
proc print data=leo.auc_valid_log_new_couple_qua_wom; run; 
proc print data=leo.auc_train_log_new_couple_qua_wom; run; 

proc export data=leo.par_est_new_couple_qua_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_new_couple_qua_wom.csv' 
dbms=csv replace; 
run; 
dm 'odsresults; clear'; 
dm 'clear log'; 
/*******************************************************************************************/

/*We now follow the method established by Zinn et. al. (2012): "To accurately estimate a retrospective regression model, case and control sampling fractions have to be consisted. 
However, in the present setting such data were not available because it cannot be observed who in reality did not mate. To add information about controls nonetheless, for each
observed couple a synthetic couple was built by randomly assigning to each male spouse a female who was not his observed partner. The response variable was set to one in the case
a couple had been observed. Otherwise, the response variable was set to zero." See details in Appendix O of the thesis.*/
/*We first work with yearly transitions. This is done for the sake of robustness, as we use in the model the matching equations estimated 
		with a quarterly step. These however make up part of Table O.5's information.*/
/*First, let us identify in our starting dataset men that enter a new common-law union*/
data common_law_men; 
set leo.eph_past_year_state; 
	where new_couple="1" & ch04=1 & (90>ageconti & ageconti>15); 
		partner_id_period=cats(partner_id,ano4,trimestre); 
		treatment=1; 
run; 
 
  /*We then make the fake control base, with randomly made-up unions among people that just entered a common-law union.*/
data control_group_men; 
set common_law_men; 
		treatment=0;
	drop id_period; 
rename partner_id_period=id_period;  
run; 

data add_partner_wage; 
set leo.eph_data_formatted_2003_2015; 
keep person ano4 trimestre sect_quartile itl quarterly_ripte;
run; 



data add_partner_wage; 
set add_partner_wage; 
/*Differences in income are taken into account for the formation of a new couple. To avoid problems with the computation of real income, 
		we take labour income as a percentage of the period's RIPTE wage index.*/
		itl_p_partner=itl/quarterly_ripte; 
rename sect_quartile=sq_partner;  
id_period=cats(person,ano4,trimestre); 
run; 
data add_partner_wage; 
set add_partner_wage; 
	drop person ano4 trimestre itl quarterly_ripte; 
run; 

proc sort data=add_partner_wage; 
	by id_period;
run; 
proc sort data=control_group_men;
	by id_period;
run; 
data control_group_men; 
merge control_group_men add_partner_wage; 
	by id_period; 
		if missing(treatment)
			then delete;
run; 


data control_group_men; 
set control_group_men; 
		rename id_period=partner_id_period;
		itl_p=itl/quarterly_ripte; 
run; 
data control_group_men; 
set control_group_men; 
		id_period=cats(id,ano4,trimestre); 
ruN; 

proc sort data=control_group_men; 
	by id_period; 
run; 
data control_group_men; 
set control_group_men; 
	by id_period; 
	dummy_id_period+1; 
run; 
data control_group_men; 
set control_group_men; 
dummy_id=dummy_id_period-1; 
run; 
data control_group_men; 
set control_group_men; 
	drop dummy_id_period; 
		treatment=1; 
run; 
/*We have thus added to the starting dataset information on the partner's wage.*/
data short_control_men; 
set control_group_men; 
keep id_period partner_formation partner_age partner_lab_mar_state itl_p_partner;
run; 
/*We add a random variable to start making fake couples. It would be advisable to add a random seed so that we can exactly reproduce the 
		results from one run to the other. This is left for future work.*/
data short_control_men; 
set short_control_men; 
		random=rand("UNIFORM"); 
run; 
proc sort data=short_control_men; 
	by random;
run; 

data short_control_men; 
set short_control_men; 
	by random; 
	dummy_id_period+1; 
run; 
data short_control_men; 
set short_control_men; 
		dummy_id=dummy_id_period-1; 
run; 
data short_control_men; 
set short_control_men; 
	drop dummy_id_2; 
		treatment=0; 
run; 
proc sort data=control_group_men; 
	by id_period; 
run; 
proc sort data=short_control_men; 
	by id_period; 
ruN; 
/*Finally, we assign random partners to men that were measured as entering a common-law union, chosen among women that have also been 
		detected as entering a common-law union.*/
data add_random_couple; 
merge control_group_men short_control_men; 
	by id_period; 
run;
proc sort data=add_random_couple;
	by id_period; 
run; 
proc sort data=control_group_men; 
	by id_period; 
run; 


data matching_data; 
set control_group_men add_random_couple;
run; 
/*We add some variable that summarise the differences between couple members.*/
data matching_data; 
set matching_data; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if age_difference<=-10 then age_diff_char="]-inf;-10]"; 
if -7>=age_difference>=-9 then age_diff_char="[-9;-7]"; 
if -4>=age_difference>=-6 then age_diff_char="[-6;-4]"; 
if -3<=age_difference<=3 then age_diff_char="[-3;3]";
if 6>=age_difference>=4 then age_diff_char="[4;6]"; 
if 9>=age_difference>=7 then age_diff_char="[7;9]"; 
if age_difference>=10 then age_diff_char="[10;inf["; 


if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Both"; 
if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="Me"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Partner"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="None"; 


income_scale_diff= itl_p-itl_p_partner; 

run; 

data train valid;
set matching_data; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=1&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
call streaminit(17101945) ;
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;
proc freq data=train (obs=30); 
table income_scale_diff;
run; 
/*ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\matching_mmkt_men.pdf"; */
title "Determinants of couple composition, men"; 
proc logistic data=train;
 weight pondera /norm; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=1&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
class 
age_diff_char (param=ref ref="[-3;3]")
formation_difference (param=ref ref="0")
couple_work (param=ref ref="Both")
;
model treatment(ref="0")= couple_work income_scale_diff income_scale_diff*income_scale_diff age_diff_char formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close;*/ 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="char_couple_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="char_couple_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_men"; if last then delete; run;
data leo.auc_train_logit_match; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_match; 
set auc2; 
run;
data leo.par_est_matching; 
set _pe; 
run;
proc print data=leo.par_est_matching; run; 
proc print data=leo.auc_valid_logit_match; run; 
proc print data=leo.auc_train_logit_match; run; 

proc export data=leo.par_est_matching
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_matching.csv' 
dbms=csv replace; 
run; 

proc freq data=train; 
table ch04; run; 
proc freq data=valid; 
table ch04; run; 

/*The estimated parameters end up in Table O.5 of Appendix O. The parameters are not exactly the same partly because of the lack of a random
		seed for the formation of the fake couples (the synthetic control group).*/


/*For the sake of robustness, we also estimate a similar matching equation on women only. Only the one for men, and on a quarterly pace, 
		is hard-coded in our microsimulation model.*/
data common_law_women; 
set leo.eph_past_year_state; 
	where new_couple="1" & ch04=2 & (90>ageconti & ageconti>15); 
		partner_id_period=cats(partner_id,ano4,trimestre); 
		treatment=1; 
run; 

data control_group_women; 
set common_law_women; 
treatment=0;
drop id_period; 
rename partner_id_period=id_period;  
drop partner_formation partner_age und_child_part partner_lab_mar_state;
run;  
/*We then make the fake control base, with randomly made-up unions among people that just entered a common-law union.*/
data control_group_women; 
set common_law_women; 
		treatment=0;
	drop id_period; 
rename partner_id_period=id_period;  
run; 

data add_partner_wage; 
set leo.eph_data_formatted_2003_2015; 
keep person ano4 trimestre sect_quartile itl quarterly_ripte;
run; 



data add_partner_wage; 
set add_partner_wage; 
/*Differences in income are taken into account for the formation of a new couple. To avoid problems with the computation of real income, 
		we take labour income as a percentage of the period's RIPTE wage index.*/
		itl_p_partner=itl/quarterly_ripte; 
rename sect_quartile=sq_partner;  
id_period=cats(person,ano4,trimestre); 
run; 
data add_partner_wage; 
set add_partner_wage; 
	drop person ano4 trimestre itl quarterly_ripte; 
run; 

proc sort data=add_partner_wage; 
	by id_period;
run; 
proc sort data=control_group_women;
	by id_period;
run; 
data control_group_women; 
merge control_group_women add_partner_wage; 
	by id_period; 
		if missing(treatment)
			then delete;
run; 


data control_group_women; 
set control_group_women; 
		rename id_period=partner_id_period;
		itl_p=itl/quarterly_ripte; 
run; 
data control_group_women; 
set control_group_women; 
		id_period=cats(id,ano4,trimestre); 
ruN; 

proc sort data=control_group_women; 
	by id_period; 
run; 
data control_group_women; 
set control_group_women; 
	by id_period; 
	dummy_id_period+1; 
run; 
data control_group_women; 
set control_group_women; 
dummy_id=dummy_id_period-1; 
run; 
data control_group_women; 
set control_group_women; 
	drop dummy_id_period; 
		treatment=1; 
run; 
/*We have thus added to the starting dataset information on the partner's wage.*/
data short_control_women; 
set control_group_women; 
keep id_period partner_formation partner_age partner_lab_mar_state itl_p_partner;
run; 
/*We add a random variable to start making fake couples. It would be advisable to add a random seed so that we can exactly reproduce the 
		results from one run to the other. This is left for future work.*/
data short_control_women; 
set short_control_women; 
		random=rand("UNIFORM"); 
run; 
proc sort data=short_control_women; 
	by random;
run; 

data short_control_women; 
set short_control_women; 
	by random; 
	dummy_id_period+1; 
run; 
data short_control_women; 
set short_control_women; 
		dummy_id=dummy_id_period-1; 
run; 
data short_control_women; 
set short_control_women; 
	drop dummy_id_2; 
		treatment=0; 
run; 
proc sort data=control_group_women; 
	by id_period; 
run; 
proc sort data=short_control_women; 
	by id_period; 
ruN; 
/*Finally, we assign random partners to women that were measured as entering a common-law union, chosen among wowomen that have also been 
		detected as entering a common-law union.*/
data add_random_couple; 
merge control_group_women short_control_women; 
	by id_period; 
run;
proc sort data=add_random_couple;
	by id_period; 
run; 
proc sort data=control_group_women; 
	by id_period; 
run; 


data matching_data; 
set control_group_women add_random_couple;
run; 
/*We add some variable that summarise the differences between couple members.*/
data matching_data; 
set matching_data; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if age_difference<=-10 then age_diff_char="]-inf;-10]"; 
if -7>=age_difference>=-9 then age_diff_char="[-9;-7]"; 
if -4>=age_difference>=-6 then age_diff_char="[-6;-4]"; 
if -3<=age_difference<=3 then age_diff_char="[-3;3]";
if 6>=age_difference>=4 then age_diff_char="[4;6]"; 
if 9>=age_difference>=7 then age_diff_char="[7;9]"; 
if age_difference>=10 then age_diff_char="[10;inf["; 


if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Both"; 
if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="Me"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Partner"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="None"; 


income_scale_diff= itl_p-itl_p_partner; 

run; 
data train_women valid_women;
set matching_data; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=2&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
call streaminit(17101945) ;
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train_women;
else output valid_women;
drop x;
run;
/*Uncomment if you want the pdf of the regression.
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\matching_mmkt_women.pdf"; */
title "Determinants of couple composition, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=2&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
class 
age_diff_char (param=ref ref="[-3;3]")
formation_difference (param=ref ref="0")
couple_work (param=ref ref="Both")
;
model treatment(ref="0")= couple_work income_scale_diff income_scale_diff*income_scale_diff age_diff_char formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; /*
ods output close; 
ods trace off; */
ods pdf close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="char_couple_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="char_couple_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_women"; if last then delete; run;
data leo.auc_train_match_year_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_match_year_wom; 
set auc2; 
run;
data leo.par_est_match_year_wom; 
set _pe; 
run;
proc print data=leo.par_est_match_year_wom; run; 
proc print data=leo.auc_valid_match_year_wom; run; 
proc print data=leo.auc_train_match_year_wom; run; 

proc export data=leo.par_est_match_year_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_match_year_wom.csv' 
dbms=csv replace; 
run; 

proc freq data=train_women; 
table ch04; run; 
proc freq data=valid_women; 
table ch04; run;
/**************************************Finally, we do the same matching regressions but with a quarterly step. It is the quarterly step
		when computed among men that is hard-coded in the model.***********************************************************************/

data common_law_men; 
set leo.eph_past_state; 
	where new_couple="1" & ch04=1 & (90>ageconti & ageconti>15); 
		partner_id_period=cats(partner_id,ano4,trimestre); 
		treatment=1; 
run; 
 
  /*We then make the fake control base, with randomly made-up unions among people that just entered a common-law union.*/
data control_group_men; 
set common_law_men; 
		treatment=0;
	drop id_period; 
rename partner_id_period=id_period;  
run; 

data add_partner_wage; 
set leo.eph_data_formatted_2003_2015; 
keep person ano4 trimestre sect_quartile itl quarterly_ripte;
run; 



data add_partner_wage; 
set add_partner_wage; 
/*Differences in income are taken into account for the formation of a new couple. To avoid problems with the computation of real income, 
		we take labour income as a percentage of the period's RIPTE wage index.*/
		itl_p_partner=itl/quarterly_ripte; 
rename sect_quartile=sq_partner;  
id_period=cats(person,ano4,trimestre); 
run; 
data add_partner_wage; 
set add_partner_wage; 
	drop person ano4 trimestre itl quarterly_ripte; 
run; 

proc sort data=add_partner_wage; 
	by id_period;
run; 
proc sort data=control_group_men;
	by id_period;
run; 
data control_group_men; 
merge control_group_men add_partner_wage; 
	by id_period; 
		if missing(treatment)
			then delete;
run; 


data control_group_men; 
set control_group_men; 
		rename id_period=partner_id_period;
		itl_p=itl/quarterly_ripte; 
run; 
data control_group_men; 
set control_group_men; 
		id_period=cats(id,ano4,trimestre); 
ruN; 

proc sort data=control_group_men; 
	by id_period; 
run; 
data control_group_men; 
set control_group_men; 
	by id_period; 
	dummy_id_period+1; 
run; 
data control_group_men; 
set control_group_men; 
dummy_id=dummy_id_period-1; 
run; 
data control_group_men; 
set control_group_men; 
	drop dummy_id_period; 
		treatment=1; 
run; 
/*We have thus added to the starting dataset information on the partner's wage.*/
data short_control_men; 
set control_group_men; 
keep id_period partner_formation partner_age partner_lab_mar_state itl_p_partner;
run; 
/*We add a random variable to start making fake couples. It would be advisable to add a random seed so that we can exactly reproduce the 
		results from one run to the other. This is left for future work.*/
data short_control_men; 
set short_control_men; 
		random=rand("UNIFORM"); 
run; 
proc sort data=short_control_men; 
	by random;
run; 

data short_control_men; 
set short_control_men; 
	by random; 
	dummy_id_period+1; 
run; 
data short_control_men; 
set short_control_men; 
		dummy_id=dummy_id_period-1; 
run; 
data short_control_men; 
set short_control_men; 
	drop dummy_id_2; 
		treatment=0; 
run; 
proc sort data=control_group_men; 
	by id_period; 
run; 
proc sort data=short_control_men; 
	by id_period; 
ruN; 
/*Finally, we assign random partners to men that were measured as entering a common-law union, chosen among women that have also been 
		detected as entering a common-law union.*/
data add_random_couple; 
merge control_group_men short_control_men; 
	by id_period; 
run;
proc sort data=add_random_couple;
	by id_period; 
run; 
proc sort data=control_group_men; 
	by id_period; 
run; 


data matching_data; 
set control_group_men add_random_couple;
run; 
/*We add some variable that summarise the differences between couple members.*/
data matching_data; 
set matching_data; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if age_difference<=-10 then age_diff_char="]-inf;-10]"; 
if -7>=age_difference>=-9 then age_diff_char="[-9;-7]"; 
if -4>=age_difference>=-6 then age_diff_char="[-6;-4]"; 
if -3<=age_difference<=3 then age_diff_char="[-3;3]";
if 6>=age_difference>=4 then age_diff_char="[4;6]"; 
if 9>=age_difference>=7 then age_diff_char="[7;9]"; 
if age_difference>=10 then age_diff_char="[10;inf["; 


if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Both"; 
if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="Me"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Partner"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="None"; 


income_scale_diff= itl_p-itl_p_partner; 

run; 

data train valid;
set matching_data; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=1&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
call streaminit(17101945) ;
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;

/*****************************This is the regression that is hard-coded in the prospective microsimulation module, the partner_id instruction
		under the marriage procedure.***************/
/*ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\matching_mmkt_men.pdf"; */
title "Determinants of couple composition, men"; 
proc logistic data=train;
 weight pondera /norm; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=1&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
class 
age_diff_char (param=ref ref="[-3;3]")
formation_difference (param=ref ref="0")
couple_work (param=ref ref="Both")
;
model treatment(ref="0")= couple_work income_scale_diff income_scale_diff*income_scale_diff age_diff_char formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close;/* 
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="char_couple_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="char_couple_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_men"; if last then delete; run;
data leo.auc_train_quarter_match; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_quarter_match; 
set auc2; 
run;
data leo.par_est_quarter_match; 
set _pe; 
run;
proc print data=leo.par_est_quarter_match; run; 
proc print data=leo.auc_valid_quarter_match; run; 
proc print data=leo.auc_train_quarter_match; run; 

proc export data=leo.par_est_quarter_match
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_quarter_match.csv' 
dbms=csv replace; 
run; 

proc freq data=train; 
table ch04; run; 
proc freq data=valid; 
table ch04; run; 

/*The estimated parameters end up in Table O.5 of Appendix O. The parameters are not exactly the same partly because of the lack of a random
		seed for the formation of the fake couples (the synthetic control group).*/


/*For the sake of robustness, we also estimate a similar matching equation on women only. Only the one for men, and on a quarterly pace, 
		is hard-coded in our microsimulation model.*/
data common_law_women; 
set leo.eph_past_state; 
	where new_couple="1" & ch04=2 & (90>ageconti & ageconti>15); 
		partner_id_period=cats(partner_id,ano4,trimestre); 
		treatment=1; 
run; 


  /*Ensuite on se prépare à faire la base fausse de contrôle*/
data control_group_women; 
set common_law_women; 
treatment=0;
drop id_period; 
rename partner_id_period=id_period;  
drop partner_formation partner_age und_child_part partner_lab_mar_state;
run;  /*We then make the fake control base, with randomly made-up unions among people that just entered a common-law union.*/
data control_group_women; 
set common_law_women; 
		treatment=0;
	drop id_period; 
rename partner_id_period=id_period;  
run; 

data add_partner_wage; 
set leo.eph_data_formatted_2003_2015; 
keep person ano4 trimestre sect_quartile itl quarterly_ripte;
run; 



data add_partner_wage; 
set add_partner_wage; 
/*Differences in income are taken into account for the formation of a new couple. To avoid problems with the computation of real income, 
		we take labour income as a percentage of the period's RIPTE wage index.*/
		itl_p_partner=itl/quarterly_ripte; 
rename sect_quartile=sq_partner;  
id_period=cats(person,ano4,trimestre); 
run; 
data add_partner_wage; 
set add_partner_wage; 
	drop person ano4 trimestre itl quarterly_ripte; 
run; 

proc sort data=add_partner_wage; 
	by id_period;
run; 
proc sort data=control_group_women;
	by id_period;
run; 
data control_group_women; 
merge control_group_women add_partner_wage; 
	by id_period; 
		if missing(treatment)
			then delete;
run; 


data control_group_women; 
set control_group_women; 
		rename id_period=partner_id_period;
		itl_p=itl/quarterly_ripte; 
run; 
data control_group_women; 
set control_group_women; 
		id_period=cats(id,ano4,trimestre); 
ruN; 

proc sort data=control_group_women; 
	by id_period; 
run; 
data control_group_women; 
set control_group_women; 
	by id_period; 
	dummy_id_period+1; 
run; 
data control_group_women; 
set control_group_women; 
dummy_id=dummy_id_period-1; 
run; 
data control_group_women; 
set control_group_women; 
	drop dummy_id_period; 
		treatment=1; 
run; 
/*We have thus added to the starting dataset information on the partner's wage.*/
data short_control_women; 
set control_group_women; 
keep id_period partner_formation partner_age partner_lab_mar_state itl_p_partner;
run; 
/*We add a random variable to start making fake couples. It would be advisable to add a random seed so that we can exactly reproduce the 
		results from one run to the other. This is left for future work.*/
data short_control_women; 
set short_control_women; 
		random=rand("UNIFORM"); 
run; 
proc sort data=short_control_women; 
	by random;
run; 

data short_control_women; 
set short_control_women; 
	by random; 
	dummy_id_period+1; 
run; 
data short_control_women; 
set short_control_women; 
		dummy_id=dummy_id_period-1; 
run; 
data short_control_women; 
set short_control_women; 
	drop dummy_id_2; 
		treatment=0; 
run; 
proc sort data=control_group_women; 
	by id_period; 
run; 
proc sort data=short_control_women; 
	by id_period; 
ruN; 
/*Finally, we assign random partners to women that were measured as entering a common-law union, chosen among wowomen that have also been 
		detected as entering a common-law union.*/
data add_random_couple; 
merge control_group_women short_control_women; 
	by id_period; 
run;
proc sort data=add_random_couple;
	by id_period; 
run; 
proc sort data=control_group_women; 
	by id_period; 
run; 

data matching_data; 
set control_group_women add_random_couple;
run; 
/*We add some variable that summarise the differences between couple members.*/
data matching_data; 
set matching_data; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if age_difference<=-10 then age_diff_char="]-inf;-10]"; 
if -7>=age_difference>=-9 then age_diff_char="[-9;-7]"; 
if -4>=age_difference>=-6 then age_diff_char="[-6;-4]"; 
if -3<=age_difference<=3 then age_diff_char="[-3;3]";
if 6>=age_difference>=4 then age_diff_char="[4;6]"; 
if 9>=age_difference>=7 then age_diff_char="[7;9]"; 
if age_difference>=10 then age_diff_char="[10;inf["; 


if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Both"; 
if (labour_market_state=1 | labour_market_state=2 | labour_market_state=3) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="Me"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=1|partner_lab_mar_state=2|partner_lab_mar_state=3) then couple_work="Partner"; 
if (labour_market_state=4 | labour_market_state=5 ) & (partner_lab_mar_state=4|partner_lab_mar_state=5) then couple_work="None"; 

itl_p=itl/quarterly_ripte;
income_scale_diff= itl_p-itl_p_partner; 

run; 
data train_women valid_women;
set matching_data; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=2&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
call streaminit(17101945) ;
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train_women;
else output valid_women;
drop x;
run;
/*Uncomment if you want the pdf of the regression.
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\matching_mmkt_women.pdf"; */
title "Determinants of couple composition, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where partner_age>13 & (partner_lab_mar_state ^=-1) & (lag_marital_status^=1 & lag_marital_status ^=2) & (ch04=2&(90>ageconti & ageconti>15))& formation_difference^=999 & (partner_id=0 | lag_partner_id=0 | partner_id=lag_partner_id); 
class 
age_diff_char (param=ref ref="[-3;3]")
formation_difference (param=ref ref="0")
couple_work (param=ref ref="Both")
;
model treatment(ref="0")= couple_work income_scale_diff income_scale_diff*income_scale_diff age_diff_char formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; /*
ods output close; 
ods trace off; */
ods pdf close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="char_couple_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="char_couple_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="coupling_women"; if last then delete; run;
data leo.auc_train_match_quar_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_match_quar_wom; 
set auc2; 
run;
data leo.par_est_match_quar_wom; 
set _pe; 
run;
proc print data=leo.par_est_match_quar_wom; run; 
proc print data=leo.auc_valid_match_quar_wom; run; 
proc print data=leo.auc_train_match_quar_wom; run; 

proc export data=leo.par_est_match_quar_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_match_quar_wom.csv' 
dbms=csv replace; 
run; 

proc freq data=train_women; 
table ch04; run; 
proc freq data=valid_women; 
table ch04; run;


/****************************************** Now we estimate marriage equations. These determine which common-law couples marry.
		The ones that are hard-coded in the prospective microsimulation model, under the marry instruction of the 
		marriage procedure, are those estimated among women at the quarterly step. Those estimated for men, and also at the yearly 
		step, are also estimated for the sake of robustness and presented in Table O.2 of Appendix O.***************************/
/*Explanatory variables are all lagged: it is the characteristics of the partners in a common-law union in t-1 that determine whether
		they marry in t*/

options nofmterr; 
data marriage_equation_data; 
set leo.eph_past_year_state; 
	married=0; 
	/*We make sure just married individuals have a known partner the period before they get married, and of course also at the time of 
			the survey*/
		if lag_part_lms^=-1 & lag_marital_status=1 & marital_status=2 & partner_lab_mar_state^=-1 
			then married=1; 
			/*We add the other explanatory variables for the marriage equation.*/
if partner_age=0 then partner_age=-1; 
if lag_part_age=0 then lag_part_age=-1; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if lag_part_age^=-1 then do; 
lag_age_difference=lag_age-lag_part_age; 
lag_formation_difference= lag_for-lag_part_for;
end; 
if lag_part_age=-1 then do; 
lag_age_difference=999; 
lag_formation_difference=999; 
end; 
if lag_und_child=0 then lag_has_children=0; 
if lag_und_child>0 then lag_has_children=1; 

if lag_age_difference<=-10 then lag_age_diff_char="]-inf;-10]"; 
if -7>=lag_age_difference>=-9 then lag_age_diff_char="[-9;-7]"; 
if -4>=lag_age_difference>=-6 then lag_age_diff_char="[-6;-4]"; 
if -3<=lag_age_difference<=3 then lag_age_diff_char="[-3;3]";
if 6>=lag_age_difference>=4 then lag_age_diff_char="[4;6]"; 
if 9>=lag_age_difference>=7 then lag_age_diff_char="[7;9]"; 
if lag_age_difference>=10 then lag_age_diff_char="[10;inf["; 

age2=ageconti*ageconti; 
lag_age2=lag_age*lag_age;
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Both"; 
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="Me"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Partner"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="None"; 

if lag_student="False" & (lag_partner_student=0) then lag_couple_student="None"; 
if lag_student="False" & (lag_partner_student=1) then lag_couple_student="Part"; 
if lag_student="True" & (lag_partner_student=0) then lag_couple_student="Me"; 
if lag_student="True" & (lag_partner_student=1) then lag_couple_student="Both"; 

run; 
data train valid;
set marriage_equation_data; 
where partner_age>13 & lag_marital_status=1 & (ch04=1&(90>=lag_age & lag_age >17)) & lag_partner_id^=0; 
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train;
else output valid;
drop x;
run;

data train_women valid_women;
set marriage_equation_data; 
where partner_age>13 & lag_marital_status=1 & (ch04=2&(90>=lag_age & lag_age >17)) & lag_partner_id^=0; 
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train_women;
else output valid_women;
drop x;
run; 
/* Uncomment if you want to export the regression's details to a pdf file
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\marriage_men.pdf"; */
title "Marriage, men"; 
proc logistic data=train;
 weight pondera /norm; 
where partner_age>13 & lag_marital_status=1 & (ch04=1&(90>=ageconti & ageconti >17)) & lag_partner_id^=0; 
class 
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
lag_has_children (param=ref ref="0")
lag_for (param=ref ref="2")
lag_couple_student (param=ref ref="None")
/*lag_for (param=ref ref="2")*/
/*lag_marital_status (param=ref ref="5")*/
/*sq_partner (param=ref ref="2")
sect_quartile*/ 
;/*formation_c*/
model married(ref="0")= lag_age lag_age*lag_age /*lag_age_quinq*/ lag_couple_student
lag_has_children lag_for lag_couple_work lag_age_diff_char lag_formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="marriage_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="marriage_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="marriage_men"; if last then delete; run;
data leo.auc_train_logit_marriage_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_marriage_men; 
set auc2; 
run;
data leo.par_est_marriage_men; 
set _pe; 
run;
proc print data=leo.par_est_marriage_men; run; 
proc print data=leo.auc_valid_logit_marriage_men; run; 
proc print data=leo.auc_train_logit_marriage_men; run; 

proc export data=leo.par_est_marriage_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_marriage_men.csv' 
dbms=csv replace; 
run; 

/*

ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\marriage_wom.pdf"; */
title "Marriage, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where partner_age>13 & lag_marital_status=1 & (ch04=2&(90>=ageconti & ageconti >17)) & lag_partner_id^=0; 
class 
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
lag_has_children (param=ref ref="0")
lag_for (param=ref ref="2")
lag_couple_student (param=ref ref="None")
;
model married(ref="0")= lag_age lag_age*lag_age lag_couple_student lag_has_children lag_for lag_couple_work lag_age_diff_char lag_formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_women_roc;
ods output close;  
score data=valid_women out=valpred outroc=valid_women_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; 
ods trace off; 
ods pdf close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="marriage_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="marriage_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="marriage_wom"; if last then delete; run;
data leo.auc_train_women_logit_marriage; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_women_logit_marriage; 
set auc2; 
run;
data leo.par_est_marriage_wom; 
set _pe; 
run;
proc print data=leo.par_est_marriage_wom; run; 
proc print data=leo.auc_valid_women_logit_marriage; run; 
proc print data=leo.auc_train_women_logit_marriage; run; 

proc export data=leo.par_est_marriage_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_marriage_wom.csv' 
dbms=csv replace; 
run; 


/*********************Now we estimate Marriage equations on a quarterly step.**************/


/*We start with men.*/

options nofmterr; 
data marriage_equation_data; 
set leo.eph_past_state; 
	married=0; 
	/*We make sure just married individuals have a known partner the period before they get married, and of course also at the time of 
			the survey*/
		if lag_part_lms^=-1 & lag_marital_status=1 & marital_status=2 & partner_lab_mar_state^=-1 
			then married=1; 
			/*We add the other explanatory variables for the marriage equation.*/
if partner_age=0 then partner_age=-1; 
if lag_part_age=0 then lag_part_age=-1; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if lag_part_age^=-1 then do; 
lag_age_difference=lag_age-lag_part_age; 
lag_formation_difference= lag_for-lag_part_for;
end; 
if lag_part_age=-1 then do; 
lag_age_difference=999; 
lag_formation_difference=999; 
end; 
if lag_und_child=0 then lag_has_children=0; 
if lag_und_child>0 then lag_has_children=1; 

if lag_age_difference<=-10 then lag_age_diff_char="]-inf;-10]"; 
if -7>=lag_age_difference>=-9 then lag_age_diff_char="[-9;-7]"; 
if -4>=lag_age_difference>=-6 then lag_age_diff_char="[-6;-4]"; 
if -3<=lag_age_difference<=3 then lag_age_diff_char="[-3;3]";
if 6>=lag_age_difference>=4 then lag_age_diff_char="[4;6]"; 
if 9>=lag_age_difference>=7 then lag_age_diff_char="[7;9]"; 
if lag_age_difference>=10 then lag_age_diff_char="[10;inf["; 

age2=ageconti*ageconti; 
lag_age2=lag_age*lag_age;
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Both"; 
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="Me"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Partner"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="None"; 

if lag_student="False" & (lag_partner_student=0) then lag_couple_student="None"; 
if lag_student="False" & (lag_partner_student=1) then lag_couple_student="Part"; 
if lag_student="True" & (lag_partner_student=0) then lag_couple_student="Me"; 
if lag_student="True" & (lag_partner_student=1) then lag_couple_student="Both"; 

run; 

data train valid;
set marriage_equation_data; 
where partner_age>13 & lag_marital_status=1 & (ch04=1&(90>=lag_age & lag_age >17)) & lag_partner_id^=0; 
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train;
else output valid;
drop x;
run;

data train_women valid_women;
set marriage_equation_data; 
where partner_age>13 & lag_marital_status=1 & (ch04=2&(90>=lag_age & lag_age >17)) & lag_partner_id^=0; 
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train_women;
else output valid_women;
drop x;
run; 
/*Uncomment if you want to export the regressions' details in a pdf file
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\marriage_men_qua.pdf"; */
title "Marriage, men"; 
proc logistic data=train;
 weight pondera /norm; 
where partner_age>13 & lag_marital_status=1 & (ch04=1&(90>=ageconti & ageconti >17)) & lag_partner_id^=0; 
class 
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
lag_has_children (param=ref ref="0")
lag_for (param=ref ref="2")
lag_couple_student (param=ref ref="None")
;
model married(ref="0")= lag_age lag_age*lag_age lag_couple_student lag_has_children lag_for lag_couple_work lag_age_diff_char lag_formation_difference/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="marriage_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="marriage_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="marriage_men"; if last then delete; run;
data leo.auc_train_log_mar_men_qua; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_log_mar_men_qua; 
set auc2; 
run;
data leo.par_est_mar_men_qua; 
set _pe; 
run;
proc print data=leo.par_est_mar_men_qua; run; 
proc print data=leo.auc_valid_log_mar_men_qua; run; 
proc print data=leo.auc_train_log_mar_men_qua; run; 

proc export data=leo.par_est_mar_men_qua
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_mar_men_qua.csv' 
dbms=csv replace; 
run; 

/*Then we study the determinants of marriage among women at a quarterly step.  This is the marriage equation that 
		is hard-coded in our dynamic microsimulation module, under the marry instruction of the marriage procedure*/

/*Uncomment to export the regressions to a pdf file
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\marriage_wom_qua.pdf"; */
title "Marriage, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where partner_age>13 & lag_marital_status=1 & (ch04=2&(90>=ageconti & ageconti >17)) & lag_partner_id^=0; 
class 

lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
lag_has_children (param=ref ref="0")
lag_for (param=ref ref="2")
lag_couple_student (param=ref ref="None")
;
model married(ref="0")= lag_age lag_age*lag_age lag_couple_student lag_has_children lag_for lag_couple_work lag_age_diff_char lag_formation_difference / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_women_roc;
ods output close;  
score data=valid_women out=valpred outroc=valid_women_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="marriage_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="marriage_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="marriage_wom"; if last then delete; run;
data leo.auc_train_women_log_mar_qua; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_women_log_mar_qua; 
set auc2; 
run;
data leo.par_est_mar_wom_qua; 
set _pe; 
run;
proc print data=leo.par_est_mar_wom_qua; run; 
proc print data=leo.auc_valid_women_log_mar_qua; run; 
proc print data=leo.auc_train_women_log_mar_qua; run; 

proc export data=leo.par_est_mar_wom_qua
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_mar_wom_qua.csv' 
dbms=csv replace; 
run;  
/***********************************************************************************************************************************/

/****************Here we compute our divorce and break-up equations. We start with a quarterly step, then adopt a yearly one. The only one that is hard-coded in our
		prospective microsimulation model is the equation computed at a quarterly step among women for divorce, among men for break-ups.*******************/

options nofmterr; 
data divorce_break_up_data; 
set leo.eph_past_state; 
	
if partner_age=0 then partner_age=-1; 
if lag_part_age=0 then lag_part_age=-1; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if lag_part_age^=-1 then do; 
lag_age_difference=lag_age-lag_part_age; 
lag_formation_difference= lag_for-lag_part_for;
end; 
if lag_part_age=-1 then do; 
lag_age_difference=999; 
lag_formation_difference=999; 
end; 
if lag_und_child=0 then lag_has_children=0; 
if lag_und_child>0 then lag_has_children=1; 

if lag_age_difference<=-10 then lag_age_diff_char="]-inf;-10]"; 
if -7>=lag_age_difference>=-9 then lag_age_diff_char="[-9;-7]"; 
if -4>=lag_age_difference>=-6 then lag_age_diff_char="[-6;-4]"; 
if -3<=lag_age_difference<=3 then lag_age_diff_char="[-3;3]";
if 6>=lag_age_difference>=4 then lag_age_diff_char="[4;6]"; 
if 9>=lag_age_difference>=7 then lag_age_diff_char="[7;9]"; 
if lag_age_difference>=10 then lag_age_diff_char="[10;inf["; 

age2=ageconti*ageconti; 
lag_age2=lag_age*lag_age;
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Both"; 
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="Me"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Partner"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="None"; 

if lag_student="False" & (lag_partner_student=0) then lag_couple_student="None"; 
if lag_student="False" & (lag_partner_student=1) then lag_couple_student="Part"; 
if lag_student="True" & (lag_partner_student=0) then lag_couple_student="Me"; 
if lag_student="True" & (lag_partner_student=1) then lag_couple_student="Both"; 

if lag_partner_id=0 then lag_couple_work="No Couple"; 

if lag_marital_status=2 & marital_status=3 & partner_id^= lag_partner_id & lag_partner_id^=0 then divorce=1; 
if lag_marital_status^=2 | marital_status^=3 | partner_id=lag_partner_id | lag_partner_id=0 then divorce=0;
if lag_marital_status=1 & (marital_status=3 | marital_status=5) & partner_id^= lag_partner_id & lag_partner_id^=0 then break_up=1; 
if lag_marital_status^=1 | marital_status=1 | marital_status=2 | marital_status=4 | partner_id=lag_partner_id | lag_partner_id=0 then break_up=0;
run;


data train valid;
set divorce_break_up_data ;
where ( 90>lag_age & lag_age>17 & lag_marital_status=1 & marital_status^=2 & ch04=2 & lag_partner_id^=0 &lag_formation_difference^=999);
call streaminit(17101945);
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_separation_wom_art.pdf"; */
ods graphics on; 
title "Break-up equation, women, quarterly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>15 & lag_marital_status=1 & marital_status^=2 & ch04=2 & lag_partner_id^=0 &lag_formation_difference^=999);
class 
lag_for (param=ref ref="2")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model break_up(ref="0")=lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; 
ods trace off; 
ods pdf close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="break_up_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="break_up_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="break_up_wom"; if last then delete; run;
data leo.auc_train_logit_bre_up_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_bre_up_wom; 
set auc2; 
run;
data leo.par_est_bre_up_wom; 
set _pe; 
run;
proc print data=leo.par_est_bre_up_wom; run; 
proc print data=leo.auc_valid_logit_bre_up_wom; run; 
proc print data=leo.auc_train_logit_bre_up_wom; run; 


proc export data=leo.par_est_bre_up_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_bre_up_wom.csv' 
dbms=csv replace; 
run; 

options nofmterr;
data train valid;
set divorce_break_up_data;
where ( 90>lag_age & lag_age>17 & lag_marital_status=1 & marital_status^=2 & ch04=1 & lag_partner_id^=0 &lag_formation_difference^=999);
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train;
else output valid;
drop x;
run;
/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_separation_men_art.pdf"; 
*//*This is the regression hard-coded in the microsimulation model, under the breakup_score
		instruction of the marriage procedure*/
ods graphics on; 
title "Break-up equation, men, quarterly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>17 & lag_marital_status=1 & marital_status^=2 & ch04=1 & lag_partner_id^=0 & lag_formation_difference^=999);
class 
lag_for (param=ref ref="2")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model break_up(ref="0")= lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="break_up_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="break_up_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="break_up_men"; if last then delete; run;
data leo.auc_train_logit_break_up_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_break_up_men; 
set auc2; 
run;
data leo.par_est_break_up_men; 
set _pe; 
run;
proc print data=leo.par_est_break_up_men; run; 
proc print data=leo.auc_valid_logit_break_up_men; run; 
proc print data=leo.auc_train_logit_break_up_men; run; 


proc export data=leo.par_est_break_up_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_break_up_men.csv' 
dbms=csv replace; 
run; 

/*Next, we carry out the same break up equations but at a yearly pace*/



/***********************************************************************************************************************************/

/****************Here we compute our divorce and break-up equations. We start with a quarterly step, then adopt a yearly one. The only one that is hard-coded in our
		prospective microsimulation model is the equation computed at a quarterly step among women for divorce, among men for break-ups.*******************/
options nofmterr; 
data divorce_break_up_data_year; 
set leo.eph_past_year_state; 
	
if partner_age=0 then partner_age=-1; 
if lag_part_age=0 then lag_part_age=-1; 
if partner_age^=-1 then do; 
age_difference=ageconti-partner_age; 
formation_difference= formation-partner_formation; 
end; 
if partner_age=-1 then do; 
age_difference=999; 
formation_difference=999; 
end; 
if lag_part_age^=-1 then do; 
lag_age_difference=lag_age-lag_part_age; 
lag_formation_difference= lag_for-lag_part_for;
end; 
if lag_part_age=-1 then do; 
lag_age_difference=999; 
lag_formation_difference=999; 
end; 
if lag_und_child=0 then lag_has_children=0; 
if lag_und_child>0 then lag_has_children=1; 

if lag_age_difference<=-10 then lag_age_diff_char="]-inf;-10]"; 
if -7>=lag_age_difference>=-9 then lag_age_diff_char="[-9;-7]"; 
if -4>=lag_age_difference>=-6 then lag_age_diff_char="[-6;-4]"; 
if -3<=lag_age_difference<=3 then lag_age_diff_char="[-3;3]";
if 6>=lag_age_difference>=4 then lag_age_diff_char="[4;6]"; 
if 9>=lag_age_difference>=7 then lag_age_diff_char="[7;9]"; 
if lag_age_difference>=10 then lag_age_diff_char="[10;inf["; 

age2=ageconti*ageconti; 
lag_age2=lag_age*lag_age;
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Both"; 
if (lag_labour_market_state=1 | lag_labour_market_state=2 | lag_labour_market_state=3) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="Me"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=1|lag_part_lms=2|lag_part_lms=3) then lag_couple_work="Partner"; 
if (lag_labour_market_state=4 | lag_labour_market_state=5 ) & (lag_part_lms=4|lag_part_lms=5|lag_part_lms=-1) then lag_couple_work="None"; 

if lag_student="False" & (lag_partner_student=0) then lag_couple_student="None"; 
if lag_student="False" & (lag_partner_student=1) then lag_couple_student="Part"; 
if lag_student="True" & (lag_partner_student=0) then lag_couple_student="Me"; 
if lag_student="True" & (lag_partner_student=1) then lag_couple_student="Both"; 

if lag_partner_id=0 then lag_couple_work="No Couple"; 

if lag_marital_status=2 & marital_status=3 & partner_id^= lag_partner_id & lag_partner_id^=0 then divorce=1; 
if lag_marital_status^=2 | marital_status^=3 | partner_id=lag_partner_id | lag_partner_id=0 then divorce=0;
if lag_marital_status=1 & (marital_status=3 | marital_status=5) & partner_id^= lag_partner_id & lag_partner_id^=0 then break_up=1; 
if lag_marital_status^=1 | marital_status=1 | marital_status=2 | marital_status=4 | partner_id=lag_partner_id | lag_partner_id=0 then break_up=0;
run;


data train valid;
set divorce_break_up_data_year;
where ( 90>lag_age & lag_age>17 & lag_marital_status=1 & marital_status^=2 & ch04=2 & lag_partner_id^=0 &lag_formation_difference^=999);
call streaminit(17101945);
x=RAND('BERNOULLI', 0.8); 
if x=1 then output train;
else output valid;
drop x;
run;/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_separation_wom_art.pdf"; */
ods graphics on; 
title "Break-up equation, women, yearly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>15 & lag_marital_status=1 & marital_status^=2 & ch04=2 & lag_partner_id^=0 &lag_formation_difference^=999);
class 
lag_for (param=ref ref="2")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model break_up(ref="0")=lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; 
ods trace off; 
ods pdf close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="break_up_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="break_up_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="break_up_wom"; if last then delete; run;
data leo.auc_train_logit_y_bre_up_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_y_bre_up_wom; 
set auc2; 
run;
data leo.par_est_y_bre_up_wom; 
set _pe; 
run;
proc print data=leo.par_est_y_bre_up_wom; run; 
proc print data=leo.auc_valid_logit_y_bre_up_wom; run; 
proc print data=leo.auc_train_logit_y_bre_up_wom; run; 


proc export data=leo.par_est_y_bre_up_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_y_bre_up_wom.csv' 
dbms=csv replace; 
run; 

options nofmterr;
data train valid;
set divorce_break_up_data_year;
where ( 90>lag_age & lag_age>17 & lag_marital_status=1 & marital_status^=2 & ch04=1 & lag_partner_id^=0 &lag_formation_difference^=999);
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train;
else output valid;
drop x;
run;
/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_separation_men_art.pdf"; 
*//*This is the regression hard-coded in the microsimulation model, under the breakup_score
		instruction of the marriage procedure*/
ods graphics on; 
title "Break-up equation, men, yearly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>17 & lag_marital_status=1 & marital_status^=2 & ch04=1 & lag_partner_id^=0 & lag_formation_difference^=999);
class 
lag_for (param=ref ref="2")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model break_up(ref="0")= lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="break_up_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="break_up_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="break_up_men"; if last then delete; run;
data leo.auc_train_logit_y_break_up_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_y_break_up_men; 
set auc2; 
run;
data leo.par_est_y_break_up_men; 
set _pe; 
run;
proc print data=leo.par_est_y_break_up_men; run; 
proc print data=leo.auc_valid_logit_y_break_up_men; run; 
proc print data=leo.auc_train_logit_y_break_up_men; run; 


proc export data=leo.par_est_y_break_up_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_y_break_up_men.csv' 
dbms=csv replace; 
run; 

/*****************************************************************************************************************************/
/*We finally estimate divorce equations.*/
/*First at the yearly step*/
options nofmterr; 
data train valid;
set divorce_break_up_data_year; 
where ( 90>lag_age & lag_age>17 & lag_marital_status=2 & marital_status^=4 & ch04=2 & lag_partner_id^=0 & lag_formation_difference^=999);
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train;
else output valid;
drop x;
run;/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_divorce_wom_art.pdf"; */
title "Divorce equation, women, yearly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>19 & lag_marital_status=2 & marital_status^=4 & ch04=2 & lag_partner_id^=0);
class 
lag_for (param=ref ref="3")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
/*lag_other_inwork_c (param=ref ref="No")*/
lag_couple_work (param=ref ref="Both")
;
model divorce(ref="0")= lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="divorce_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="divorce_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="divorce_wom"; if last then delete; run;
data leo.auc_train_logit_div_y_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_div_y_wom; 
set auc2; 
run;
data leo.par_est_div_y_wom; 
set _pe; 
run;
proc print data=leo.par_est_div_y_wom; run; 
proc print data=leo.auc_valid_logit_div_y_wom; run; 
proc print data=leo.auc_train_logit_div_y_wom; run; 
proc export data=leo.par_est_div_y_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_div_y_wom.csv' 
dbms=csv replace; 
run; 

data train valid;
set divorce_break_up_data_year; 
where ( 90>lag_age & lag_age>19 & lag_marital_status=2 & marital_status^=4 & ch04=1 & lag_age_difference^=999);
call streaminit(17101945) ;
x=RAND('BERNOULLI', 0.8);
if x=1 then output train;
else output valid;
drop x;
run;/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_divorce_men_art.pdf";
ods trace on;  */
title "Divorce equation, men yearly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>17 & lag_marital_status=2 & marital_status^=4 & ch04=1 & lag_age_difference^=999 & lag_part_lms^=-1);
class 
lag_for (param=ref ref="2")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model divorce(ref="0")= lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="divorce_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="divorce_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="divorce_men"; if last then delete; run;
data leo.auc_train_logit_div_y_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_div_y_men; 
set auc2; 
run;
data leo.par_est_div_y_men; 
set _pe; 
run;
proc print data=leo.par_est_div_y_men; run; 
proc print data=leo.auc_valid_logit_div_y_men; run; 
proc print data=leo.auc_train_logit_div_y_men; run; 

proc export data=leo.par_est_div_y_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_div_y_men.csv' 
dbms=csv replace; 
run; 

/*Then with a quarterly step. We hard-code the divorce equation estimated with a quarterly step on women,
		under instruction divorce_women of the marriage procedure.*/ 


options nofmterr; 
data train valid;
set divorce_break_up_data; 
where ( 90>lag_age & lag_age>17 & lag_marital_status=2 & marital_status^=4 & ch04=2 & lag_partner_id^=0 & lag_formation_difference^=999);
call streaminit(17101945) /*Si c'est négatif, chaque tirage va être différent, sinon c'est le seed*/;
x=RAND('BERNOULLI', 0.8); /* 80% des obs. environ allouées à la table d'apprentissage, le reste à la table de validation */
if x=1 then output train;
else output valid;
drop x;
run;/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_divorce_wom_art.pdf"; */
title "Divorce equation, women, quarterly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>19 & lag_marital_status=2 & marital_status^=4 & ch04=2 & lag_partner_id^=0);
class 
lag_for (param=ref ref="3")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model divorce(ref="0")= lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="divorce_wom"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="divorce_wom"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="divorce_wom"; if last then delete; run;
data leo.auc_train_logit_div_wom; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_div_wom; 
set auc2; 
run;
data leo.par_est_div_wom; 
set _pe; 
run;
proc print data=leo.par_est_div_wom; run; 
proc print data=leo.auc_valid_logit_div_wom; run; 
proc print data=leo.auc_train_logit_div_wom; run; 
proc export data=leo.par_est_div_wom
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_div_wom.csv' 
dbms=csv replace; 
run; 

data train valid;
set divorce_break_up_data; 
where ( 90>lag_age & lag_age>19 & lag_marital_status=2 & marital_status^=4 & ch04=1 & lag_age_difference^=999);
call streaminit(17101945) ;
x=RAND('BERNOULLI', 0.8);
if x=1 then output train;
else output valid;
drop x;
run;/*
ods pdf file ="H:\Leonardo_orléans\Sorties_SAS\régressions\logit_divorce_men_art.pdf";
ods trace on;  */
title "Divorce equation, men quarterly step";
proc logistic data=train;
 weight pondera /norm; 
where ( 90>lag_age & lag_age>17 & lag_marital_status=2 & marital_status^=4 & ch04=1 & lag_age_difference^=999 & lag_part_lms^=-1);
class 
lag_for (param=ref ref="2")
lag_has_children (param=ref ref="0")
lag_age_diff_char (param=ref ref="[-3;3]")
lag_formation_difference (param=ref ref="0")
lag_couple_work (param=ref ref="Both")
;
model divorce(ref="0")= lag_age lag_age2 lag_couple_work lag_for lag_age_diff_char lag_formation_difference lag_has_children / selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2 ParameterEstimates=_pe;
run; quit; 
ods output close; /*
ods trace off; 
ods pdf close; */
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="divorce_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="divorce_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="divorce_men"; if last then delete; run;
data leo.auc_train_logit_div_men; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_div_men; 
set auc2; 
run;
data leo.par_est_div_men; 
set _pe; 
run;
proc print data=leo.par_est_div_men; run; 
proc print data=leo.auc_valid_logit_div_men; run; 
proc print data=leo.auc_train_logit_div_men; run; 

proc export data=leo.par_est_div_men
outfile='h:\Tout_LIAM2\Équations comportementales\par_est_div_men.csv' 
dbms=csv replace; 
run; 
