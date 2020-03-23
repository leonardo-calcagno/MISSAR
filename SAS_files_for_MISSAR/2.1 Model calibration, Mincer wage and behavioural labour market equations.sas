/**********Next, we study individual behaviour in the EPHc (2003-2015), as a way to reproduce in our microsimulation model plausible 
		individual developments in the labour-market, family and education spheres.****************/
/****************************We start off with our Mincer wage equations*************************************************************/

/*First of all, let us create the variables top 2% and bottom 2% income percentiles. Workers with those extreme revenues are excluded 
		from the Mincer wage equations, to avoid them being polluted by these outliers. */
/*The centiles are computed separately by labour-market state (so we exclude the top/bottom 2% among formal workers, then among 
		independent workers of the formal sector, then among informal workers).*/
/*This effectively takes people with null income out of the analysis. It may however been better to compute these centiles excluding 
		people with null reported income, which include for instance unpaid family workers in the case of informal workers. This is left 
		for future work. */
dm 'odsresults; clear'; 
dm 'clear log'; 
%macro ITL_centiles(indata,periodvar,lmsvar,t);
proc univariate data=&indata. noprint;
	where &lmsvar.=1 & &periodvar.=&t.;
   		var itl;
   	output out=wage_earners_cent pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
	where &lmsvar.=2 & &periodvar.=&t.;
   		var itl;
   output out=independent_workers_cent pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;	
	where &lmsvar.=3 & &periodvar.=&t.;
   		var itl;
   output out=informal_workers_cent pctlpts=2 98 pctlpre=cent; 
run;

data wage_earners_cent; 
set wage_earners_cent; 
&lmsvar.=1; 
run; 
data independent_workers_cent; 
set independent_workers_cent; 
&lmsvar.=2; 
run; 

data informal_workers_cent; 
set informal_workers_cent; 
&lmsvar.=3; 
run; 
data centiles_&t.; 
set wage_earners_cent independent_workers_cent informal_workers_cent; 
&periodvar.=&t.; 
run; 

%mend; 

%ITL_centiles(leo.eph_data_formatted_2003_t3,period,labour_market_state,1); 
%ITL_centiles(leo.eph_data_formatted_2003_t4,period,labour_market_state,2); 
%ITL_centiles(leo.eph_data_formatted_2004_t1,period,labour_market_state,3); 
%ITL_centiles(leo.eph_data_formatted_2004_t2,period,labour_market_state,4); 
%ITL_centiles(leo.eph_data_formatted_2004_t3,period,labour_market_state,5); 
%ITL_centiles(leo.eph_data_formatted_2004_t4,period,labour_market_state,6); 
%ITL_centiles(leo.eph_data_formatted_2005_t1,period,labour_market_state,7); 
%ITL_centiles(leo.eph_data_formatted_2005_t2,period,labour_market_state,8); 
%ITL_centiles(leo.eph_data_formatted_2005_t3,period,labour_market_state,9); 
%ITL_centiles(leo.eph_data_formatted_2005_t4,period,labour_market_state,10); 
%ITL_centiles(leo.eph_data_formatted_2006_t1,period,labour_market_state,11); 
%ITL_centiles(leo.eph_data_formatted_2006_t2,period,labour_market_state,12); 
%ITL_centiles(leo.eph_data_formatted_2006_t3,period,labour_market_state,13); 
%ITL_centiles(leo.eph_data_formatted_2006_t4,period,labour_market_state,14); 
%ITL_centiles(leo.eph_data_formatted_2007_t1,period,labour_market_state,15); 
%ITL_centiles(leo.eph_data_formatted_2007_t2,period,labour_market_state,16); /*
%ITL_centiles(leo.eph_data_formatted_2007_t3,period,labour_market_state,17); */
%ITL_centiles(leo.eph_data_formatted_2007_t4,period,labour_market_state,18); 
%ITL_centiles(leo.eph_data_formatted_2008_t1,period,labour_market_state,19); 
%ITL_centiles(leo.eph_data_formatted_2008_t2,period,labour_market_state,20); 
%ITL_centiles(leo.eph_data_formatted_2008_t3,period,labour_market_state,21); 
%ITL_centiles(leo.eph_data_formatted_2008_t4,period,labour_market_state,22); 
%ITL_centiles(leo.eph_data_formatted_2009_t1,period,labour_market_state,23); 
%ITL_centiles(leo.eph_data_formatted_2009_t2,period,labour_market_state,24); 
%ITL_centiles(leo.eph_data_formatted_2009_t3,period,labour_market_state,25); 
%ITL_centiles(leo.eph_data_formatted_2009_t4,period,labour_market_state,26); 
%ITL_centiles(leo.eph_data_formatted_2010_t1,period,labour_market_state,27); 
%ITL_centiles(leo.eph_data_formatted_2010_t2,period,labour_market_state,28); 
%ITL_centiles(leo.eph_data_formatted_2010_t3,period,labour_market_state,29); 
%ITL_centiles(leo.eph_data_formatted_2010_t4,period,labour_market_state,30); 
%ITL_centiles(leo.eph_data_formatted_2011_t1,period,labour_market_state,31); 
%ITL_centiles(leo.eph_data_formatted_2011_t2,period,labour_market_state,32); 
%ITL_centiles(leo.eph_data_formatted_2011_t3,period,labour_market_state,33); 
%ITL_centiles(leo.eph_data_formatted_2011_t4,period,labour_market_state,34); 
%ITL_centiles(leo.eph_data_formatted_2012_t1,period,labour_market_state,35); 
%ITL_centiles(leo.eph_data_formatted_2012_t2,period,labour_market_state,36); 
%ITL_centiles(leo.eph_data_formatted_2012_t3,period,labour_market_state,37); 
%ITL_centiles(leo.eph_data_formatted_2012_t4,period,labour_market_state,38); 
%ITL_centiles(leo.eph_data_formatted_2013_t1,period,labour_market_state,39); 
%ITL_centiles(leo.eph_data_formatted_2013_t2,period,labour_market_state,40); 
%ITL_centiles(leo.eph_data_formatted_2013_t3,period,labour_market_state,41); 
%ITL_centiles(leo.eph_data_formatted_2013_t4,period,labour_market_state,42); 
%ITL_centiles(leo.eph_data_formatted_2014_t1,period,labour_market_state,43); 
%ITL_centiles(leo.eph_data_formatted_2014_t2,period,labour_market_state,44); 
%ITL_centiles(leo.eph_data_formatted_2014_t3,period,labour_market_state,45); 
%ITL_centiles(leo.eph_data_formatted_2014_t4,period,labour_market_state,46); 
%ITL_centiles(leo.eph_data_formatted_2015_t1,period,labour_market_state,47); 
%ITL_centiles(leo.eph_data_formatted_2015_t2,period,labour_market_state,48); 
data leo.centiles_2_98_2003_2015; 
set centiles_1-centiles_16 centiles_18-centiles_48; 
run; 

proc sort data=leo.centiles_2_98_2003_2015; 
	by period labour_market_state; 
run; 
proc sort data=leo.eph_data_formatted_2003_2015; 
	by period labour_market_state; 
run; 
data leo.eph_data_formatted_2003_2015; 
merge leo.eph_data_formatted_2003_2015 leo.centiles_2_98_2003_2015; 
	by period labour_market_state; 
run; 
 	

/*Then, we need to compute the coefficients to correct this RIPTE index by gender (for men and women). This is done following Duc et. al.,
		and is explained in section 2.3.3. of the thesis, starting from page 187.*/ 






%macro mean_var_h_f(indata,varname,lmsvar,periodname,period); 
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

dm 'clear log'; 
dm 'odsresults; clear'; 

%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,1);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,2);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,3);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,4);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,5);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,6);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,7);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,8);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,9);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,10);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,11);
dm 'clear log'; run; 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,12);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,13);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,14);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,15);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,16);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,17);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,18);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,19);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,20);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,21);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,22);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,23);
dm 'clear log'; run; 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,24);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,25);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,26);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,27);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,28);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,29);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,30);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,31);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,32);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,33);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,34);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,35);
dm 'clear log'; run; 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,36);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,37);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,38);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,39);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,40);
dm 'clear log'; run; 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,41);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,42);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,43);
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,44); 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,45); 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,46); 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,47); 
%mean_var_h_f(leo.eph_data_formatted_2003_2015,ITL,labour_market_state,period,48); 

	/*Then, the structure coefficient to correct the RIPTE by gender is simply the mean wage among one gender divided by the mean overall 
			wage.*/ 
data leo.mean_ITL; 
set leo.ITL_mean_1-leo.ITL_mean_16 leo.ITL_mean_18-leo.ITL_mean_48; 
		coefficient_men=mean_ITL_men/mean_ITL_all; 
		coefficient_women=mean_ITL_women/mean_ITL_all; 
run; 
	/*We put these coefficients in a distinct dataset, which we will merge in the datasets where we want to use them. We also use it to 
			calibrate our microsimulation model. */
data leo.structure_coefficients; 
set leo.mean_ITL; 
	keep coefficient_men coefficient_women period; 
run;
proc export data=leo.structure_coefficients
	outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\globals\Structure_coefficients\structure_coefficients_2003_2015.csv' 
	dbms=csv replace; 
run; 
proc sort data=leo.eph_data_formatted_2003_2015; 
	by period; 
run; 

proc sort data=leo.structure_coefficients; 
	by period; 
run; 
/*Keeping old versions of coefficients in the dataset may lead to bugs. It is thus better to just drop them before the merge.*/
data leo.eph_data_formatted_2003_2015; 
set leo.eph_data_formatted_2003_2015; 
	drop coefficient_men coefficient_women; 
run; 
data leo.eph_data_formatted_2003_2015; 
merge leo.eph_data_formatted_2003_2015 leo.structure_coefficients; 
	by period; 
run; 
/*Finally, we add other variables necessary for carrying out our Mincer wage equations*/
data leo.eph_data_formatted_2003_2015; 
set leo.eph_data_formatted_2003_2015; 

	/*First, we add the value of the mean RIPTE index for the studied quarter in current pesos. We are going to divide self-reported labour income 
			in current pesos by an index in current pesos in our Mincer wage equations, so we do not bother with computing constant pesos.*/
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
	/*Then, we discretise the continuous age variable, and instead adopt five-year age intervals. This lets us capture the non-linear 
			impact of age on wages, as will be shown in our Mincer wage equations.*/ 
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
	/*After that, we compute the position in the income scale, which will be the dependent variable of our Mincer wage equations as in 
			Duc et. al. (2013).*/
if labour_market_state^=4 & labour_market_state^=5 then do; 
if ch04=1 & ITL>cent2 & ITL^=0 /*& ITL<cent98*/ then ln_wage= log(ITL/(quarterly_RIPTE*coefficient_men)); 
if ch04=2 & ITL>cent2 & ITL^=0 /*& ITL<cent98*/  then ln_wage= log(ITL/(quarterly_RIPTE*coefficient_women)); 
	/*We assume workers with null reported income or income lower than the sectoral bottom 2\% actually do have one, but is equal to 
			the bottom 2% centile of their labour-market category+ 1. It may be correct to exclude them from the analysis altogether,
			but then they would lack an error term to be input in the microsimulation model, which is obtained in the Mincer wage equations.*/ 
if ch04=1 & ((ITL<=cent2) | ITL=0) /*& ITL<cent98*/ then ln_wage= log(cent2+1/(quarterly_RIPTE*coefficient_men)); 
if ch04=2 & ((ITL<=cent2) | ITL=0)/*& ITL<cent98*/  then ln_wage= log(cent2+1/(quarterly_RIPTE*coefficient_women)); 
end; 
if labour_market_state=4 | labour_market_state=5 then sect_quartile=0; 
run; 


/*We introduce the civil servant and informal independent worker categories, as explanatory variables for Mincer wage equations. 
		To avoid colinearity with the labour_market_state variable, we create a new one for the Mincer wage equations where 
		6 equals informal independent workers and 7 civil servants. */

data leo.eph_data_formatted_2003_2015; 
set leo.eph_data_formatted_2003_2015; 
drop new_labour_market_state; 
run; 

data leo.eph_data_formatted_2003_2015; 
set leo.eph_data_formatted_2003_2015; 

	new_lms=labour_market_state; 
	if civil_servant=1 
		then new_lms=7; 
	if informal_independent=1
		then new_lms=6; 
run; 
/****************************************Next, the actual Mincer wage regressions****************************************************/

/*Read section 2.3.3. of the thesis, and particularly since page 189, for a detailed explanation on the design of our Mincer wage equations. */

/*We keep three polytomous explanatory variables for wages, all crossed with age groups. These are labour-market state, seniority and level 
		of education. Our retrospective module does not simulate seniority, as it would needlessly complicate our simulations  (doing so 
		would need making pat simulated careers at least partially deterministic: for instance, someone reporting today having a seniority
		of 1 to 5 years has to stay in the same labour-market state for between 1 to 5 years). Thus, the Mincer wage equations for the 
		prospective and retrospective simulation modules differ by this seniority variable.*/

/*The idea between the 10-fold stepwise selection method is to only select the most relevant explanatory variables, without overfitting 
		our model to the training dataset. This methodology is explained in full in section 2.3.1 page 177 of our thesis.*/

/*A problem that should be fixed in future versions is that the 10-fold stepwise selection procedure is reliant on a random 
		number generator. We did not put a random seed in these Mincer wage equations, so the actual coefficients are slightly 
		different from one run to the other. In future work, a random seed should be assigned to the glmeselct procedure.*/
/*These ods instruction are optional, uncomment them with your own path to run them
ods pdf file="H:\Leonardo_orléans\Sorties_SAS\régressions\10_FOLD_REG_ln_wage_resid_art.pdf"; 
ods csv file="H:\Leonardo_orléans\Sorties_SAS\régressions\csv\10_FOLD_REG_ln_wage_resid_art.csv";*/
dm 'odsresults; clear'; 
dm 'clear log'; 

ods graphics on; 
title "10-fold cross validation on wages: men"; 

proc glmselect data=leo.eph_data_formatted_2003_2015 testdata=leo.eph_data_formatted_2003_2015
               plots(stepAxis=number)=(criterionPanel ASEPlot) seed=17101945;
			   weight pondera ; 
where estado=1 & ageconti>15 & ageconti<65 & ch04=1 & ((ITL > cent2) & ITL < cent98); 

   class  /*age_16_19(split) age_20_24(split) age_25_29(split) age_30_34(split) age_35_39(split) age_40_44(split) age_45_49(split) age_50_54(split) age_55_59(split) age_60_64(split)*/ agegroup(split) formation(split) new_lms(split) seniority(split) ;  
   
   model ln_wage = new_lms*agegroup| seniority*agegroup |formation*agegroup  /*
|age_16_19*formation|age_20_24*formation|age_25_29*formation|age_30_34*formation|age_35_39*formation|age_40_44*formation|age_45_49*formation|age_50_54*formation|age_55_59*formation|age_60_64*formation
|age_16_19*seniority|age_20_24*seniority|age_25_29*seniority|age_30_34*seniority|age_35_39*seniority|age_40_44*seniority|age_45_49*seniority|age_50_54*seniority|age_55_59*seniority|age_60_64*seniority
|age_16_19*new_lms|age_20_24*new_lms|age_25_29*new_lms|age_30_34*new_lms|age_35_39*new_lms|age_40_44*new_lms|age_45_49*new_lms|age_50_54*new_lms|age_55_59*new_lms|age_60_64*new_lms*/ @2
           / selection = stepwise(choose = cv 
                                  select = sl
								SLE=0.10 SLS=0.1)  
             stats     = press 
             cvMethod  = random(10) 
             cvDetails = all 
             hierarchy = single
			showpvalues;
   output out=leo.new_lms_all_men r=resid;
   ODS OUTPUT ParameterEstimates =_pe /*CVDetail= _cv*/;
  
run; 
 ods output close; 
ods graphics off; 

/*ods trace off; */
	/*We store the estimated parameters in a distinct dataset, which we later export. This helps when hard-coding Mincer wage equations in 
			the LIAM2 microsimulation toolbox*/
data leo.pe_men_mwe_forw_new_lms; 
set _pe; 
regression="Mincer_men_forw_new_lms"; 
run; 


ods graphics on; 
title "10-fold cross validation on wages: women"; 

proc glmselect data=leo.eph_data_formatted_2003_2015 testdata=leo.eph_data_formatted_2003_2015
               plots(stepAxis=number)=(criterionPanel ASEPlot) seed=17101945;
			   weight pondera ; 
where estado=1 & ageconti>15 & ageconti<60 & ch04=2 & ((ITL > cent2) & ITL < cent98); 

   class  /*age_16_19(split) age_20_24(split) age_25_29(split) age_30_34(split) age_35_39(split) age_40_44(split) age_45_49(split) age_50_54(split) age_55_59(split) age_60_64(split)*/ agegroup(split) formation(split) new_lms(split) seniority(split) ;  
   
   model ln_wage = new_lms*agegroup| seniority*agegroup |formation*agegroup   /*
|age_16_19*formation|age_20_24*formation|age_25_29*formation|age_30_34*formation|age_35_39*formation|age_40_44*formation|age_45_49*formation|age_50_54*formation|age_55_59*formation|age_60_64*formation
|age_16_19*seniority|age_20_24*seniority|age_25_29*seniority|age_30_34*seniority|age_35_39*seniority|age_40_44*seniority|age_45_49*seniority|age_50_54*seniority|age_55_59*seniority|age_60_64*seniority
|age_16_19*new_lms|age_20_24*new_lms|age_25_29*new_lms|age_30_34*new_lms|age_35_39*new_lms|age_40_44*new_lms|age_45_49*new_lms|age_50_54*new_lms|age_55_59*new_lms|age_60_64*new_lms*/ @2
           / selection = stepwise(choose = cv 
                                  select = sl
								SLE=0.10 SLS=0.1)  
             stats     = press 
             cvMethod  = random(10) 
             cvDetails = all 
             hierarchy = single
			showpvalues;
   output out=leo.new_lms_all_women r=resid;
   ODS OUTPUT ParameterEstimates =_pe /*CVDetail= _cv*/;
  
run; 
 ods output close; 
ods graphics off; 


/*ods csv close;  
ods pdf close; 
*/
data leo.pe_women_mwe_forw_new_lms; 
set _pe; 
regression="Mincer_women_forw_new_lms"; 
run; 


/**We don't change the backwards Mincer wage equations, mainly because there is no difference in retirement rights between being a civil servant or a formal wage-earner; 
		or between being an independent or wage-earner informal worker.***********/
/*
ods pdf file="H:\Leonardo_orléans\Sorties_SAS\régressions\10_FOLD_REG_ln_wage_resid_back_art.pdf";
ods csv file="H:\Leonardo_orléans\Sorties_SAS\régressions\csv\10_FOLD_REG_ln_wage_resid_back_art.csv";*/
ods graphics on; 
title "10-fold cross validation on wages: men"; 
proc glmselect data=leo.eph_data_formatted_2003_2015 testdata=leo.eph_data_formatted_2003_2015
               plots(stepAxis=number)=(criterionPanel ASEPlot) seed=17101945;
			   weight pondera ; 
where estado=1 & ageconti>15 & ageconti<65 & ch04=1 & ((ITL > cent2) & ITL < cent98); 

   class  /*age_16_19(split) age_20_24(split) age_25_29(split) age_30_34(split) age_35_39(split) age_40_44(split) age_45_49(split) age_50_54(split) age_55_59(split) age_60_64(split)*/ agegroup(split) formation(split) labour_market_state(split) ;  
   
   model ln_wage =labour_market_state*agegroup |formation*agegroup/*
|age_16_19*formation|age_20_24*formation|age_25_29*formation|age_30_34*formation|age_35_39*formation|age_40_44*formation|age_45_49*formation|age_50_54*formation|age_55_59*formation|age_60_64*formation
|age_16_19*seniority|age_20_24*seniority|age_25_29*seniority|age_30_34*seniority|age_35_39*seniority|age_40_44*seniority|age_45_49*seniority|age_50_54*seniority|age_55_59*seniority|age_60_64*seniority
|age_16_19*labour_market_state|age_20_24*labour_market_state|age_25_29*labour_market_state|age_30_34*labour_market_state|age_35_39*labour_market_state|age_40_44*labour_market_state|age_45_49*labour_market_state|age_50_54*labour_market_state|age_55_59*labour_market_state|age_60_64*labour_market_state*/ @2
           / selection = stepwise(choose = cv 
                                  select = sl
								SLE=0.1 SLS=0.1)  
             stats     = press 
             cvMethod  = random(10) 
             cvDetails = all 
             hierarchy = single
			showpvalues;
   output out=leo.outData_back_men r=resid;
    ODS OUTPUT ParameterEstimates =_pe /*CVDetail= _cv*/;
run; 
ods graphics off;


data leo.pe_men_mwe_back; 
set _pe; 
regression="Mincer_men_back"; 
run; 
title "10-fold cross validation on wages: women"; 
ods graphics on; 
proc glmselect data=leo.eph_data_formatted_2003_2015 testdata=leo.eph_data_formatted_2003_2015
               plots(stepAxis=number)=(criterionPanel ASEPlot) seed=17101945;
			   weight pondera; 
where estado=1 & ageconti>15 & ageconti<60 & ch04=2 & ((ITL > cent2) & ITL < cent98); 

   class  agegroup(split) formation(split) labour_market_state(split) ;  
   
   model ln_wage =labour_market_state*agegroup |formation*agegroup/*
age_16_19 age_20_24 age_25_29 age_30_34 age_35_39 age_40_44 age_45_49 age_50_54 age_55_59 age_60_64 labour_market_state seniority formation
|age_16_19*formation|age_20_24*formation|age_25_29*formation|age_30_34*formation|age_35_39*formation|age_40_44*formation|age_45_49*formation|age_50_54*formation|age_55_59*formation/*|age_60_64*formation|formation*/
/*|age_16_19*seniority|age_20_24*seniority|age_25_29*seniority|age_30_34*seniority|age_35_39*seniority|age_40_44*seniority|age_45_49*seniority|age_50_54*seniority|age_55_59*seniority/*|age_60_64*seniority|seniority*/
/*|age_16_19*labour_market_state|age_20_24*labour_market_state|age_25_29*labour_market_state|age_30_34*labour_market_state|age_35_39*labour_market_state|age_40_44*labour_market_state|age_45_49*labour_market_state|age_50_54*labour_market_state|age_55_59*labour_market_state/*|age_60_64*labour_market_state|labour_market_state*/ @2
           / selection = STEPwise(choose = cv 
                                  select = sl
									SLS=0.1 SLE=0.10)  
             stats     = press 
             cvMethod  = random(10) 
             cvDetails = all 
             hierarchy = singleclass
			showpvalues;
   output out=leo.outData_back_women r=resid;
    ODS OUTPUT ParameterEstimates =_pe /*CVDetail= _cv*/;
run; 
ods graphics off;
/*ods csv close;  
ods pdf close; 
*/


data leo.pe_women_mwe_back; 
set _pe; 
regression="Mincer_women_back"; 
run; 
data leo.Mincer_wage_parameters_new; 
set leo.pe_men_mwe_forw_new_lms leo.pe_women_mwe_forw_new_lms  leo.pe_men_mwe_back leo.pe_women_mwe_back; 
run; 

proc print data=Leo.mincer_wage_parameters_new; run;
	/*These parameters need to be hard-coded in LIAM2, in the retrospective and prospective modules and separately for men and women. 
			Only parameters with p-values under the 10% threshold must be transcribed in the model.*/ 
proc export data=leo.pe_men_mwe_back outfile="H:\Tout_LIAM2\Équations comportementales\Équations de salaire\mincer_back_men.csv"
dbms=csv replace; 
run; 
proc export data=leo.pe_women_mwe_back outfile="H:\Tout_LIAM2\Équations comportementales\Équations de salaire\mincer_back_women.csv"
dbms=csv replace; 
run; 

proc export data=leo.pe_men_mwe_forw_new_lms outfile="H:\Tout_LIAM2\Équations comportementales\Équations de salaire\mincer_forw_men_new_lms.csv"
dbms=csv replace; 
run; 
proc export data=leo.pe_women_mwe_forw_new_lms outfile="H:\Tout_LIAM2\Équations comportementales\Équations de salaire\mincer_forw_women_new_lms.csv"
dbms=csv replace; 
run; 
/*********************************************BEHAVIOURAL EQUATIONS************************************************/

/*The remaining equations are behavioural. They simulate the transition of individuals between labour-market states, but also the evolution
		of family links (new unions, marriages, divorces, breakups).*/

	/*First, we carry out the labour-market behavioural equations. We create some variable that are needed for them, and that exploit 
			the pannel characteristics of our dataset.*/
data leo.eph_past_state; 
set leo.eph_past_state; 
	rename lag_civil_servant=was_civil_servant; 
	rename lag_inf_indep=was_inf_indep; 
run; 
data leo.eph_past_state; 
	length little_children_qual $32.; 
set leo.eph_past_state;
	/*We need to format the starting dataset so as to make 
			each labour-market state a dummy (for instance, whether a respondent is a formal wage-earner or not)*/ 
		if labour_market_state=1
			then wage_earner=1; 
		if labour_market_state=2|labour_market_state=3|labour_market_state=4|labour_market_state=5 
			then wage_earner=0; 
		if labour_market_state=2 
			then independent=1; 
		if labour_market_state=1|labour_market_state=3|labour_market_state=4|labour_market_state=5 
			then independent=0; 
		if labour_market_state=3 
			then informal=1; 
		if labour_market_state=2|labour_market_state=1|labour_market_state=4|labour_market_state=5
			then informal=0; 
		if labour_market_state=4 
			then unemployed=1; 
		if labour_market_state=2|labour_market_state=3|labour_market_state=1|labour_market_state=5 
			then unemployed=0; 
		if labour_market_state=5 
			then inactive=1; 
		if labour_market_state=2|labour_market_state=3|labour_market_state=1|labour_market_state=4 
			then inactive=0; 
	/*We also compute "backwards" behavioural equations for our retrospective microsimulation module, that is the probability an individual
			was in a given labour-market state last quarter given his or her current characteristics.*/
 		if lag_labour_market_state=1
			then was_wage_earner=1; 
		if lag_labour_market_state=2|lag_labour_market_state=3|lag_labour_market_state=4|lag_labour_market_state=5 
			then was_wage_earner=0; 
		if lag_labour_market_state=2 
			then was_independent=1; 
		if lag_labour_market_state=1|lag_labour_market_state=3|lag_labour_market_state=4|lag_labour_market_state=5 
			then was_independent=0; 
		if lag_labour_market_state=3 
			then was_informal=1; 
		if lag_labour_market_state=2|lag_labour_market_state=1|lag_labour_market_state=4|lag_labour_market_state=5
			then was_informal=0; 
		if lag_labour_market_state=4 
			then was_unemployed=1; 
		if lag_labour_market_state=2|lag_labour_market_state=3|lag_labour_market_state=1|lag_labour_market_state=5 
			then was_unemployed=0; 
		if lag_labour_market_state=5 
			then was_inactive=1; 
		if lag_labour_market_state=2|lag_labour_market_state=3|lag_labour_market_state=1|lag_labour_market_state=4 
			then was_inactive=0; 
	
	/*We also add a dummy to know when an individual just finished education, as an explanatory variable*/
		if student="False" & lag_student="True" 
			then out_of_education=1; 
		if student ^="False" | lag_student ^="True" 
			then out_of_education=0; 
				/*Then, we discretise the continuous age variable, and instead adopt five-year age intervals. This lets us capture the non-linear 
			impact of age on wages, as will be shown in our Mincer wage equations.*/ 
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
	/*We add the civil servant and informal independent worker variables. These are nested behavioural equations: we first determine who
			is a registered wage-earner (resp. informal worker). Then, within formal wage-earners (informal workers), we make another 
			behavioural equation to see who is a civil servant / independent informal worker. Both civil servant and independent worker
			are however explanatory variables for labour market state.*/
		priv_wage_earner=0; 
		was_priv_wage_earner=0; 
		informal_we=0; 
		was_informal_we=0; 
		if wage_earner=1 & civil_servant=0 
			then priv_wage_earner=1; 
		if was_wage_earner=1 & was_civil_servant=0 
			then was_priv_wage_earner=1; 
		if informal=1 & informal_independent=0 
			then informal_we=1; 
		if was_informal=1 & was_inf_indep=0
			then was_informal_we=1; 
	/*Finally, we had forgotten to simplify the little_children variable: we only keep 0, 1, 2 or more as values. */
		if little_children=0
			then little_children_qual="0"; 
		if little_children=1 
			then little_children_qual="1"; 
		if little_children>=2
			then little_children_qual="2+"; 
		if lag_seniority="-1"
			then lag_seniority="0"; 
run; 

/*Then we start our 5-fold stepwise selection procedure. Unfortunately SAS does not support a cross-validation procedure for logistic 
		regressions similar to the one we used for our Mincer wage equations. We thus randomly leave out a fifth of the dataset, train the
		model in the remaining 4/5, and see how well the trained model fares in the validation dataset by comparing their AUC statistics.
		If the AUC statistics are similar in the training and validation datasets, then the behavioural equation is not overfitted to the 
		training dataset.  
		This AUC statistics tells us the accuracy with which our model classifies a given observation with respect to the dependent variable. 
		It ranges from 0 to 1, a 0.5 statistic shows the model has the same classification power as a coin flip, and a 1 means it correctly
		classifies all observations. Usually, a statistic of 0.7 shows the model has a decent prediction power and models with AUCs of 0.8 
		or above have a strong explanatory power.*/ 

dm 'odsresults; clear'; 
dm 'clear log'; 
options nofmterr; 
data train valid;
set leo.eph_past_state;
	/*Here we keep only men of working age, and exclude formal workers who do not report their income*/
	where(ch04=1&(16<=ageconti<=64)&(lag_sect_quartile^=0 |lag_labour_market_state^=3)); 
	call streaminit(17101945) /*Here we put the random seed. A negative number means the seed varies each time.*/;
		x=RAND('BERNOULLI', 0.8); /* Approximately 80% of obs. assigned to the training dataset train, the rest to validation valid */
		if x=1 
			then output train;
		else output valid;
	drop x;
run;
/*We do the same operation for women*/
options nofmterr; 
data train_women valid_women;
set leo.eph_past_state;
	where(ch04=2&(16<=ageconti<=59)&(lag_sect_quartile^=0 |lag_labour_market_state^=3)); 
	call streaminit(17101945) /*Here we put the random seed. A negative number means the seed varies each time.*/;
		x=RAND('BERNOULLI', 0.8);
		if x=1 
			then output train_women;
		else output valid_women;
	drop x;
run;

/*We then abide by the warning by Norton (2003) that advises against carrying out logistic equations with explanatory terms made up 
		of crossing two qualitative variables. This is one of the reasons why we estimate behavioural equations separately for men and 
		women.
We however use labour-market dependent explanatory variables such as seniority or belonging to a given labour income quartile. For instance,
		belonging to the 25% richest formal wage-earners, or to informal workers with a seniority of 5 years or more. We add these 
		explanatory variables below in these training and validation datasets, so as not to clutter our starting dataset with them.*/
/*Finally, our microsimulation model uses labour-market related information of the previous quarter to determine the simulated labour-market
		state for this quarter. As such, we work with lagged labour-market related variables.*/


/*One thing worth noting is we do not get with the code below exactly the same estimated parameters for our estimated behavioural equations
		than in our thesis (although the differences are minimal). This comes in particular by a different computation of sectorial quartiles
		as far as missing income is concerned, which gives a different starting point for the number of observations used in our regressions.
		We could not find the reason of this discrepancy, but we believe this version of the code is more accurate as the repartition of 
		workers across sectoral quartiles is better done in this version than in the one actually used in the model. Re-calibration of the 
		model should not significantly change the results, and is left for future work.*/
		
data train; 
set train; 
		if missing(lag_seniority) | lag_seniority="-" then lag_seniority="-1";
		/*Workers that do not report their seniority or income get the lowest seniority and sectorial income quartile*/
		if lag_labour_market_state^=4 & lag_labour_market_state^=5 
			then do; 
				if lag_seniority="-1" 
					then lag_seniority="1"; 
				if lag_sect_quartile=0 
					then lag_sect_quartile=1; 
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




if lag_seniority="0" & lag_labour_market_state=1 then lag_sen_0_lms_1=1; if lag_seniority^="0" | lag_labour_market_state^=1 then lag_sen_0_lms_1=0; 
if lag_seniority="5" & lag_labour_market_state=1 then lag_sen_5_lms_1=1; if lag_seniority^="5" | lag_labour_market_state^=1 then lag_sen_5_lms_1=0; 
if lag_seniority="1" & lag_labour_market_state=1 then lag_sen_1_lms_1=1; if lag_seniority^="1" | lag_labour_market_state^=1 then lag_sen_1_lms_1=0; 
if lag_seniority="2" & lag_labour_market_state=1 then lag_sen_2_lms_1=1; if lag_seniority^="2" | lag_labour_market_state^=1 then lag_sen_2_lms_1=0; 
if lag_seniority="3" & lag_labour_market_state=1 then lag_sen_3_lms_1=1; if lag_seniority^="3" | lag_labour_market_state^=1 then lag_sen_3_lms_1=0; 
if lag_seniority="4" & lag_labour_market_state=1 then lag_sen_4_lms_1=1; if lag_seniority^="4" | lag_labour_market_state^=1 then lag_sen_4_lms_1=0; 

if lag_seniority="0" & lag_labour_market_state=2 then lag_sen_0_lms_2=1; if lag_seniority^="0" | lag_labour_market_state^=2 then lag_sen_0_lms_2=0; 
if lag_seniority="5" & lag_labour_market_state=2 then lag_sen_5_lms_2=1; if lag_seniority^="5" | lag_labour_market_state^=2 then lag_sen_5_lms_2=0; 
if lag_seniority="1" & lag_labour_market_state=2 then lag_sen_1_lms_2=1; if lag_seniority^="1" | lag_labour_market_state^=2 then lag_sen_1_lms_2=0; 
if lag_seniority="2" & lag_labour_market_state=2 then lag_sen_2_lms_2=1; if lag_seniority^="2" | lag_labour_market_state^=2 then lag_sen_2_lms_2=0; 
if lag_seniority="3" & lag_labour_market_state=2 then lag_sen_3_lms_2=1; if lag_seniority^="3" | lag_labour_market_state^=2 then lag_sen_3_lms_2=0; 
if lag_seniority="4" & lag_labour_market_state=2 then lag_sen_4_lms_2=1; if lag_seniority^="4" | lag_labour_market_state^=2 then lag_sen_4_lms_2=0; 

if lag_seniority="0" & lag_labour_market_state=3 then lag_sen_0_lms_3=1; if lag_seniority^="0" | lag_labour_market_state^=3 then lag_sen_0_lms_3=0; 
if lag_seniority="5" & lag_labour_market_state=3 then lag_sen_5_lms_3=1; if lag_seniority^="5" | lag_labour_market_state^=3 then lag_sen_5_lms_3=0; 
if lag_seniority="1" & lag_labour_market_state=3 then lag_sen_1_lms_3=1; if lag_seniority^="1" | lag_labour_market_state^=3 then lag_sen_1_lms_3=0; 
if lag_seniority="2" & lag_labour_market_state=3 then lag_sen_2_lms_3=1; if lag_seniority^="2" | lag_labour_market_state^=3 then lag_sen_2_lms_3=0; 
if lag_seniority="3" & lag_labour_market_state=3 then lag_sen_3_lms_3=1; if lag_seniority^="3" | lag_labour_market_state^=3 then lag_sen_3_lms_3=0; 
if lag_seniority="4" & lag_labour_market_state=3 then lag_sen_4_lms_3=1; if lag_seniority^="4" | lag_labour_market_state^=3 then lag_sen_4_lms_3=0; 

if lag_seniority="0" & lag_labour_market_state=4 then lag_sen_0_lms_4=1; if lag_seniority^="0" | lag_labour_market_state^=4 then lag_sen_0_lms_4=0; 
if lag_seniority="5" & lag_labour_market_state=4 then lag_sen_5_lms_4=1; if lag_seniority^="5" | lag_labour_market_state^=4 then lag_sen_5_lms_4=0; 
if lag_seniority="1" & lag_labour_market_state=4 then lag_sen_1_lms_4=1; if lag_seniority^="1" | lag_labour_market_state^=4 then lag_sen_1_lms_4=0; 
if lag_seniority="2" & lag_labour_market_state=4 then lag_sen_2_lms_4=1; if lag_seniority^="2" | lag_labour_market_state^=4 then lag_sen_2_lms_4=0; 
if lag_seniority="3" & lag_labour_market_state=4 then lag_sen_3_lms_4=1; if lag_seniority^="3" | lag_labour_market_state^=4 then lag_sen_3_lms_4=0; 
if lag_seniority="4" & lag_labour_market_state=4 then lag_sen_4_lms_4=1; if lag_seniority^="4" | lag_labour_market_state^=4 then lag_sen_4_lms_4=0; 

if lag_seniority="0" & lag_labour_market_state=5 then lag_sen_0_lms_5=1; if lag_seniority^="0" | lag_labour_market_state^=5 then lag_sen_0_lms_5=0; 
if lag_seniority="5" & lag_labour_market_state=5 then lag_sen_5_lms_5=1; if lag_seniority^="5" | lag_labour_market_state^=5 then lag_sen_5_lms_5=0; 
if lag_seniority="1" & lag_labour_market_state=5 then lag_sen_1_lms_5=1; if lag_seniority^="1" | lag_labour_market_state^=5 then lag_sen_1_lms_5=0; 
if lag_seniority="2" & lag_labour_market_state=5 then lag_sen_2_lms_5=1; if lag_seniority^="2" | lag_labour_market_state^=5 then lag_sen_2_lms_5=0; 
if lag_seniority="3" & lag_labour_market_state=5 then lag_sen_3_lms_5=1; if lag_seniority^="3" | lag_labour_market_state^=5 then lag_sen_3_lms_5=0; 
if lag_seniority="4" & lag_labour_market_state=5 then lag_sen_4_lms_5=1; if lag_seniority^="4" | lag_labour_market_state^=5 then lag_sen_4_lms_5=0; 

run; 
data valid; 
set valid; 
		if missing(lag_seniority) | lag_seniority="-" then lag_seniority="-1";
		/*Workers that do not report their seniority or income get the lowest seniority and sectorial income quartile*/
		if lag_labour_market_state^=4 & lag_labour_market_state^=5 
			then do; 
				if lag_seniority="-1" 
					then lag_seniority="1"; 
				if lag_sect_quartile=0 
					then lag_sect_quartile=1; 
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




if lag_seniority="0" & lag_labour_market_state=1 then lag_sen_0_lms_1=1; if lag_seniority^="0" | lag_labour_market_state^=1 then lag_sen_0_lms_1=0; 
if lag_seniority="5" & lag_labour_market_state=1 then lag_sen_5_lms_1=1; if lag_seniority^="5" | lag_labour_market_state^=1 then lag_sen_5_lms_1=0; 
if lag_seniority="1" & lag_labour_market_state=1 then lag_sen_1_lms_1=1; if lag_seniority^="1" | lag_labour_market_state^=1 then lag_sen_1_lms_1=0; 
if lag_seniority="2" & lag_labour_market_state=1 then lag_sen_2_lms_1=1; if lag_seniority^="2" | lag_labour_market_state^=1 then lag_sen_2_lms_1=0; 
if lag_seniority="3" & lag_labour_market_state=1 then lag_sen_3_lms_1=1; if lag_seniority^="3" | lag_labour_market_state^=1 then lag_sen_3_lms_1=0; 
if lag_seniority="4" & lag_labour_market_state=1 then lag_sen_4_lms_1=1; if lag_seniority^="4" | lag_labour_market_state^=1 then lag_sen_4_lms_1=0; 

if lag_seniority="0" & lag_labour_market_state=2 then lag_sen_0_lms_2=1; if lag_seniority^="0" | lag_labour_market_state^=2 then lag_sen_0_lms_2=0; 
if lag_seniority="5" & lag_labour_market_state=2 then lag_sen_5_lms_2=1; if lag_seniority^="5" | lag_labour_market_state^=2 then lag_sen_5_lms_2=0; 
if lag_seniority="1" & lag_labour_market_state=2 then lag_sen_1_lms_2=1; if lag_seniority^="1" | lag_labour_market_state^=2 then lag_sen_1_lms_2=0; 
if lag_seniority="2" & lag_labour_market_state=2 then lag_sen_2_lms_2=1; if lag_seniority^="2" | lag_labour_market_state^=2 then lag_sen_2_lms_2=0; 
if lag_seniority="3" & lag_labour_market_state=2 then lag_sen_3_lms_2=1; if lag_seniority^="3" | lag_labour_market_state^=2 then lag_sen_3_lms_2=0; 
if lag_seniority="4" & lag_labour_market_state=2 then lag_sen_4_lms_2=1; if lag_seniority^="4" | lag_labour_market_state^=2 then lag_sen_4_lms_2=0; 

if lag_seniority="0" & lag_labour_market_state=3 then lag_sen_0_lms_3=1; if lag_seniority^="0" | lag_labour_market_state^=3 then lag_sen_0_lms_3=0; 
if lag_seniority="5" & lag_labour_market_state=3 then lag_sen_5_lms_3=1; if lag_seniority^="5" | lag_labour_market_state^=3 then lag_sen_5_lms_3=0; 
if lag_seniority="1" & lag_labour_market_state=3 then lag_sen_1_lms_3=1; if lag_seniority^="1" | lag_labour_market_state^=3 then lag_sen_1_lms_3=0; 
if lag_seniority="2" & lag_labour_market_state=3 then lag_sen_2_lms_3=1; if lag_seniority^="2" | lag_labour_market_state^=3 then lag_sen_2_lms_3=0; 
if lag_seniority="3" & lag_labour_market_state=3 then lag_sen_3_lms_3=1; if lag_seniority^="3" | lag_labour_market_state^=3 then lag_sen_3_lms_3=0; 
if lag_seniority="4" & lag_labour_market_state=3 then lag_sen_4_lms_3=1; if lag_seniority^="4" | lag_labour_market_state^=3 then lag_sen_4_lms_3=0; 

if lag_seniority="0" & lag_labour_market_state=4 then lag_sen_0_lms_4=1; if lag_seniority^="0" | lag_labour_market_state^=4 then lag_sen_0_lms_4=0; 
if lag_seniority="5" & lag_labour_market_state=4 then lag_sen_5_lms_4=1; if lag_seniority^="5" | lag_labour_market_state^=4 then lag_sen_5_lms_4=0; 
if lag_seniority="1" & lag_labour_market_state=4 then lag_sen_1_lms_4=1; if lag_seniority^="1" | lag_labour_market_state^=4 then lag_sen_1_lms_4=0; 
if lag_seniority="2" & lag_labour_market_state=4 then lag_sen_2_lms_4=1; if lag_seniority^="2" | lag_labour_market_state^=4 then lag_sen_2_lms_4=0; 
if lag_seniority="3" & lag_labour_market_state=4 then lag_sen_3_lms_4=1; if lag_seniority^="3" | lag_labour_market_state^=4 then lag_sen_3_lms_4=0; 
if lag_seniority="4" & lag_labour_market_state=4 then lag_sen_4_lms_4=1; if lag_seniority^="4" | lag_labour_market_state^=4 then lag_sen_4_lms_4=0; 

if lag_seniority="0" & lag_labour_market_state=5 then lag_sen_0_lms_5=1; if lag_seniority^="0" | lag_labour_market_state^=5 then lag_sen_0_lms_5=0; 
if lag_seniority="5" & lag_labour_market_state=5 then lag_sen_5_lms_5=1; if lag_seniority^="5" | lag_labour_market_state^=5 then lag_sen_5_lms_5=0; 
if lag_seniority="1" & lag_labour_market_state=5 then lag_sen_1_lms_5=1; if lag_seniority^="1" | lag_labour_market_state^=5 then lag_sen_1_lms_5=0; 
if lag_seniority="2" & lag_labour_market_state=5 then lag_sen_2_lms_5=1; if lag_seniority^="2" | lag_labour_market_state^=5 then lag_sen_2_lms_5=0; 
if lag_seniority="3" & lag_labour_market_state=5 then lag_sen_3_lms_5=1; if lag_seniority^="3" | lag_labour_market_state^=5 then lag_sen_3_lms_5=0; 
if lag_seniority="4" & lag_labour_market_state=5 then lag_sen_4_lms_5=1; if lag_seniority^="4" | lag_labour_market_state^=5 then lag_sen_4_lms_5=0; 


run; 

data train_women; 
set train_women; 
		if missing(lag_seniority) | lag_seniority="-" then lag_seniority="-1";
		/*Workers that do not report their seniority or income get the lowest seniority and sectorial income quartile*/
		if lag_labour_market_state^=4 & lag_labour_market_state^=5 
			then do; 
				if lag_seniority="-1" 
					then lag_seniority="1"; 
				if lag_sect_quartile=0 
					then lag_sect_quartile=1; 
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




if lag_seniority="0" & lag_labour_market_state=1 then lag_sen_0_lms_1=1; if lag_seniority^="0" | lag_labour_market_state^=1 then lag_sen_0_lms_1=0; 
if lag_seniority="5" & lag_labour_market_state=1 then lag_sen_5_lms_1=1; if lag_seniority^="5" | lag_labour_market_state^=1 then lag_sen_5_lms_1=0; 
if lag_seniority="1" & lag_labour_market_state=1 then lag_sen_1_lms_1=1; if lag_seniority^="1" | lag_labour_market_state^=1 then lag_sen_1_lms_1=0; 
if lag_seniority="2" & lag_labour_market_state=1 then lag_sen_2_lms_1=1; if lag_seniority^="2" | lag_labour_market_state^=1 then lag_sen_2_lms_1=0; 
if lag_seniority="3" & lag_labour_market_state=1 then lag_sen_3_lms_1=1; if lag_seniority^="3" | lag_labour_market_state^=1 then lag_sen_3_lms_1=0; 
if lag_seniority="4" & lag_labour_market_state=1 then lag_sen_4_lms_1=1; if lag_seniority^="4" | lag_labour_market_state^=1 then lag_sen_4_lms_1=0; 

if lag_seniority="0" & lag_labour_market_state=2 then lag_sen_0_lms_2=1; if lag_seniority^="0" | lag_labour_market_state^=2 then lag_sen_0_lms_2=0; 
if lag_seniority="5" & lag_labour_market_state=2 then lag_sen_5_lms_2=1; if lag_seniority^="5" | lag_labour_market_state^=2 then lag_sen_5_lms_2=0; 
if lag_seniority="1" & lag_labour_market_state=2 then lag_sen_1_lms_2=1; if lag_seniority^="1" | lag_labour_market_state^=2 then lag_sen_1_lms_2=0; 
if lag_seniority="2" & lag_labour_market_state=2 then lag_sen_2_lms_2=1; if lag_seniority^="2" | lag_labour_market_state^=2 then lag_sen_2_lms_2=0; 
if lag_seniority="3" & lag_labour_market_state=2 then lag_sen_3_lms_2=1; if lag_seniority^="3" | lag_labour_market_state^=2 then lag_sen_3_lms_2=0; 
if lag_seniority="4" & lag_labour_market_state=2 then lag_sen_4_lms_2=1; if lag_seniority^="4" | lag_labour_market_state^=2 then lag_sen_4_lms_2=0; 

if lag_seniority="0" & lag_labour_market_state=3 then lag_sen_0_lms_3=1; if lag_seniority^="0" | lag_labour_market_state^=3 then lag_sen_0_lms_3=0; 
if lag_seniority="5" & lag_labour_market_state=3 then lag_sen_5_lms_3=1; if lag_seniority^="5" | lag_labour_market_state^=3 then lag_sen_5_lms_3=0; 
if lag_seniority="1" & lag_labour_market_state=3 then lag_sen_1_lms_3=1; if lag_seniority^="1" | lag_labour_market_state^=3 then lag_sen_1_lms_3=0; 
if lag_seniority="2" & lag_labour_market_state=3 then lag_sen_2_lms_3=1; if lag_seniority^="2" | lag_labour_market_state^=3 then lag_sen_2_lms_3=0; 
if lag_seniority="3" & lag_labour_market_state=3 then lag_sen_3_lms_3=1; if lag_seniority^="3" | lag_labour_market_state^=3 then lag_sen_3_lms_3=0; 
if lag_seniority="4" & lag_labour_market_state=3 then lag_sen_4_lms_3=1; if lag_seniority^="4" | lag_labour_market_state^=3 then lag_sen_4_lms_3=0; 

if lag_seniority="0" & lag_labour_market_state=4 then lag_sen_0_lms_4=1; if lag_seniority^="0" | lag_labour_market_state^=4 then lag_sen_0_lms_4=0; 
if lag_seniority="5" & lag_labour_market_state=4 then lag_sen_5_lms_4=1; if lag_seniority^="5" | lag_labour_market_state^=4 then lag_sen_5_lms_4=0; 
if lag_seniority="1" & lag_labour_market_state=4 then lag_sen_1_lms_4=1; if lag_seniority^="1" | lag_labour_market_state^=4 then lag_sen_1_lms_4=0; 
if lag_seniority="2" & lag_labour_market_state=4 then lag_sen_2_lms_4=1; if lag_seniority^="2" | lag_labour_market_state^=4 then lag_sen_2_lms_4=0; 
if lag_seniority="3" & lag_labour_market_state=4 then lag_sen_3_lms_4=1; if lag_seniority^="3" | lag_labour_market_state^=4 then lag_sen_3_lms_4=0; 
if lag_seniority="4" & lag_labour_market_state=4 then lag_sen_4_lms_4=1; if lag_seniority^="4" | lag_labour_market_state^=4 then lag_sen_4_lms_4=0; 

if lag_seniority="0" & lag_labour_market_state=5 then lag_sen_0_lms_5=1; if lag_seniority^="0" | lag_labour_market_state^=5 then lag_sen_0_lms_5=0; 
if lag_seniority="5" & lag_labour_market_state=5 then lag_sen_5_lms_5=1; if lag_seniority^="5" | lag_labour_market_state^=5 then lag_sen_5_lms_5=0; 
if lag_seniority="1" & lag_labour_market_state=5 then lag_sen_1_lms_5=1; if lag_seniority^="1" | lag_labour_market_state^=5 then lag_sen_1_lms_5=0; 
if lag_seniority="2" & lag_labour_market_state=5 then lag_sen_2_lms_5=1; if lag_seniority^="2" | lag_labour_market_state^=5 then lag_sen_2_lms_5=0; 
if lag_seniority="3" & lag_labour_market_state=5 then lag_sen_3_lms_5=1; if lag_seniority^="3" | lag_labour_market_state^=5 then lag_sen_3_lms_5=0; 
if lag_seniority="4" & lag_labour_market_state=5 then lag_sen_4_lms_5=1; if lag_seniority^="4" | lag_labour_market_state^=5 then lag_sen_4_lms_5=0; 


run; 
data valid_women; 
set valid_women; 
		if missing(lag_seniority) | lag_seniority="-" then lag_seniority="-1";
		/*Workers that do not report their seniority or income get the lowest seniority and sectorial income quartile*/
		if lag_labour_market_state^=4 & lag_labour_market_state^=5 
			then do; 
				if lag_seniority="-1" 
					then lag_seniority="1"; 
				if lag_sect_quartile=0 
					then lag_sect_quartile=1; 
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




if lag_seniority="0" & lag_labour_market_state=1 then lag_sen_0_lms_1=1; if lag_seniority^="0" | lag_labour_market_state^=1 then lag_sen_0_lms_1=0; 
if lag_seniority="5" & lag_labour_market_state=1 then lag_sen_5_lms_1=1; if lag_seniority^="5" | lag_labour_market_state^=1 then lag_sen_5_lms_1=0; 
if lag_seniority="1" & lag_labour_market_state=1 then lag_sen_1_lms_1=1; if lag_seniority^="1" | lag_labour_market_state^=1 then lag_sen_1_lms_1=0; 
if lag_seniority="2" & lag_labour_market_state=1 then lag_sen_2_lms_1=1; if lag_seniority^="2" | lag_labour_market_state^=1 then lag_sen_2_lms_1=0; 
if lag_seniority="3" & lag_labour_market_state=1 then lag_sen_3_lms_1=1; if lag_seniority^="3" | lag_labour_market_state^=1 then lag_sen_3_lms_1=0; 
if lag_seniority="4" & lag_labour_market_state=1 then lag_sen_4_lms_1=1; if lag_seniority^="4" | lag_labour_market_state^=1 then lag_sen_4_lms_1=0; 

if lag_seniority="0" & lag_labour_market_state=2 then lag_sen_0_lms_2=1; if lag_seniority^="0" | lag_labour_market_state^=2 then lag_sen_0_lms_2=0; 
if lag_seniority="5" & lag_labour_market_state=2 then lag_sen_5_lms_2=1; if lag_seniority^="5" | lag_labour_market_state^=2 then lag_sen_5_lms_2=0; 
if lag_seniority="1" & lag_labour_market_state=2 then lag_sen_1_lms_2=1; if lag_seniority^="1" | lag_labour_market_state^=2 then lag_sen_1_lms_2=0; 
if lag_seniority="2" & lag_labour_market_state=2 then lag_sen_2_lms_2=1; if lag_seniority^="2" | lag_labour_market_state^=2 then lag_sen_2_lms_2=0; 
if lag_seniority="3" & lag_labour_market_state=2 then lag_sen_3_lms_2=1; if lag_seniority^="3" | lag_labour_market_state^=2 then lag_sen_3_lms_2=0; 
if lag_seniority="4" & lag_labour_market_state=2 then lag_sen_4_lms_2=1; if lag_seniority^="4" | lag_labour_market_state^=2 then lag_sen_4_lms_2=0; 

if lag_seniority="0" & lag_labour_market_state=3 then lag_sen_0_lms_3=1; if lag_seniority^="0" | lag_labour_market_state^=3 then lag_sen_0_lms_3=0; 
if lag_seniority="5" & lag_labour_market_state=3 then lag_sen_5_lms_3=1; if lag_seniority^="5" | lag_labour_market_state^=3 then lag_sen_5_lms_3=0; 
if lag_seniority="1" & lag_labour_market_state=3 then lag_sen_1_lms_3=1; if lag_seniority^="1" | lag_labour_market_state^=3 then lag_sen_1_lms_3=0; 
if lag_seniority="2" & lag_labour_market_state=3 then lag_sen_2_lms_3=1; if lag_seniority^="2" | lag_labour_market_state^=3 then lag_sen_2_lms_3=0; 
if lag_seniority="3" & lag_labour_market_state=3 then lag_sen_3_lms_3=1; if lag_seniority^="3" | lag_labour_market_state^=3 then lag_sen_3_lms_3=0; 
if lag_seniority="4" & lag_labour_market_state=3 then lag_sen_4_lms_3=1; if lag_seniority^="4" | lag_labour_market_state^=3 then lag_sen_4_lms_3=0; 

if lag_seniority="0" & lag_labour_market_state=4 then lag_sen_0_lms_4=1; if lag_seniority^="0" | lag_labour_market_state^=4 then lag_sen_0_lms_4=0; 
if lag_seniority="5" & lag_labour_market_state=4 then lag_sen_5_lms_4=1; if lag_seniority^="5" | lag_labour_market_state^=4 then lag_sen_5_lms_4=0; 
if lag_seniority="1" & lag_labour_market_state=4 then lag_sen_1_lms_4=1; if lag_seniority^="1" | lag_labour_market_state^=4 then lag_sen_1_lms_4=0; 
if lag_seniority="2" & lag_labour_market_state=4 then lag_sen_2_lms_4=1; if lag_seniority^="2" | lag_labour_market_state^=4 then lag_sen_2_lms_4=0; 
if lag_seniority="3" & lag_labour_market_state=4 then lag_sen_3_lms_4=1; if lag_seniority^="3" | lag_labour_market_state^=4 then lag_sen_3_lms_4=0; 
if lag_seniority="4" & lag_labour_market_state=4 then lag_sen_4_lms_4=1; if lag_seniority^="4" | lag_labour_market_state^=4 then lag_sen_4_lms_4=0; 

if lag_seniority="0" & lag_labour_market_state=5 then lag_sen_0_lms_5=1; if lag_seniority^="0" | lag_labour_market_state^=5 then lag_sen_0_lms_5=0; 
if lag_seniority="5" & lag_labour_market_state=5 then lag_sen_5_lms_5=1; if lag_seniority^="5" | lag_labour_market_state^=5 then lag_sen_5_lms_5=0; 
if lag_seniority="1" & lag_labour_market_state=5 then lag_sen_1_lms_5=1; if lag_seniority^="1" | lag_labour_market_state^=5 then lag_sen_1_lms_5=0; 
if lag_seniority="2" & lag_labour_market_state=5 then lag_sen_2_lms_5=1; if lag_seniority^="2" | lag_labour_market_state^=5 then lag_sen_2_lms_5=0; 
if lag_seniority="3" & lag_labour_market_state=5 then lag_sen_3_lms_5=1; if lag_seniority^="3" | lag_labour_market_state^=5 then lag_sen_3_lms_5=0; 
if lag_seniority="4" & lag_labour_market_state=5 then lag_sen_4_lms_5=1; if lag_seniority^="4" | lag_labour_market_state^=5 then lag_sen_4_lms_5=0; 
run;
/***********************************************We can now start estimating the labour-market behavioural equations**********************/

title " wage_earner, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65));
class 
formation (param=ref ref="1")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="1")
little_children_qual (param=ref ref="0")/*
lag_sect_quartile (param=ref ref="1")*/
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

lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="1")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")

was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
agegroup (param=ref ref="35")
/*lag_sect_quartile (param=ref ref="1")
from_state (param=ref ref="1")
lag_anciennete (param=ref ref="5")
*/
/*
num_child (param=ref ref="3")*/
/*out_of_education (param=ref ref="0")*/
;
model wage_earner(ref="0")= /*lag_sect_quartile lag_anciennete from_state*/ formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="wage_earner_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="wage_earner_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="wage_earner_men"; if last then delete; run;
data leo.auc_train_logit_w_earners_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_w_earners_men_12; 
set auc2; 
run;
data leo.par_est_w_earners_men_12; 
set _pe; 
run;
proc export data=leo.par_est_w_earners_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\wage_earner_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_w_earners_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_wage_earner_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_w_earners_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_wage_earner_men_12.csv"
label dbms=csv replace;  
run;
/*In the above exported datasets, you get the parameters of the behavioural equation as estimated in the training dataset, and the AUC
		statistics in both the training and validation datasets*/
/*
proc print data=leo.par_est_w_earners_men; run; 
proc print data=leo.auc_valid_logit_w_earners_men; run; 
proc print data=leo.auc_train_logit_w_earners_men; run; 
*/

title " wage_earner, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60));
class 
formation (param=ref ref="1")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="1")
little_children_qual (param=ref ref="0")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
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


lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="1")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model wage_earner(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="wage_earner_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="wage_earner_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="wage_earner_women"; if last then delete; run;
data leo.auc_train_logit_w_earners_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_w_earners_wom_12; 
set auc2; 
run;
data leo.par_est_w_earners_wom_12; 
set _pe; 
run;

proc export data=leo.par_est_w_earners_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\wage_earner_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_w_earners_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_wage_earner_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_w_earners_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_wage_earner_wom_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_w_earners_wom; run; 
proc print data=leo.auc_valid_logit_w_earners_wom; run; 
proc print data=leo.auc_train_logit_w_earners_wom; run; */



/*
dm 'odsresults; clear'; 
dm 'clear log'; */
title " independent, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65));
class 
formation (param=ref ref="3")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="2")
little_children_qual (param=ref ref="1")/*
lag_sect_quartile (param=ref ref="1")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="1")
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

lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="1")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
/*
num_child (param=ref ref="3")*/
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model independent(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="independent_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="independent_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="independent_men"; if last then delete; run;
data leo.auc_train_logit_indep_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_indep_men_12; 
set auc2; 
run;
data leo.par_est_indep_men_12; 
set _pe; 
run;


proc export data=leo.par_est_indep_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\independent_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_indep_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_independent_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_indep_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_independent_men_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_indep_men; run; 
proc print data=leo.auc_valid_logit_indep_men; run; 
proc print data=leo.auc_train_logit_indep_men; run; */


title " independent, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60));
class 
formation (param=ref ref="3")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="2")
little_children_qual (param=ref ref="1")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="1")
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


lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="1")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model independent(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="independent_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="independent_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="independent_women"; if last then delete; run;
data leo.auc_train_logit_indep_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_indep_wom_12; 
set auc2; 
run;
data leo.par_est_indep_wom_12; 
set _pe; 
run;



proc export data=leo.par_est_indep_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\independent_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_indep_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_independent_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_indep_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_independent_wom_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_indep_wom; run; 
proc print data=leo.auc_valid_logit_indep_wom; run; 
proc print data=leo.auc_train_logit_indep_wom; run; */





title " informal, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65));
class 
formation (param=ref ref="3")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="1")
partner_lab_mar_state (param=ref ref="3")
little_children_qual (param=ref ref="2+")/*
lag_sect_quartile (param=ref ref="1")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="0")
lag_sec_qua_0_lms_2 (param=ref ref="0")
lag_sec_qua_2_lms_2 (param=ref ref="0")
lag_sec_qua_3_lms_2 (param=ref ref="0")
lag_sec_qua_4_lms_2 (param=ref ref="0")
lag_sec_qua_1_lms_3 (param=ref ref="1")
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

lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="1")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
/*
num_child (param=ref ref="3")*/
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
;
model informal(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5 
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="informal_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="informal_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="informal_men"; if last then delete; run;
data leo.auc_train_logit_infor_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_infor_men_12; 
set auc2; 
run;
data leo.par_est_infor_men_12; 
set _pe; 
run;



proc export data=leo.par_est_infor_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\informal_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_infor_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_informal_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_infor_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_informal_men_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_infor_men; run; 
proc print data=leo.auc_valid_logit_infor_men; run; 
proc print data=leo.auc_train_logit_infor_men; run; */


title " informal, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60));
class 
formation (param=ref ref="3")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="1")
little_children_qual (param=ref ref="2+")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
lag_sec_qua_0_lms_1 (param=ref ref="0")
lag_sec_qua_2_lms_1 (param=ref ref="0")
lag_sec_qua_3_lms_1 (param=ref ref="0")
lag_sec_qua_4_lms_1 (param=ref ref="0")
lag_sec_qua_1_lms_2 (param=ref ref="0")
lag_sec_qua_0_lms_2 (param=ref ref="0")
lag_sec_qua_2_lms_2 (param=ref ref="0")
lag_sec_qua_3_lms_2 (param=ref ref="0")
lag_sec_qua_4_lms_2 (param=ref ref="0")
lag_sec_qua_1_lms_3 (param=ref ref="1")
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
 
lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="1")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model informal(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="informal_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="informal_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="informal_women"; if last then delete; run;
data leo.auc_train_logit_infor_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_infor_wom_12; 
set auc2; 
run;
data leo.par_est_infor_wom_12; 
set _pe; 
run;


proc export data=leo.par_est_infor_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\informal_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_infor_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_informal_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_infor_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_informal_wom_12.csv"
label dbms=csv replace;  
run; 

/*
proc print data=leo.par_est_infor_wom; run; 
proc print data=leo.auc_valid_logit_infor_wom; run; 
proc print data=leo.auc_train_logit_infor_wom; run; */





title " unemployed, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65));
class 
formation (param=ref ref="3")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="5")
partner_lab_mar_state (param=ref ref="-1")
little_children_qual (param=ref ref="1")/*
lag_sect_quartile (param=ref ref="1")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
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
lag_sec_qua_0_lms_4 (param=ref ref="1")
lag_sec_qua_2_lms_4 (param=ref ref="0")
lag_sec_qua_3_lms_4 (param=ref ref="0")
lag_sec_qua_4_lms_4 (param=ref ref="0")
lag_sec_qua_1_lms_5 (param=ref ref="0")
lag_sec_qua_0_lms_5 (param=ref ref="0")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")

lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="1")
lag_sen_0_lms_5 (param=ref ref="0")
/*
num_child (param=ref ref="3")*/
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model unemployed(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5 
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;
ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="unemployed_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="unemployed_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="unemployed_men"; if last then delete; run;
data leo.auc_train_logit_unem_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_unem_men_12; 
set auc2; 
run;
data leo.par_est_unem_men_12; 
set _pe; 
run;


proc export data=leo.par_est_unem_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\unemployed_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_unem_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_unemployed_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_unem_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_unemployed_men_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_unem_men; run; 
proc print data=leo.auc_valid_logit_unem_men; run; 
proc print data=leo.auc_train_logit_unem_men; run; */


title " unemployed, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60));
class 
formation (param=ref ref="3")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="5")
partner_lab_mar_state (param=ref ref="-1")
little_children_qual (param=ref ref="2+")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
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
lag_sec_qua_0_lms_4 (param=ref ref="1")
lag_sec_qua_2_lms_4 (param=ref ref="0")
lag_sec_qua_3_lms_4 (param=ref ref="0")
lag_sec_qua_4_lms_4 (param=ref ref="0")
lag_sec_qua_1_lms_5 (param=ref ref="0")
lag_sec_qua_0_lms_5 (param=ref ref="0")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")


lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")
out_of_education (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="1")
lag_sen_0_lms_5 (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model unemployed(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5 
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="unemployed_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="unemployed_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="unemployed_women"; if last then delete; run;
data leo.auc_train_logit_unem_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_unem_wom_12; 
set auc2; 
run;
data leo.par_est_unem_wom_12; 
set _pe; 
run;

proc export data=leo.par_est_unem_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\unemployed_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_unem_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_unemployed_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_unem_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_unemployed_wom_12.csv"
label dbms=csv replace;  
run; 

/*
proc print data=leo.par_est_unem_wom; run; 
proc print data=leo.auc_valid_logit_unem_wom; run; 
proc print data=leo.auc_train_logit_unem_wom; run; 
*/



title " inactive, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65));
class 
formation (param=ref ref="3")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="5")
partner_lab_mar_state (param=ref ref="-1")
little_children_qual (param=ref ref="1")/*
lag_sect_quartile (param=ref ref="1")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
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
lag_sec_qua_0_lms_5 (param=ref ref="1")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")


lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="1")
/*
num_child (param=ref ref="3")*/
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model inactive(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="inactive_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="inactive_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="inactive_men"; if last then delete; run;
data leo.auc_train_logit_inac_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_inac_men_12; 
set auc2; 
run;
data leo.par_est_inac_men_12; 
set _pe; 
run;


proc export data=leo.par_est_inac_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\inactive_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_inac_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_inactive_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_inac_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_inactive_men_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_inac_men; run; 
proc print data=leo.auc_valid_logit_inac_men; run; 
proc print data=leo.auc_train_logit_inac_men; run; */


title " inactive, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60));
class 
formation (param=ref ref="3")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="1")
little_children_qual (param=ref ref="2+")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
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
lag_sec_qua_0_lms_5 (param=ref ref="1")
lag_sec_qua_2_lms_5 (param=ref ref="0")
lag_sec_qua_3_lms_5 (param=ref ref="0")
lag_sec_qua_4_lms_5 (param=ref ref="0")



lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="1")
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="0")
;
model inactive(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5 
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 

ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="inactive_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="inactive_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="inactive_women"; if last then delete; run;
data leo.auc_train_logit_inac_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_inac_wom_12; 
set auc2; 
run;
data leo.par_est_inac_wom_12; 
set _pe; 
run;


proc export data=leo.par_est_inac_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\inactive_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_inac_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_inactive_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_inac_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_inactive_wom_12.csv"
label dbms=csv replace;  
run; 









title " Civil servant, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65) & labour_market_state=1);
class 
formation (param=ref ref="3")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="5")
partner_lab_mar_state (param=ref ref="-1")
little_children_qual (param=ref ref="1")/*
lag_sect_quartile (param=ref ref="1")*/
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


lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="1")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
/*
num_child (param=ref ref="3")*/
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="1")
was_inf_indep (param=ref ref="0")
;
model civil_servant(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="civil_servant_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="civil_servant_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="civil_servant_men"; if last then delete; run;
data leo.auc_train_logit_civ_ser_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_civ_ser_men_12; 
set auc2; 
run;
data leo.par_est_civ_ser_men_12; 
set _pe; 
run;


proc export data=leo.par_est_civ_ser_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\civil_servant_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_civ_ser_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_civil_servant_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_civ_ser_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_civil_servant_men_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_civ_ser_men; run; 
proc print data=leo.auc_valid_logit_civ_ser_men; run; 
proc print data=leo.auc_train_logit_civ_ser_men; run; */


title " civil_servant, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60)& labour_market_state=1);
class 
formation (param=ref ref="3")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="1")
little_children_qual (param=ref ref="2+")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
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



lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="1")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="0")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="1")
was_inf_indep (param=ref ref="0")
;
model civil_servant(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5 
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 

ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="civil_servant_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="civil_servant_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="civil_servant_women"; if last then delete; run;
data leo.auc_train_logit_civ_ser_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_civ_ser_wom_12; 
set auc2; 
run;
data leo.par_est_civ_ser_wom_12; 
set _pe; 
run;


proc export data=leo.par_est_civ_ser_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\civil_servant_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_civ_ser_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_civil_servant_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_civ_ser_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_civil_servant_wom_12.csv"
label dbms=csv replace;  
run; 










title " Informal independent, men  "; 
proc logistic data=train;
 weight pondera /norm; 
where (ch04=1&(16<=ageconti<65) & labour_market_state=3);
class 
formation (param=ref ref="3")/*
from_state (param=ref ref="1")*/
marital_status (param=ref ref="5")
partner_lab_mar_state (param=ref ref="-1")
little_children_qual (param=ref ref="1")/*
lag_sect_quartile (param=ref ref="1")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
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
lag_sec_qua_2_lms_3 (param=ref ref="1")
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


lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="1")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
/*
num_child (param=ref ref="3")*/
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="1")
;
model informal_independent(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual  /*lag_sect_quartile*from_state lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education 
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 
ods output close; 

data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="civil_servant_men"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="civil_servant_men"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="civil_servant_men"; if last then delete; run;
data leo.auc_train_logit_inf_indep_men_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_inf_indep_men_12; 
set auc2; 
run;
data leo.par_est_inf_indep_men_12; 
set _pe; 
run;


proc export data=leo.par_est_inf_indep_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\civil_servant_men_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_inf_indep_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_civil_servant_men_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_inf_indep_men_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_civil_servant_men_12.csv"
label dbms=csv replace;  
run; 
/*
proc print data=leo.par_est_inf_indep_men; run; 
proc print data=leo.auc_valid_logit_inf_indep_men; run; 
proc print data=leo.auc_train_logit_inf_indep_men; run; */


title " Informal independent, women"; 
proc logistic data=train_women;
 weight pondera /norm; 
where (ch04=2&(16<=ageconti<60)& labour_market_state=3);
class 
formation (param=ref ref="3")
/*from_state (param=ref ref="1")*/
marital_status (param=ref ref="2")
partner_lab_mar_state (param=ref ref="1")
little_children_qual (param=ref ref="2+")
/*lag_sect_quartile (param=ref ref="1")*/
/*
num_child (param=ref ref="3")*/
lag_sec_qua_1_lms_1 (param=ref ref="0")
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
lag_sec_qua_2_lms_3 (param=ref ref="1")
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



lag_sen_1_lms_1 (param=ref ref="0")
lag_sen_5_lms_1 (param=ref ref="0")
lag_sen_2_lms_1 (param=ref ref="0")
lag_sen_3_lms_1 (param=ref ref="0")
lag_sen_4_lms_1 (param=ref ref="0")
lag_sen_1_lms_2 (param=ref ref="0")
lag_sen_5_lms_2 (param=ref ref="0")
lag_sen_2_lms_2 (param=ref ref="0")
lag_sen_3_lms_2 (param=ref ref="0")
lag_sen_4_lms_2 (param=ref ref="0")
lag_sen_1_lms_3 (param=ref ref="0")
lag_sen_5_lms_3 (param=ref ref="1")
lag_sen_2_lms_3 (param=ref ref="0")
lag_sen_3_lms_3 (param=ref ref="0")
lag_sen_4_lms_3 (param=ref ref="0")
lag_sen_1_lms_4 (param=ref ref="0")
lag_sen_5_lms_4 (param=ref ref="0")
lag_sen_2_lms_4 (param=ref ref="0")
lag_sen_3_lms_4 (param=ref ref="0")
lag_sen_4_lms_4 (param=ref ref="0")
lag_sen_1_lms_5 (param=ref ref="0")
lag_sen_5_lms_5 (param=ref ref="0")
lag_sen_2_lms_5 (param=ref ref="0")
lag_sen_3_lms_5 (param=ref ref="0")
lag_sen_4_lms_5 (param=ref ref="0")

lag_sen_0_lms_1 (param=ref ref="0")
lag_sen_0_lms_2 (param=ref ref="0")
lag_sen_0_lms_3 (param=ref ref="0")
lag_sen_0_lms_4 (param=ref ref="0")
lag_sen_0_lms_5 (param=ref ref="0")
out_of_education (param=ref ref="0")
agegroup (param=ref ref="35")
was_civil_servant (param=ref ref="0")
was_inf_indep (param=ref ref="1")
;
model informal_independent(ref="0")= formation agegroup marital_status partner_lab_mar_state little_children_qual /*lag_sect_quartile*/ /*enf_bas_age*/ /*from_state*/ out_of_education
lag_sec_qua_0_lms_1 lag_sec_qua_1_lms_1 lag_sec_qua_2_lms_1 lag_sec_qua_3_lms_1 lag_sec_qua_4_lms_1 lag_sec_qua_0_lms_2 lag_sec_qua_1_lms_2 lag_sec_qua_2_lms_2 lag_sec_qua_3_lms_2 lag_sec_qua_4_lms_2 lag_sec_qua_0_lms_3 lag_sec_qua_1_lms_3 lag_sec_qua_2_lms_3 lag_sec_qua_3_lms_3 lag_sec_qua_4_lms_3  lag_sec_qua_0_lms_4 lag_sec_qua_1_lms_4 lag_sec_qua_2_lms_4 lag_sec_qua_3_lms_4 lag_sec_qua_4_lms_4 lag_sec_qua_0_lms_5 lag_sec_qua_1_lms_5 lag_sec_qua_2_lms_5 lag_sec_qua_3_lms_5 lag_sec_qua_4_lms_5 
lag_sen_0_lms_1 lag_sen_0_lms_2 lag_sen_0_lms_3 lag_sen_0_lms_4 lag_sen_0_lms_5
lag_sen_5_lms_1 lag_sen_1_lms_1 lag_sen_2_lms_1 lag_sen_3_lms_1 lag_sen_4_lms_1 lag_sen_5_lms_2 lag_sen_1_lms_2 lag_sen_2_lms_2 lag_sen_3_lms_2 lag_sen_4_lms_2 lag_sen_5_lms_3 lag_sen_1_lms_3 lag_sen_2_lms_3 lag_sen_3_lms_3 lag_sen_4_lms_3  lag_sen_5_lms_4 lag_sen_1_lms_4 lag_sen_2_lms_4 lag_sen_3_lms_4 lag_sen_4_lms_4 lag_sen_5_lms_5 lag_sen_1_lms_5 lag_sen_2_lms_5 lag_sen_3_lms_5 lag_sen_4_lms_5
was_civil_servant was_inf_indep/ selection=stepwise slstay=0.10 slentry=0.10 scale=none clparm=wald clodds=pl rsq outroc=train_roc;

ods output close;  
score data=valid_women out=valpred outroc=valid_roc fitstat; roc; ODS OUTPUT ROCASSOCIATION = AUC  ScoreFitStat=AUC2  ParameterEstimates =_pe;
run; quit; 

ods output close; 
data AUC; length regression $32.; length dataset $32.;  set AUC; Regression="civil_servant_women"; run; 
data AUC2; length regression $32.; length dataset $32.;  set AUC2; Regression="civil_servant_women"; run; 
data _pe; length regression $32.; length dataset $32.; length classval0 $32.; length classval1 $32.; set _pe end=last; Regression="civil_servant_women"; if last then delete; run;
data leo.auc_train_logit_inf_indep_wom_12; 
set auc; where ROCMODEL="Model"; 
run; 
data leo.auc_valid_logit_inf_indep_wom_12; 
set auc2; 
run;
data leo.par_est_inf_indep_wom_12; 
set _pe; 
run;


proc export data=leo.par_est_inf_indep_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\Paramètres\civil_servant_wom_12.csv"
label dbms=csv replace;  
run;
proc export data=leo.auc_valid_logit_inf_indep_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_valid\AUC_V_civil_servant_wom_12.csv"
label dbms=csv replace;  
run; 
proc export data=leo.auc_train_logit_inf_indep_wom_12 outfile="H:\Leonardo_orléans\Sorties_SAS\régressions\Équations comportementales\AUC_train\AUC_T_civil_servant_wom_12.csv"
label dbms=csv replace;  
run; 
