dm 'odsresults; clear'; 
dm 'clear log'; 
%macro age_group_and_gender_for_indep (indata,period,agegroup_var,gender_var); 

proc freq data=&indata.; 
	where period=&period. & ageconti>=16;
	weight pondera; 
		table &gender_var.*&agegroup_var. / out=demographic_&period. noprint; 
run; 
data men_&period.; 
set demographic_&period.; 
	where &gender_var.=1; 
		drop percent; 
		rename count=men_&period.; 
		if &agegroup_var.=1 | &agegroup_var.=300 
			then delete; 
run; 
data men_&period.; 
set men_&period.; 
	drop &gender_var.; 
run; 
data women_&period.; 
set demographic_&period.; 
	where &gender_var.=2; 
		drop percent; 
		rename count=women_&period.; 
		if &agegroup_var.=1 | &agegroup_var.=300 
			then delete; 
run; 
data women_&period.; 
set women_&period.; 
	drop &gender_var.; 
run; 
%mend;
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,74,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,73,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,72,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,71,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,70,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,69,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,68,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,67,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,66,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,65,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,64,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,63,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,62,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,61,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,60,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,59,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,58,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,57,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,56,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,55,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,54,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,53,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2021,52,agegroup,ch04); 
data men_2016_2021; 
merge men_74-men_52; 
	by agegroup; 
run; 
data women_2016_2021; 
merge women_74-women_52; 
	by agegroup; 
run; 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,48,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,47,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,46,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,45,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,44,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,43,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,42,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,41,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,40,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,39,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,38,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,37,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,36,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,35,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,34,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,33,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,32,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,31,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,30,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,29,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,28,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,27,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,26,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,25,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,24,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,23,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,22,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,21,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,20,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,19,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,18,agegroup,ch04); /*
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,17,agegroup,ch04); */
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,16,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,15,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,14,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,13,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,12,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,11,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,10,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,9,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,8,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,7,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,6,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,5,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,4,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,3,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,2,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_data_formatted_2003_2015,1,agegroup,ch04); 

data men_2003_2015; 
merge men_48-men_18 men_1-men_16;
	by agegroup; 
run; 

data women_2003_2015; 
	merge women_48-women_18 women_1-women_16; 
	by agegroup; 
run; 
data men_2003_2015;
set men_2003_2015; 
	men_17= round((men_18 + men_16)/2); 
run; 
data women_2003_2015; 
set women_2003_2015; 
	women_17=round((women_18 + women_16)/2); 
run; 
data men_2003_2015;
	retain agegroup men_48-men_10 men_9 men_8 men_7 men_6 men_5 men_4 men_3 men_2 men_1; 
set men_2003_2015; 
run; 
data women_2003_2015;
	retain agegroup women_48-women_10 women_9 women_8 women_7 women_6 women_5 women_4 women_3 women_2 women_1; 
set women_2003_2015; 
run; 
proc export data=men_2016_2021
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\demographic_men_post_2016.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=women_2016_2021
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\demographic_women_post_2016.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=men_2003_2015
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\demographic_men_2003_2015.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=women_2003_2015
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\demographic_women_2003_2015.xlsx' 
	dbms=xlsx replace; 
run; 
%macro independent_proportion(indata,period,agegroup_var,gender_var); 
data &indata.; 
set &indata.; 
	indep=0;
		if estado=1 & (cat_ocup=1 | cat_ocup=2) 
			then indep=1; 
run; 
proc freq data=&indata.; 
	where period=&period. & ageconti>=16 & &gender_var.=1;
	weight pondera; 
		table indep*&agegroup_var. / outpct out=indep_men_&period. noprint; 
run; 
data indep_men_&period.; 
set indep_men_&period.; 
	if indep=0 
		then delete; 
	men_&period.=pct_col/100; 
	if &agegroup_var.=1 | &agegroup_var.=300 
		then delete; 
run; 
data indep_men_&period.; 
set indep_men_&period.; 
	keep &agegroup_var. men_&period.; 
run; 

proc freq data=&indata.; 
	where period=&period. & ageconti>=16 & &gender_var.=2;
	weight pondera; 
		table indep*&agegroup_var. / outpct out=indep_women_&period. noprint; 
run; 
data indep_women_&period.; 
set indep_women_&period.; 
	if indep=0 
		then delete; 
	women_&period.=pct_col/100; 
	if &agegroup_var.=1 | &agegroup_var.=300 
		then delete; 
run; 
data indep_women_&period.; 
set indep_women_&period.; 
	keep &agegroup_var. women_&period.; 
run; 

%mend; 


%independent_proportion(leo.eph_formatted_2016_2021,74,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,73,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,72,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,71,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,70,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,69,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,68,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,67,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,66,agegroup,ch04);
%independent_proportion(leo.eph_formatted_2016_2021,66,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,65,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,64,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,63,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,62,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,61,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,60,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,59,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,58,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,57,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,56,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,55,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,54,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,53,agegroup,ch04); 
%independent_proportion(leo.eph_formatted_2016_2021,52,agegroup,ch04); 

data indep_women_2016_2021; 
merge indep_women_74-indep_women_52; 
	by agegroup; 
run; 

data indep_men_2016_2021; 
merge indep_men_74-indep_men_52; 
	by agegroup; 
run; 


%independent_proportion(leo.eph_data_formatted_2003_2015,48,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,47,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,46,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,45,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,44,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,43,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,42,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,41,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,40,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,39,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,38,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,37,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,36,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,35,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,34,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,33,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,32,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,31,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,30,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,29,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,28,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,27,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,26,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,25,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,24,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,23,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,22,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,21,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,20,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,19,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,18,agegroup,ch04); /*
%independent_proportion(leo.eph_data_formatted_2003_2015,17,agegroup,ch04); */
%independent_proportion(leo.eph_data_formatted_2003_2015,16,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,15,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,14,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,13,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,12,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,11,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,10,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,9,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,8,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,7,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,6,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,5,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,4,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,3,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,2,agegroup,ch04); 
%independent_proportion(leo.eph_data_formatted_2003_2015,1,agegroup,ch04); 

data indep_men_2003_2015; 
merge indep_men_48-indep_men_18 indep_men_1-indep_men_16;
	by agegroup; 
run; 

data indep_women_2003_2015; 
	merge indep_women_48-indep_women_18 indep_women_1-indep_women_16; 
	by agegroup; 
run; 
data indep_men_2003_2015;
set indep_men_2003_2015; 
	indep_men_17= round((indep_men_18 + indep_men_16)/2); 
run; 
data indep_women_2003_2015; 
set indep_women_2003_2015; 
	indep_women_17=round((indep_women_18 + indep_women_16)/2); 
run; 
data indep_men_2003_2015;
	retain agegroup indep_men_48-indep_men_10 indep_men_9 indep_men_8 indep_men_7 indep_men_6 indep_men_5 indep_men_4 indep_men_3 indep_men_2 indep_men_1; 
set indep_men_2003_2015; 
run; 
data indep_women_2003_2015;
	retain agegroup indep_women_48-indep_women_10 indep_women_9 indep_women_8 indep_women_7 indep_women_6 indep_women_5 indep_women_4 indep_women_3 indep_women_2 indep_women_1; 
set indep_women_2003_2015; 
run; 


proc export data=indep_men_2003_2015
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\indep_demographic_men_2003_2015.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=indep_women_2003_2015
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\indep_demographic_women_2003_2015.xlsx' 
	dbms=xlsx replace; 
run; 


proc export data=indep_men_2016_2021
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\indep_men_post_2016.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=indep_women_2016_2021
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\indep_women_post_2016.xlsx' 
	dbms=xlsx replace; 
run; 

proc freq data=leo.eph_formatted_2016_2021; 
	weight pondera; 
	where ageconti>=16 & ageconti<70; 
		table period*agegroup /outpct out=demographic; 
run; 
proc print data=demographic; run;

%macro age_group_for_indep (indata,period,agegroup_var); 

data demographic_&period.; 
set demographic; 
	if period^=&period. 
		then delete; 
	drop pct_row percent pct_col period; 
	rename count=pop_&period.; 
run; 


proc freq data=&indata.; 
	weight pondera; 
	where ageconti>=16 & ageconti<70 & period=&period.; 
		table indep*&agegroup_var. /outpct out=indep_&period. noprint; 
run; 

data indep_&period.; 
set indep_&period.; 
	if indep=0 
		then delete; 
	indep_&period.=pct_col/100; 
	if &agegroup_var.=1 | &agegroup_var.=300 
		then delete; 
run; 
data indep_&period.; 
set indep_&period.; 
	keep &agegroup_var. indep_&period.; 
run; 

%mend; 
%age_group_for_indep (leo.eph_formatted_2016_2021,52,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,53,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,54,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,55,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,56,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,57,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,58,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,59,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,60,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,61,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,62,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,63,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,64,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,65,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,66,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,67,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,68,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,69,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,70,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,71,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,72,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,73,agegroup); 
%age_group_for_indep (leo.eph_formatted_2016_2021,74,agegroup); 

data leo.indep_population_post_2016; 
merge indep_74-indep_52; 
	by agegroup; 
run; 
data leo.demographic_post_2016; 
merge demographic_74-demographic_52; 
	by agegroup; 
run; 





proc export data=leo.indep_population_post_2016
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\indep_population_post_2016.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=leo.demographic_post_2016
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\demographic_post_2016.xlsx' 
	dbms=xlsx replace; 
run;  
proc freq data=leo.eph_data_formatted_2003_2015; 
	weight pondera; 
	where ageconti>=16 & ageconti<70; 
		table period*agegroup /outpct out=demographic; 
run; 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,48,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,47,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,46,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,45,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,44,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,43,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,42,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,41,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,40,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,39,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,38,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,37,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,36,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,35,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,34,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,33,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,32,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,31,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,30,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,29,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,28,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,27,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,26,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,25,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,24,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,23,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,22,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,21,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,20,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,19,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,18,agegroup); /*
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,17,agegroup); */
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,16,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,15,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,14,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,13,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,12,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,11,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,10,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,9,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,8,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,7,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,6,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,5,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,4,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,3,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,2,agegroup); 
%age_group_for_Indep(leo.eph_data_formatted_2003_2015,1,agegroup); 

data leo.indep_population_2003_2015; 
merge indep_48-indep_18 indep_1-indep_16;
	by agegroup; 
run; 

data leo.indep_population_2003_2015; 
set leo.indep_population_2003_2015; 
	indep_17=((indep_18+indep_16)/2);
run; 

data leo.demographic_2003_2015; 
merge demographic_48-demographic_18 demographic_1-demographic_16;
	by agegroup; 
run; 

data leo.demographic_2003_2015; 
set leo.demographic_2003_2015; 
	pop_17=round((pop_18+pop_16)/2);
run; 



data leo.indep_population_2003_2015;
	retain agegroup indep_48-indep_10 indep_9 indep_8 indep_7 indep_6 indep_5 indep_4 indep_3 indep_2 indep_1; 
set leo.indep_population_2003_2015; 
run; 
data leo.demographic_2003_2015;
	retain agegroup pop_48-pop_10 pop_9 pop_8 pop_7 pop_6 pop_5 pop_4 pop_3 pop_2 pop_1; 
set leo.demographic_2003_2015; 
run; 
proc print data=leo.indep_population_2003_2015; run; 
proc print data=leo.demographic_2003_2015; run; 
proc export data=leo.indep_population_2003_2015
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\indep_population_2003_2015.xlsx' 
	dbms=xlsx replace; 
run; 

proc export data=leo.demographic_2003_2015
	outfile='C:\Users\Leonardo\Documents\Excel_files_for_MISSAR_Private\Social_security_data\Demographic_data\demographic_2003_2015.xlsx' 
	dbms=xlsx replace; 
run; 
