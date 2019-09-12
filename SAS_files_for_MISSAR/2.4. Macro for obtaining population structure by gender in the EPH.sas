dm 'odsresults; clear'; 
dm 'clear log'; 
%macro age_group_and_gender_for_indep (indata,period,agegroup_var,gender_var); 

proc freq data=&indata.; 
	where period=&period. & ageconti>=15;
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
proc freq data=leo.eph_formatted_2016_2019; 
table ch06*ageconti; 
run; 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,63,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,62,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,61,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,60,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,59,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,58,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,57,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,56,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,55,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,54,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,53,agegroup,ch04); 
%age_group_and_gender_for_indep(leo.eph_formatted_2016_2019,52,agegroup,ch04); 
data men_2016_2019; 
merge men_63-men_52; 
	by agegroup; 
run; 
data women_2016_2019; 
merge women_63-women_52; 
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

proc print data=men_2016_2019; run; 
proc print data=women_2016_2019; run; 
proc print data=men_2003_2015; run; 
proc print data=women_2003_2015; run; 


proc export data=men_2016_2019
	outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\Historical_indexes\Computed_proportions_of_monotributistas_and_autonomous_workers\demographic_men_post_2016.csv' 
	dbms=csv replace; 
run; 

proc export data=women_2016_2019
	outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\Historical_indexes\Computed_proportions_of_monotributistas_and_autonomous_workers\demographic_women_post_2016.csv' 
	dbms=csv replace; 
run; 

proc export data=men_2003_2015
	outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\Historical_indexes\Computed_proportions_of_monotributistas_and_autonomous_workers\demographic_men_2003_2015.csv' 
	dbms=csv replace; 
run; 

proc export data=women_2003_2015
	outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\Historical_indexes\Computed_proportions_of_monotributistas_and_autonomous_workers\demographic_women_2003_2015.csv' 
	dbms=csv replace; 
run; 
