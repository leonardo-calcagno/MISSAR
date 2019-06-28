
/*********************************Here, we carry out most of the macro-alignment of our prospective and retrospective microsimulation modules.
		In our alignment by sorting procedures, we distribute individuals among various possible states whiel respecting some proportions. 
		In this file, we compute these aggregate proportions on various waves of the EPH (1974-2017).*********************************/
/*First, we work with the EPhc (2003-2015). We priorise yearly datasets, as it lowers computation times. We first divide the working-age
		population into five-year age groups.*/
%macro agegroups (indata); 
data &indata.; 
set &indata.; 
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
run; 

%mend; 
%agegroups(leo.eph_data_formatted_2003); 
%agegroups(leo.eph_data_formatted_2004); 
%agegroups(leo.eph_data_formatted_2005); 
%agegroups(leo.eph_data_formatted_2006); 
%agegroups(leo.eph_data_formatted_2007); 
%agegroups(leo.eph_data_formatted_2008); 
%agegroups(leo.eph_data_formatted_2009); 
%agegroups(leo.eph_data_formatted_2010); 
%agegroups(leo.eph_data_formatted_2011); 
%agegroups(leo.eph_data_formatted_2012); 
%agegroups(leo.eph_data_formatted_2013); 
%agegroups(leo.eph_data_formatted_2014); 
%agegroups(leo.eph_data_formatted_2015); 
/*****************************We then compute the distribution of working-age individuals (16-69) among five labour-market states
		(formal wage-earners, formal sector independent workers, informal workers, the unemployed and the inactive), separately by gender.
*****************************/
 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
/*We exclude people aged 19 or less with a complete university education, as they are most likely misreporting their education level.*/
where ( (ch04=1) & (period=1) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_1;
run; 


proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=1) & (period=2) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=3) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=4) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=5) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=6) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=7) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=8) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=9) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=10) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=11) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=12) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=13) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=14) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=1) & (period=15) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=1) & (period=16) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=1) & (period=18) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=19) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=20) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=21) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=22) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=23) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=24) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=25) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=26) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_26; 
run;
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=27) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=28) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=29) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=30) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=31) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=32) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=33) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=34) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=35) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_35; 
run; 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=36) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=37) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=38) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=39) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=40) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=41) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=42) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_42; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=43) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=44) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=45) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_45; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=46) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=1) & (period=47) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_47; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=1) & (period=48) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_men_48; 
run; 




data lms_men_1; set lms_men_1; period=3; percent_col=pct_col/100; run; 
data lms_men_2; set lms_men_2; period=4; percent_col=pct_col/100; run; 
data lms_men_3; set lms_men_3; period=5; percent_col=pct_col/100; run; 
data lms_men_4; set lms_men_4; period=6; percent_col=pct_col/100; run; 
data lms_men_5; set lms_men_5; period=7; percent_col=pct_col/100; run; 
data lms_men_6; set lms_men_6; period=8; percent_col=pct_col/100; run; 
data lms_men_7; set lms_men_7; period=9; percent_col=pct_col/100; run; 
data lms_men_8; set lms_men_8; period=10; percent_col=pct_col/100; run; 
data lms_men_9; set lms_men_9; period=11; percent_col=pct_col/100; run; 
data lms_men_10; set lms_men_10; period=12; percent_col=pct_col/100; run; 
data lms_men_11; set lms_men_11; period=13; percent_col=pct_col/100; run; 
data lms_men_12; set lms_men_12; period=14; percent_col=pct_col/100; run; 
data lms_men_13; set lms_men_13; period=15; percent_col=pct_col/100; run; 
data lms_men_14; set lms_men_14; period=16; percent_col=pct_col/100; run; 
data lms_men_15; set lms_men_15; period=17; percent_col=pct_col/100; run; 
data lms_men_16; set lms_men_16; period=18; percent_col=pct_col/100; run; 
data lms_men_18; set lms_men_18; period=20; percent_col=pct_col/100; run; 
data lms_men_19; set lms_men_19; period=21; percent_col=pct_col/100; run; 
data lms_men_20; set lms_men_20; period=22; percent_col=pct_col/100; run; 
data lms_men_21; set lms_men_21; period=23; percent_col=pct_col/100; run; 
data lms_men_22; set lms_men_22; period=24; percent_col=pct_col/100; run; 
data lms_men_23; set lms_men_23; period=25; percent_col=pct_col/100; run; 
data lms_men_24; set lms_men_24; period=26; percent_col=pct_col/100; run; 
data lms_men_25; set lms_men_25; period=27; percent_col=pct_col/100; run; 
data lms_men_26; set lms_men_26; period=28; percent_col=pct_col/100; run; 
data lms_men_27; set lms_men_27; period=29; percent_col=pct_col/100; run; 
data lms_men_28; set lms_men_28; period=30; percent_col=pct_col/100; run; 
data lms_men_29; set lms_men_29; period=31; percent_col=pct_col/100; run; 
data lms_men_30; set lms_men_30; period=32; percent_col=pct_col/100; run; 
data lms_men_31; set lms_men_31; period=33; percent_col=pct_col/100; run; 
data lms_men_32; set lms_men_32; period=34; percent_col=pct_col/100; run; 
data lms_men_33; set lms_men_33; period=35; percent_col=pct_col/100; run; 
data lms_men_34; set lms_men_34; period=36; percent_col=pct_col/100; run; 
data lms_men_35; set lms_men_35; period=37; percent_col=pct_col/100; run; 
data lms_men_36; set lms_men_36; period=38; percent_col=pct_col/100; run; 
data lms_men_37; set lms_men_37; period=39; percent_col=pct_col/100; run; 
data lms_men_38; set lms_men_38; period=40; percent_col=pct_col/100; run; 
data lms_men_39; set lms_men_39; period=41; percent_col=pct_col/100; run; 
data lms_men_40; set lms_men_40; period=42; percent_col=pct_col/100; run; 
data lms_men_41; set lms_men_41; period=43; percent_col=pct_col/100; run; 
data lms_men_42; set lms_men_42; period=44; percent_col=pct_col/100; run; 
data lms_men_43; set lms_men_43; period=45; percent_col=pct_col/100; run; 
data lms_men_44; set lms_men_44; period=46; percent_col=pct_col/100; run; 
data lms_men_45; set lms_men_45; period=47; percent_col=pct_col/100; run; 
data lms_men_46; set lms_men_46; period=48; percent_col=pct_col/100; run; 
data lms_men_47; set lms_men_47; period=49; percent_col=pct_col/100; run; 
data lms_men_48; set lms_men_48; period=50; percent_col=pct_col/100; run; 


data lms_men_1; set lms_men_1; keep percent_col labour_market_state agegroup period; run; 
data lms_men_2; set lms_men_2; keep percent_col labour_market_state agegroup period; run; 
data lms_men_3; set lms_men_3; keep percent_col labour_market_state agegroup period; run; 
data lms_men_4; set lms_men_4; keep percent_col labour_market_state agegroup period; run; 
data lms_men_5; set lms_men_5; keep percent_col labour_market_state agegroup period; run; 
data lms_men_6; set lms_men_6; keep percent_col labour_market_state agegroup period; run; 
data lms_men_7; set lms_men_7; keep percent_col labour_market_state agegroup period; run; 
data lms_men_8; set lms_men_8; keep percent_col labour_market_state agegroup period; run; 
data lms_men_9; set lms_men_9; keep percent_col labour_market_state agegroup period; run; 
data lms_men_10; set lms_men_10; keep percent_col labour_market_state agegroup period; run; 
data lms_men_11; set lms_men_11; keep percent_col labour_market_state agegroup period; run; 
data lms_men_12; set lms_men_12; keep percent_col labour_market_state agegroup period; run; 
data lms_men_13; set lms_men_13; keep percent_col labour_market_state agegroup period; run; 
data lms_men_14; set lms_men_14; keep percent_col labour_market_state agegroup period; run; 
data lms_men_15; set lms_men_15; keep percent_col labour_market_state agegroup period; run; 
data lms_men_16; set lms_men_16; keep percent_col labour_market_state agegroup period; run; 
data lms_men_18; set lms_men_18; keep percent_col labour_market_state agegroup period; run; 
data lms_men_19; set lms_men_19; keep percent_col labour_market_state agegroup period; run; 
data lms_men_20; set lms_men_20; keep percent_col labour_market_state agegroup period; run; 
data lms_men_21; set lms_men_21; keep percent_col labour_market_state agegroup period; run; 
data lms_men_22; set lms_men_22; keep percent_col labour_market_state agegroup period; run; 
data lms_men_23; set lms_men_23; keep percent_col labour_market_state agegroup period; run; 
data lms_men_24; set lms_men_24; keep percent_col labour_market_state agegroup period; run; 
data lms_men_25; set lms_men_25; keep percent_col labour_market_state agegroup period; run; 
data lms_men_26; set lms_men_26; keep percent_col labour_market_state agegroup period; run; 
data lms_men_27; set lms_men_27; keep percent_col labour_market_state agegroup period; run; 
data lms_men_28; set lms_men_28; keep percent_col labour_market_state agegroup period; run; 
data lms_men_29; set lms_men_29; keep percent_col labour_market_state agegroup period; run; 
data lms_men_30; set lms_men_30; keep percent_col labour_market_state agegroup period; run; 
data lms_men_31; set lms_men_31; keep percent_col labour_market_state agegroup period; run; 
data lms_men_32; set lms_men_32; keep percent_col labour_market_state agegroup period; run; 
data lms_men_33; set lms_men_33; keep percent_col labour_market_state agegroup period; run; 
data lms_men_34; set lms_men_34; keep percent_col labour_market_state agegroup period; run; 
data lms_men_35; set lms_men_35; keep percent_col labour_market_state agegroup period; run; 
data lms_men_36; set lms_men_36; keep percent_col labour_market_state agegroup period; run; 
data lms_men_37; set lms_men_37; keep percent_col labour_market_state agegroup period; run; 
data lms_men_38; set lms_men_38; keep percent_col labour_market_state agegroup period; run; 
data lms_men_39; set lms_men_39; keep percent_col labour_market_state agegroup period; run; 
data lms_men_40; set lms_men_40; keep percent_col labour_market_state agegroup period; run; 
data lms_men_41; set lms_men_41; keep percent_col labour_market_state agegroup period; run; 
data lms_men_42; set lms_men_42; keep percent_col labour_market_state agegroup period; run; 
data lms_men_43; set lms_men_43; keep percent_col labour_market_state agegroup period; run; 
data lms_men_44; set lms_men_44; keep percent_col labour_market_state agegroup period; run; 
data lms_men_45; set lms_men_45; keep percent_col labour_market_state agegroup period; run; 
data lms_men_46; set lms_men_46; keep percent_col labour_market_state agegroup period; run; 
data lms_men_47; set lms_men_47; keep percent_col labour_market_state agegroup period; run; 
data lms_men_48; set lms_men_48; keep percent_col labour_market_state agegroup period; run; 
data lms_men_base; 
set lms_men_1
lms_men_2
lms_men_3
lms_men_4
lms_men_5
lms_men_6
lms_men_7
lms_men_8
lms_men_9
lms_men_10
lms_men_11
lms_men_12
lms_men_13
lms_men_14
lms_men_15
lms_men_16
lms_men_18
lms_men_19
lms_men_20
lms_men_21
lms_men_22
lms_men_23
lms_men_24
lms_men_25
lms_men_26
lms_men_27
lms_men_28
lms_men_29
lms_men_30
lms_men_31
lms_men_32
lms_men_33
lms_men_34
lms_men_35
lms_men_36
lms_men_37
lms_men_38
lms_men_39
lms_men_40 lms_men_41 lms_men_42 lms_men_43 lms_men_44 lms_men_45 lms_men_46 lms_men_47 lms_men_48; run; 

/*We then only take the different labour-market states and transpose them. This results in tables that have the format required by LIAM2, 
		by labour-market state and gender.*/
data lms_men_base_wag;
set lms_men_base (where=(labour_market_state=1));
run; 
proc sort data=lms_men_base_wag; 
by agegroup; 
run; 
 
proc transpose data=lms_men_base_wag out=lms_men_trans_wag; 
by agegroup;
id period ;
run;
data lms_men_trans_wag; 
set lms_men_trans_wag (where= (_NAME_="percent_col")); 
RUN; 

data lms_men_trans_wag; 
set lms_men_trans_wag ; 
drop _name_ _label_ ; 
RUN; 
data lms_men_base_ind;
set lms_men_base (where=(labour_market_state=2));
run; 
proc sort data=lms_men_base_ind; 
by agegroup; 
run; 
proc transpose data=lms_men_base_ind out=lms_men_trans_ind; 
by agegroup;
id period ;
run;

data lms_men_trans_ind; 
set lms_men_trans_ind (where= (_NAME_="percent_col")); 
RUN; 

data lms_men_trans_ind; 
set lms_men_trans_ind ; 
drop _name_ _label_ ; 
RUN; 
data lms_men_base_inf;
set lms_men_base (where=(labour_market_state=3));
run; 
proc sort data=lms_men_base_inf; 
by agegroup; 
run; 
proc transpose data=lms_men_base_inf out=lms_men_trans_inf; 
by agegroup;
id period ;
run;
data lms_men_trans_inf; 
set lms_men_trans_inf (where= (_NAME_="percent_col")); 
RUN; 

data lms_men_trans_inf; 
set lms_men_trans_inf ; 
drop _name_ _label_ ; 
RUN; 

data lms_men_base_une;
set lms_men_base (where=(labour_market_state=4));
run; 
proc sort data=lms_men_base_une; 
by agegroup; 
run; 
proc transpose data=lms_men_base_une out=lms_men_trans_une; 
by agegroup;
id period ;
run;

data lms_men_trans_une; 
set lms_men_trans_une (where= (_NAME_="percent_col")); 
RUN; 

data lms_men_trans_une; 
set lms_men_trans_une ; 
drop _name_ _label_ ; 
RUN; 
data lms_men_base_ina;
set lms_men_base (where=(labour_market_state=5));
run; 
proc sort data=lms_men_base_ina; 
by agegroup; 
run; 
proc transpose data=lms_men_base_ina out=lms_men_trans_ina; 
by agegroup;
id period ;
run;

data lms_men_trans_ina; 
set lms_men_trans_ina (where= (_NAME_="percent_col")); 
RUN; 
data lms_men_trans_ina; 
set lms_men_trans_ina ; 
drop _name_ _label_ ; 
RUN;  
/*The EPH was not carried out during the third quarter of 2007. We thus assume the proportion of people in a given labour-market state during
		that quarter is the average of the second and fourth quarters of 2007.*/
data lms_men_trans_wag; 
set lms_men_trans_wag; 
_19 = (_18 + _20) /2; 
run; 
data lms_men_trans_ind; 
set lms_men_trans_ind; 
_19 = (_18 + _20) /2; 
run; 
data lms_men_trans_inf; 
set lms_men_trans_inf; 
_19 = (_18 + _20) /2; 
run; 
data lms_men_trans_une; 
set lms_men_trans_une; 
_19 = (_18 + _20) /2; 
run; 

data lms_men_trans_ina; 
set lms_men_trans_ina; 
_19 = (_18 + _20) /2; 
run; 
proc print data=lms_men_trans_wag; run; 
proc print data=lms_men_trans_ind; run; 
proc print data=lms_men_trans_inf; run; 
proc print data=lms_men_trans_une; run; 
proc print data=lms_men_trans_ina; run; 
data leo.cal_wag_men; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_men_trans_wag;
run; 
data leo.cal_ind_men; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_men_trans_ind;
run; 

data leo.cal_inf_men; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_men_trans_inf;
run; 

data leo.cal_une_men; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_men_trans_une;
run; 

data leo.cal_ina_men; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_men_trans_ina;
run;



/*We do the same thing for women*/

proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=2) & (period=1) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_1;
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=2) & (period=2) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=3) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=4) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=5) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=6) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=7) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=8) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=9) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=10) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=11) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=12) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=13) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=14) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=2) & (period=15) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=2) & (period=16) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=2) & (period=18) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=19) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=20) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=21) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=22) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=23) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=24) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=25) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=26) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_26; 
run; 

proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=27) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=28) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=29) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=30) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=31) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=32) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=33) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=34) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=35) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=36) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=37) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_37; 
run; 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=38) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=39) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=40) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=41) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=42) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=43) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=44) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=45) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_45; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=46) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=2) & (period=47) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_47; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=2) & (period=48) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_wom_48; 
run; 
data lms_wom_1; set lms_wom_1; period=3; percent_col=pct_col/100; run; 
data lms_wom_2; set lms_wom_2; period=4; percent_col=pct_col/100; run; 
data lms_wom_3; set lms_wom_3; period=5; percent_col=pct_col/100; run; 
data lms_wom_4; set lms_wom_4; period=6; percent_col=pct_col/100; run; 
data lms_wom_5; set lms_wom_5; period=7; percent_col=pct_col/100; run; 
data lms_wom_6; set lms_wom_6; period=8; percent_col=pct_col/100; run; 
data lms_wom_7; set lms_wom_7; period=9; percent_col=pct_col/100; run; 
data lms_wom_8; set lms_wom_8; period=10; percent_col=pct_col/100; run; 
data lms_wom_9; set lms_wom_9; period=11; percent_col=pct_col/100; run; 
data lms_wom_10; set lms_wom_10; period=12; percent_col=pct_col/100; run; 
data lms_wom_11; set lms_wom_11; period=13; percent_col=pct_col/100; run; 
data lms_wom_12; set lms_wom_12; period=14; percent_col=pct_col/100; run; 
data lms_wom_13; set lms_wom_13; period=15; percent_col=pct_col/100; run; 
data lms_wom_14; set lms_wom_14; period=16; percent_col=pct_col/100; run; 
data lms_wom_15; set lms_wom_15; period=17; percent_col=pct_col/100; run; 
data lms_wom_16; set lms_wom_16; period=18; percent_col=pct_col/100; run; 
data lms_wom_18; set lms_wom_18; period=20; percent_col=pct_col/100; run; 
data lms_wom_19; set lms_wom_19; period=21; percent_col=pct_col/100; run; 
data lms_wom_20; set lms_wom_20; period=22; percent_col=pct_col/100; run; 
data lms_wom_21; set lms_wom_21; period=23; percent_col=pct_col/100; run; 
data lms_wom_22; set lms_wom_22; period=24; percent_col=pct_col/100; run; 
data lms_wom_23; set lms_wom_23; period=25; percent_col=pct_col/100; run; 
data lms_wom_24; set lms_wom_24; period=26; percent_col=pct_col/100; run; 
data lms_wom_25; set lms_wom_25; period=27; percent_col=pct_col/100; run; 
data lms_wom_26; set lms_wom_26; period=28; percent_col=pct_col/100; run; 
data lms_wom_27; set lms_wom_27; period=29; percent_col=pct_col/100; run; 
data lms_wom_28; set lms_wom_28; period=30; percent_col=pct_col/100; run; 
data lms_wom_29; set lms_wom_29; period=31; percent_col=pct_col/100; run; 
data lms_wom_30; set lms_wom_30; period=32; percent_col=pct_col/100; run; 
data lms_wom_31; set lms_wom_31; period=33; percent_col=pct_col/100; run; 
data lms_wom_32; set lms_wom_32; period=34; percent_col=pct_col/100; run; 
data lms_wom_33; set lms_wom_33; period=35; percent_col=pct_col/100; run; 
data lms_wom_34; set lms_wom_34; period=36; percent_col=pct_col/100; run; 
data lms_wom_35; set lms_wom_35; period=37; percent_col=pct_col/100; run; 
data lms_wom_36; set lms_wom_36; period=38; percent_col=pct_col/100; run; 
data lms_wom_37; set lms_wom_37; period=39; percent_col=pct_col/100; run; 
data lms_wom_38; set lms_wom_38; period=40; percent_col=pct_col/100; run; 
data lms_wom_39; set lms_wom_39; period=41; percent_col=pct_col/100; run; 
data lms_wom_40; set lms_wom_40; period=42; percent_col=pct_col/100; run; 
data lms_wom_41; set lms_wom_41; period=43; percent_col=pct_col/100; run; 
data lms_wom_42; set lms_wom_42; period=44; percent_col=pct_col/100; run; 
data lms_wom_43; set lms_wom_43; period=45; percent_col=pct_col/100; run; 
data lms_wom_44; set lms_wom_44; period=46; percent_col=pct_col/100; run; 
data lms_wom_45; set lms_wom_45; period=47; percent_col=pct_col/100; run;
data lms_wom_46; set lms_wom_46; period=48; percent_col=pct_col/100; run;
data lms_wom_47; set lms_wom_47; period=49; percent_col=pct_col/100; run;
data lms_wom_48; set lms_wom_48; period=50; percent_col=pct_col/100; run;


data lms_wom_1; set lms_wom_1; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_2; set lms_wom_2; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_3; set lms_wom_3; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_4; set lms_wom_4; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_5; set lms_wom_5; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_6; set lms_wom_6; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_7; set lms_wom_7; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_8; set lms_wom_8; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_9; set lms_wom_9; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_10; set lms_wom_10; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_11; set lms_wom_11; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_12; set lms_wom_12; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_13; set lms_wom_13; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_14; set lms_wom_14; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_15; set lms_wom_15; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_16; set lms_wom_16; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_18; set lms_wom_18; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_19; set lms_wom_19; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_20; set lms_wom_20; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_21; set lms_wom_21; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_22; set lms_wom_22; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_23; set lms_wom_23; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_24; set lms_wom_24; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_25; set lms_wom_25; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_26; set lms_wom_26; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_27; set lms_wom_27; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_28; set lms_wom_28; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_29; set lms_wom_29; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_30; set lms_wom_30; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_31; set lms_wom_31; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_32; set lms_wom_32; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_33; set lms_wom_33; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_34; set lms_wom_34; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_35; set lms_wom_35; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_36; set lms_wom_36; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_37; set lms_wom_37; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_38; set lms_wom_38; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_39; set lms_wom_39; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_40; set lms_wom_40; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_41; set lms_wom_41; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_42; set lms_wom_42; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_43; set lms_wom_43; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_44; set lms_wom_44; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_45; set lms_wom_45; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_46; set lms_wom_46; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_47; set lms_wom_47; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_48; set lms_wom_48; keep percent_col labour_market_state agegroup period; run; 
data lms_wom_base; 
set lms_wom_1
lms_wom_2
lms_wom_3
lms_wom_4
lms_wom_5
lms_wom_6
lms_wom_7
lms_wom_8
lms_wom_9
lms_wom_10
lms_wom_11
lms_wom_12
lms_wom_13
lms_wom_14
lms_wom_15
lms_wom_16
lms_wom_18
lms_wom_19
lms_wom_20
lms_wom_21
lms_wom_22
lms_wom_23
lms_wom_24
lms_wom_25
lms_wom_26
lms_wom_27
lms_wom_28
lms_wom_29
lms_wom_30
lms_wom_31
lms_wom_32
lms_wom_33
lms_wom_34
lms_wom_35
lms_wom_36
lms_wom_37
lms_wom_38
lms_wom_39
lms_wom_40 lms_wom_41 lms_wom_42 lms_wom_43 lms_wom_44 lms_wom_45 lms_wom_46 lms_wom_47 lms_wom_48; run; 
data lms_wom_base_wag;
set lms_wom_base (where=(labour_market_state=1));
run; 
proc sort data=lms_wom_base_wag; 
by agegroup; 
run; 
 
proc transpose data=lms_wom_base_wag out=lms_wom_trans_wag; 
by agegroup;
id period ;
run;
data lms_wom_trans_wag; 
set lms_wom_trans_wag (where= (_NAME_="percent_col")); 
RUN; 

data lms_wom_trans_wag; 
set lms_wom_trans_wag ; 
drop _name_ _label_ ; 
RUN; 
data lms_wom_base_ind;
set lms_wom_base (where=(labour_market_state=2));
run; 
proc sort data=lms_wom_base_ind; 
by agegroup; 
run; 
proc transpose data=lms_wom_base_ind out=lms_wom_trans_ind; 
by agegroup;
id period ;
run;

data lms_wom_trans_ind; 
set lms_wom_trans_ind (where= (_NAME_="percent_col")); 
RUN; 

data lms_wom_trans_ind; 
set lms_wom_trans_ind ; 
drop _name_ _label_ ; 
RUN; 
data lms_wom_base_inf;
set lms_wom_base (where=(labour_market_state=3));
run; 
proc sort data=lms_wom_base_inf; 
by agegroup; 
run; 
proc transpose data=lms_wom_base_inf out=lms_wom_trans_inf; 
by agegroup;
id period ;
run;
data lms_wom_trans_inf; 
set lms_wom_trans_inf (where= (_NAME_="percent_col")); 
RUN; 

data lms_wom_trans_inf; 
set lms_wom_trans_inf ; 
drop _name_ _label_ ; 
RUN; 

data lms_wom_base_une;
set lms_wom_base (where=(labour_market_state=4));
run; 
proc sort data=lms_wom_base_une; 
by agegroup; 
run; 
proc transpose data=lms_wom_base_une out=lms_wom_trans_une; 
by agegroup;
id period ;
run;

data lms_wom_trans_une; 
set lms_wom_trans_une (where= (_NAME_="percent_col")); 
RUN; 

data lms_wom_trans_une; 
set lms_wom_trans_une ; 
drop _name_ _label_ ; 
RUN; 
data lms_wom_base_ina;
set lms_wom_base (where=(labour_market_state=5));
run; 
proc sort data=lms_wom_base_ina; 
by agegroup; 
run; 
proc transpose data=lms_wom_base_ina out=lms_wom_trans_ina; 
by agegroup;
id period ;
run;

data lms_wom_trans_ina; 
set lms_wom_trans_ina (where= (_NAME_="percent_col")); 
RUN; 
data lms_wom_trans_ina; 
set lms_wom_trans_ina ; 
drop _name_ _label_ ; 
RUN; 
proc print data=lms_wom_trans_ina; run; 

data lms_wom_trans_wag; 
set lms_wom_trans_wag; 
_19 = (_18 + _20) /2; 
run; 
data lms_wom_trans_ind; 
set lms_wom_trans_ind; 
_19 = (_18 + _20) /2; 
run; 
data lms_wom_trans_inf; 
set lms_wom_trans_inf; 
_19 = (_18 + _20) /2; 
run; 
data lms_wom_trans_une; 
set lms_wom_trans_une; 
_19 = (_18 + _20) /2; 
run; 

data lms_wom_trans_ina; 
set lms_wom_trans_ina; 
_19 = (_18 + _20) /2; 
run; 
proc print data=lms_wom_trans_wag; run; 
proc print data=lms_wom_trans_ind; run; 
proc print data=lms_wom_trans_inf; run; 
proc print data=lms_wom_trans_une; run; 
proc print data=lms_wom_trans_ina; run; 


data leo.cal_wag_wom; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_wom_trans_wag;
run; 
data leo.cal_ind_wom; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_wom_trans_ind;
run; 

data leo.cal_inf_wom; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_wom_trans_inf;
run; 

data leo.cal_une_wom; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_wom_trans_une;
run; 

data leo.cal_ina_wom; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set lms_wom_trans_ina;
run; 

/*Macro for putting at zero missing values*/
 %Macro M_Zero (ds) ;
     data &ds. (drop=_i);
          set &ds. ;
          array A_VarNum[*] _NUMERIC_ ;     

          do _i=1 to dim( A_VarNum ) ;
          If A_VarNum (_i)=. then A_VarNum (_i)=0 ;
     End ;
   run ;
%Mend ; 

%m_zero(leo.cal_wag_wom);
%m_zero(leo.cal_ind_wom);
 %m_zero(leo.cal_inf_wom);
%m_zero(leo.cal_une_wom);
 %m_zero(leo.cal_ina_wom);

%m_zero(leo.cal_wag_men);
%m_zero(leo.cal_ind_men);
 %m_zero(leo.cal_inf_men);
%m_zero(leo.cal_une_men);
 %m_zero(leo.cal_ina_men);

/*Change the path to the one of your liking. These alignment tables must afterwards be put in the same folder than the file of the 
 		prospective microsimulation. You still have to format these alignment tables as shown by the csv files present in the folder. 
 		Finally, you will have to append labour-market information for 2016-2017 (the EPHc dataset for those periods is formatted differently)
 		the labour-market scenarios (low, central and high) in additionnal columns, as obtained from the excel folders present in the folder. 
 		You can of course change the scenarios and add the newest waves of the EPHc as they come out. */
proc export data=leo.cal_wag_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_wag_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_ind_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_ind_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_inf_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_inf_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_une_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_une_men.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_ina_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_ina_men.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_wag_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_wag_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_ind_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_ind_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_inf_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_inf_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_une_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_une_wom.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_ina_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_ina_wom.csv' 
dbms=csv replace; 
run; 



/*We invert the order of the columns so as to suit the needs of the retrospective microsimulation module: the most recent dataset is the second
		column from the left, and the oldest (third quarter of 2003) is the last column on the right.*/ 


%macro cal_backward(indata, variable); 



data &indata._b; 
set &indata.; 
Rename _3=x50;
Rename _4=x49;
Rename _5=x48;
Rename _6=x47;
Rename _7=x46;
Rename _8=x45;
Rename _9=x44;
Rename _10=x43;
Rename _11=x42;
Rename _12=x41;
Rename _13=x40;
Rename _14=x39;
Rename _15=x38;
Rename _16=x37;
Rename _17=x36;
Rename _18=x35;
Rename _19=x34;
Rename _20=x33;
Rename _21=x32;
Rename _22=x31;
Rename _23=x30;
Rename _24=x29;
Rename _25=x28;
Rename _26=x27;
Rename _27=x26;
Rename _28=x25;
Rename _29=x24;
Rename _30=x23;
Rename _31=x22;
Rename _32=x21;
Rename _33=x20;
Rename _34=x19;
Rename _35=x18;
Rename _36=x17;
Rename _37=x16;
Rename _38=x15;
Rename _39=x14;
Rename _40=x13;
Rename _41=x12;
Rename _42=x11;
Rename _43=x10;
Rename _44=x9;
Rename _45=x8;
Rename _46=x7;
Rename _47=x6;
Rename _48=x5;
Rename _49=x4;
Rename _50=x3;

run;
data &indata._b; 
retain &variable. x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42 x42 x43 x44 x45 x46 x47 x48 x49 x50; 
set &indata._b; 
run; 
%mend; 

 
%cal_backward(leo.cal_wag_men,agegroup);
%cal_backward(leo.cal_ind_men,agegroup);
 %cal_backward(leo.cal_inf_men,agegroup);
%cal_backward(leo.cal_une_men,agegroup);
 %cal_backward(leo.cal_ina_men,agegroup);
 
%cal_backward(leo.cal_wag_wom,agegroup);
%cal_backward(leo.cal_ind_wom,agegroup);
 %cal_backward(leo.cal_inf_wom,agegroup);
%cal_backward(leo.cal_une_wom,agegroup);
 %cal_backward(leo.cal_ina_wom,agegroup);
/*Again, change the path to fit your machine. You will have to change some parts of the csv by hand, and mimic the files present in the 
		ZENODO folder. You will also need to add additional data from other EPH waves with other formatting (1974-2003 and 2016-2017). */

proc export data=leo.cal_wag_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_wag_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_ind_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ind_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_inf_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_inf_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_une_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_une_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_ina_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ina_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_wag_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_wag_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_ind_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ind_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_inf_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_inf_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_une_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_une_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_ina_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ina_wom_b.csv' 
dbms=csv replace; 
run; 
/* Uncomment this if you want to clear the results viewer and the SAS log
dm 'odsresults; clear'; 
dm 'clear log'; */


/*************************************Next, we compute the proportion of students on the EPHc (2003-2015)*******************************/
/**********************First, for men**********************/
 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=1) & (period=1) & (agegroup =16|agegroup =20|agegroup=25)) ;
table student*ageconti / noprint outpct out=stu_men_1; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=1) & (period=2)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=3)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=4)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=5)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=1) & (period=6)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=7)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=8)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=9)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=1) & (period=10)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=11)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=12)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=13)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=1) & (period=14)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=1) & (period=15)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=1) & (period=16)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=1) & (period=18)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=19)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=20)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=21)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=1) & (period=22)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=23)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=24)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=25)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=1) & (period=26)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_26; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=27)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=28)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=29)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=1) & (period=30)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=31)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=32)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=33)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=1) & (period=34)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=35)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=36)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=37)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=1) & (period=38)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=39)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=40)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=41)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=1) & (period=42)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=43)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=44)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_44; 
run; 

 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=45)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_45; 
run; 

 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=1) & (period=46)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_46; 
run; 

proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=1) & (period=47)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_47; 
run; 

 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=1) & (period=48)& (agegroup=16|agegroup=20|agegroup=25));
table student*ageconti / noprint outpct out=stu_men_48; 
run; 
data stu_men_1; set stu_men_1; period=3; percent_col=pct_col/100; run; 
data stu_men_2; set stu_men_2; period=4; percent_col=pct_col/100; run; 
data stu_men_3; set stu_men_3; period=5; percent_col=pct_col/100; run; 
data stu_men_4; set stu_men_4; period=6; percent_col=pct_col/100; run; 
data stu_men_5; set stu_men_5; period=7; percent_col=pct_col/100; run; 
data stu_men_6; set stu_men_6; period=8; percent_col=pct_col/100; run; 
data stu_men_7; set stu_men_7; period=9; percent_col=pct_col/100; run; 
data stu_men_8; set stu_men_8; period=10; percent_col=pct_col/100; run; 
data stu_men_9; set stu_men_9; period=11; percent_col=pct_col/100; run; 
data stu_men_10; set stu_men_10; period=12; percent_col=pct_col/100; run; 
data stu_men_11; set stu_men_11; period=13; percent_col=pct_col/100; run; 
data stu_men_12; set stu_men_12; period=14; percent_col=pct_col/100; run; 
data stu_men_13; set stu_men_13; period=15; percent_col=pct_col/100; run; 
data stu_men_14; set stu_men_14; period=16; percent_col=pct_col/100; run; 
data stu_men_15; set stu_men_15; period=17; percent_col=pct_col/100; run; 
data stu_men_16; set stu_men_16; period=18; percent_col=pct_col/100; run; 
data stu_men_18; set stu_men_18; period=20; percent_col=pct_col/100; run; 
data stu_men_19; set stu_men_19; period=21; percent_col=pct_col/100; run; 
data stu_men_20; set stu_men_20; period=22; percent_col=pct_col/100; run; 
data stu_men_21; set stu_men_21; period=23; percent_col=pct_col/100; run; 
data stu_men_22; set stu_men_22; period=24; percent_col=pct_col/100; run; 
data stu_men_23; set stu_men_23; period=25; percent_col=pct_col/100; run; 
data stu_men_24; set stu_men_24; period=26; percent_col=pct_col/100; run; 
data stu_men_25; set stu_men_25; period=27; percent_col=pct_col/100; run; 
data stu_men_26; set stu_men_26; period=28; percent_col=pct_col/100; run; 
data stu_men_27; set stu_men_27; period=29; percent_col=pct_col/100; run; 
data stu_men_28; set stu_men_28; period=30; percent_col=pct_col/100; run; 
data stu_men_29; set stu_men_29; period=31; percent_col=pct_col/100; run; 
data stu_men_30; set stu_men_30; period=32; percent_col=pct_col/100; run; 
data stu_men_31; set stu_men_31; period=33; percent_col=pct_col/100; run; 
data stu_men_32; set stu_men_32; period=34; percent_col=pct_col/100; run; 
data stu_men_33; set stu_men_33; period=35; percent_col=pct_col/100; run; 
data stu_men_34; set stu_men_34; period=36; percent_col=pct_col/100; run; 
data stu_men_35; set stu_men_35; period=37; percent_col=pct_col/100; run; 
data stu_men_36; set stu_men_36; period=38; percent_col=pct_col/100; run; 
data stu_men_37; set stu_men_37; period=39; percent_col=pct_col/100; run; 
data stu_men_38; set stu_men_38; period=40; percent_col=pct_col/100; run; 
data stu_men_39; set stu_men_39; period=41; percent_col=pct_col/100; run; 
data stu_men_40; set stu_men_40; period=42; percent_col=pct_col/100; run; 
data stu_men_41; set stu_men_41; period=43; percent_col=pct_col/100; run; 
data stu_men_42; set stu_men_42; period=44; percent_col=pct_col/100; run; 
data stu_men_43; set stu_men_43; period=45; percent_col=pct_col/100; run; 
data stu_men_44; set stu_men_44; period=46; percent_col=pct_col/100; run; 
data stu_men_45; set stu_men_45; period=47; percent_col=pct_col/100; run; 
data stu_men_46; set stu_men_46; period=48; percent_col=pct_col/100; run; 
data stu_men_47; set stu_men_47; period=49; percent_col=pct_col/100; run; 
data stu_men_48; set stu_men_48; period=50; percent_col=pct_col/100; run; 
proc print data=stu_men_1; run; 
data stu_men_1; set stu_men_1; keep percent_col student ageconti period; run; 
data stu_men_2; set stu_men_2; keep percent_col student ageconti period; run; 
data stu_men_3; set stu_men_3; keep percent_col student ageconti period; run; 
data stu_men_4; set stu_men_4; keep percent_col student ageconti period; run; 
data stu_men_5; set stu_men_5; keep percent_col student ageconti period; run; 
data stu_men_6; set stu_men_6; keep percent_col student ageconti period; run; 
data stu_men_7; set stu_men_7; keep percent_col student ageconti period; run; 
data stu_men_8; set stu_men_8; keep percent_col student ageconti period; run; 
data stu_men_9; set stu_men_9; keep percent_col student ageconti period; run; 
data stu_men_10; set stu_men_10; keep percent_col student ageconti period; run; 
data stu_men_11; set stu_men_11; keep percent_col student ageconti period; run; 
data stu_men_12; set stu_men_12; keep percent_col student ageconti period; run; 
data stu_men_13; set stu_men_13; keep percent_col student ageconti period; run; 
data stu_men_14; set stu_men_14; keep percent_col student ageconti period; run; 
data stu_men_15; set stu_men_15; keep percent_col student ageconti period; run; 
data stu_men_16; set stu_men_16; keep percent_col student ageconti period; run; 
data stu_men_18; set stu_men_18; keep percent_col student ageconti period; run; 
data stu_men_19; set stu_men_19; keep percent_col student ageconti period; run; 
data stu_men_20; set stu_men_20; keep percent_col student ageconti period; run; 
data stu_men_21; set stu_men_21; keep percent_col student ageconti period; run; 
data stu_men_22; set stu_men_22; keep percent_col student ageconti period; run; 
data stu_men_23; set stu_men_23; keep percent_col student ageconti period; run; 
data stu_men_24; set stu_men_24; keep percent_col student ageconti period; run; 
data stu_men_25; set stu_men_25; keep percent_col student ageconti period; run; 
data stu_men_26; set stu_men_26; keep percent_col student ageconti period; run; 
data stu_men_27; set stu_men_27; keep percent_col student ageconti period; run; 
data stu_men_28; set stu_men_28; keep percent_col student ageconti period; run; 
data stu_men_29; set stu_men_29; keep percent_col student ageconti period; run; 
data stu_men_30; set stu_men_30; keep percent_col student ageconti period; run; 
data stu_men_31; set stu_men_31; keep percent_col student ageconti period; run; 
data stu_men_32; set stu_men_32; keep percent_col student ageconti period; run; 
data stu_men_33; set stu_men_33; keep percent_col student ageconti period; run; 
data stu_men_34; set stu_men_34; keep percent_col student ageconti period; run; 
data stu_men_35; set stu_men_35; keep percent_col student ageconti period; run; 
data stu_men_36; set stu_men_36; keep percent_col student ageconti period; run; 
data stu_men_37; set stu_men_37; keep percent_col student ageconti period; run; 
data stu_men_38; set stu_men_38; keep percent_col student ageconti period; run; 
data stu_men_39; set stu_men_39; keep percent_col student ageconti period; run; 
data stu_men_40; set stu_men_40; keep percent_col student ageconti period; run; 
data stu_men_41; set stu_men_41; keep percent_col student ageconti period; run; 
data stu_men_42; set stu_men_42; keep percent_col student ageconti period; run; 
data stu_men_43; set stu_men_43; keep percent_col student ageconti period; run; 
data stu_men_44; set stu_men_44; keep percent_col student ageconti period; run; 
data stu_men_45; set stu_men_45; keep percent_col student ageconti period; run; 
data stu_men_46; set stu_men_46; keep percent_col student ageconti period; run; 
data stu_men_47; set stu_men_47; keep percent_col student ageconti period; run; 
data stu_men_48; set stu_men_48; keep percent_col student ageconti period; run; 
proc print data=stu_men_1; run; 
proc print data=stu_men_23; run; 
data stu_men_base; 
set stu_men_1
stu_men_2
stu_men_3
stu_men_4
stu_men_5
stu_men_6
stu_men_7
stu_men_8
stu_men_9
stu_men_10
stu_men_11
stu_men_12
stu_men_13
stu_men_14
stu_men_15
stu_men_16
stu_men_18
stu_men_19
stu_men_20
stu_men_21
stu_men_22
stu_men_23
stu_men_24
stu_men_25
stu_men_26
stu_men_27
stu_men_28
stu_men_29
stu_men_30
stu_men_31
stu_men_32
stu_men_33
stu_men_34
stu_men_35
stu_men_36
stu_men_37
stu_men_38
stu_men_39
stu_men_40 stu_men_41 stu_men_42 stu_men_43 stu_men_44 stu_men_45 stu_men_46 stu_men_47 stu_men_48; run; 

/*proc sort data=leo.cal_sal_f_for3; 
by agegroup; 
run; */
/*On prend ensuite de la base uniquement les différents états dans le marché du travail et on les transppose. 
Le résultat est une série de tableaux en format LIAM2 selon l'état dans le marché du travail*/
data stu_men_base;
set stu_men_base (where=(student="True"));
run; 
proc sort data=stu_men_base; 
by ageconti; 
run; 
 
proc transppose data=stu_men_base out=stu_men_transp; 
by ageconti;
id period ;
run;
data stu_men_transp; 
set stu_men_transp (where= (_NAME_="percent_col")); 
RUN; 

data stu_men_transp; 
set stu_men_transp ; 
drop _name_ _label_ ; 
RUN; 

data stu_men_transp; 
set stu_men_transp; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_stu_men; 
retain ageconti _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set stu_men_transp;
rename ageconti=age; 
run; 
proc print data=leo.cal_stu_men; run; 

/************************Then, for women*********************************/


proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=2) & (period=1) & (agegroup =16|agegroup =20|agegroup=25)) ;
table student*ch06 / noprint outpct out=stu_wom_1; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where ( (ch04=2) & (period=2)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=3)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=4)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=5)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where ( (ch04=2) & (period=6)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=7)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=8)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=9)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where ( (ch04=2) & (period=10)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=11)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=12)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=13)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where ( (ch04=2) & (period=14)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=2) & (period=15)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=2) & (period=16)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where ( (ch04=2) & (period=18)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=19)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=20)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=21)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where ( (ch04=2) & (period=22)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=23)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=24)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=25)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where ( (ch04=2) & (period=26)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_26; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=27)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=28)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=29)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where ( (ch04=2) & (period=30)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=31)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=32)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=33)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where ( (ch04=2) & (period=34)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=35)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=36)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=37)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where ( (ch04=2) & (period=38)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=39)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=40)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=41)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where ( (ch04=2) & (period=42)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=43)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=44)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_44; 
run; 

 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=45)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_45; 
run; 

 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where ( (ch04=2) & (period=46)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_46; 
run; 

proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=2) & (period=47)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_47; 
run; 

 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where ( (ch04=2) & (period=48)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=stu_wom_48; 
run; 
data stu_wom_1; set stu_wom_1; period=3; percent_col=pct_col/100; run; 
data stu_wom_2; set stu_wom_2; period=4; percent_col=pct_col/100; run; 
data stu_wom_3; set stu_wom_3; period=5; percent_col=pct_col/100; run; 
data stu_wom_4; set stu_wom_4; period=6; percent_col=pct_col/100; run; 
data stu_wom_5; set stu_wom_5; period=7; percent_col=pct_col/100; run; 
data stu_wom_6; set stu_wom_6; period=8; percent_col=pct_col/100; run; 
data stu_wom_7; set stu_wom_7; period=9; percent_col=pct_col/100; run; 
data stu_wom_8; set stu_wom_8; period=10; percent_col=pct_col/100; run; 
data stu_wom_9; set stu_wom_9; period=11; percent_col=pct_col/100; run; 
data stu_wom_10; set stu_wom_10; period=12; percent_col=pct_col/100; run; 
data stu_wom_11; set stu_wom_11; period=13; percent_col=pct_col/100; run; 
data stu_wom_12; set stu_wom_12; period=14; percent_col=pct_col/100; run; 
data stu_wom_13; set stu_wom_13; period=15; percent_col=pct_col/100; run; 
data stu_wom_14; set stu_wom_14; period=16; percent_col=pct_col/100; run; 
data stu_wom_15; set stu_wom_15; period=17; percent_col=pct_col/100; run; 
data stu_wom_16; set stu_wom_16; period=18; percent_col=pct_col/100; run; 
data stu_wom_18; set stu_wom_18; period=20; percent_col=pct_col/100; run; 
data stu_wom_19; set stu_wom_19; period=21; percent_col=pct_col/100; run; 
data stu_wom_20; set stu_wom_20; period=22; percent_col=pct_col/100; run; 
data stu_wom_21; set stu_wom_21; period=23; percent_col=pct_col/100; run; 
data stu_wom_22; set stu_wom_22; period=24; percent_col=pct_col/100; run; 
data stu_wom_23; set stu_wom_23; period=25; percent_col=pct_col/100; run; 
data stu_wom_24; set stu_wom_24; period=26; percent_col=pct_col/100; run; 
data stu_wom_25; set stu_wom_25; period=27; percent_col=pct_col/100; run; 
data stu_wom_26; set stu_wom_26; period=28; percent_col=pct_col/100; run; 
data stu_wom_27; set stu_wom_27; period=29; percent_col=pct_col/100; run; 
data stu_wom_28; set stu_wom_28; period=30; percent_col=pct_col/100; run; 
data stu_wom_29; set stu_wom_29; period=31; percent_col=pct_col/100; run; 
data stu_wom_30; set stu_wom_30; period=32; percent_col=pct_col/100; run; 
data stu_wom_31; set stu_wom_31; period=33; percent_col=pct_col/100; run; 
data stu_wom_32; set stu_wom_32; period=34; percent_col=pct_col/100; run; 
data stu_wom_33; set stu_wom_33; period=35; percent_col=pct_col/100; run; 
data stu_wom_34; set stu_wom_34; period=36; percent_col=pct_col/100; run; 
data stu_wom_35; set stu_wom_35; period=37; percent_col=pct_col/100; run; 
data stu_wom_36; set stu_wom_36; period=38; percent_col=pct_col/100; run; 
data stu_wom_37; set stu_wom_37; period=39; percent_col=pct_col/100; run; 
data stu_wom_38; set stu_wom_38; period=40; percent_col=pct_col/100; run; 
data stu_wom_39; set stu_wom_39; period=41; percent_col=pct_col/100; run; 
data stu_wom_40; set stu_wom_40; period=42; percent_col=pct_col/100; run; 
data stu_wom_41; set stu_wom_41; period=43; percent_col=pct_col/100; run; 
data stu_wom_42; set stu_wom_42; period=44; percent_col=pct_col/100; run; 
data stu_wom_43; set stu_wom_43; period=45; percent_col=pct_col/100; run; 
data stu_wom_44; set stu_wom_44; period=46; percent_col=pct_col/100; run; 
data stu_wom_45; set stu_wom_45; period=47; percent_col=pct_col/100; run; 
data stu_wom_46; set stu_wom_46; period=48; percent_col=pct_col/100; run; 
data stu_wom_47; set stu_wom_47; period=49; percent_col=pct_col/100; run; 
data stu_wom_48; set stu_wom_48; period=50; percent_col=pct_col/100; run; 
proc print data=stu_wom_1; run; 
data stu_wom_1; set stu_wom_1; keep percent_col student ch06 period; run; 
data stu_wom_2; set stu_wom_2; keep percent_col student ch06 period; run; 
data stu_wom_3; set stu_wom_3; keep percent_col student ch06 period; run; 
data stu_wom_4; set stu_wom_4; keep percent_col student ch06 period; run; 
data stu_wom_5; set stu_wom_5; keep percent_col student ch06 period; run; 
data stu_wom_6; set stu_wom_6; keep percent_col student ch06 period; run; 
data stu_wom_7; set stu_wom_7; keep percent_col student ch06 period; run; 
data stu_wom_8; set stu_wom_8; keep percent_col student ch06 period; run; 
data stu_wom_9; set stu_wom_9; keep percent_col student ch06 period; run; 
data stu_wom_10; set stu_wom_10; keep percent_col student ch06 period; run; 
data stu_wom_11; set stu_wom_11; keep percent_col student ch06 period; run; 
data stu_wom_12; set stu_wom_12; keep percent_col student ch06 period; run; 
data stu_wom_13; set stu_wom_13; keep percent_col student ch06 period; run; 
data stu_wom_14; set stu_wom_14; keep percent_col student ch06 period; run; 
data stu_wom_15; set stu_wom_15; keep percent_col student ch06 period; run; 
data stu_wom_16; set stu_wom_16; keep percent_col student ch06 period; run; 
data stu_wom_18; set stu_wom_18; keep percent_col student ch06 period; run; 
data stu_wom_19; set stu_wom_19; keep percent_col student ch06 period; run; 
data stu_wom_20; set stu_wom_20; keep percent_col student ch06 period; run; 
data stu_wom_21; set stu_wom_21; keep percent_col student ch06 period; run; 
data stu_wom_22; set stu_wom_22; keep percent_col student ch06 period; run; 
data stu_wom_23; set stu_wom_23; keep percent_col student ch06 period; run; 
data stu_wom_24; set stu_wom_24; keep percent_col student ch06 period; run; 
data stu_wom_25; set stu_wom_25; keep percent_col student ch06 period; run; 
data stu_wom_26; set stu_wom_26; keep percent_col student ch06 period; run; 
data stu_wom_27; set stu_wom_27; keep percent_col student ch06 period; run; 
data stu_wom_28; set stu_wom_28; keep percent_col student ch06 period; run; 
data stu_wom_29; set stu_wom_29; keep percent_col student ch06 period; run; 
data stu_wom_30; set stu_wom_30; keep percent_col student ch06 period; run; 
data stu_wom_31; set stu_wom_31; keep percent_col student ch06 period; run; 
data stu_wom_32; set stu_wom_32; keep percent_col student ch06 period; run; 
data stu_wom_33; set stu_wom_33; keep percent_col student ch06 period; run; 
data stu_wom_34; set stu_wom_34; keep percent_col student ch06 period; run; 
data stu_wom_35; set stu_wom_35; keep percent_col student ch06 period; run; 
data stu_wom_36; set stu_wom_36; keep percent_col student ch06 period; run; 
data stu_wom_37; set stu_wom_37; keep percent_col student ch06 period; run; 
data stu_wom_38; set stu_wom_38; keep percent_col student ch06 period; run; 
data stu_wom_39; set stu_wom_39; keep percent_col student ch06 period; run; 
data stu_wom_40; set stu_wom_40; keep percent_col student ch06 period; run; 
data stu_wom_41; set stu_wom_41; keep percent_col student ch06 period; run; 
data stu_wom_42; set stu_wom_42; keep percent_col student ch06 period; run; 
data stu_wom_43; set stu_wom_43; keep percent_col student ch06 period; run; 
data stu_wom_44; set stu_wom_44; keep percent_col student ch06 period; run; 
data stu_wom_45; set stu_wom_45; keep percent_col student ch06 period; run; 
data stu_wom_46; set stu_wom_46; keep percent_col student ch06 period; run; 
data stu_wom_47; set stu_wom_47; keep percent_col student ch06 period; run; 
data stu_wom_48; set stu_wom_48; keep percent_col student ch06 period; run; 
proc print data=stu_wom_1; run; 
proc print data=stu_wom_23; run; 
data stu_wom_base; 
set stu_wom_1
stu_wom_2
stu_wom_3
stu_wom_4
stu_wom_5
stu_wom_6
stu_wom_7
stu_wom_8
stu_wom_9
stu_wom_10
stu_wom_11
stu_wom_12
stu_wom_13
stu_wom_14
stu_wom_15
stu_wom_16
stu_wom_18
stu_wom_19
stu_wom_20
stu_wom_21
stu_wom_22
stu_wom_23
stu_wom_24
stu_wom_25
stu_wom_26
stu_wom_27
stu_wom_28
stu_wom_29
stu_wom_30
stu_wom_31
stu_wom_32
stu_wom_33
stu_wom_34
stu_wom_35
stu_wom_36
stu_wom_37
stu_wom_38
stu_wom_39
stu_wom_40 stu_wom_41 stu_wom_42 stu_wom_43 stu_wom_44 stu_wom_45 stu_wom_46 stu_wom_47 stu_wom_48; run; 

/*proc sort data=leo.cal_sal_wom_womor3; 
by agegroup; 
run; */
/*On prend ensuite de la base uniquement les différents états dans le marché du travail et on les transpose. 
Le résultat est une série de tableaux en format LIAM2 selon l'état dans le marché du travail*/
data stu_wom_base;
set stu_wom_base (where=(student="True"));
run; 
proc sort data=stu_wom_base; 
by ch06; 
run; 
 
proc transpose data=stu_wom_base out=stu_wom_transp; 
by ch06;
id period ;
run;
data stu_wom_transp; 
set stu_wom_transp (where= (_NAME_="percent_col")); 
RUN; 

data stu_wom_transp; 
set stu_wom_transp ; 
drop _name_ _label_ ; 
RUN; 

data stu_wom_transp; 
set stu_wom_transp; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_stu_wom; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set stu_wom_transp;
rename ch06=age; 
run; 
proc print data=leo.cal_stu_wom; 
run; 

/*Finally, we export the tables. Again, you must format them by hand and mimic the csv files with the same names present in the ZENODO 
		repository. You must also put them in the same folder than the prospective microsimulation file that you execute. We do not 
		carry out an alignment by sorting procedure for students in our retrospective module, so we do not need alignment proportions for 
		these backwards simulations.*/


/*************************************Next, we compute the alignment tables for education level. This is important for determining the 
		education level reached by students (how much of them actually complete secondary / tertiary education).***********************/
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=1 & (period=1) & (agegroup =16|agegroup =20|agegroup=25)) ;
table formation*ch06 / noprint outpct out=for_men_1; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=1 & (period=2)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=3)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=4)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=5)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=6)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=7)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=8)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=9)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=10)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=11)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=12)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=13)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=14)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=1 & (period=15)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=1 & (period=16)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=1 & (period=18)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=19)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=20)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=21)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=22)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=23)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=24)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=25)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=26)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_26; 
run;
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=27)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=28)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=29)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=30)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=31)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=32)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=33)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=34)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=35)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=36)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=37)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=38)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=39)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=40)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=41)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=42)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=43)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=44)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=45)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_45; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=46)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=1 & (period=47)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_47; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=1 & (period=48)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_men_48; 
run; 
data for_men_1; set for_men_1; period=3; percent_col=pct_col/100; run; 
data for_men_2; set for_men_2; period=4; percent_col=pct_col/100; run; 
data for_men_3; set for_men_3; period=5; percent_col=pct_col/100; run; 
data for_men_4; set for_men_4; period=6; percent_col=pct_col/100; run; 
data for_men_5; set for_men_5; period=7; percent_col=pct_col/100; run; 
data for_men_6; set for_men_6; period=8; percent_col=pct_col/100; run; 
data for_men_7; set for_men_7; period=9; percent_col=pct_col/100; run; 
data for_men_8; set for_men_8; period=10; percent_col=pct_col/100; run; 
data for_men_9; set for_men_9; period=11; percent_col=pct_col/100; run; 
data for_men_10; set for_men_10; period=12; percent_col=pct_col/100; run; 
data for_men_11; set for_men_11; period=13; percent_col=pct_col/100; run; 
data for_men_12; set for_men_12; period=14; percent_col=pct_col/100; run; 
data for_men_13; set for_men_13; period=15; percent_col=pct_col/100; run; 
data for_men_14; set for_men_14; period=16; percent_col=pct_col/100; run; 
data for_men_15; set for_men_15; period=17; percent_col=pct_col/100; run; 
data for_men_16; set for_men_16; period=18; percent_col=pct_col/100; run; 
data for_men_18; set for_men_18; period=20; percent_col=pct_col/100; run; 
data for_men_19; set for_men_19; period=21; percent_col=pct_col/100; run; 
data for_men_20; set for_men_20; period=22; percent_col=pct_col/100; run; 
data for_men_21; set for_men_21; period=23; percent_col=pct_col/100; run; 
data for_men_22; set for_men_22; period=24; percent_col=pct_col/100; run; 
data for_men_23; set for_men_23; period=25; percent_col=pct_col/100; run; 
data for_men_24; set for_men_24; period=26; percent_col=pct_col/100; run; 
data for_men_25; set for_men_25; period=27; percent_col=pct_col/100; run; 
data for_men_26; set for_men_26; period=28; percent_col=pct_col/100; run; 
data for_men_27; set for_men_27; period=29; percent_col=pct_col/100; run; 
data for_men_28; set for_men_28; period=30; percent_col=pct_col/100; run; 
data for_men_29; set for_men_29; period=31; percent_col=pct_col/100; run; 
data for_men_30; set for_men_30; period=32; percent_col=pct_col/100; run; 
data for_men_31; set for_men_31; period=33; percent_col=pct_col/100; run; 
data for_men_32; set for_men_32; period=34; percent_col=pct_col/100; run; 
data for_men_33; set for_men_33; period=35; percent_col=pct_col/100; run; 
data for_men_34; set for_men_34; period=36; percent_col=pct_col/100; run; 
data for_men_35; set for_men_35; period=37; percent_col=pct_col/100; run; 
data for_men_36; set for_men_36; period=38; percent_col=pct_col/100; run; 
data for_men_37; set for_men_37; period=39; percent_col=pct_col/100; run; 
data for_men_38; set for_men_38; period=40; percent_col=pct_col/100; run; 
data for_men_39; set for_men_39; period=41; percent_col=pct_col/100; run; 
data for_men_40; set for_men_40; period=42; percent_col=pct_col/100; run; 
data for_men_41; set for_men_41; period=43; percent_col=pct_col/100; run; 
data for_men_42; set for_men_42; period=44; percent_col=pct_col/100; run; 
data for_men_43; set for_men_43; period=45; percent_col=pct_col/100; run; 
data for_men_44; set for_men_44; period=46; percent_col=pct_col/100; run; 
data for_men_45; set for_men_45; period=47; percent_col=pct_col/100; run; 
data for_men_46; set for_men_46; period=48; percent_col=pct_col/100; run; 
data for_men_47; set for_men_47; period=49; percent_col=pct_col/100; run; 
data for_men_48; set for_men_48; period=50; percent_col=pct_col/100; run; 

data for_men_1; set for_men_1; keep percent_col formation ch06 period; run; 
data for_men_2; set for_men_2; keep percent_col formation ch06 period; run; 
data for_men_3; set for_men_3; keep percent_col formation ch06 period; run; 
data for_men_4; set for_men_4; keep percent_col formation ch06 period; run; 
data for_men_5; set for_men_5; keep percent_col formation ch06 period; run; 
data for_men_6; set for_men_6; keep percent_col formation ch06 period; run; 
data for_men_7; set for_men_7; keep percent_col formation ch06 period; run; 
data for_men_8; set for_men_8; keep percent_col formation ch06 period; run; 
data for_men_9; set for_men_9; keep percent_col formation ch06 period; run; 
data for_men_10; set for_men_10; keep percent_col formation ch06 period; run; 
data for_men_11; set for_men_11; keep percent_col formation ch06 period; run; 
data for_men_12; set for_men_12; keep percent_col formation ch06 period; run; 
data for_men_13; set for_men_13; keep percent_col formation ch06 period; run; 
data for_men_14; set for_men_14; keep percent_col formation ch06 period; run; 
data for_men_15; set for_men_15; keep percent_col formation ch06 period; run; 
data for_men_16; set for_men_16; keep percent_col formation ch06 period; run; 
data for_men_18; set for_men_18; keep percent_col formation ch06 period; run; 
data for_men_19; set for_men_19; keep percent_col formation ch06 period; run; 
data for_men_20; set for_men_20; keep percent_col formation ch06 period; run; 
data for_men_21; set for_men_21; keep percent_col formation ch06 period; run; 
data for_men_22; set for_men_22; keep percent_col formation ch06 period; run; 
data for_men_23; set for_men_23; keep percent_col formation ch06 period; run; 
data for_men_24; set for_men_24; keep percent_col formation ch06 period; run; 
data for_men_25; set for_men_25; keep percent_col formation ch06 period; run; 
data for_men_26; set for_men_26; keep percent_col formation ch06 period; run; 
data for_men_27; set for_men_27; keep percent_col formation ch06 period; run; 
data for_men_28; set for_men_28; keep percent_col formation ch06 period; run; 
data for_men_29; set for_men_29; keep percent_col formation ch06 period; run; 
data for_men_30; set for_men_30; keep percent_col formation ch06 period; run; 
data for_men_31; set for_men_31; keep percent_col formation ch06 period; run; 
data for_men_32; set for_men_32; keep percent_col formation ch06 period; run; 
data for_men_33; set for_men_33; keep percent_col formation ch06 period; run; 
data for_men_34; set for_men_34; keep percent_col formation ch06 period; run; 
data for_men_35; set for_men_35; keep percent_col formation ch06 period; run; 
data for_men_36; set for_men_36; keep percent_col formation ch06 period; run; 
data for_men_37; set for_men_37; keep percent_col formation ch06 period; run; 
data for_men_38; set for_men_38; keep percent_col formation ch06 period; run; 
data for_men_39; set for_men_39; keep percent_col formation ch06 period; run; 
data for_men_40; set for_men_40; keep percent_col formation ch06 period; run; 
data for_men_41; set for_men_41; keep percent_col formation ch06 period; run; 
data for_men_42; set for_men_42; keep percent_col formation ch06 period; run; 
data for_men_43; set for_men_43; keep percent_col formation ch06 period; run; 
data for_men_44; set for_men_44; keep percent_col formation ch06 period; run; 
data for_men_45; set for_men_45; keep percent_col formation ch06 period; run; 
data for_men_46; set for_men_46; keep percent_col formation ch06 period; run; 
data for_men_47; set for_men_47; keep percent_col formation ch06 period; run; 
data for_men_48; set for_men_48; keep percent_col formation ch06 period; run; 
data for_men_base; 
set for_men_1
for_men_2
for_men_3
for_men_4
for_men_5
for_men_6
for_men_7
for_men_8
for_men_9
for_men_10
for_men_11
for_men_12
for_men_13
for_men_14
for_men_15
for_men_16
for_men_18
for_men_19
for_men_20
for_men_21
for_men_22
for_men_23
for_men_24
for_men_25
for_men_26
for_men_27
for_men_28
for_men_29
for_men_30
for_men_31
for_men_32
for_men_33
for_men_34
for_men_35
for_men_36
for_men_37
for_men_38
for_men_39
for_men_40 for_men_41 for_men_42 for_men_43 for_men_44 for_men_45 for_men_46 for_men_47 for_men_48; run; 

/*We now transpose the base one education level at a time.*/

data for_1_men_base;
set for_men_base (where=(formation="1"));
run; 

data for_2_men_base;
set for_men_base  (where=(formation="2"));
run; 

data for_3_men_base;
set for_men_base  (where=(formation="3"));
run; 

proc sort data=for_1_men_base; 
by ch06; 
run; 
proc sort data=for_2_men_base; 
by ch06; 
run; 
 
proc sort data=for_3_men_base; 
by ch06; 
run; 
 
proc transpose data=for_1_men_base out=transp_for_1_men; 
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

data transp_for_1_men; 
set transp_for_1_men; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_for_1_men; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_for_1_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_for_1_men); 
proc print data=leo.cal_for_1_men; run;
proc export data=leo.cal_for_1_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_for_1_men.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=for_2_men_base out=transp_for_2_men; 
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

data transp_for_2_men; 
set transp_for_2_men; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_for_2_men; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_for_2_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_for_2_men); 
proc print data=leo.cal_for_2_men; run; 
proc export data=leo.cal_for_2_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_for_2_men.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=for_3_men_base out=transp_for_3_men; 
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

data transp_for_3_men; 
set transp_for_3_men; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_for_3_men; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_for_3_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_for_3_men); 
proc print data=leo.cal_for_3_men; run; 
proc export data=leo.cal_for_3_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_for_3_men.csv' 
dbms=csv replace; 
run; 

/*****************************We now compute the alignment tables for women*************************/

proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=2 & (period=1) & (agegroup =16|agegroup =20|agegroup=25)) ;
table formation*ch06 / noprint outpct out=for_wom_1; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=2 & (period=2)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=3)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=4)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=5)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=6)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=7)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=8)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=9)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=10)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=11)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=12)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=13)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=14)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=2 & (period=15)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=2 & (period=16)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=2 & (period=18)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=19)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=20)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=21)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=22)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=23)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=24)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=25)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=26)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_26; 
run;
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=27)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=28)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=29)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=30)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=31)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=32)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=33)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=34)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=35)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=36)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=37)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=38)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=39)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=40)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=41)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=42)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=43)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=44)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=45)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_45; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=46)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=2 & (period=47)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_47; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=2 & (period=48)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=for_wom_48; 
run; 
data for_wom_1; set for_wom_1; period=3; percent_col=pct_col/100; run; 
data for_wom_2; set for_wom_2; period=4; percent_col=pct_col/100; run; 
data for_wom_3; set for_wom_3; period=5; percent_col=pct_col/100; run; 
data for_wom_4; set for_wom_4; period=6; percent_col=pct_col/100; run; 
data for_wom_5; set for_wom_5; period=7; percent_col=pct_col/100; run; 
data for_wom_6; set for_wom_6; period=8; percent_col=pct_col/100; run; 
data for_wom_7; set for_wom_7; period=9; percent_col=pct_col/100; run; 
data for_wom_8; set for_wom_8; period=10; percent_col=pct_col/100; run; 
data for_wom_9; set for_wom_9; period=11; percent_col=pct_col/100; run; 
data for_wom_10; set for_wom_10; period=12; percent_col=pct_col/100; run; 
data for_wom_11; set for_wom_11; period=13; percent_col=pct_col/100; run; 
data for_wom_12; set for_wom_12; period=14; percent_col=pct_col/100; run; 
data for_wom_13; set for_wom_13; period=15; percent_col=pct_col/100; run; 
data for_wom_14; set for_wom_14; period=16; percent_col=pct_col/100; run; 
data for_wom_15; set for_wom_15; period=17; percent_col=pct_col/100; run; 
data for_wom_16; set for_wom_16; period=18; percent_col=pct_col/100; run; 
data for_wom_18; set for_wom_18; period=20; percent_col=pct_col/100; run; 
data for_wom_19; set for_wom_19; period=21; percent_col=pct_col/100; run; 
data for_wom_20; set for_wom_20; period=22; percent_col=pct_col/100; run; 
data for_wom_21; set for_wom_21; period=23; percent_col=pct_col/100; run; 
data for_wom_22; set for_wom_22; period=24; percent_col=pct_col/100; run; 
data for_wom_23; set for_wom_23; period=25; percent_col=pct_col/100; run; 
data for_wom_24; set for_wom_24; period=26; percent_col=pct_col/100; run; 
data for_wom_25; set for_wom_25; period=27; percent_col=pct_col/100; run; 
data for_wom_26; set for_wom_26; period=28; percent_col=pct_col/100; run; 
data for_wom_27; set for_wom_27; period=29; percent_col=pct_col/100; run; 
data for_wom_28; set for_wom_28; period=30; percent_col=pct_col/100; run; 
data for_wom_29; set for_wom_29; period=31; percent_col=pct_col/100; run; 
data for_wom_30; set for_wom_30; period=32; percent_col=pct_col/100; run; 
data for_wom_31; set for_wom_31; period=33; percent_col=pct_col/100; run; 
data for_wom_32; set for_wom_32; period=34; percent_col=pct_col/100; run; 
data for_wom_33; set for_wom_33; period=35; percent_col=pct_col/100; run; 
data for_wom_34; set for_wom_34; period=36; percent_col=pct_col/100; run; 
data for_wom_35; set for_wom_35; period=37; percent_col=pct_col/100; run; 
data for_wom_36; set for_wom_36; period=38; percent_col=pct_col/100; run; 
data for_wom_37; set for_wom_37; period=39; percent_col=pct_col/100; run; 
data for_wom_38; set for_wom_38; period=40; percent_col=pct_col/100; run; 
data for_wom_39; set for_wom_39; period=41; percent_col=pct_col/100; run; 
data for_wom_40; set for_wom_40; period=42; percent_col=pct_col/100; run; 
data for_wom_41; set for_wom_41; period=43; percent_col=pct_col/100; run; 
data for_wom_42; set for_wom_42; period=44; percent_col=pct_col/100; run; 
data for_wom_43; set for_wom_43; period=45; percent_col=pct_col/100; run; 
data for_wom_44; set for_wom_44; period=46; percent_col=pct_col/100; run; 
data for_wom_45; set for_wom_45; period=47; percent_col=pct_col/100; run; 
data for_wom_46; set for_wom_46; period=48; percent_col=pct_col/100; run; 
data for_wom_47; set for_wom_47; period=49; percent_col=pct_col/100; run; 
data for_wom_48; set for_wom_48; period=50; percent_col=pct_col/100; run; 

data for_wom_1; set for_wom_1; keep percent_col formation ch06 period; run; 
data for_wom_2; set for_wom_2; keep percent_col formation ch06 period; run; 
data for_wom_3; set for_wom_3; keep percent_col formation ch06 period; run; 
data for_wom_4; set for_wom_4; keep percent_col formation ch06 period; run; 
data for_wom_5; set for_wom_5; keep percent_col formation ch06 period; run; 
data for_wom_6; set for_wom_6; keep percent_col formation ch06 period; run; 
data for_wom_7; set for_wom_7; keep percent_col formation ch06 period; run; 
data for_wom_8; set for_wom_8; keep percent_col formation ch06 period; run; 
data for_wom_9; set for_wom_9; keep percent_col formation ch06 period; run; 
data for_wom_10; set for_wom_10; keep percent_col formation ch06 period; run; 
data for_wom_11; set for_wom_11; keep percent_col formation ch06 period; run; 
data for_wom_12; set for_wom_12; keep percent_col formation ch06 period; run; 
data for_wom_13; set for_wom_13; keep percent_col formation ch06 period; run; 
data for_wom_14; set for_wom_14; keep percent_col formation ch06 period; run; 
data for_wom_15; set for_wom_15; keep percent_col formation ch06 period; run; 
data for_wom_16; set for_wom_16; keep percent_col formation ch06 period; run; 
data for_wom_18; set for_wom_18; keep percent_col formation ch06 period; run; 
data for_wom_19; set for_wom_19; keep percent_col formation ch06 period; run; 
data for_wom_20; set for_wom_20; keep percent_col formation ch06 period; run; 
data for_wom_21; set for_wom_21; keep percent_col formation ch06 period; run; 
data for_wom_22; set for_wom_22; keep percent_col formation ch06 period; run; 
data for_wom_23; set for_wom_23; keep percent_col formation ch06 period; run; 
data for_wom_24; set for_wom_24; keep percent_col formation ch06 period; run; 
data for_wom_25; set for_wom_25; keep percent_col formation ch06 period; run; 
data for_wom_26; set for_wom_26; keep percent_col formation ch06 period; run; 
data for_wom_27; set for_wom_27; keep percent_col formation ch06 period; run; 
data for_wom_28; set for_wom_28; keep percent_col formation ch06 period; run; 
data for_wom_29; set for_wom_29; keep percent_col formation ch06 period; run; 
data for_wom_30; set for_wom_30; keep percent_col formation ch06 period; run; 
data for_wom_31; set for_wom_31; keep percent_col formation ch06 period; run; 
data for_wom_32; set for_wom_32; keep percent_col formation ch06 period; run; 
data for_wom_33; set for_wom_33; keep percent_col formation ch06 period; run; 
data for_wom_34; set for_wom_34; keep percent_col formation ch06 period; run; 
data for_wom_35; set for_wom_35; keep percent_col formation ch06 period; run; 
data for_wom_36; set for_wom_36; keep percent_col formation ch06 period; run; 
data for_wom_37; set for_wom_37; keep percent_col formation ch06 period; run; 
data for_wom_38; set for_wom_38; keep percent_col formation ch06 period; run; 
data for_wom_39; set for_wom_39; keep percent_col formation ch06 period; run; 
data for_wom_40; set for_wom_40; keep percent_col formation ch06 period; run; 
data for_wom_41; set for_wom_41; keep percent_col formation ch06 period; run; 
data for_wom_42; set for_wom_42; keep percent_col formation ch06 period; run; 
data for_wom_43; set for_wom_43; keep percent_col formation ch06 period; run; 
data for_wom_44; set for_wom_44; keep percent_col formation ch06 period; run; 
data for_wom_45; set for_wom_45; keep percent_col formation ch06 period; run; 
data for_wom_46; set for_wom_46; keep percent_col formation ch06 period; run; 
data for_wom_47; set for_wom_47; keep percent_col formation ch06 period; run; 
data for_wom_48; set for_wom_48; keep percent_col formation ch06 period; run; 
data for_wom_base; 
set for_wom_1
for_wom_2
for_wom_3
for_wom_4
for_wom_5
for_wom_6
for_wom_7
for_wom_8
for_wom_9
for_wom_10
for_wom_11
for_wom_12
for_wom_13
for_wom_14
for_wom_15
for_wom_16
for_wom_18
for_wom_19
for_wom_20
for_wom_21
for_wom_22
for_wom_23
for_wom_24
for_wom_25
for_wom_26
for_wom_27
for_wom_28
for_wom_29
for_wom_30
for_wom_31
for_wom_32
for_wom_33
for_wom_34
for_wom_35
for_wom_36
for_wom_37
for_wom_38
for_wom_39
for_wom_40 for_wom_41 for_wom_42 for_wom_43 for_wom_44 for_wom_45 for_wom_46 for_wom_47 for_wom_48; run; 


data for_1_wom_base;
set for_wom_base (where=(formation="1"));
run; 

data for_2_wom_base;
set for_wom_base(where=(formation="2"));
run; 

data for_3_wom_base;
set for_wom_base (where=(formation="3"));
run; 

proc sort data=for_1_wom_base; 
by ch06; 
run; 
proc sort data=for_2_wom_base; 
by ch06; 
run; 
 
proc sort data=for_3_wom_base; 
by ch06; 
run; 
 
proc transpose data=for_1_wom_base out=transp_for_1_wom; 
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

data transp_for_1_wom; 
set transp_for_1_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_for_1_wom; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_for_1_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_for_1_wom); 
proc print data=leo.cal_for_1_wom; run; 
proc export data=leo.cal_for_1_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_for_1_wom.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=for_2_wom_base out=transp_for_2_wom; 
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

data transp_for_2_wom; 
set transp_for_2_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_for_2_wom; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_for_2_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_for_2_wom); 
proc print data=leo.cal_for_2_wom; run; 
proc export data=leo.cal_for_2_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_for_2_wom.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=for_3_wom_base out=transp_for_3_wom; 
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

data transp_for_3_wom; 
set transp_for_3_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_for_3_wom; 
retain ch06 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_for_3_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_for_3_wom); 
proc print data=leo.cal_for_3_wom; run; 
proc export data=leo.cal_for_3_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_for_3_wom.csv' 
dbms=csv replace; 
run; 

/***********************************Next, we compute the alignment tables for marital status.****************************************/

/*We also align the marital status of the elderly, so we need to extend the age group variable for people 70 or more. All children 15 
		or less are modelled as single anyway, so we do not need to extend this variable before age 16.*/

data leo.eph_data_formatted_2003; 
set leo.eph_data_formatted_2003; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2004; 
set leo.eph_data_formatted_2004; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2005; 
set leo.eph_data_formatted_2005; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2006; 
set leo.eph_data_formatted_2006; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2007; 
set leo.eph_data_formatted_2007; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2008; 
set leo.eph_data_formatted_2008; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2009; 
set leo.eph_data_formatted_2009; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2010; 
set leo.eph_data_formatted_2010; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2011; 
set leo.eph_data_formatted_2011; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2012; 
set leo.eph_data_formatted_2012; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2013; 
set leo.eph_data_formatted_2013; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2014; 
set leo.eph_data_formatted_2014; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

data leo.eph_data_formatted_2015; 
set leo.eph_data_formatted_2015; 
agegroup_ext=agegroup; 
if 64<ch06<70 then agegroup_ext=65; 
if 69<ch06<76 then agegroup_ext=70; 
if 74<ch06<80 then agegroup_ext=75; 
if 79<ch06<86 then agegroup_ext=80; 
if 84<ch06<90 then agegroup_ext=85; 
if 89<ch06<96 then agegroup_ext=90; 
if 94<ch06<100 then agegroup_ext=95; 
run; 

/*First, the marital status for men*/
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=1 & (period=1) & (agegroup_ext>15)) ;
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_1; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=1 & (period=2)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=3)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=4)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=5)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=1 & (period=6)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=7)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=8)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=9)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=1 & (period=10)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=11)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=12)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=13)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=1 & (period=14)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=1 & (period=15)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=1 & (period=16)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=1 & (period=18)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=19)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=20)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=21)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=1 & (period=22)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=23)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=24)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=25)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=1 & (period=26)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_26; 
run;
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=27)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=28)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=29)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=1 & (period=30)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=31)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=32)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=33)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=1 & (period=34)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=35)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=36)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=37)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=1 & (period=38)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=39)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=40)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=41)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=1 & (period=42)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=43)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=44)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=45)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_45; 
run; 

proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=1 & (period=46)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=1 & (period=47)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_47; 
run; 

proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=1 & (period=48)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_men_48; 
run; 


data mar_stat_men_1; set mar_stat_men_1; period=3; percent_col=pct_col/100; run; 
data mar_stat_men_2; set mar_stat_men_2; period=4; percent_col=pct_col/100; run; 
data mar_stat_men_3; set mar_stat_men_3; period=5; percent_col=pct_col/100; run; 
data mar_stat_men_4; set mar_stat_men_4; period=6; percent_col=pct_col/100; run; 
data mar_stat_men_5; set mar_stat_men_5; period=7; percent_col=pct_col/100; run; 
data mar_stat_men_6; set mar_stat_men_6; period=8; percent_col=pct_col/100; run; 
data mar_stat_men_7; set mar_stat_men_7; period=9; percent_col=pct_col/100; run; 
data mar_stat_men_8; set mar_stat_men_8; period=10; percent_col=pct_col/100; run; 
data mar_stat_men_9; set mar_stat_men_9; period=11; percent_col=pct_col/100; run; 
data mar_stat_men_10; set mar_stat_men_10; period=12; percent_col=pct_col/100; run; 
data mar_stat_men_11; set mar_stat_men_11; period=13; percent_col=pct_col/100; run; 
data mar_stat_men_12; set mar_stat_men_12; period=14; percent_col=pct_col/100; run; 
data mar_stat_men_13; set mar_stat_men_13; period=15; percent_col=pct_col/100; run; 
data mar_stat_men_14; set mar_stat_men_14; period=16; percent_col=pct_col/100; run; 
data mar_stat_men_15; set mar_stat_men_15; period=17; percent_col=pct_col/100; run; 
data mar_stat_men_16; set mar_stat_men_16; period=18; percent_col=pct_col/100; run; 
data mar_stat_men_18; set mar_stat_men_18; period=20; percent_col=pct_col/100; run; 
data mar_stat_men_19; set mar_stat_men_19; period=21; percent_col=pct_col/100; run; 
data mar_stat_men_20; set mar_stat_men_20; period=22; percent_col=pct_col/100; run; 
data mar_stat_men_21; set mar_stat_men_21; period=23; percent_col=pct_col/100; run; 
data mar_stat_men_22; set mar_stat_men_22; period=24; percent_col=pct_col/100; run; 
data mar_stat_men_23; set mar_stat_men_23; period=25; percent_col=pct_col/100; run; 
data mar_stat_men_24; set mar_stat_men_24; period=26; percent_col=pct_col/100; run; 
data mar_stat_men_25; set mar_stat_men_25; period=27; percent_col=pct_col/100; run; 
data mar_stat_men_26; set mar_stat_men_26; period=28; percent_col=pct_col/100; run; 
data mar_stat_men_27; set mar_stat_men_27; period=29; percent_col=pct_col/100; run; 
data mar_stat_men_28; set mar_stat_men_28; period=30; percent_col=pct_col/100; run; 
data mar_stat_men_29; set mar_stat_men_29; period=31; percent_col=pct_col/100; run; 
data mar_stat_men_30; set mar_stat_men_30; period=32; percent_col=pct_col/100; run; 
data mar_stat_men_31; set mar_stat_men_31; period=33; percent_col=pct_col/100; run; 
data mar_stat_men_32; set mar_stat_men_32; period=34; percent_col=pct_col/100; run; 
data mar_stat_men_33; set mar_stat_men_33; period=35; percent_col=pct_col/100; run; 
data mar_stat_men_34; set mar_stat_men_34; period=36; percent_col=pct_col/100; run; 
data mar_stat_men_35; set mar_stat_men_35; period=37; percent_col=pct_col/100; run; 
data mar_stat_men_36; set mar_stat_men_36; period=38; percent_col=pct_col/100; run; 
data mar_stat_men_37; set mar_stat_men_37; period=39; percent_col=pct_col/100; run; 
data mar_stat_men_38; set mar_stat_men_38; period=40; percent_col=pct_col/100; run; 
data mar_stat_men_39; set mar_stat_men_39; period=41; percent_col=pct_col/100; run; 
data mar_stat_men_40; set mar_stat_men_40; period=42; percent_col=pct_col/100; run; 
data mar_stat_men_41; set mar_stat_men_41; period=43; percent_col=pct_col/100; run; 
data mar_stat_men_42; set mar_stat_men_42; period=44; percent_col=pct_col/100; run; 
data mar_stat_men_43; set mar_stat_men_43; period=45; percent_col=pct_col/100; run; 
data mar_stat_men_44; set mar_stat_men_44; period=46; percent_col=pct_col/100; run; 
data mar_stat_men_45; set mar_stat_men_45; period=47; percent_col=pct_col/100; run; 
data mar_stat_men_46; set mar_stat_men_46; period=48; percent_col=pct_col/100; run; 
data mar_stat_men_47; set mar_stat_men_47; period=49; percent_col=pct_col/100; run; 
data mar_stat_men_48; set mar_stat_men_48; period=50; percent_col=pct_col/100; run; 
data mar_stat_men_1; set mar_stat_men_1; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_2; set mar_stat_men_2; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_3; set mar_stat_men_3; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_4; set mar_stat_men_4; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_5; set mar_stat_men_5; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_6; set mar_stat_men_6; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_7; set mar_stat_men_7; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_8; set mar_stat_men_8; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_9; set mar_stat_men_9; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_10; set mar_stat_men_10; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_11; set mar_stat_men_11; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_12; set mar_stat_men_12; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_13; set mar_stat_men_13; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_14; set mar_stat_men_14; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_15; set mar_stat_men_15; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_16; set mar_stat_men_16; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_18; set mar_stat_men_18; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_19; set mar_stat_men_19; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_20; set mar_stat_men_20; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_21; set mar_stat_men_21; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_22; set mar_stat_men_22; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_23; set mar_stat_men_23; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_24; set mar_stat_men_24; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_25; set mar_stat_men_25; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_26; set mar_stat_men_26; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_27; set mar_stat_men_27; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_28; set mar_stat_men_28; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_29; set mar_stat_men_29; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_30; set mar_stat_men_30; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_31; set mar_stat_men_31; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_32; set mar_stat_men_32; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_33; set mar_stat_men_33; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_34; set mar_stat_men_34; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_35; set mar_stat_men_35; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_36; set mar_stat_men_36; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_37; set mar_stat_men_37; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_38; set mar_stat_men_38; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_39; set mar_stat_men_39; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_40; set mar_stat_men_40; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_41; set mar_stat_men_41; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_42; set mar_stat_men_42; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_43; set mar_stat_men_43; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_44; set mar_stat_men_44; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_45; set mar_stat_men_45; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_46; set mar_stat_men_46; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_47; set mar_stat_men_47; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_48; set mar_stat_men_48; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_men_base; 
set mar_stat_men_1
mar_stat_men_2
mar_stat_men_3
mar_stat_men_4
mar_stat_men_5
mar_stat_men_6
mar_stat_men_7
mar_stat_men_8
mar_stat_men_9
mar_stat_men_10
mar_stat_men_11
mar_stat_men_12
mar_stat_men_13
mar_stat_men_14
mar_stat_men_15
mar_stat_men_16
mar_stat_men_18
mar_stat_men_19
mar_stat_men_20
mar_stat_men_21
mar_stat_men_22
mar_stat_men_23
mar_stat_men_24
mar_stat_men_25
mar_stat_men_26
mar_stat_men_27
mar_stat_men_28
mar_stat_men_29
mar_stat_men_30
mar_stat_men_31
mar_stat_men_32
mar_stat_men_33
mar_stat_men_34
mar_stat_men_35
mar_stat_men_36
mar_stat_men_37
mar_stat_men_38
mar_stat_men_39
mar_stat_men_40 mar_stat_men_41 mar_stat_men_42 mar_stat_men_43 mar_stat_men_44 mar_stat_men_45 mar_stat_men_46 mar_stat_men_47 mar_stat_men_48; run; 
data base_mar_stat_men_1;
set mar_stat_men_base (where=(ch07=1));
run; 


data base_mar_stat_men_2;
set mar_stat_men_base (where=(ch07=2));
run; 
data base_mar_stat_men_3;
set mar_stat_men_base (where=(ch07=3));
run; 

data base_mar_stat_men_4;
set mar_stat_men_base (where=(ch07=4));
run; 

data base_mar_stat_men_5;
set mar_stat_men_base (where=(ch07=5));
run; 

proc sort data=base_mar_stat_men_1; 
by agegroup_ext; 
run; 
proc sort data=base_mar_stat_men_2; 
by agegroup_ext; 
run; 
 
proc sort data=base_mar_stat_men_3; 
by agegroup_ext; 
run; 
 
proc sort data=base_mar_stat_men_4; 
by agegroup_ext; 
run; 
 
proc sort data=base_mar_stat_men_5; 
by agegroup_ext; 
run; 
 
 
proc transpose data=base_mar_stat_men_1 out=transp_mar_stat_men_1; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_men_1; 
set transp_mar_stat_men_1 (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_men_1; 
set transp_mar_stat_men_1; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_men_1; 
set transp_mar_stat_men_1; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_men_1; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_men_1; 
run; 
%m_zero(leo.cal_mar_stat_men_1); 
proc print data=leo.cal_mar_stat_men_1; run; 
proc export data=leo.cal_mar_stat_men_1
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_men_1.csv' 
dbms=csv replace; 
run; 

proc print data=leo.cal_mar_stat_men_1; 
run; 



data base_mar_stat_men_2;
set mar_stat_men_base (where=(ch07=2));
run; 

data base_mar_stat_men_3;
set mar_stat_men_base (where=(ch07=3));
run; 

proc sort data=base_mar_stat_men_2; 
by agegroup_ext; 
run; 
 
proc sort data=base_mar_stat_men_3; 
by agegroup_ext; 
run; 
 
 
proc transpose data=base_mar_stat_men_2 out=transp_mar_stat_men_2; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_men_2; 
set transp_mar_stat_men_2 (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_men_2; 
set transp_mar_stat_men_2; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_men_2; 
set transp_mar_stat_men_2; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_men_2; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_men_2;
 
run; 
proc print data=leo.cal_mar_stat_men_2; run; 
%m_zero(leo.cal_mar_stat_men_2); 
proc export data=leo.cal_mar_stat_men_2
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_men_2.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=base_mar_stat_men_3 out=transp_mar_stat_men_3; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_men_3; 
set transp_mar_stat_men_3 (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_men_3; 
set transp_mar_stat_men_3; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_men_3; 
set transp_mar_stat_men_3; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_men_3; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_men_3;
 
run; 
proc print data=leo.cal_mar_stat_men_3; run; 
%m_zero(leo.cal_mar_stat_men_3); 
proc export data=leo.cal_mar_stat_men_3
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_men_3.csv' 
dbms=csv replace; 
run; 

proc transpose data=base_mar_stat_men_4 out=transp_mar_stat_men_4; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_men_4; 
set transp_mar_stat_men_4 (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_men_4; 
set transp_mar_stat_men_4; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_men_4; 
set transp_mar_stat_men_4; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_men_4; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_men_4;
 
run; 
proc print data=leo.cal_mar_stat_men_4; run; 
%m_zero(leo.cal_mar_stat_men_4); 
proc export data=leo.cal_mar_stat_men_4
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_men_4.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=base_mar_stat_men_5 out=transp_mar_stat_men_5; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_men_5; 
set transp_mar_stat_men_5 (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_men_5; 
set transp_mar_stat_men_5; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_men_5; 
set transp_mar_stat_men_5; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_men_5; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_men_5;
 
run; 
proc print data=leo.cal_mar_stat_men_5; run; 
proc print data=leo.cal_civ_5_m; run; 
%m_zero(leo.cal_mar_stat_men_5); 
proc export data=leo.cal_mar_stat_men_5
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_men_5.csv' 
dbms=csv replace; 
run; 

/*Here, the marital status for wom_en*/
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=2 & (period=1) & (agegroup_ext>15)) ;
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_1; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  ch04=2 & (period=2)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=3)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=4)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=5)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  ch04=2 & (period=6)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=7)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=8)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=9)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  ch04=2 & (period=10)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=11)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=12)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=13)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  ch04=2 & (period=14)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=2 & (period=15)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=2 & (period=16)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  ch04=2 & (period=18)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=19)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=20)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=21)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  ch04=2 & (period=22)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=23)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=24)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=25)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  ch04=2 & (period=26)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_26; 
run;
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=27)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=28)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=29)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  ch04=2 & (period=30)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=31)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=32)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=33)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  ch04=2 & (period=34)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=35)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=36)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=37)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  ch04=2 & (period=38)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=39)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=40)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=41)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  ch04=2 & (period=42)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=43)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=44)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=45)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_45; 
run; 

proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  ch04=2 & (period=46)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=2 & (period=47)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_47; 
run; 

proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  ch04=2 & (period=48)& (agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=mar_stat_wom_48; 
run; 


data mar_stat_wom_1; set mar_stat_wom_1; period=3; percent_col=pct_col/100; run; 
data mar_stat_wom_2; set mar_stat_wom_2; period=4; percent_col=pct_col/100; run; 
data mar_stat_wom_3; set mar_stat_wom_3; period=5; percent_col=pct_col/100; run; 
data mar_stat_wom_4; set mar_stat_wom_4; period=6; percent_col=pct_col/100; run; 
data mar_stat_wom_5; set mar_stat_wom_5; period=7; percent_col=pct_col/100; run; 
data mar_stat_wom_6; set mar_stat_wom_6; period=8; percent_col=pct_col/100; run; 
data mar_stat_wom_7; set mar_stat_wom_7; period=9; percent_col=pct_col/100; run; 
data mar_stat_wom_8; set mar_stat_wom_8; period=10; percent_col=pct_col/100; run; 
data mar_stat_wom_9; set mar_stat_wom_9; period=11; percent_col=pct_col/100; run; 
data mar_stat_wom_10; set mar_stat_wom_10; period=12; percent_col=pct_col/100; run; 
data mar_stat_wom_11; set mar_stat_wom_11; period=13; percent_col=pct_col/100; run; 
data mar_stat_wom_12; set mar_stat_wom_12; period=14; percent_col=pct_col/100; run; 
data mar_stat_wom_13; set mar_stat_wom_13; period=15; percent_col=pct_col/100; run; 
data mar_stat_wom_14; set mar_stat_wom_14; period=16; percent_col=pct_col/100; run; 
data mar_stat_wom_15; set mar_stat_wom_15; period=17; percent_col=pct_col/100; run; 
data mar_stat_wom_16; set mar_stat_wom_16; period=18; percent_col=pct_col/100; run; 
data mar_stat_wom_18; set mar_stat_wom_18; period=20; percent_col=pct_col/100; run; 
data mar_stat_wom_19; set mar_stat_wom_19; period=21; percent_col=pct_col/100; run; 
data mar_stat_wom_20; set mar_stat_wom_20; period=22; percent_col=pct_col/100; run; 
data mar_stat_wom_21; set mar_stat_wom_21; period=23; percent_col=pct_col/100; run; 
data mar_stat_wom_22; set mar_stat_wom_22; period=24; percent_col=pct_col/100; run; 
data mar_stat_wom_23; set mar_stat_wom_23; period=25; percent_col=pct_col/100; run; 
data mar_stat_wom_24; set mar_stat_wom_24; period=26; percent_col=pct_col/100; run; 
data mar_stat_wom_25; set mar_stat_wom_25; period=27; percent_col=pct_col/100; run; 
data mar_stat_wom_26; set mar_stat_wom_26; period=28; percent_col=pct_col/100; run; 
data mar_stat_wom_27; set mar_stat_wom_27; period=29; percent_col=pct_col/100; run; 
data mar_stat_wom_28; set mar_stat_wom_28; period=30; percent_col=pct_col/100; run; 
data mar_stat_wom_29; set mar_stat_wom_29; period=31; percent_col=pct_col/100; run; 
data mar_stat_wom_30; set mar_stat_wom_30; period=32; percent_col=pct_col/100; run; 
data mar_stat_wom_31; set mar_stat_wom_31; period=33; percent_col=pct_col/100; run; 
data mar_stat_wom_32; set mar_stat_wom_32; period=34; percent_col=pct_col/100; run; 
data mar_stat_wom_33; set mar_stat_wom_33; period=35; percent_col=pct_col/100; run; 
data mar_stat_wom_34; set mar_stat_wom_34; period=36; percent_col=pct_col/100; run; 
data mar_stat_wom_35; set mar_stat_wom_35; period=37; percent_col=pct_col/100; run; 
data mar_stat_wom_36; set mar_stat_wom_36; period=38; percent_col=pct_col/100; run; 
data mar_stat_wom_37; set mar_stat_wom_37; period=39; percent_col=pct_col/100; run; 
data mar_stat_wom_38; set mar_stat_wom_38; period=40; percent_col=pct_col/100; run; 
data mar_stat_wom_39; set mar_stat_wom_39; period=41; percent_col=pct_col/100; run; 
data mar_stat_wom_40; set mar_stat_wom_40; period=42; percent_col=pct_col/100; run; 
data mar_stat_wom_41; set mar_stat_wom_41; period=43; percent_col=pct_col/100; run; 
data mar_stat_wom_42; set mar_stat_wom_42; period=44; percent_col=pct_col/100; run; 
data mar_stat_wom_43; set mar_stat_wom_43; period=45; percent_col=pct_col/100; run; 
data mar_stat_wom_44; set mar_stat_wom_44; period=46; percent_col=pct_col/100; run; 
data mar_stat_wom_45; set mar_stat_wom_45; period=47; percent_col=pct_col/100; run; 
data mar_stat_wom_46; set mar_stat_wom_46; period=48; percent_col=pct_col/100; run; 
data mar_stat_wom_47; set mar_stat_wom_47; period=49; percent_col=pct_col/100; run; 
data mar_stat_wom_48; set mar_stat_wom_48; period=50; percent_col=pct_col/100; run; 
data mar_stat_wom_1; set mar_stat_wom_1; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_2; set mar_stat_wom_2; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_3; set mar_stat_wom_3; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_4; set mar_stat_wom_4; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_5; set mar_stat_wom_5; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_6; set mar_stat_wom_6; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_7; set mar_stat_wom_7; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_8; set mar_stat_wom_8; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_9; set mar_stat_wom_9; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_10; set mar_stat_wom_10; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_11; set mar_stat_wom_11; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_12; set mar_stat_wom_12; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_13; set mar_stat_wom_13; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_14; set mar_stat_wom_14; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_15; set mar_stat_wom_15; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_16; set mar_stat_wom_16; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_18; set mar_stat_wom_18; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_19; set mar_stat_wom_19; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_20; set mar_stat_wom_20; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_21; set mar_stat_wom_21; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_22; set mar_stat_wom_22; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_23; set mar_stat_wom_23; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_24; set mar_stat_wom_24; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_25; set mar_stat_wom_25; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_26; set mar_stat_wom_26; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_27; set mar_stat_wom_27; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_28; set mar_stat_wom_28; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_29; set mar_stat_wom_29; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_30; set mar_stat_wom_30; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_31; set mar_stat_wom_31; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_32; set mar_stat_wom_32; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_33; set mar_stat_wom_33; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_34; set mar_stat_wom_34; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_35; set mar_stat_wom_35; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_36; set mar_stat_wom_36; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_37; set mar_stat_wom_37; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_38; set mar_stat_wom_38; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_39; set mar_stat_wom_39; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_40; set mar_stat_wom_40; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_41; set mar_stat_wom_41; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_42; set mar_stat_wom_42; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_43; set mar_stat_wom_43; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_44; set mar_stat_wom_44; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_45; set mar_stat_wom_45; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_46; set mar_stat_wom_46; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_47; set mar_stat_wom_47; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_48; set mar_stat_wom_48; keep percent_col ch07 agegroup_ext period; run; 
data mar_stat_wom_base; 
set mar_stat_wom_1
mar_stat_wom_2
mar_stat_wom_3
mar_stat_wom_4
mar_stat_wom_5
mar_stat_wom_6
mar_stat_wom_7
mar_stat_wom_8
mar_stat_wom_9
mar_stat_wom_10
mar_stat_wom_11
mar_stat_wom_12
mar_stat_wom_13
mar_stat_wom_14
mar_stat_wom_15
mar_stat_wom_16
mar_stat_wom_18
mar_stat_wom_19
mar_stat_wom_20
mar_stat_wom_21
mar_stat_wom_22
mar_stat_wom_23
mar_stat_wom_24
mar_stat_wom_25
mar_stat_wom_26
mar_stat_wom_27
mar_stat_wom_28
mar_stat_wom_29
mar_stat_wom_30
mar_stat_wom_31
mar_stat_wom_32
mar_stat_wom_33
mar_stat_wom_34
mar_stat_wom_35
mar_stat_wom_36
mar_stat_wom_37
mar_stat_wom_38
mar_stat_wom_39
mar_stat_wom_40 mar_stat_wom_41 mar_stat_wom_42 mar_stat_wom_43 mar_stat_wom_44 mar_stat_wom_45 mar_stat_wom_46 mar_stat_wom_47 mar_stat_wom_48; run; 
data mar_stat_1_wom_base;
set mar_stat_wom_base (where=(ch07=1));
run; 


data mar_stat_2_wom_base;
set mar_stat_wom_base (where=(ch07=2));
run; 
data mar_stat_3_wom_base;
set mar_stat_wom_base (where=(ch07=3));
run; 

data mar_stat_4_wom_base;
set mar_stat_wom_base (where=(ch07=4));
run; 

data mar_stat_5_wom_base;
set mar_stat_wom_base (where=(ch07=5));
run; 

proc sort data=mar_stat_1_wom_base; 
by agegroup_ext; 
run; 
proc sort data=mar_stat_2_wom_base; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_3_wom_base; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_4_wom_base; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_5_wom_base; 
by agegroup_ext; 
run; 
 
 
proc transpose data=mar_stat_1_wom_base out=transp_mar_stat_1_wom; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_1_wom; 
set transp_mar_stat_1_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_1_wom; 
set transp_mar_stat_1_wom; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_1_wom; 
set transp_mar_stat_1_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_1_wom; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_1_wom; 
run; 
%m_zero(leo.cal_mar_stat_1_wom); 
proc print data=leo.cal_mar_stat_1_wom; run; 
proc export data=leo.cal_mar_stat_1_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_1_wom.csv' 
dbms=csv replace; 
run; 




data mar_stat_2_wom_base;
set leo.fluk_basefua (where=(ch07=2));
run; 

data mar_stat_3_wom_base;
set leo.fluk_basefua (where=(ch07=3));
run; 

proc sort data=mar_stat_2_wom_base; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_3_wom_base; 
by agegroup_ext; 
run; 
 
 
proc transpose data=mar_stat_2_wom_base out=transp_mar_stat_2_wom; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_2_wom; 
set transp_mar_stat_2_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_2_wom; 
set transp_mar_stat_2_wom; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_2_wom; 
set transp_mar_stat_2_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_2_wom; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_2_wom;
 
run; 
proc print data=leo.cal_mar_stat_2_wom; run; 
%m_zero(leo.cal_mar_stat_2_wom); 
proc export data=leo.cal_mar_stat_2_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_2_wom.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=mar_stat_3_wom_base out=transp_mar_stat_3_wom; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_3_wom; 
set transp_mar_stat_3_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_3_wom; 
set transp_mar_stat_3_wom; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_3_wom; 
set transp_mar_stat_3_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_3_wom; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_3_wom;
 
run; 
proc print data=leo.cal_mar_stat_3_wom; run; 
%m_zero(leo.cal_mar_stat_3_wom); 
proc export data=leo.cal_mar_stat_3_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_3_wom.csv' 
dbms=csv replace; 
run; 

proc transpose data=mar_stat_4_wom_base out=transp_mar_stat_4_wom; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_4_wom; 
set transp_mar_stat_4_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_4_wom; 
set transp_mar_stat_4_wom; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_4_wom; 
set transp_mar_stat_4_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_4_wom; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_4_wom;
 
run; 
proc print data=leo.cal_mar_stat_4_wom; run; 
%m_zero(leo.cal_mar_stat_4_wom); 
proc export data=leo.cal_mar_stat_4_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_4_wom.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=mar_stat_5_wom_base out=transp_mar_stat_5_wom; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_5_wom; 
set transp_mar_stat_5_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_5_wom; 
set transp_mar_stat_5_wom; 
drop _name_ _label_ ; 
RUN; 

data transp_mar_stat_5_wom; 
set transp_mar_stat_5_wom; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_mar_stat_5_wom; 
retain agegroup_ext _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_mar_stat_5_wom;
 
run; 
proc print data=leo.cal_mar_stat_5_wom; run; 
%m_zero(leo.cal_mar_stat_5_wom); 
proc export data=leo.cal_mar_stat_5_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_mar_stat_5_wom.csv' 
dbms=csv replace; 
run; 


/*Finally, we re-format all the above alignment datasets for our retrospective simulations. */

%cal_backward(leo.cal_stu_men,age);
%cal_backward(leo.cal_stu_wom,age);
%cal_backward(leo.cal_for_1_men,age);
%cal_backward(leo.cal_for_2_men,age);
%cal_backward(leo.cal_for_3_men,age);
%cal_backward(leo.cal_for_1_wom,age);
%cal_backward(leo.cal_for_2_wom,age);
%cal_backward(leo.cal_for_3_wom,age);


%cal_backward(leo.cal_mar_stat_1_men,agegroup_ext);
%cal_backward(leo.cal_mar_stat_2_men,agegroup_ext);
%cal_backward(leo.cal_mar_stat_3_men,agegroup_ext);
%cal_backward(leo.cal_mar_stat_4_men,agegroup_ext);
%cal_backward(leo.cal_mar_stat_5_men,agegroup_ext);
 
%cal_backward(leo.cal_mar_stat_1_wom,agegroup_ext);
%cal_backward(leo.cal_mar_stat_2_wom,agegroup_ext);
%cal_backward(leo.cal_mar_stat_3_wom,agegroup_ext);
%cal_backward(leo.cal_mar_stat_4_wom,agegroup_ext);
%cal_backward(leo.cal_mar_stat_5_wom,agegroup_ext);
 
%cal_backward(leo.cal_wag_men,agegroup);
%cal_backward(leo.cal_ind_men,agegroup);
%cal_backward(leo.cal_inf_men,agegroup);
%cal_backward(leo.cal_une_men,agegroup);
%cal_backward(leo.cal_ina_men,agegroup);

%cal_backward(leo.cal_wag_wom,agegroup);
%cal_backward(leo.cal_ind_wom,agegroup);
%cal_backward(leo.cal_inf_wom,agegroup);
%cal_backward(leo.cal_une_wom,agegroup);
%cal_backward(leo.cal_ina_wom,agegroup);
proc export data=leo.cal_wag_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_wag_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_ind_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ind_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_inf_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_inf_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_une_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_une_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_ina_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ina_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_wag_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_wag_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_ind_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ind_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_inf_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_inf_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_une_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_une_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_ina_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_ina_wom_b.csv' 
dbms=csv replace; 
run; 



proc export data=leo.cal_mar_stat_1_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_1_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_2_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_2_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_3_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_3_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_4_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_4_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_5_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_5_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_mar_stat_1_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_1_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_2_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_2_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_3_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_3_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_mar_stat_4_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_4_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_mar_stat_5_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_mar_stat_5_wom_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_for_1_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_for_1_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_for_2_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_for_2_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_for_3_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_for_3_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_for_1_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_for_1_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_for_2_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_for_2_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_for_3_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_for_3_wom_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_stu_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_stu_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_stu_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_stu_wom_b.csv' 
dbms=csv replace; 
run; 

/*************************Finally, we compute the probability a couple has of breaking up over the course of a quarter.********************/
 
/*First, we lump together single and divorced people (ch07=3 and ch07=5)*/
data break_up_data; 
set leo.eph_past_state; 
if marital_status=1 then marital_status_2=1; 
if marital_status=2 then marital_status_2=2; 
if marital_status=3 | marital_status=5 then marital_status_2=3;
if marital_status=4 then marital_status_2=4;  
if 15<ageconti<20 then agegroup_ext=16; 
if 19<ageconti<25 then agegroup_ext=20; 
if 24<ageconti<30 then agegroup_ext=25; 
if 29<ageconti<35 then agegroup_ext=30; 
if 34<ageconti<40 then agegroup_ext=35; 
if 39<ageconti<45 then agegroup_ext=40;
if 44<ageconti<50 then agegroup_ext=45; 
if 49<ageconti<55 then agegroup_ext=50;  
if 54<ageconti<60 then agegroup_ext=55; 
if 59<ageconti<65 then agegroup_ext=60;
if 64<ageconti<70 then agegroup_ext=65;
if 16>ageconti then agegroup_ext=1; 
if 69<ageconti<75 then agegroup_ext=70;
if 74<ageconti<80 then agegroup_ext=75;
if 79<ageconti<85 then agegroup_ext=80;
if 84<ageconti<90 then agegroup_ext=85;
if 89<ageconti<95 then agegroup_ext=90;
if 94<ageconti then agegroup_ext=95;
run; 
proc freq data=break_up_data; 
weight pondera; 
where (lag_partner_id^=0 & lag_marital_status=1 &  (ch04=1)  & ageconti>=16 & (formation^=3 | (formation=3 & agegroup_ext^=15))) ;
table agegroup_ext*marital_status_2 / noprint outpct out=break_up_men; 
run; 

proc freq data=break_up_data; 
weight pondera; 
where (lag_partner_id^=0 & lag_marital_status=1 &  (ch04=2)  & ageconti>=16 & (formation^=3 | (formation=3 & agegroup_ext^=15))) ;
table agegroup_ext*marital_status_2 / noprint outpct out=break_up_wom; 
run; 
data break_up_men; set break_up_men; percent_row=pct_row/100; run; 

data break_up_wom; set break_up_wom; percent_row=pct_row/100; run; 

data break_up_men; set break_up_men; keep percent_row marital_status_2 agegroup_ext period; run; 
data break_up_wom; set break_up_wom; keep percent_row marital_status_2 agegroup_ext period; run;


data leo.break_up_base_men;
set break_up_men (where=(marital_status_2=3));
run; 
data leo.break_up_base_wom;
set break_up_wom (where=(marital_status_2=3));
run; 
proc sort data=leo.break_up_base_men; 
by agegroup_ext; 
run; 
proc sort data=leo.break_up_base_wom; 
by agegroup_ext; 
run; 


proc export data=leo.break_up_base_men outfile="H:\Tout_LIAM2\code\code_backup\Simulations pour la thèse\Simulations prospectives\cal_breakup_men.csv"
dbms=csv replace; run; 

proc export data=leo.break_up_base_wom outfile="H:\Tout_LIAM2\code\code_backup\Simulations pour la thèse\Simulations prospectives\cal_breakup_wom.csv"
dbms=csv replace; run; 

/****************************Next, we add information on types of independent workers. Monotributo, etc. ********************/


data independent_2003; 
set leo.eph_data_formatted_2003; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2004; 
set leo.eph_data_formatted_2004; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2005; 
set leo.eph_data_formatted_2005; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2006; 
set leo.eph_data_formatted_2006; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2007; 
set leo.eph_data_formatted_2007; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2008; 
set leo.eph_data_formatted_2008; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2009; 
set leo.eph_data_formatted_2009; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2010; 
set leo.eph_data_formatted_2010; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2011; 
set leo.eph_data_formatted_2011; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2012; 
set leo.eph_data_formatted_2012; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2013; 
set leo.eph_data_formatted_2013; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2014; 
set leo.eph_data_formatted_2014; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 
data independent_2015; 
set leo.eph_data_formatted_2015; 
indep=0; 
if cat_ocup=1 | cat_ocup=2 then indep=1;
run; 

proc freq data=independent_2003; 
weight pondera; 
where ( (ch04=1) & (period=1) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_1;
 
run; 
proc freq data=independent_2003; 
weight pondera; 
where ( (ch04=1) & (period=2) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_2; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=1) & (period=3) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_3; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=1) & (period=4) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_4; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=1) & (period=5) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_5; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=1) & (period=6) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_6; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=1) & (period=7) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_7; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=1) & (period=8) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_8; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=1) & (period=9) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_9; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=1) & (period=10) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_10; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=1) & (period=11) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_11; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=1) & (period=12) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_12; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=1) & (period=13) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_13; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=1) & (period=14) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_14; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where ( (ch04=1) & (period=15) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_15; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where ( (ch04=1) & (period=16) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_16; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where ( (ch04=1) & (period=18) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_18; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=1) & (period=19) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_19; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=1) & (period=20) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_20; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=1) & (period=21) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_21; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=1) & (period=22) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_22; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=1) & (period=23) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_23; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=1) & (period=24) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_24; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=1) & (period=25) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_25; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=1) & (period=26) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_26; 
run;
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=1) & (period=27) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_27; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=1) & (period=28) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_28; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=1) & (period=29) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_29; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=1) & (period=30) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_30; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=1) & (period=31) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_31; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=1) & (period=32) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_32; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=1) & (period=33) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_33; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=1) & (period=34) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_34; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=1) & (period=35) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_35; 
run; 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=1) & (period=36) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_36; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=1) & (period=37) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_37; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=1) & (period=38) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_38; 
run; 

proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=1) & (period=39) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_39; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=1) & (period=40) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_40; 
run; 
 
proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=1) & (period=41) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_41; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=1) & (period=42) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_42; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=1) & (period=43) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_43; 
run; 
 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=1) & (period=44) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_44; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=1) & (period=45) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_45; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=1) & (period=46) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_46; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where ( (ch04=1) & (period=47) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_47; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where ( (ch04=1) & (period=48) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_men_48; 
run; 
data independent_men_1; set independent_men_1; period=3; percent_col=pct_col/100; run; 
data independent_men_2; set independent_men_2; period=4; percent_col=pct_col/100; run; 
data independent_men_3; set independent_men_3; period=5; percent_col=pct_col/100; run; 
data independent_men_4; set independent_men_4; period=6; percent_col=pct_col/100; run; 
data independent_men_5; set independent_men_5; period=7; percent_col=pct_col/100; run; 
data independent_men_6; set independent_men_6; period=8; percent_col=pct_col/100; run; 
data independent_men_7; set independent_men_7; period=9; percent_col=pct_col/100; run; 
data independent_men_8; set independent_men_8; period=10; percent_col=pct_col/100; run; 
data independent_men_9; set independent_men_9; period=11; percent_col=pct_col/100; run; 
data independent_men_10; set independent_men_10; period=12; percent_col=pct_col/100; run; 
data independent_men_11; set independent_men_11; period=13; percent_col=pct_col/100; run; 
data independent_men_12; set independent_men_12; period=14; percent_col=pct_col/100; run; 
data independent_men_13; set independent_men_13; period=15; percent_col=pct_col/100; run; 
data independent_men_14; set independent_men_14; period=16; percent_col=pct_col/100; run; 
data independent_men_15; set independent_men_15; period=17; percent_col=pct_col/100; run; 
data independent_men_16; set independent_men_16; period=18; percent_col=pct_col/100; run; 
data independent_men_18; set independent_men_18; period=20; percent_col=pct_col/100; run; 
data independent_men_19; set independent_men_19; period=21; percent_col=pct_col/100; run; 
data independent_men_20; set independent_men_20; period=22; percent_col=pct_col/100; run; 
data independent_men_21; set independent_men_21; period=23; percent_col=pct_col/100; run; 
data independent_men_22; set independent_men_22; period=24; percent_col=pct_col/100; run; 
data independent_men_23; set independent_men_23; period=25; percent_col=pct_col/100; run; 
data independent_men_24; set independent_men_24; period=26; percent_col=pct_col/100; run; 
data independent_men_25; set independent_men_25; period=27; percent_col=pct_col/100; run; 
data independent_men_26; set independent_men_26; period=28; percent_col=pct_col/100; run; 
data independent_men_27; set independent_men_27; period=29; percent_col=pct_col/100; run; 
data independent_men_28; set independent_men_28; period=30; percent_col=pct_col/100; run; 
data independent_men_29; set independent_men_29; period=31; percent_col=pct_col/100; run; 
data independent_men_30; set independent_men_30; period=32; percent_col=pct_col/100; run; 
data independent_men_31; set independent_men_31; period=33; percent_col=pct_col/100; run; 
data independent_men_32; set independent_men_32; period=34; percent_col=pct_col/100; run; 
data independent_men_33; set independent_men_33; period=35; percent_col=pct_col/100; run; 
data independent_men_34; set independent_men_34; period=36; percent_col=pct_col/100; run; 
data independent_men_35; set independent_men_35; period=37; percent_col=pct_col/100; run; 
data independent_men_36; set independent_men_36; period=38; percent_col=pct_col/100; run; 
data independent_men_37; set independent_men_37; period=39; percent_col=pct_col/100; run; 
data independent_men_38; set independent_men_38; period=40; percent_col=pct_col/100; run; 
data independent_men_39; set independent_men_39; period=41; percent_col=pct_col/100; run; 
data independent_men_40; set independent_men_40; period=42; percent_col=pct_col/100; run; 
data independent_men_41; set independent_men_41; period=43; percent_col=pct_col/100; run; 
data independent_men_42; set independent_men_42; period=44; percent_col=pct_col/100; run; 
data independent_men_43; set independent_men_43; period=45; percent_col=pct_col/100; run; 
data independent_men_44; set independent_men_44; period=46; percent_col=pct_col/100; run; 
data independent_men_45; set independent_men_45; period=47; percent_col=pct_col/100; run; 
data independent_men_46; set independent_men_46; period=48; percent_col=pct_col/100; run; 
data independent_men_47; set independent_men_47; period=49; percent_col=pct_col/100; run; 
data independent_men_48; set independent_men_48; period=50; percent_col=pct_col/100; run; 


data independent_men_1; set independent_men_1; keep percent_col indep agegroup period; run; 
data indepenedent_2; set independent_men_2; keep percent_col indep agegroup period; run; 
data independent_men_3; set independent_men_3; keep percent_col indep agegroup period; run; 
data independent_men_4; set independent_men_4; keep percent_col indep agegroup period; run; 
data independent_men_5; set independent_men_5; keep percent_col indep agegroup period; run; 
data independent_men_6; set independent_men_6; keep percent_col indep agegroup period; run; 
data independent_men_7; set independent_men_7; keep percent_col indep agegroup period; run; 
data independent_men_8; set independent_men_8; keep percent_col indep agegroup period; run; 
data independent_men_9; set independent_men_9; keep percent_col indep agegroup period; run; 
data independent_men_10; set independent_men_10; keep percent_col indep agegroup period; run; 
data independent_men_11; set independent_men_11; keep percent_col indep agegroup period; run; 
data independent_men_12; set independent_men_12; keep percent_col indep agegroup period; run; 
data independent_men_13; set independent_men_13; keep percent_col indep agegroup period; run; 
data independent_men_14; set independent_men_14; keep percent_col indep agegroup period; run; 
data independent_men_15; set independent_men_15; keep percent_col indep agegroup period; run; 
data independent_men_16; set independent_men_16; keep percent_col indep agegroup period; run; 
data independent_men_18; set independent_men_18; keep percent_col indep agegroup period; run; 
data independent_men_19; set independent_men_19; keep percent_col indep agegroup period; run; 
data independent_men_20; set independent_men_20; keep percent_col indep agegroup period; run; 
data independent_men_21; set independent_men_21; keep percent_col indep agegroup period; run; 
data independent_men_22; set independent_men_22; keep percent_col indep agegroup period; run; 
data independent_men_23; set independent_men_23; keep percent_col indep agegroup period; run; 
data independent_men_24; set independent_men_24; keep percent_col indep agegroup period; run; 
data independent_men_25; set independent_men_25; keep percent_col indep agegroup period; run; 
data independent_men_26; set independent_men_26; keep percent_col indep agegroup period; run; 
data independent_men_27; set independent_men_27; keep percent_col indep agegroup period; run; 
data independent_men_28; set independent_men_28; keep percent_col indep agegroup period; run; 
data independent_men_29; set independent_men_29; keep percent_col indep agegroup period; run; 
data independent_men_30; set independent_men_30; keep percent_col indep agegroup period; run; 
data independent_men_31; set independent_men_31; keep percent_col indep agegroup period; run; 
data independent_men_32; set independent_men_32; keep percent_col indep agegroup period; run; 
data independent_men_33; set independent_men_33; keep percent_col indep agegroup period; run; 
data independent_men_34; set independent_men_34; keep percent_col indep agegroup period; run; 
data independent_men_35; set independent_men_35; keep percent_col indep agegroup period; run; 
data independent_men_36; set independent_men_36; keep percent_col indep agegroup period; run; 
data independent_men_37; set independent_men_37; keep percent_col indep agegroup period; run; 
data independent_men_38; set independent_men_38; keep percent_col indep agegroup period; run; 
data independent_men_39; set independent_men_39; keep percent_col indep agegroup period; run; 
data independent_men_40; set independent_men_40; keep percent_col indep agegroup period; run; 
data independent_men_41; set independent_men_41; keep percent_col indep agegroup period; run; 
data independent_men_42; set independent_men_42; keep percent_col indep agegroup period; run; 
data independent_men_43; set independent_men_43; keep percent_col indep agegroup period; run; 
data independent_men_44; set independent_men_44; keep percent_col indep agegroup period; run; 
data independent_men_45; set independent_men_45; keep percent_col indep agegroup period; run; 
data independent_men_46; set independent_men_46; keep percent_col indep agegroup period; run; 
data independent_men_47; set independent_men_47; keep percent_col indep agegroup period; run; 
data independent_men_48; set independent_men_48; keep percent_col indep agegroup period; run; 
data independent_men_base; 
set independent_men_1
independent_men_2
independent_men_3
independent_men_4
independent_men_5
independent_men_6
independent_men_7
independent_men_8
independent_men_9
independent_men_10
independent_men_11
independent_men_12
independent_men_13
independent_men_14
independent_men_15
independent_men_16
independent_men_18
independent_men_19
independent_men_20
independent_men_21
independent_men_22
independent_men_23
independent_men_24
independent_men_25
independent_men_26
independent_men_27
independent_men_28
independent_men_29
independent_men_30
independent_men_31
independent_men_32
independent_men_33
independent_men_34
independent_men_35
independent_men_36
independent_men_37
independent_men_38
independent_men_39
independent_men_40 independent_men_41 independent_men_42 independent_men_43 independent_men_44 independent_men_45 independent_men_46 independent_men_47 independent_men_48; run; 

data independent_men_base;
set independent_men_base (where=(indep=1));
run; 
proc sort data=independent_men_base; 
by agegroup; 
run; 
 
proc transpose data=independent_men_base out=transp_indep_men; 
by agegroup;
id period ;
run;
data transp_indep_men; 
set transp_indep_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_indep_men; 
set transp_indep_men ; 
drop _name_ _label_ ; 
RUN; 

data transp_indep_men; 
set transp_indep_men; 
_19 = (_18 + _20) /2; 
run; 
proc print data=transp_indep_men; run; 
data leo.cal_indep_men; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_indep_men;
run; 
proc print data=leo.cal_indep_men (obs=10); run; 
/*The same thing is done for women*/

proc freq data=independent_2003; 
weight pondera; 
where ( (ch04=2) & (period=1) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_1;
run; 
proc freq data=independent_2003; 
weight pondera; 
where ( (ch04=2) & (period=2) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=fluk2; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=2) & (period=3) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_3; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=2) & (period=4) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_4; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=2) & (period=5) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_5; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where ( (ch04=2) & (period=6) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_6; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=2) & (period=7) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_7; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=2) & (period=8) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_8; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=2) & (period=9) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_9; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where ( (ch04=2) & (period=10) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_10; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=2) & (period=11) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_11; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=2) & (period=12) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_12; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=2) & (period=13) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_13; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where ( (ch04=2) & (period=14) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_14; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where ( (ch04=2) & (period=15) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_15; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where ( (ch04=2) & (period=16) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_16; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where ( (ch04=2) & (period=18) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_18; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=2) & (period=19) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_19; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=2) & (period=20) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_20; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=2) & (period=21) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_21; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where ( (ch04=2) & (period=22) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_22; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=2) & (period=23) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_23; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=2) & (period=24) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_24; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=2) & (period=25) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_25; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where ( (ch04=2) & (period=26) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_26; 
run; 

proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=2) & (period=27) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_27; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=2) & (period=28) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_28; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=2) & (period=29) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_29; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where ( (ch04=2) & (period=30) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_30; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=2) & (period=31) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_31; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=2) & (period=32) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_32; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=2) & (period=33) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_33; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where ( (ch04=2) & (period=34) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_34; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=2) & (period=35) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_35; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=2) & (period=36) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_36; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=2) & (period=37) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_37; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where ( (ch04=2) & (period=38) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_38; 
run; 

proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=2) & (period=39) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_39; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=2) & (period=40) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_40; 
run; 
 
proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=2) & (period=41) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_41; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where ( (ch04=2) & (period=42) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_42; 
run; 
 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=2) & (period=43) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_43; 
run; 
 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=2) & (period=44) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_44; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=2) & (period=45) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_45; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where ( (ch04=2) & (period=46) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_46; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where ( (ch04=2) & (period=47) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_47; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where ( (ch04=2) & (period=48) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep*agegroup / noprint outpct out=independent_wom_48; 
run; 
data independent_wom_1; set independent_wom_1; period=3; percent_col=pct_col/100; run; 
data  independent_wom_2; set independent_wom_2; period=4; percent_col=pct_col/100; run; 
data independent_wom_3; set independent_wom_3; period=5; percent_col=pct_col/100; run; 
data independent_wom_4; set independent_wom_4; period=6; percent_col=pct_col/100; run; 
data independent_wom_5; set independent_wom_5; period=7; percent_col=pct_col/100; run; 
data independent_wom_6; set independent_wom_6; period=8; percent_col=pct_col/100; run; 
data independent_wom_7; set independent_wom_7; period=9; percent_col=pct_col/100; run; 
data independent_wom_8; set independent_wom_8; period=10; percent_col=pct_col/100; run; 
data independent_wom_9; set independent_wom_9; period=11; percent_col=pct_col/100; run; 
data independent_wom_10; set independent_wom_10; period=12; percent_col=pct_col/100; run; 
data independent_wom_11; set independent_wom_11; period=13; percent_col=pct_col/100; run; 
data independent_wom_12; set independent_wom_12; period=14; percent_col=pct_col/100; run; 
data independent_wom_13; set independent_wom_13; period=15; percent_col=pct_col/100; run; 
data independent_wom_14; set independent_wom_14; period=16; percent_col=pct_col/100; run; 
data independent_wom_15; set independent_wom_15; period=17; percent_col=pct_col/100; run; 
data independent_wom_16; set independent_wom_16; period=18; percent_col=pct_col/100; run; 
data independent_wom_18; set independent_wom_18; period=20; percent_col=pct_col/100; run; 
data independent_wom_19; set independent_wom_19; period=21; percent_col=pct_col/100; run; 
data independent_wom_20; set independent_wom_20; period=22; percent_col=pct_col/100; run; 
data independent_wom_21; set independent_wom_21; period=23; percent_col=pct_col/100; run; 
data independent_wom_22; set independent_wom_22; period=24; percent_col=pct_col/100; run; 
data independent_wom_23; set independent_wom_23; period=25; percent_col=pct_col/100; run; 
data independent_wom_24; set independent_wom_24; period=26; percent_col=pct_col/100; run; 
data independent_wom_25; set independent_wom_25; period=27; percent_col=pct_col/100; run; 
data independent_wom_26; set independent_wom_26; period=28; percent_col=pct_col/100; run; 
data independent_wom_27; set independent_wom_27; period=29; percent_col=pct_col/100; run; 
data independent_wom_28; set independent_wom_28; period=30; percent_col=pct_col/100; run; 
data independent_wom_29; set independent_wom_29; period=31; percent_col=pct_col/100; run; 
data independent_wom_30; set independent_wom_30; period=32; percent_col=pct_col/100; run; 
data independent_wom_31; set independent_wom_31; period=33; percent_col=pct_col/100; run; 
data independent_wom_32; set independent_wom_32; period=34; percent_col=pct_col/100; run; 
data independent_wom_33; set independent_wom_33; period=35; percent_col=pct_col/100; run; 
data independent_wom_34; set independent_wom_34; period=36; percent_col=pct_col/100; run; 
data independent_wom_35; set independent_wom_35; period=37; percent_col=pct_col/100; run; 
data independent_wom_36; set independent_wom_36; period=38; percent_col=pct_col/100; run; 
data independent_wom_37; set independent_wom_37; period=39; percent_col=pct_col/100; run; 
data independent_wom_38; set independent_wom_38; period=40; percent_col=pct_col/100; run; 
data independent_wom_39; set independent_wom_39; period=41; percent_col=pct_col/100; run; 
data independent_wom_40; set independent_wom_40; period=42; percent_col=pct_col/100; run; 
data independent_wom_41; set independent_wom_41; period=43; percent_col=pct_col/100; run; 
data independent_wom_42; set independent_wom_42; period=44; percent_col=pct_col/100; run; 
data independent_wom_43; set independent_wom_43; period=45; percent_col=pct_col/100; run; 
data independent_wom_44; set independent_wom_44; period=46; percent_col=pct_col/100; run; 
data independent_wom_45; set independent_wom_45; period=47; percent_col=pct_col/100; run;
data independent_wom_46; set independent_wom_46; period=48; percent_col=pct_col/100; run;
data independent_wom_47; set independent_wom_47; period=49; percent_col=pct_col/100; run;
data independent_wom_48; set independent_wom_48; period=50; percent_col=pct_col/100; run;


data independent_wom_1; set independent_wom_1; keep percent_col indep agegroup period; run; 
data  independent_wom_2; set  independent_wom_2; keep percent_col indep agegroup period; run; 
data independent_wom_3; set independent_wom_3; keep percent_col indep agegroup period; run; 
data independent_wom_4; set independent_wom_4; keep percent_col indep agegroup period; run; 
data independent_wom_5; set independent_wom_5; keep percent_col indep agegroup period; run; 
data independent_wom_6; set independent_wom_6; keep percent_col indep agegroup period; run; 
data independent_wom_7; set independent_wom_7; keep percent_col indep agegroup period; run; 
data independent_wom_8; set independent_wom_8; keep percent_col indep agegroup period; run; 
data independent_wom_9; set independent_wom_9; keep percent_col indep agegroup period; run; 
data independent_wom_10; set independent_wom_10; keep percent_col indep agegroup period; run; 
data independent_wom_11; set independent_wom_11; keep percent_col indep agegroup period; run; 
data independent_wom_12; set independent_wom_12; keep percent_col indep agegroup period; run; 
data independent_wom_13; set independent_wom_13; keep percent_col indep agegroup period; run; 
data independent_wom_14; set independent_wom_14; keep percent_col indep agegroup period; run; 
data independent_wom_15; set independent_wom_15; keep percent_col indep agegroup period; run; 
data independent_wom_16; set independent_wom_16; keep percent_col indep agegroup period; run; 
data independent_wom_18; set independent_wom_18; keep percent_col indep agegroup period; run; 
data independent_wom_19; set independent_wom_19; keep percent_col indep agegroup period; run; 
data independent_wom_20; set independent_wom_20; keep percent_col indep agegroup period; run; 
data independent_wom_21; set independent_wom_21; keep percent_col indep agegroup period; run; 
data independent_wom_22; set independent_wom_22; keep percent_col indep agegroup period; run; 
data independent_wom_23; set independent_wom_23; keep percent_col indep agegroup period; run; 
data independent_wom_24; set independent_wom_24; keep percent_col indep agegroup period; run; 
data independent_wom_25; set independent_wom_25; keep percent_col indep agegroup period; run; 
data independent_wom_26; set independent_wom_26; keep percent_col indep agegroup period; run; 
data independent_wom_27; set independent_wom_27; keep percent_col indep agegroup period; run; 
data independent_wom_28; set independent_wom_28; keep percent_col indep agegroup period; run; 
data independent_wom_29; set independent_wom_29; keep percent_col indep agegroup period; run; 
data independent_wom_30; set independent_wom_30; keep percent_col indep agegroup period; run; 
data independent_wom_31; set independent_wom_31; keep percent_col indep agegroup period; run; 
data independent_wom_32; set independent_wom_32; keep percent_col indep agegroup period; run; 
data independent_wom_33; set independent_wom_33; keep percent_col indep agegroup period; run; 
data independent_wom_34; set independent_wom_34; keep percent_col indep agegroup period; run; 
data independent_wom_35; set independent_wom_35; keep percent_col indep agegroup period; run; 
data independent_wom_36; set independent_wom_36; keep percent_col indep agegroup period; run; 
data independent_wom_37; set independent_wom_37; keep percent_col indep agegroup period; run; 
data independent_wom_38; set independent_wom_38; keep percent_col indep agegroup period; run; 
data independent_wom_39; set independent_wom_39; keep percent_col indep agegroup period; run; 
data independent_wom_40; set independent_wom_40; keep percent_col indep agegroup period; run; 
data independent_wom_41; set independent_wom_41; keep percent_col indep agegroup period; run; 
data independent_wom_42; set independent_wom_42; keep percent_col indep agegroup period; run; 
data independent_wom_43; set independent_wom_43; keep percent_col indep agegroup period; run; 
data independent_wom_44; set independent_wom_44; keep percent_col indep agegroup period; run; 
data independent_wom_45; set independent_wom_45; keep percent_col indep agegroup period; run; 
data independent_wom_46; set independent_wom_46; keep percent_col indep agegroup period; run; 
data independent_wom_47; set independent_wom_47; keep percent_col indep agegroup period; run; 
data independent_wom_48; set independent_wom_48; keep percent_col indep agegroup period; run; 
data independent_wom_base; 
set independent_wom_1
 independent_wom_2
independent_wom_3
independent_wom_4
independent_wom_5
independent_wom_6
independent_wom_7
independent_wom_8
independent_wom_9
independent_wom_10
independent_wom_11
independent_wom_12
independent_wom_13
independent_wom_14
independent_wom_15
independent_wom_16
independent_wom_18
independent_wom_19
independent_wom_20
independent_wom_21
independent_wom_22
independent_wom_23
independent_wom_24
independent_wom_25
independent_wom_26
independent_wom_27
independent_wom_28
independent_wom_29
independent_wom_30
independent_wom_31
independent_wom_32
independent_wom_33
independent_wom_34
independent_wom_35
independent_wom_36
independent_wom_37
independent_wom_38
independent_wom_39
independent_wom_40 independent_wom_41 independent_wom_42 independent_wom_43 independent_wom_44 independent_wom_45 independent_wom_46 independent_wom_47 independent_wom_48; run; 

data independent_wom_base;
set independent_wom_base (where=(indep=1));
run; 
proc sort data=independent_wom_base; 
by agegroup; 
run; 
 
proc transpose data=independent_wom_base out=transp_indep_wom; 
by agegroup;
id period ;
run;
data transp_indep_wom; 
set transp_indep_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_indep_wom; 
set transp_indep_wom ; 
drop _name_ _label_ ; 
RUN; 
data transp_indep_wom; 
set transp_indep_wom; 
_19 = (_18 + _20) /2; 
run; 
proc print data=transp_indep_wom; run; 


data leo.cal_indep_wom; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_indep_wom;
run; 
proc print data=leo.cal_indep_wom; run; 

/*We next export a measurement of the population by age group and gender, useful for making our projection scenarios (in particular 
		regarding labour-market states, but also the proportion of people in a given independent labour market state*/


proc freq data=independent_2003; 
weight pondera; 
where (  (period=1) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_1;
 
run; 
proc freq data=independent_2003; 
weight pondera; 
where (  (period=2) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_2; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  (period=3) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_3; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  (period=4) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_4; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  (period=5) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_5; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  (period=6) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_6; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  (period=7) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_7; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  (period=8) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_8; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  (period=9) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_9; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  (period=10) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_10; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  (period=11) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_11; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  (period=12) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_12; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  (period=13) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_13; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  (period=14) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_14; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where (  (period=15) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_15; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where (  (period=16) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_16; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where (  (period=18) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_18; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  (period=19) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_19; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  (period=20) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_20; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  (period=21) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_21; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  (period=22) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_22; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  (period=23) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_23; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  (period=24) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_24; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  (period=25) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_25; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  (period=26) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_26; 
run;
proc freq data=independent_2010; 
weight pondera; 
where (  (period=27) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_27; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where (  (period=28) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_28; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where (  (period=29) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_29; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where (  (period=30) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_30; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where (  (period=31) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_31; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where (  (period=32) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_32; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where (  (period=33) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_33; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where (  (period=34) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_34; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  (period=35) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_35; 
run; 
proc freq data=independent_2012; 
weight pondera; 
where (  (period=36) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_36; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  (period=37) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_37; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  (period=38) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_38; 
run; 

proc freq data=independent_2013; 
weight pondera; 
where (  (period=39) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_39; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where (  (period=40) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_40; 
run; 
 
proc freq data=independent_2013; 
weight pondera; 
where (  (period=41) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_41; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where (  (period=42) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_42; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where (  (period=43) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_43; 
run; 
 
proc freq data=independent_2014; 
weight pondera; 
where (  (period=44) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_44; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where (  (period=45) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_45; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where (  (period=46) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_46; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where (  (period=47) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_47; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where (  (period=48) & (agegroup ^=1) & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table ch04*agegroup /  noprint outpct out=population_48; 
run; 
data population_1; set population_1; period=3; run; 
data population_2; set population_2; period=4; run; 
data population_3; set population_3; period=5; run; 
data population_4; set population_4; period=6; run; 
data population_5; set population_5; period=7; run; 
data population_6; set population_6; period=8; run; 
data population_7; set population_7; period=9; run; 
data population_8; set population_8; period=10; run; 
data population_9; set population_9; period=11; run; 
data population_10; set population_10; period=12; run; 
data population_11; set population_11; period=13; run; 
data population_12; set population_12; period=14; run; 
data population_13; set population_13; period=15; run; 
data population_14; set population_14; period=16; run; 
data population_15; set population_15; period=17; run; 
data population_16; set population_16; period=18; run; 
data population_18; set population_18; period=20; run; 
data population_19; set population_19; period=21; run; 
data population_20; set population_20; period=22; run; 
data population_21; set population_21; period=23; run; 
data population_22; set population_22; period=24; run; 
data population_23; set population_23; period=25; run; 
data population_24; set population_24; period=26; run; 
data population_25; set population_25; period=27; run; 
data population_26; set population_26; period=28; run; 
data population_27; set population_27; period=29; run; 
data population_28; set population_28; period=30; run; 
data population_29; set population_29; period=31; run; 
data population_30; set population_30; period=32; run; 
data population_31; set population_31; period=33; run; 
data population_32; set population_32; period=34; run; 
data population_33; set population_33; period=35; run; 
data population_34; set population_34; period=36; run; 
data population_35; set population_35; period=37; run; 
data population_36; set population_36; period=38; run; 
data population_37; set population_37; period=39; run; 
data population_38; set population_38; period=40; run; 
data population_39; set population_39; period=41; run; 
data population_40; set population_40; period=42; run; 
data population_41; set population_41; period=43; run; 
data population_42; set population_42; period=44; run; 
data population_43; set population_43; period=45; run; 
data population_44; set population_44; period=46; run; 
data population_45; set population_45; period=47; run; 
data population_46; set population_46; period=48; run; 
data population_47; set population_47; period=49; run; 
data population_48; set population_48; period=50; run; 


data population_1; set population_1; keep count indep agegroup period ch04; run; 
data population_2; set population_2; keep count indep agegroup period count ch04; run; 
data population_3; set population_3; keep count indep agegroup period count ch04; run; 
data population_4; set population_4; keep count indep agegroup period count ch04; run; 
data population_5; set population_5; keep count indep agegroup period count ch04; run; 
data population_6; set population_6; keep count indep agegroup period count ch04; run; 
data population_7; set population_7; keep count indep agegroup period count ch04; run; 
data population_8; set population_8; keep count indep agegroup period count ch04; run; 
data population_9; set population_9; keep count indep agegroup period count ch04; run; 
data population_10; set population_10; keep count indep agegroup period count ch04; run; 
data population_11; set population_11; keep count indep agegroup period count ch04; run; 
data population_12; set population_12; keep count indep agegroup period count ch04; run; 
data population_13; set population_13; keep count indep agegroup period count ch04; run; 
data population_14; set population_14; keep count indep agegroup period count ch04; run; 
data population_15; set population_15; keep count indep agegroup period count ch04; run; 
data population_16; set population_16; keep count indep agegroup period count ch04; run; 
data population_18; set population_18; keep count indep agegroup period count ch04; run; 
data population_19; set population_19; keep count indep agegroup period count ch04; run; 
data population_20; set population_20; keep count indep agegroup period count ch04; run; 
data population_21; set population_21; keep count indep agegroup period count ch04; run; 
data population_22; set population_22; keep count indep agegroup period count ch04; run; 
data population_23; set population_23; keep count indep agegroup period count ch04; run; 
data population_24; set population_24; keep count indep agegroup period count ch04; run; 
data population_25; set population_25; keep count indep agegroup period count ch04; run; 
data population_26; set population_26; keep count indep agegroup period count ch04; run; 
data population_27; set population_27; keep count indep agegroup period count ch04; run; 
data population_28; set population_28; keep count indep agegroup period count ch04; run; 
data population_29; set population_29; keep count indep agegroup period count ch04; run; 
data population_30; set population_30; keep count indep agegroup period count ch04; run; 
data population_31; set population_31; keep count indep agegroup period count ch04; run; 
data population_32; set population_32; keep count indep agegroup period count ch04; run; 
data population_33; set population_33; keep count indep agegroup period count ch04; run; 
data population_34; set population_34; keep count indep agegroup period count ch04; run; 
data population_35; set population_35; keep count indep agegroup period count ch04; run; 
data population_36; set population_36; keep count indep agegroup period count ch04; run; 
data population_37; set population_37; keep count indep agegroup period count ch04; run; 
data population_38; set population_38; keep count indep agegroup period count ch04; run; 
data population_39; set population_39; keep count indep agegroup period count ch04; run; 
data population_40; set population_40; keep count indep agegroup period count ch04; run; 
data population_41; set population_41; keep count indep agegroup period count ch04; run; 
data population_42; set population_42; keep count indep agegroup period count ch04; run; 
data population_43; set population_43; keep count indep agegroup period count ch04; run; 
data population_44; set population_44; keep count indep agegroup period count ch04; run; 
data population_45; set population_45; keep count indep agegroup period count ch04; run; 
data population_46; set population_46; keep count indep agegroup period count ch04; run; 
data population_47; set population_47; keep count indep agegroup period count ch04; run; 
data population_48; set population_48; keep count indep agegroup period count ch04; run; 
data population_base; 
set population_1
population_2
population_3
population_4
population_5
population_6
population_7
population_8
population_9
population_10
population_11
population_12
population_13
population_14
population_15
population_16
population_18
population_19
population_20
population_21
population_22
population_23
population_24
population_25
population_26
population_27
population_28
population_29
population_30
population_31
population_32
population_33
population_34
population_35
population_36
population_37
population_38
population_39
population_40 population_41 population_42 population_43 population_44 population_45 population_46 population_47 population_48; run; 
proc print data=population_base; run; 

data male_population_base;
set population_base (where=(ch04=1));
run; 
proc sort data=male_population_base; 
by agegroup; 
run; 
proc transpose data=male_population_base out=transp_male_population; 
by agegroup;
id period ;
run;
data transp_male_population; 
set transp_male_population (where= (_NAME_="COUNT")); 
RUN; 

data transp_male_population; 
set transp_male_population ; 
drop _name_ _label_ ; 
RUN; 

data transp_male_population; 
set transp_male_population; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_male_population; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_male_population;
run; 
proc print data=leo.cal_male_population; run; 


data female_population_base;
set population_base (where=(ch04=2));
run; 
proc sort data=female_population_base; 
by agegroup; 
run; 
proc transpose data=female_population_base out=transp_female_population; 
by agegroup;
id period ;
run;
data transp_female_population; 
set transp_female_population (where= (_NAME_="COUNT")); 
RUN; 

data transp_female_population; 
set transp_female_population ; 
drop _name_ _label_ ; 
RUN; 

data transp_female_population; 
set transp_female_population; 
_19 = (_18 + _20) /2; 
run; 
data leo.cal_female_population; 
retain agegroup _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_female_population;
run; 
proc print data=leo.cal_female; run; 
proc print data=leo.cal_female_population; run; 

/*We compute the proportion of formal wage-earners by gender. This lets us deduce from external AFIP data proportions of workers by gender
		at later steps of this work.*/
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  (period=1) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_1;
run; 
proc freq data=leo.eph_data_formatted_2003; 
weight pondera; 
where (  (period=2) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=fluk2; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  (period=3) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_3; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  (period=4) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_4; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  (period=5) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_5; 
run; 
proc freq data=leo.eph_data_formatted_2004; 
weight pondera; 
where (  (period=6) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_6; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  (period=7) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_7; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  (period=8) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_8; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  (period=9) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_9; 
run; 
proc freq data=leo.eph_data_formatted_2005; 
weight pondera; 
where (  (period=10) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_10; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  (period=11) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_11; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  (period=12) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_12; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  (period=13) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_13; 
run; 
proc freq data=leo.eph_data_formatted_2006; 
weight pondera; 
where (  (period=14) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_14; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  (period=15) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_15; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  (period=16) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_16; 
run; 
proc freq data=leo.eph_data_formatted_2007; 
weight pondera; 
where (  (period=18) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_18; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  (period=19) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_19; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  (period=20) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_20; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  (period=21) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_21; 
run; 
proc freq data=leo.eph_data_formatted_2008; 
weight pondera; 
where (  (period=22) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_22; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  (period=23) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_23; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  (period=24) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_24; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  (period=25) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_25; 
run; 
proc freq data=leo.eph_data_formatted_2009; 
weight pondera; 
where (  (period=26) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_26; 
run; 

proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  (period=27) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_27; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  (period=28) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_28; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  (period=29) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_29; 
run; 
proc freq data=leo.eph_data_formatted_2010; 
weight pondera; 
where (  (period=30) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_30; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  (period=31) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_31; 
run; 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  (period=32) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_32; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  (period=33) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_33; 
run; 
 
proc freq data=leo.eph_data_formatted_2011; 
weight pondera; 
where (  (period=34) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_34; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  (period=35) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_35; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  (period=36) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_36; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  (period=37) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_37; 
run; 
 
proc freq data=leo.eph_data_formatted_2012; 
weight pondera; 
where (  (period=38) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_38; 
run; 

proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  (period=39) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_39; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  (period=40) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_40; 
run; 
 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  (period=41) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_41; 
run; 
proc freq data=leo.eph_data_formatted_2013; 
weight pondera; 
where (  (period=42) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_42; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  (period=43) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_43; 
run; 
 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  (period=44) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_44; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  (period=45) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_45; 
run; 
proc freq data=leo.eph_data_formatted_2014; 
weight pondera; 
where (  (period=46) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_46; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  (period=47) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_47; 
run; 
proc freq data=leo.eph_data_formatted_2015; 
weight pondera; 
where (  (period=48) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*ch04 / noprint outpct out=lms_gender_48; 
run; 
data lms_gender_1; set lms_gender_1; period=3; percent_row=pct_row/100; run; 
data  lms_gender_2; set lms_gender_2; period=4; percent_row=pct_row/100; run; 
data lms_gender_3; set lms_gender_3; period=5; percent_row=pct_row/100; run; 
data lms_gender_4; set lms_gender_4; period=6; percent_row=pct_row/100; run; 
data lms_gender_5; set lms_gender_5; period=7; percent_row=pct_row/100; run; 
data lms_gender_6; set lms_gender_6; period=8; percent_row=pct_row/100; run; 
data lms_gender_7; set lms_gender_7; period=9; percent_row=pct_row/100; run; 
data lms_gender_8; set lms_gender_8; period=10; percent_row=pct_row/100; run; 
data lms_gender_9; set lms_gender_9; period=11; percent_row=pct_row/100; run; 
data lms_gender_10; set lms_gender_10; period=12; percent_row=pct_row/100; run; 
data lms_gender_11; set lms_gender_11; period=13; percent_row=pct_row/100; run; 
data lms_gender_12; set lms_gender_12; period=14; percent_row=pct_row/100; run; 
data lms_gender_13; set lms_gender_13; period=15; percent_row=pct_row/100; run; 
data lms_gender_14; set lms_gender_14; period=16; percent_row=pct_row/100; run; 
data lms_gender_15; set lms_gender_15; period=17; percent_row=pct_row/100; run; 
data lms_gender_16; set lms_gender_16; period=18; percent_row=pct_row/100; run; 
data lms_gender_18; set lms_gender_18; period=20; percent_row=pct_row/100; run; 
data lms_gender_19; set lms_gender_19; period=21; percent_row=pct_row/100; run; 
data lms_gender_20; set lms_gender_20; period=22; percent_row=pct_row/100; run; 
data lms_gender_21; set lms_gender_21; period=23; percent_row=pct_row/100; run; 
data lms_gender_22; set lms_gender_22; period=24; percent_row=pct_row/100; run; 
data lms_gender_23; set lms_gender_23; period=25; percent_row=pct_row/100; run; 
data lms_gender_24; set lms_gender_24; period=26; percent_row=pct_row/100; run; 
data lms_gender_25; set lms_gender_25; period=27; percent_row=pct_row/100; run; 
data lms_gender_26; set lms_gender_26; period=28; percent_row=pct_row/100; run; 
data lms_gender_27; set lms_gender_27; period=29; percent_row=pct_row/100; run; 
data lms_gender_28; set lms_gender_28; period=30; percent_row=pct_row/100; run; 
data lms_gender_29; set lms_gender_29; period=31; percent_row=pct_row/100; run; 
data lms_gender_30; set lms_gender_30; period=32; percent_row=pct_row/100; run; 
data lms_gender_31; set lms_gender_31; period=33; percent_row=pct_row/100; run; 
data lms_gender_32; set lms_gender_32; period=34; percent_row=pct_row/100; run; 
data lms_gender_33; set lms_gender_33; period=35; percent_row=pct_row/100; run; 
data lms_gender_34; set lms_gender_34; period=36; percent_row=pct_row/100; run; 
data lms_gender_35; set lms_gender_35; period=37; percent_row=pct_row/100; run; 
data lms_gender_36; set lms_gender_36; period=38; percent_row=pct_row/100; run; 
data lms_gender_37; set lms_gender_37; period=39; percent_row=pct_row/100; run; 
data lms_gender_38; set lms_gender_38; period=40; percent_row=pct_row/100; run; 
data lms_gender_39; set lms_gender_39; period=41; percent_row=pct_row/100; run; 
data lms_gender_40; set lms_gender_40; period=42; percent_row=pct_row/100; run; 
data lms_gender_41; set lms_gender_41; period=43; percent_row=pct_row/100; run; 
data lms_gender_42; set lms_gender_42; period=44; percent_row=pct_row/100; run; 
data lms_gender_43; set lms_gender_43; period=45; percent_row=pct_row/100; run; 
data lms_gender_44; set lms_gender_44; period=46; percent_row=pct_row/100; run; 
data lms_gender_45; set lms_gender_45; period=47; percent_row=pct_row/100; run;
data lms_gender_46; set lms_gender_46; period=48; percent_row=pct_row/100; run;
data lms_gender_47; set lms_gender_47; period=49; percent_row=pct_row/100; run;
data lms_gender_48; set lms_gender_48; period=50; percent_row=pct_row/100; run;


data lms_gender_1; set lms_gender_1; keep percent_row labour_market_state ch04 period; run; 
data  lms_gender_2; set  lms_gender_2; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_3; set lms_gender_3; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_4; set lms_gender_4; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_5; set lms_gender_5; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_6; set lms_gender_6; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_7; set lms_gender_7; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_8; set lms_gender_8; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_9; set lms_gender_9; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_10; set lms_gender_10; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_11; set lms_gender_11; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_12; set lms_gender_12; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_13; set lms_gender_13; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_14; set lms_gender_14; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_15; set lms_gender_15; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_16; set lms_gender_16; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_18; set lms_gender_18; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_19; set lms_gender_19; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_20; set lms_gender_20; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_21; set lms_gender_21; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_22; set lms_gender_22; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_23; set lms_gender_23; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_24; set lms_gender_24; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_25; set lms_gender_25; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_26; set lms_gender_26; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_27; set lms_gender_27; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_28; set lms_gender_28; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_29; set lms_gender_29; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_30; set lms_gender_30; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_31; set lms_gender_31; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_32; set lms_gender_32; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_33; set lms_gender_33; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_34; set lms_gender_34; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_35; set lms_gender_35; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_36; set lms_gender_36; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_37; set lms_gender_37; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_38; set lms_gender_38; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_39; set lms_gender_39; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_40; set lms_gender_40; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_41; set lms_gender_41; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_42; set lms_gender_42; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_43; set lms_gender_43; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_44; set lms_gender_44; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_45; set lms_gender_45; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_46; set lms_gender_46; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_47; set lms_gender_47; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_48; set lms_gender_48; keep percent_row labour_market_state ch04 period; run; 
data lms_gender_base; 
set lms_gender_1
 lms_gender_2
lms_gender_3
lms_gender_4
lms_gender_5
lms_gender_6
lms_gender_7
lms_gender_8
lms_gender_9
lms_gender_10
lms_gender_11
lms_gender_12
lms_gender_13
lms_gender_14
lms_gender_15
lms_gender_16
lms_gender_18
lms_gender_19
lms_gender_20
lms_gender_21
lms_gender_22
lms_gender_23
lms_gender_24
lms_gender_25
lms_gender_26
lms_gender_27
lms_gender_28
lms_gender_29
lms_gender_30
lms_gender_31
lms_gender_32
lms_gender_33
lms_gender_34
lms_gender_35
lms_gender_36
lms_gender_37
lms_gender_38
lms_gender_39
lms_gender_40 lms_gender_41 lms_gender_42 lms_gender_43 lms_gender_44 lms_gender_45 lms_gender_46 lms_gender_47 lms_gender_48; run;
proc print data=lms_gender_base; run;  

data male_lms_base;;
set lms_gender_base (where=(labour_market_state=1));
run; 
proc sort data=male_lms_base; 
by ch04; 
run; 
 
proc transpose data=male_lms_base out=transp_lms_men; 
by ch04;
id period ;
run;
data transp_lms_men; 
set transp_lms_men (where= (_NAME_="percent_row")); 
RUN; 

data transp_lms_men; 
set transp_lms_men; 
drop _name_ _label_ ; 
RUN; 
data transp_lms_men; 
set transp_lms_men; 
_19 = (_18 + _20) /2; 
run; 


data leo.cal_lms_gender; 
retain ch04 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_lms_men;
run; 

proc print data=leo.cal_lms_gender; run; 
/*We then divide the population in three categories: formal wage-earners, independent workers and the rest.*/
data independent_2015; 
set independent_2015; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 

data independent_2014; 
set independent_2014; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2013; 
set independent_2013; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2012; 
set independent_2012; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2011; 
set independent_2011; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
options nofmterr; 
data independent_2010; 
set independent_2010; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2009; 
set independent_2009; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2008; 
set independent_2008; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2007; 
set independent_2007; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2006; 
set independent_2006; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2005; 
set independent_2005; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
data independent_2004; 
set independent_2004; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 
options nofmterr; 
data independent_2003; 
set independent_2003; 
indep_2=0; 
if indep=1 then indep_2=1; 
if labour_Market_state=1 then indep_2=2; 
if indep=0 & labour_Market_state^=1 then indep_2=0; 
run; 

proc freq data=independent_2003; 
weight pondera; 
where (  indep_2^=0 & (period=1) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_1;
run; 

proc freq data=independent_2003; 
weight pondera; 
where (  indep_2^=0 & (period=2) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_2; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  indep_2^=0 & (period=3) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_3; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  indep_2^=0 & (period=4) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_4; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  indep_2^=0 & (period=5) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_5; 
run; 
proc freq data=independent_2004; 
weight pondera; 
where (  indep_2^=0 & (period=6) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_6; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  indep_2^=0 & (period=7) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_7; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  indep_2^=0 & (period=8) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_8; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  indep_2^=0 & (period=9) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_9; 
run; 
proc freq data=independent_2005; 
weight pondera; 
where (  indep_2^=0 & (period=10) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_10; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  indep_2^=0 & (period=11) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_11; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  indep_2^=0 & (period=12) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_12; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  indep_2^=0 & (period=13) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_13; 
run; 
proc freq data=independent_2006; 
weight pondera; 
where (  indep_2^=0 & (period=14) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_14; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where (  indep_2^=0 & (period=15) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_15; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where (  indep_2^=0 & (period=16) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_16; 
run; 
proc freq data=independent_2007; 
weight pondera; 
where (  indep_2^=0 & (period=18) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_18; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  indep_2^=0 & (period=19) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_19; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  indep_2^=0 & (period=20) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_20; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  indep_2^=0 & (period=21) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_21; 
run; 
proc freq data=independent_2008; 
weight pondera; 
where (  indep_2^=0 & (period=22) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_22; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  indep_2^=0 & (period=23) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_23; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  indep_2^=0 & (period=24) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_24; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  indep_2^=0 & (period=25) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_25; 
run; 
proc freq data=independent_2009; 
weight pondera; 
where (  indep_2^=0 & (period=26) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_26; 
run; 

proc freq data=independent_2010; 
weight pondera; 
where (  indep_2^=0 & (period=27) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_27; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where (  indep_2^=0 & (period=28) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_28; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where (  indep_2^=0 & (period=29) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_29; 
run; 
proc freq data=independent_2010; 
weight pondera; 
where (  indep_2^=0 & (period=30) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_30; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where (  indep_2^=0 & (period=31) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_31; 
run; 
proc freq data=independent_2011; 
weight pondera; 
where (  indep_2^=0 & (period=32) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_32; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where (  indep_2^=0 & (period=33) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_33; 
run; 
 
proc freq data=independent_2011; 
weight pondera; 
where (  indep_2^=0 & (period=34) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_34; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  indep_2^=0 & (period=35) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_35; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  indep_2^=0 & (period=36) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_36; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  indep_2^=0 & (period=37) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_37; 
run; 
 
proc freq data=independent_2012; 
weight pondera; 
where (  indep_2^=0 & (period=38) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_38; 
run; 

proc freq data=independent_2013; 
weight pondera; 
where (  indep_2^=0 & (period=39) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_39; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where (  indep_2^=0 & (period=40) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_40; 
run; 
 
proc freq data=independent_2013; 
weight pondera; 
where (  indep_2^=0 & (period=41) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_41; 
run; 
proc freq data=independent_2013; 
weight pondera; 
where (  indep_2^=0 & (period=42) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_42; 
run; 
 
proc freq data=independent_2014; 
weight pondera; 
where (  indep_2^=0 & (period=43) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_43; 
run; 
 
proc freq data=independent_2014; 
weight pondera; 
where (  indep_2^=0 & (period=44) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_44; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where (  indep_2^=0 & (period=45) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_45; 
run; 
proc freq data=independent_2014; 
weight pondera; 
where (  indep_2^=0 & (period=46) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_46; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where (  indep_2^=0 & (period=47) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_47; 
run; 
proc freq data=independent_2015; 
weight pondera; 
where (  indep_2^=0 & (period=48) & (agegroup ^=1)  & (agegroup^=300) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table indep_2*ch04 / noprint outpct out=indep_2_48; 
run; 
data indep_2_1; set indep_2_1; period=3; percent_col=pct_col/100; run; 
data  indep_2_2; set indep_2_2; period=4; percent_col=pct_col/100; run; 
data indep_2_3; set indep_2_3; period=5; percent_col=pct_col/100; run; 
data indep_2_4; set indep_2_4; period=6; percent_col=pct_col/100; run; 
data indep_2_5; set indep_2_5; period=7; percent_col=pct_col/100; run; 
data indep_2_6; set indep_2_6; period=8; percent_col=pct_col/100; run; 
data indep_2_7; set indep_2_7; period=9; percent_col=pct_col/100; run; 
data indep_2_8; set indep_2_8; period=10; percent_col=pct_col/100; run; 
data indep_2_9; set indep_2_9; period=11; percent_col=pct_col/100; run; 
data indep_2_10; set indep_2_10; period=12; percent_col=pct_col/100; run; 
data indep_2_11; set indep_2_11; period=13; percent_col=pct_col/100; run; 
data indep_2_12; set indep_2_12; period=14; percent_col=pct_col/100; run; 
data indep_2_13; set indep_2_13; period=15; percent_col=pct_col/100; run; 
data indep_2_14; set indep_2_14; period=16; percent_col=pct_col/100; run; 
data indep_2_15; set indep_2_15; period=17; percent_col=pct_col/100; run; 
data indep_2_16; set indep_2_16; period=18; percent_col=pct_col/100; run; 
data indep_2_18; set indep_2_18; period=20; percent_col=pct_col/100; run; 
data indep_2_19; set indep_2_19; period=21; percent_col=pct_col/100; run; 
data indep_2_20; set indep_2_20; period=22; percent_col=pct_col/100; run; 
data indep_2_21; set indep_2_21; period=23; percent_col=pct_col/100; run; 
data indep_2_22; set indep_2_22; period=24; percent_col=pct_col/100; run; 
data indep_2_23; set indep_2_23; period=25; percent_col=pct_col/100; run; 
data indep_2_24; set indep_2_24; period=26; percent_col=pct_col/100; run; 
data indep_2_25; set indep_2_25; period=27; percent_col=pct_col/100; run; 
data indep_2_26; set indep_2_26; period=28; percent_col=pct_col/100; run; 
data indep_2_27; set indep_2_27; period=29; percent_col=pct_col/100; run; 
data indep_2_28; set indep_2_28; period=30; percent_col=pct_col/100; run; 
data indep_2_29; set indep_2_29; period=31; percent_col=pct_col/100; run; 
data indep_2_30; set indep_2_30; period=32; percent_col=pct_col/100; run; 
data indep_2_31; set indep_2_31; period=33; percent_col=pct_col/100; run; 
data indep_2_32; set indep_2_32; period=34; percent_col=pct_col/100; run; 
data indep_2_33; set indep_2_33; period=35; percent_col=pct_col/100; run; 
data indep_2_34; set indep_2_34; period=36; percent_col=pct_col/100; run; 
data indep_2_35; set indep_2_35; period=37; percent_col=pct_col/100; run; 
data indep_2_36; set indep_2_36; period=38; percent_col=pct_col/100; run; 
data indep_2_37; set indep_2_37; period=39; percent_col=pct_col/100; run; 
data indep_2_38; set indep_2_38; period=40; percent_col=pct_col/100; run; 
data indep_2_39; set indep_2_39; period=41; percent_col=pct_col/100; run; 
data indep_2_40; set indep_2_40; period=42; percent_col=pct_col/100; run; 
data indep_2_41; set indep_2_41; period=43; percent_col=pct_col/100; run; 
data indep_2_42; set indep_2_42; period=44; percent_col=pct_col/100; run; 
data indep_2_43; set indep_2_43; period=45; percent_col=pct_col/100; run; 
data indep_2_44; set indep_2_44; period=46; percent_col=pct_col/100; run; 
data indep_2_45; set indep_2_45; period=47; percent_col=pct_col/100; run;
data indep_2_46; set indep_2_46; period=48; percent_col=pct_col/100; run;
data indep_2_47; set indep_2_47; period=49; percent_col=pct_col/100; run;
data indep_2_48; set indep_2_48; period=50; percent_col=pct_col/100; run;


data indep_2_1; set indep_2_1; keep percent_col indep_2 ch04 period; run; 
data  indep_2_2; set  indep_2_2; keep percent_col indep_2 ch04 period; run; 
data indep_2_3; set indep_2_3; keep percent_col indep_2 ch04 period; run; 
data indep_2_4; set indep_2_4; keep percent_col indep_2 ch04 period; run; 
data indep_2_5; set indep_2_5; keep percent_col indep_2 ch04 period; run; 
data indep_2_6; set indep_2_6; keep percent_col indep_2 ch04 period; run; 
data indep_2_7; set indep_2_7; keep percent_col indep_2 ch04 period; run; 
data indep_2_8; set indep_2_8; keep percent_col indep_2 ch04 period; run; 
data indep_2_9; set indep_2_9; keep percent_col indep_2 ch04 period; run; 
data indep_2_10; set indep_2_10; keep percent_col indep_2 ch04 period; run; 
data indep_2_11; set indep_2_11; keep percent_col indep_2 ch04 period; run; 
data indep_2_12; set indep_2_12; keep percent_col indep_2 ch04 period; run; 
data indep_2_13; set indep_2_13; keep percent_col indep_2 ch04 period; run; 
data indep_2_14; set indep_2_14; keep percent_col indep_2 ch04 period; run; 
data indep_2_15; set indep_2_15; keep percent_col indep_2 ch04 period; run; 
data indep_2_16; set indep_2_16; keep percent_col indep_2 ch04 period; run; 
data indep_2_18; set indep_2_18; keep percent_col indep_2 ch04 period; run; 
data indep_2_19; set indep_2_19; keep percent_col indep_2 ch04 period; run; 
data indep_2_20; set indep_2_20; keep percent_col indep_2 ch04 period; run; 
data indep_2_21; set indep_2_21; keep percent_col indep_2 ch04 period; run; 
data indep_2_22; set indep_2_22; keep percent_col indep_2 ch04 period; run; 
data indep_2_23; set indep_2_23; keep percent_col indep_2 ch04 period; run; 
data indep_2_24; set indep_2_24; keep percent_col indep_2 ch04 period; run; 
data indep_2_25; set indep_2_25; keep percent_col indep_2 ch04 period; run; 
data indep_2_26; set indep_2_26; keep percent_col indep_2 ch04 period; run; 
data indep_2_27; set indep_2_27; keep percent_col indep_2 ch04 period; run; 
data indep_2_28; set indep_2_28; keep percent_col indep_2 ch04 period; run; 
data indep_2_29; set indep_2_29; keep percent_col indep_2 ch04 period; run; 
data indep_2_30; set indep_2_30; keep percent_col indep_2 ch04 period; run; 
data indep_2_31; set indep_2_31; keep percent_col indep_2 ch04 period; run; 
data indep_2_32; set indep_2_32; keep percent_col indep_2 ch04 period; run; 
data indep_2_33; set indep_2_33; keep percent_col indep_2 ch04 period; run; 
data indep_2_34; set indep_2_34; keep percent_col indep_2 ch04 period; run; 
data indep_2_35; set indep_2_35; keep percent_col indep_2 ch04 period; run; 
data indep_2_36; set indep_2_36; keep percent_col indep_2 ch04 period; run; 
data indep_2_37; set indep_2_37; keep percent_col indep_2 ch04 period; run; 
data indep_2_38; set indep_2_38; keep percent_col indep_2 ch04 period; run; 
data indep_2_39; set indep_2_39; keep percent_col indep_2 ch04 period; run; 
data indep_2_40; set indep_2_40; keep percent_col indep_2 ch04 period; run; 
data indep_2_41; set indep_2_41; keep percent_col indep_2 ch04 period; run; 
data indep_2_42; set indep_2_42; keep percent_col indep_2 ch04 period; run; 
data indep_2_43; set indep_2_43; keep percent_col indep_2 ch04 period; run; 
data indep_2_44; set indep_2_44; keep percent_col indep_2 ch04 period; run; 
data indep_2_45; set indep_2_45; keep percent_col indep_2 ch04 period; run; 
data indep_2_46; set indep_2_46; keep percent_col indep_2 ch04 period; run; 
data indep_2_47; set indep_2_47; keep percent_col indep_2 ch04 period; run; 
data indep_2_48; set indep_2_48; keep percent_col indep_2 ch04 period; run; 
data indep_2_base; 
set indep_2_1
 indep_2_2
indep_2_3
indep_2_4
indep_2_5
indep_2_6
indep_2_7
indep_2_8
indep_2_9
indep_2_10
indep_2_11
indep_2_12
indep_2_13
indep_2_14
indep_2_15
indep_2_16
indep_2_18
indep_2_19
indep_2_20
indep_2_21
indep_2_22
indep_2_23
indep_2_24
indep_2_25
indep_2_26
indep_2_27
indep_2_28
indep_2_29
indep_2_30
indep_2_31
indep_2_32
indep_2_33
indep_2_34
indep_2_35
indep_2_36
indep_2_37
indep_2_38
indep_2_39
indep_2_40 indep_2_41 indep_2_42 indep_2_43 indep_2_44 indep_2_45 indep_2_46 indep_2_47 indep_2_48; run;
proc print data=indep_2_base; run;  
/*proc sort data=leo.cal_sal_f_for3; 
by agegroup; 
run; */
/*On prend ensuite de la base uniquement les différents états dans le marché du travail et on les transpose. 
Le résultat est une série de tableaux en format LIAM2 selon l'état dans le marché du travail*/
data indep_2_base;
set indep_2_base (where=(indep_2=1));
run; 
proc sort data=indep_2_base; 
by ch04; 
run; 
 
proc transpose data=indep_2_base out=transp_indep_2; 
by ch04;
id period ;
run;
data transp_indep_2; 
set transp_indep_2 (where= (_NAME_="percent_col")); 
RUN; 

data transp_indep_2; 
set transp_indep_2; 
drop _name_ _label_ ; 
RUN; 
data transp_indep_2; 
set transp_indep_2; 
_19 = (_18 + _20) /2; 
run; 
proc print data=transp_indep_2; run; 


data leo.cal_independent_2; 
retain ch04 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13 _14 _15 _16 _17 _18 _19 _20 _21 _22 _23 _24 _25 _26 _27 _28 _29 _30 _31 _32 _33 _34 _35 _36 _37 _38 _39 _40 _41 _42 _43 _44 _45 _46 _47 _48 _49 _50;
set transp_indep_2;
run; 

%m_zero(leo.cal_indep_wom);
%m_zero(leo.cal_indep_men);
%m_zero(leo.cal_lms_gender); 
%m_zero(leo.cal_independent_2); 
%m_zero(leo.cal_male_population); 
%m_zero(leo.cal_female_population); 


proc export data=leo.cal_indep_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_indep_men.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_indep_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_indep_wom.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_lms_gender
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_lms_gender.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_independent_2
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_independent_2.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_male_population
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_male_population.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_female_population
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_female_population.csv' 
dbms=csv replace; 
run; 

proc print data=leo.cal_indep_men; run; 
proc print data=leo.cal_indep_h; run; 
proc print data=leo.cal_indep_wom; run; 
proc print data=leo.cal_indep_f; run; 
proc print data=leo.cal_lms_Men; run; 
proc print data=leo.cal_e21_male; run; 
proc print data=leo.cal_independent_2; run; 
proc print data=leo.cal_indep_2; run; 
proc print data=leo.cal_male_population; run; 
proc print data=leo.cal_male; run; 
proc print data=leo.cal_female_population; run; 
proc print data=leo.cal_female; run; 



/*Et on les met en format pour qu'elles soient lisibles pour le code en backwards*/ 



%cal_backward(leo.cal_indep_men,agegroup);
%cal_backward(leo.cal_indep_wom,agegroup);
%cal_backward(leo.cal_lms_Men,ch04);
%cal_backward(leo.cal_independent_2,ch04);
%cal_backward(leo.cal_male_population,agegroup);
%cal_backward(leo.cal_female_population,agegroup);
proc export data=leo.cal_indep_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_indep_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_indep_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_indep_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_lms_Men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_lms_Men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_independent_2_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_independent_2_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_male_population_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_male_population_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_female_population_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_female_population_b.csv' 
dbms=csv replace; 
run; 
proc print data=leo.cal_indep_men_b; run; 
proc print data=leo.cal_indep_h_b; run; 
proc print data=leo.cal_indep_wom_b; run; 
proc print data=leo.cal_indep_f_b; run; 
proc print data=leo.cal_lms_Men_b; run; 
proc print data=leo.cal_e21_male_b; run; 
proc print data=leo.cal_independent_2_b; run; 
proc print data=leo.cal_indep_2_b; run; 
proc print data=leo.cal_male_population_b; run; 
proc print data=leo.cal_male_b; run; 
proc print data=leo.cal_female_population_b; run; 
proc print data=leo.cal_female_b; run; 

