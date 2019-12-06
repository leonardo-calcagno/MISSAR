 
DATA mean_wages; 
set leo.eph_formatted_2016_2019; 
		ITL=p21+tot_p12; 
		if itl<0 then itl=0; 
	keep ITL p21 tot_p12 ano4 trimestre id household labour_market_state ch04 estado cat_ocup hhstate ageconti pondera period; 
run; 
dm 'odsresults; clear'; 
dm 'clear log'; 

proc format ;
value categories
0="Total population"
1="Total formal wage-earners"
2="Total formal independent"
3="Total informal"
10="Total men"
20="Total women"
11="Male formal wage-earners"
12="Male formal independent"
13="Male informal"
21="Female formal wage-earners"
22="Female formal independent"
23="Female informal"
;
run ;
%macro mean_wages_post_2016 (year,quarter,period);
proc means data=mean_wages noprint; 
	where trimestre=&quarter. & ano4=&year.  & itl>0 & labour_market_state^=4 & labour_market_state^=5; 
	weight pondera; 
	class ch04 labour_market_state;
		var itl;
		output out=mean_&period. mean=mean_wage_&period.;
run; 
data mean_&period.; 
set mean_&period.; 
	drop _type_ _freq_; 
	if missing(ch04) 
		then do; 
			if missing(labour_market_state)
				then category=0; 
			if labour_market_state=1 
				then category=1; 
			if labour_market_state=2 
				then category=2; 
			if labour_market_state=3
				then category=3; 
		end;
	if ch04=1 
		then do; 
			if missing(labour_market_state)
				then category=10;  
			if labour_market_state=1 
				then category=11; 
			if labour_market_state=2 
				then category=12; 
			if labour_market_state=3
				then category=13; 
		end; 
	if ch04=2 
		then do; 
			if missing(labour_market_state)
				then category=20;  
			if labour_market_state=1 
				then category=21; 
			if labour_market_state=2 
				then category=22; 
			if labour_market_state=3
				then category=23; 
		end; 
run; 
proc sort data=mean_&period.; 
	by category; 
run; 
%mend; 
%mean_wages_post_2016 (2019,2,64); 
%mean_wages_post_2016 (2019,1,63); 
%mean_wages_post_2016 (2018,4,62); 
%mean_wages_post_2016 (2018,3,61); 
%mean_wages_post_2016 (2018,2,60); 
%mean_wages_post_2016 (2018,1,59); 
%mean_wages_post_2016 (2017,4,58); 
%mean_wages_post_2016 (2017,3,57); 
%mean_wages_post_2016 (2017,2,56); 
%mean_wages_post_2016 (2017,1,55); 
%mean_wages_post_2016 (2016,4,54); 
%mean_wages_post_2016 (2016,3,53); 
%mean_wages_post_2016 (2016,2,52);
data mean_wage_categories; 
merge mean_52-mean_64; 
by category; 
	drop labour_market_state ch04; 
run; 
data mean_wage_categories; 
retain category mean_wage_52-mean_wage_64;
set mean_wage_categories; 
format category categories.;
run; 
ods excel file="C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\Excel_files_for_MISSAR\Mean_wage_post_2016.xlsx";
proc print data=mean_wage_categories;
run;
ods excel close;

