/*The Macro 1.2. computes family links among all household members, but also shrinks the individual ids. Indeed, LIAM2 cannot handle
ids that are too long, so we give respondents in each quarter that start at 0. This macro thus gives each individual's
partner, mother and father id in its long (the concatenation of EPHc variables CODUSU, NRO_HOGAR and COMPONENTE) and short 
versions. The datasets both_id are the conversion key that lets us shift from one format to the other. */
 
%family_links_and_id(leo,eph_data_formatted_2003,3,long_id_2003_t3,both_id_2003_t3,short_id_2003_t3,1,2);
%family_links_and_id(leo,eph_data_formatted_2003,4,long_id_2003_t4,both_id_2003_t4,short_id_2003_t4,2,3);  
%family_links_and_id(leo,eph_data_formatted_2004,1,long_id_2004_t1,both_id_2004_t1,short_id_2004_t1,3,4);  
%family_links_and_id(leo,eph_data_formatted_2004,2,long_id_2004_t2,both_id_2004_t2,short_id_2004_t2,4,5);  
%family_links_and_id(leo,eph_data_formatted_2004,3,long_id_2004_t3,both_id_2004_t3,short_id_2004_t3,5,6);  
%family_links_and_id(leo,eph_data_formatted_2004,4,long_id_2004_t4,both_id_2004_t4,short_id_2004_t4,6,7);  

%family_links_and_id(leo,eph_data_formatted_2005,1,long_id_2005_t1,both_id_2005_t1,short_id_2005_t1,7,8);  
%family_links_and_id(leo,eph_data_formatted_2005,2,long_id_2005_t2,both_id_2005_t2,short_id_2005_t2,8,9);  
%family_links_and_id(leo,eph_data_formatted_2005,3,long_id_2005_t3,both_id_2005_t3,short_id_2005_t3,9,10);  
%family_links_and_id(leo,eph_data_formatted_2005,4,long_id_2005_t4,both_id_2005_t4,short_id_2005_t4,10,11);  

%family_links_and_id(leo,eph_data_formatted_2006,1,long_id_2006_t1,both_id_2006_t1,short_id_2006_t1,11,12);  
%family_links_and_id(leo,eph_data_formatted_2006,2,long_id_2006_t2,both_id_2006_t2,short_id_2006_t2,12,13);  
%family_links_and_id(leo,eph_data_formatted_2006,3,long_id_2006_t3,both_id_2006_t3,short_id_2006_t3,13,14);  
%family_links_and_id(leo,eph_data_formatted_2006,4,long_id_2006_t4,both_id_2006_t4,short_id_2006_t4,14,15);  

%family_links_and_id(leo,eph_data_formatted_2007,1,long_id_2007_t1,both_id_2007_t1,short_id_2007_t1,15,16);  
%family_links_and_id(leo,eph_data_formatted_2007,2,long_id_2007_t2,both_id_2007_t2,short_id_2007_t2,16,17);  /*
%family_links_and_id(leo,eph_data_formatted_2007,3,long_id_2007_t3,both_id_2007_t3,short_id_2007_t3,17,18);*/  
/*SEGUIR AQUI*/
%family_links_and_id(leo,eph_data_formatted_2007,4,long_id_2007_t4,both_id_2007_t4,short_id_2007_t4,18,19); 

%family_links_and_id(leo,eph_data_formatted_2008,1,long_id_2008_t1,both_id_2008_t1,short_id_2008_t1,19,20);  
%family_links_and_id(leo,eph_data_formatted_2008,2,long_id_2008_t2,both_id_2008_t2,short_id_2008_t2,20,21);  
%family_links_and_id(leo,eph_data_formatted_2008,3,long_id_2008_t3,both_id_2008_t3,short_id_2008_t3,21,22);  
%family_links_and_id(leo,eph_data_formatted_2008,4,long_id_2008_t4,both_id_2008_t4,short_id_2008_t4,22,23);  

%family_links_and_id(leo,eph_data_formatted_2009,1,long_id_2009_t1,both_id_2009_t1,short_id_2009_t1,23,24);  
%family_links_and_id(leo,eph_data_formatted_2009,2,long_id_2009_t2,both_id_2009_t2,short_id_2009_t2,24,25);  
%family_links_and_id(leo,eph_data_formatted_2009,3,long_id_2009_t3,both_id_2009_t3,short_id_2009_t3,25,26);  
%family_links_and_id(leo,eph_data_formatted_2009,4,long_id_2009_t4,both_id_2009_t4,short_id_2009_t4,26,27);
 

%family_links_and_id(leo,eph_data_formatted_2010,1,long_id_2010_t1,both_id_2010_t1,short_id_2010_t1,27,28);  
%family_links_and_id(leo,eph_data_formatted_2010,2,long_id_2010_t2,both_id_2010_t2,short_id_2010_t2,28,29);  
%family_links_and_id(leo,eph_data_formatted_2010,3,long_id_2010_t3,both_id_2010_t3,short_id_2010_t3,29,30);  
%family_links_and_id(leo,eph_data_formatted_2010,4,long_id_2010_t4,both_id_2010_t4,short_id_2010_t4,30,31);  

%family_links_and_id(leo,eph_data_formatted_2011,1,long_id_2011_t1,both_id_2011_t1,short_id_2011_t1,31,32);  
%family_links_and_id(leo,eph_data_formatted_2011,2,long_id_2011_t2,both_id_2011_t2,short_id_2011_t2,32,33);  
%family_links_and_id(leo,eph_data_formatted_2011,3,long_id_2011_t3,both_id_2011_t3,short_id_2011_t3,33,34);  
%family_links_and_id(leo,eph_data_formatted_2011,4,long_id_2011_t4,both_id_2011_t4,short_id_2011_t4,34,35);
 

%family_links_and_id(leo,eph_data_formatted_2012,1,long_id_2012_t1,both_id_2012_t1,short_id_2012_t1,35,36);  
%family_links_and_id(leo,eph_data_formatted_2012,2,long_id_2012_t2,both_id_2012_t2,short_id_2012_t2,36,37);  
%family_links_and_id(leo,eph_data_formatted_2012,3,long_id_2012_t3,both_id_2012_t3,short_id_2012_t3,37,38);  
%family_links_and_id(leo,eph_data_formatted_2012,4,long_id_2012_t4,both_id_2012_t4,short_id_2012_t4,38,39);  

%family_links_and_id(leo,eph_data_formatted_2013,1,long_id_2013_t1,both_id_2013_t1,short_id_2013_t1,39,40);  
%family_links_and_id(leo,eph_data_formatted_2013,2,long_id_2013_t2,both_id_2013_t2,short_id_2013_t2,40,41);  
%family_links_and_id(leo,eph_data_formatted_2013,3,long_id_2013_t3,both_id_2013_t3,short_id_2013_t3,41,42);  
%family_links_and_id(leo,eph_data_formatted_2013,4,long_id_2013_t4,both_id_2013_t4,short_id_2013_t4,42,43);
 

%family_links_and_id(leo,eph_data_formatted_2014,1,long_id_2014_t1,both_id_2014_t1,short_id_2014_t1,43,44);  
%family_links_and_id(leo,eph_data_formatted_2014,2,long_id_2014_t2,both_id_2014_t2,short_id_2014_t2,44,45);  
%family_links_and_id(leo,eph_data_formatted_2014,3,long_id_2014_t3,both_id_2014_t3,short_id_2014_t3,45,46);  
%family_links_and_id(leo,eph_data_formatted_2014,4,long_id_2014_t4,both_id_2014_t4,short_id_2014_t4,46,47);  

%family_links_and_id(leo,eph_data_formatted_2015,1,long_id_2015_t1,both_id_2015_t1,short_id_2015_t1,47,48);  
%family_links_and_id(leo,eph_data_formatted_2015,2,long_id_2015_t2,both_id_2015_t2,short_id_2015_t2,48,49); 
 
/****The short if version of family links will be used for the dataset input in LIAM2. For our regressions and descriptive statistics 
that calibrate the microsimulation model, we keep the original long ids (which are unique throughout time and allow for a short
pannel analysis, as two different individuals cannot have the same long id throughout the 2003-2015 period)******************/

/*We now add information on family links in the dataset formatted for regressions / descriptive statistics / calibration.*/

%macro add_family_links (year,quarter,period); 
data leo.eph_data_formatted_&year._t&quarter.;
set leo.eph_data_formatted_&year.; 
where period=&period.; 
id=person; 
ruN; 
proc sort data=leo.long_id_&year._t&quarter.;
by id; 
run; 
proc sort data=leo.eph_data_formatted_&year._t&quarter.; 
by id; 
run; 
data leo.eph_data_formatted_&year._t&quarter.; 
merge leo.eph_data_formatted_&year._t&quarter. leo.long_id_&year._t&quarter.; 
by id; 
drop id; 
run;  

%mend;

%add_family_links(2015,2,48); 
%add_family_links(2015,1,47);
%add_family_links(2014,4,46);
%add_family_links(2014,3,45);
%add_family_links(2014,2,44);
%add_family_links(2014,1,43);
%add_family_links(2013,4,42);
%add_family_links(2013,3,41);
%add_family_links(2013,2,40);
%add_family_links(2013,1,39);
%add_family_links(2012,4,38);
%add_family_links(2012,3,37);
%add_family_links(2012,2,36);
%add_family_links(2012,1,35);
%add_family_links(2011,4,34);
%add_family_links(2011,3,33);
%add_family_links(2011,2,32);
%add_family_links(2011,1,31);
%add_family_links(2010,4,30);
%add_family_links(2010,3,29);
%add_family_links(2010,2,28);
%add_family_links(2010,1,27);
%add_family_links(2009,4,26);
%add_family_links(2009,3,25);
%add_family_links(2009,2,24);
%add_family_links(2009,1,23);
%add_family_links(2008,4,22);
%add_family_links(2008,3,21);
%add_family_links(2008,2,20);
%add_family_links(2008,1,19);
%add_family_links(2007,4,18);
%add_family_links(2007,3,17);
%add_family_links(2007,2,16);
%add_family_links(2007,1,15);
%add_family_links(2006,4,14);
%add_family_links(2006,3,13);
%add_family_links(2006,2,12);
%add_family_links(2006,1,11);
%add_family_links(2005,4,10);
%add_family_links(2005,3,9);
%add_family_links(2005,2,8);
%add_family_links(2005,1,7);
%add_family_links(2004,4,6);
%add_family_links(2004,3,5);
%add_family_links(2004,2,4);
%add_family_links(2004,1,3);
%add_family_links(2003,4,2);
%add_family_links(2003,3,1);
/***We then add variables that count the number of little children (ages 4 or less) and underage children (17 or less) in these datasets.*/
%macro number_of_children(indata,age,agevar,idvar,gendervar,malevar,femalevar,childrenvar); 
data father_id_only; 
set &indata.; 
	keep &idvar. &agevar. father_id; 
run; 

data mother_id_only; 
set &indata.; 
	keep &idvar. &agevar. mother_id; 
run; 

proc sort data=father_id_only; 
	by father_id; 
run; 

proc sort data=mother_id_only; 
	by mother_id; 
run; 

data father_id_only; 
set father_id_only; 
	rename &idvar.=id3; 
	rename father_id=&idvar.; 
run; 

data father_id_only; 
set father_id_only; 
		if &agevar.>&age.
			then delete; 
	drop id3;
run; 

data father_id_only; 
set father_id_only; 
	by &idvar.; 
		if first.&idvar. 
			then apparition=1; 
		else apparition+1; 
	if last.&idvar.; 
run;

data mother_id_only; 
set mother_id_only; 
		rename &idvar.=id3; 
		rename mother_id=&idvar.; 
run; 


data mother_id_only; 
set mother_id_only; 
		if &agevar.>&age. 
			then delete; 
	drop id3;
run; 

data mother_id_only; 
set mother_id_only; 
	by &idvar.; 
		if first.&idvar.
			then apparition=1; 
		else apparition+1; 
		if last.&idvar.; 
run;

data father_id_only; 
set father_id_only; 
		if &idvar.=0 
			then delete; 
		rename apparition=&childrenvar.; 
	drop &agevar.;
run;
 
data mother_id_only; 
set mother_id_only; 
		if &idvar.=0
			then delete; 
		rename apparition=&childrenvar.; 
	drop &agevar.;
run; 


data only_men; 
set &indata.; 
		if &gendervar.="&femalevar."
			then delete; 
run; 

data only_women; 
set &indata.; 
		if &gendervar.="&malevar." 
			then delete; 
run; 

proc sort data=only_men; 
	by &idvar.; 
run; 
proc sort data=only_women; 
	by &idvar.; 
run; 

data merge_father; 
	merge only_men father_id_only; 
		by &idvar.; 
run; 
proc sort data=merge_father; 
by &idvar.; 
run; 

data merge_mother; 
	merge only_women mother_id_only; 
by &idvar.; 
run; 

proc sort data=merge_mother; 
	by &idvar.; 
run; 

data &indata.; 
set merge_father merge_mother; 
run; 
data &indata.; 
set &indata.; 
		if missing(&childrenvar.) 
			then &childrenvar.=0; 
		if missing(labour_market_state)
			then delete; 
run; 

%mend; 
%number_of_children(leo.eph_data_formatted_2015_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2015_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2014_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2014_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2014_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2014_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2013_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2013_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2013_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2013_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2012_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2012_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2012_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2012_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2011_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2011_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2011_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2011_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2010_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2010_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2010_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2010_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2009_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2009_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2009_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2009_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2008_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2008_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2008_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2008_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2007_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2007_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2007_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2007_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2006_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2006_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2006_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2006_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2005_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2005_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2005_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2005_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2004_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2004_t3,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2004_t2,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2004_t1,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2003_t4,17,ageconti,person,ch04,1,2,underage_children);
%number_of_children(leo.eph_data_formatted_2003_t3,17,ageconti,person,ch04,1,2,underage_children);


%number_of_children(leo.eph_data_formatted_2015_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2015_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2014_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2014_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2014_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2014_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2013_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2013_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2013_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2013_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2012_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2012_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2012_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2012_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2011_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2011_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2011_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2011_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2010_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2010_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2010_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2010_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2009_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2009_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2009_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2009_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2008_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2008_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2008_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2008_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2007_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2007_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2007_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2007_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2006_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2006_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2006_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2006_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2005_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2005_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2005_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2005_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2004_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2004_t3,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2004_t2,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2004_t1,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2003_t4,4,ageconti,person,ch04,1,2,little_children);
%number_of_children(leo.eph_data_formatted_2003_t3,4,ageconti,person,ch04,1,2,little_children);
/*Now, we add some pieces of information on the partner: his/her age, education level and labour-market state. These are useful for 
		estimating our behavioural equations, both in the labour-market and family spheres.*/

%macro partner_information(indata); 
data &indata.; 
set &indata.; 
		formation2=formation*1; 
		student_num=0; 
		if student="True" 
			then student_num=1; 
	drop formation; 
run; 
data &indata.; 
set &indata.; 
		rename formation2=formation; 
run;
 
data partner_information; 
set &indata.; 
	keep person labour_Market_state ageconti formation student_num;
		rename person=partner_id; 
		rename labour_market_state=partner_lab_mar_state; 
		rename ageconti=partner_age; 
		rename formation=partner_formation; 
		rename student_num=partner_student;
run;
proc sort data=partner_information; 
	by partner_id; 
run;  
proc sort data=&indata.; 
	by partner_id; 
run; 
data &indata.;
merge &indata. partner_information;
	by partner_id; 
		if missing(person) 	
			then delete;
run; 
/*We put at -1 all missing values. Thus, those that do not have a known partner get a -1 value for these variables on partner's characteristics.*/
 %Macro M_minus_one (ds) ;
     data &ds. (drop=_i);
          set &ds. ;
          array A_VarNum[*] _NUMERIC_ ;     

          do _i=1 to dim( A_VarNum ) ;
          If A_VarNum (_i)=. then A_VarNum (_i)=-1 ;
     End ;
   run ;
%Mend ; 
%m_minus_one(&indata.); 

%mend; 
%partner_information(leo.eph_data_formatted_2003_t3);
%partner_information(leo.eph_data_formatted_2003_t4);
%partner_information(leo.eph_data_formatted_2004_t1);
%partner_information(leo.eph_data_formatted_2004_t2);
%partner_information(leo.eph_data_formatted_2004_t3);
%partner_information(leo.eph_data_formatted_2004_t4);
%partner_information(leo.eph_data_formatted_2005_t1);
%partner_information(leo.eph_data_formatted_2005_t2);
%partner_information(leo.eph_data_formatted_2005_t3);
%partner_information(leo.eph_data_formatted_2005_t4);
%partner_information(leo.eph_data_formatted_2006_t1);
%partner_information(leo.eph_data_formatted_2006_t2);
%partner_information(leo.eph_data_formatted_2006_t3);
%partner_information(leo.eph_data_formatted_2006_t4);
%partner_information(leo.eph_data_formatted_2007_t1);
%partner_information(leo.eph_data_formatted_2007_t2);
%partner_information(leo.eph_data_formatted_2007_t3);
%partner_information(leo.eph_data_formatted_2007_t4);
%partner_information(leo.eph_data_formatted_2008_t1);
%partner_information(leo.eph_data_formatted_2008_t2);
%partner_information(leo.eph_data_formatted_2008_t3);
%partner_information(leo.eph_data_formatted_2008_t4);
%partner_information(leo.eph_data_formatted_2009_t1);
%partner_information(leo.eph_data_formatted_2009_t2);
%partner_information(leo.eph_data_formatted_2009_t3);
%partner_information(leo.eph_data_formatted_2009_t4);
%partner_information(leo.eph_data_formatted_2010_t1);
%partner_information(leo.eph_data_formatted_2010_t2);
%partner_information(leo.eph_data_formatted_2010_t3);
%partner_information(leo.eph_data_formatted_2010_t4);
%partner_information(leo.eph_data_formatted_2011_t1);
%partner_information(leo.eph_data_formatted_2011_t2);
%partner_information(leo.eph_data_formatted_2011_t3);
%partner_information(leo.eph_data_formatted_2011_t4);
%partner_information(leo.eph_data_formatted_2012_t1);
%partner_information(leo.eph_data_formatted_2012_t2);
%partner_information(leo.eph_data_formatted_2012_t3);
%partner_information(leo.eph_data_formatted_2012_t4);
%partner_information(leo.eph_data_formatted_2013_t1);
%partner_information(leo.eph_data_formatted_2013_t2);
%partner_information(leo.eph_data_formatted_2013_t3);
%partner_information(leo.eph_data_formatted_2013_t4);
%partner_information(leo.eph_data_formatted_2014_t1);
%partner_information(leo.eph_data_formatted_2014_t2);
%partner_information(leo.eph_data_formatted_2014_t3);
%partner_information(leo.eph_data_formatted_2014_t4);
%partner_information(leo.eph_data_formatted_2015_t1);
%partner_information(leo.eph_data_formatted_2015_t2);

/*Now we compute income deciles*/

%macro ITL_main_centiles(library,indata,outdata,labour_var,income_var,output_sect,output_all,time_var,period);
proc univariate data=&library..&indata. noprint;
where &labour_var.=1 & &time_var.=&period.;
   var &income_var.;
   output out=&library..wage_earners_&period. pctlpts=2 5 10 25 50 75 90 95 98 pctlpre=cent; 
run;
proc univariate data=&library..&indata. noprint;
where &labour_var.=2 & &time_var.=&period.;
   var &income_var.;
   output out=&library..formal_independent_&period. pctlpts=2 5 10 25 50 75 90 95 98 pctlpre=cent; 
run;
proc univariate data=&library..&indata. noprint;
where &labour_var.=3 & &time_var.=&period.;
   var &income_var.;
   output out=&library..informal_&period. pctlpts=2 5 10 25 50 75 90 95 98 pctlpre=cent; 
run;
proc univariate data=&library..&indata. noprint;
where &income_var.^=0 & &time_var.=&period.;
   var &income_var.;
   output out=&library..all_workers_&period. pctlpts=2 5 10 25 50 75 90 95 98 pctlpre=cent_all; 
run;
data &library..wage_earners_&period.; 
set &library..wage_earners_&period.; 
&labour_var.=1; 
run; 
data &library..formal_independent_&period.; 
set &library..formal_independent_&period.; 
&labour_var.=2; 
run; 

data &library..informal_&period.; 
set &library..informal_&period.; 
&labour_var.=3; 
run;

data &library..all_workers_&period.; 
set &library..all_workers_&period.; 
&time_var.=&period.;
run;  
data &library..all_percentiles_&period.; 
set &library..wage_earners_&period. &library..formal_independent_&period. &library..informal_&period.; 
run; 
proc sort data=&library..&indata.; 
by &labour_var.; 
run; 
options nofmterr; 
data &library..bis; 
set &library..&indata.; 
where &time_var.=&period.; 
run; 
options nofmterr; 
data &library..&outdata.; 
merge &library..bis &library..all_percentiles_&period.; 
by &labour_var.; 
run; 

proc sort data=&library..&outdata.; 
by &time_var.; 
run; 
proc sort data=&library..all_workers_&period.; 
by &time_var.; 
run; 
data &library..&outdata.; 
merge &library..&outdata. &library..all_workers_&period.;
by &time_var.; 
run; 


/***********We also compute here sectoral income quartiles******************/


data &library..&outdata.; 
set &library..&outdata.; 
if &income_var.<cent2 then sect_centile_2=1; 
else sect_centile_2=0; 
if &income_var.<cent5 then sect_centile_5=1; 
else sect_centile_5=0; 
if &income_var.<cent10 then sect_centile_10=1; 
else sect_centile_10=0; 
if &income_var.<cent25 then sect_centile_25=1; 
else sect_centile_25=0; 
if &income_var.<cent50 then sect_centile_50=1; 
else sect_centile_50=0; 
if &income_var.<cent75 then sect_centile_75=1; 
else sect_centile_75=0; 
if &income_var.<cent90 then sect_centile_90=1; 
else sect_centile_90=0; 
if &income_var.<cent95 then sect_centile_95=1; 
else sect_centile_95=0; 
if &income_var.<cent98 then sect_centile_98=1; 
else sect_centile_98=0; 
if &income_var.<=cent25 then &output_sect.=1; 
if cent25<&income_var.<=cent50 then &output_sect.=2; 
if cent50<&income_var.<=cent75 then &output_sect.=3; 
if cent75<&income_var. then &output_sect.=4; 
if &income_var.<cent_all2 then centile_all_2=1; 
else centile_all_2=0; 
if &income_var.<cent_all5 then centile_all_5=1; 
else centile_all_5=0; 
if &income_var.<cent_all10 then centile_all_10=1; 
else centile_all_10=0; 
if &income_var.<cent_all25 then centile_all_25=1; 
else centile_all_25=0; 
if &income_var.<cent_all50 then centile_all_50=1; 
else centile_all_50=0; 
if &income_var.<cent_all75 then centile_all_75=1; 
else centile_all_75=0; 
if &income_var.<cent_all90 then centile_all_90=1; 
else centile_all_90=0; 
if &income_var.<cent_all95 then centile_all_95=1; 
else centile_all_95=0; 
if &income_var.<cent_all98 then centile_all_98=1; 
else centile_all_98=0; 
if &income_var.=0 then do; 
&output_all.=0; 
&output_sect.=0; 
end; 
if 0<&income_var.<=cent_all25 then &output_all.=1; 
if cent_all25<&income_var.<=cent_all50 then &output_all.=2; 
if cent_all50<&income_var.<=cent_all75 then &output_all.=3; 
if cent_all75<&income_var. then &output_all.=4;  
run; 

data &library..&outdata.; 
set &library..&outdata.; 
drop cent2 cent5 cent10 cent25 cent50 cent75 cent90 cent95 cent98 
cent_all2 cent_all5 cent_all10 cent_all25 cent_all50 cent_all75 cent_all90 cent_all95 cent_all98 
sect_centile_2 sect_centile_5 sect_centile_10 sect_centile_25 sect_centile_50 sect_centile_75 sect_centile_90 sect_centile_95 sect_centile_98 
centile_all_2 centile_all_5 centile_all_10 centile_all_25 centile_all_50 centile_all_75 centile_all_90 centile_all_95 centile_all_98; 
run;  
%mend; 

%ITL_main_centiles(leo,eph_data_formatted_2003_t3,eph_data_formatted_2003_t3,labour_market_state,itl,sect_quartile,quartile_all,period,1);
%ITL_main_centiles(leo,eph_data_formatted_2003_t4,eph_data_formatted_2003_t4,labour_market_state,itl,sect_quartile,quartile_all,period,2);
%ITL_main_centiles(leo,eph_data_formatted_2004_t1,eph_data_formatted_2004_t1,labour_market_state,itl,sect_quartile,quartile_all,period,3);
%ITL_main_centiles(leo,eph_data_formatted_2004_t2,eph_data_formatted_2004_t2,labour_market_state,itl,sect_quartile,quartile_all,period,4);
%ITL_main_centiles(leo,eph_data_formatted_2004_t3,eph_data_formatted_2004_t3,labour_market_state,itl,sect_quartile,quartile_all,period,5);
%ITL_main_centiles(leo,eph_data_formatted_2004_t4,eph_data_formatted_2004_t4,labour_market_state,itl,sect_quartile,quartile_all,period,6);
%ITL_main_centiles(leo,eph_data_formatted_2005_t1,eph_data_formatted_2005_t1,labour_market_state,itl,sect_quartile,quartile_all,period,7);
%ITL_main_centiles(leo,eph_data_formatted_2005_t2,eph_data_formatted_2005_t2,labour_market_state,itl,sect_quartile,quartile_all,period,8);
%ITL_main_centiles(leo,eph_data_formatted_2005_t3,eph_data_formatted_2005_t3,labour_market_state,itl,sect_quartile,quartile_all,period,9);
%ITL_main_centiles(leo,eph_data_formatted_2005_t4,eph_data_formatted_2005_t4,labour_market_state,itl,sect_quartile,quartile_all,period,10);
%ITL_main_centiles(leo,eph_data_formatted_2006_t1,eph_data_formatted_2006_t1,labour_market_state,itl,sect_quartile,quartile_all,period,11);
%ITL_main_centiles(leo,eph_data_formatted_2006_t2,eph_data_formatted_2006_t2,labour_market_state,itl,sect_quartile,quartile_all,period,12);
%ITL_main_centiles(leo,eph_data_formatted_2006_t3,eph_data_formatted_2006_t3,labour_market_state,itl,sect_quartile,quartile_all,period,13);
%ITL_main_centiles(leo,eph_data_formatted_2006_t4,eph_data_formatted_2006_t4,labour_market_state,itl,sect_quartile,quartile_all,period,14);
%ITL_main_centiles(leo,eph_data_formatted_2007_t1,eph_data_formatted_2007_t1,labour_market_state,itl,sect_quartile,quartile_all,period,15);
%ITL_main_centiles(leo,eph_data_formatted_2007_t2,eph_data_formatted_2007_t2,labour_market_state,itl,sect_quartile,quartile_all,period,16);
%ITL_main_centiles(leo,eph_data_formatted_2007_t3,eph_data_formatted_2007_t3,labour_market_state,itl,sect_quartile,quartile_all,period,17);
%ITL_main_centiles(leo,eph_data_formatted_2007_t4,eph_data_formatted_2007_t4,labour_market_state,itl,sect_quartile,quartile_all,period,18);
%ITL_main_centiles(leo,eph_data_formatted_2008_t1,eph_data_formatted_2008_t1,labour_market_state,itl,sect_quartile,quartile_all,period,19);
%ITL_main_centiles(leo,eph_data_formatted_2008_t2,eph_data_formatted_2008_t2,labour_market_state,itl,sect_quartile,quartile_all,period,20);
%ITL_main_centiles(leo,eph_data_formatted_2008_t3,eph_data_formatted_2008_t3,labour_market_state,itl,sect_quartile,quartile_all,period,21);
%ITL_main_centiles(leo,eph_data_formatted_2008_t4,eph_data_formatted_2008_t4,labour_market_state,itl,sect_quartile,quartile_all,period,22);
%ITL_main_centiles(leo,eph_data_formatted_2009_t1,eph_data_formatted_2009_t1,labour_market_state,itl,sect_quartile,quartile_all,period,23);
%ITL_main_centiles(leo,eph_data_formatted_2009_t2,eph_data_formatted_2009_t2,labour_market_state,itl,sect_quartile,quartile_all,period,24);
%ITL_main_centiles(leo,eph_data_formatted_2009_t3,eph_data_formatted_2009_t3,labour_market_state,itl,sect_quartile,quartile_all,period,25);
%ITL_main_centiles(leo,eph_data_formatted_2009_t4,eph_data_formatted_2009_t4,labour_market_state,itl,sect_quartile,quartile_all,period,26);
%ITL_main_centiles(leo,eph_data_formatted_2010_t1,eph_data_formatted_2010_t1,labour_market_state,itl,sect_quartile,quartile_all,period,27);
%ITL_main_centiles(leo,eph_data_formatted_2010_t2,eph_data_formatted_2010_t2,labour_market_state,itl,sect_quartile,quartile_all,period,28);
%ITL_main_centiles(leo,eph_data_formatted_2010_t3,eph_data_formatted_2010_t3,labour_market_state,itl,sect_quartile,quartile_all,period,29);
%ITL_main_centiles(leo,eph_data_formatted_2010_t4,eph_data_formatted_2010_t4,labour_market_state,itl,sect_quartile,quartile_all,period,30);
%ITL_main_centiles(leo,eph_data_formatted_2011_t1,eph_data_formatted_2011_t1,labour_market_state,itl,sect_quartile,quartile_all,period,31);
%ITL_main_centiles(leo,eph_data_formatted_2011_t2,eph_data_formatted_2011_t2,labour_market_state,itl,sect_quartile,quartile_all,period,32);
%ITL_main_centiles(leo,eph_data_formatted_2011_t3,eph_data_formatted_2011_t3,labour_market_state,itl,sect_quartile,quartile_all,period,33);
%ITL_main_centiles(leo,eph_data_formatted_2011_t4,eph_data_formatted_2011_t4,labour_market_state,itl,sect_quartile,quartile_all,period,34);
%ITL_main_centiles(leo,eph_data_formatted_2012_t1,eph_data_formatted_2012_t1,labour_market_state,itl,sect_quartile,quartile_all,period,35);
%ITL_main_centiles(leo,eph_data_formatted_2012_t2,eph_data_formatted_2012_t2,labour_market_state,itl,sect_quartile,quartile_all,period,36);
%ITL_main_centiles(leo,eph_data_formatted_2012_t3,eph_data_formatted_2012_t3,labour_market_state,itl,sect_quartile,quartile_all,period,37);
%ITL_main_centiles(leo,eph_data_formatted_2012_t4,eph_data_formatted_2012_t4,labour_market_state,itl,sect_quartile,quartile_all,period,38);
%ITL_main_centiles(leo,eph_data_formatted_2013_t1,eph_data_formatted_2013_t1,labour_market_state,itl,sect_quartile,quartile_all,period,39);
%ITL_main_centiles(leo,eph_data_formatted_2013_t2,eph_data_formatted_2013_t2,labour_market_state,itl,sect_quartile,quartile_all,period,40);
%ITL_main_centiles(leo,eph_data_formatted_2013_t3,eph_data_formatted_2013_t3,labour_market_state,itl,sect_quartile,quartile_all,period,41);
%ITL_main_centiles(leo,eph_data_formatted_2013_t4,eph_data_formatted_2013_t4,labour_market_state,itl,sect_quartile,quartile_all,period,42);
%ITL_main_centiles(leo,eph_data_formatted_2014_t1,eph_data_formatted_2014_t1,labour_market_state,itl,sect_quartile,quartile_all,period,43);
%ITL_main_centiles(leo,eph_data_formatted_2014_t2,eph_data_formatted_2014_t2,labour_market_state,itl,sect_quartile,quartile_all,period,44);
%ITL_main_centiles(leo,eph_data_formatted_2014_t3,eph_data_formatted_2014_t3,labour_market_state,itl,sect_quartile,quartile_all,period,45);
%ITL_main_centiles(leo,eph_data_formatted_2014_t4,eph_data_formatted_2014_t4,labour_market_state,itl,sect_quartile,quartile_all,period,46);
%ITL_main_centiles(leo,eph_data_formatted_2015_t1,eph_data_formatted_2015_t1,labour_market_state,itl,sect_quartile,quartile_all,period,47);
%ITL_main_centiles(leo,eph_data_formatted_2015_t2,eph_data_formatted_2015_t2,labour_market_state,itl,sect_quartile,quartile_all,period,48);

data leo.eph_data_formatted_2003_2015; 
set leo.eph_data_formatted_2015_t2 leo.eph_data_formatted_2015_t1
	leo.eph_data_formatted_2014_t1 leo.eph_data_formatted_2014_t2 leo.eph_data_formatted_2014_t3 leo.eph_data_formatted_2014_t4
	leo.eph_data_formatted_2013_t1 leo.eph_data_formatted_2013_t2 leo.eph_data_formatted_2013_t3 leo.eph_data_formatted_2013_t4
	leo.eph_data_formatted_2012_t1 leo.eph_data_formatted_2012_t2 leo.eph_data_formatted_2012_t3 leo.eph_data_formatted_2012_t4
	leo.eph_data_formatted_2011_t1 leo.eph_data_formatted_2011_t2 leo.eph_data_formatted_2011_t3 leo.eph_data_formatted_2011_t4
	leo.eph_data_formatted_2010_t1 leo.eph_data_formatted_2010_t2 leo.eph_data_formatted_2010_t3 leo.eph_data_formatted_2010_t4
	leo.eph_data_formatted_2009_t1 leo.eph_data_formatted_2009_t2 leo.eph_data_formatted_2009_t3 leo.eph_data_formatted_2009_t4
	leo.eph_data_formatted_2008_t1 leo.eph_data_formatted_2008_t2 leo.eph_data_formatted_2008_t3 leo.eph_data_formatted_2008_t4
	leo.eph_data_formatted_2007_t1 leo.eph_data_formatted_2007_t2/* leo.eph_data_formatted_2007_t3*/ leo.eph_data_formatted_2007_t4
	leo.eph_data_formatted_2006_t1 leo.eph_data_formatted_2006_t2 leo.eph_data_formatted_2006_t3 leo.eph_data_formatted_2006_t4
	leo.eph_data_formatted_2005_t1 leo.eph_data_formatted_2005_t2 leo.eph_data_formatted_2005_t3 leo.eph_data_formatted_2005_t4
	leo.eph_data_formatted_2004_t1 leo.eph_data_formatted_2004_t2 leo.eph_data_formatted_2004_t3 leo.eph_data_formatted_2004_t4
	leo.eph_data_formatted_2003_t3 leo.eph_data_formatted_2003_t4;
run; 

/* We add as labour-market states civil servants and independent workers of the informal sector. These are nested labour-market states: 
		if an individual is simulated as being a formal wage-earner, then in a second step we check whether he works in the public or 
		private sector. Same thing for independent workers of the informal sector. 
	These labour-market state refinements are irrelevant for computing retirement rights. They are however probably highly significative
			when determining individual wages and labour-market behaviour. Also, employer's contributions for civil servants are different
			since Decree 814/2001 and Law 27430 fiscal reform established them as the lowest. Since that Decree, employer's contributions
			differ by sector. We chose not to simulate belonging to the primary / secondary sector with lower employers' contributions
			than the service sector, following that Decree, for now: making hypothesiss on the future proportion of working-age population
			that are civil servants is not too far-fetched; it is much more complicated however to anticipate how much formal wage-earners
			will work in the service or industrial sectors. */
data leo.eph_data_formatted_2003_2015; 
set leo.eph_data_formatted_2003_2015; 
	civil_servant=0; 
	if labour_market_state=1 & pp04a=2 
		then civil_servant=1; 
	informal_independent=0; 
	if labour_market_state=3 & (cat_ocup=1 | cat_ocup=2)
		then informal_independent=1; 
run; 

/***Now we carry out some data steps for studying quarterly transitions: we make datasets made up of people surveyed in period t and period 
		t+1. The idea is then to track their evolution in said quarter. Thus, 50% of the dataset is made up of people surveyed in t, 
		and the other half is the same people, but surveyed in t+1.****/


%macro couple_trim(indata,outdata,unit_var,date_var,from,to);

data &outdata.;
set &indata. (where=(&date_var.=&from. | &date_var.=&to.));
run;  
proc sort data=&outdata.;
by  &unit_var. &date_var.  ;  
run; 

data second_half; 
set &outdata.; 
by  &unit_var.   ;  
if first.&unit_var.  then apparition=1; 
else apparition+1;
if last.&unit_var.; 
run;


data second_half; 
set second_half;
if apparition=1 then delete_this_obs=1;
if apparition=2 then delete_this_obs=0; 
run;
data &outdata.; 
set &outdata.;
delete_this_obs=0;
run; 
 
/*
proc freq data=second_half; 
tables apparition*delete_this_obs;
tables apparition*&date_var.; 
tables delete_this_obs*&date_var.;  
run; */
proc sort data=second_half; 
by  &unit_var. &date_var. ;  
run; 
proc sort data=&outdata.; 
by  &unit_var.   ;  
run; 

data &outdata.;
merge   &outdata. second_half;
 by  &unit_var. &date_var. ;   
run; 

data &outdata.; 
set &outdata.; 
if delete_this_obs=1 then delete; 
run; 
data &outdata.; 
set &outdata.; 
drop delete_this_obs apparition; 
run; 
%mend;





%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2003_t3_t4,person,period,1,2);
dm 'clear log'; 
dm 'odsresults; clear'; 
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2004_t4_t1,person,period,2,3);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2004_t1_t2,person,period,3,4);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2004_t2_t3,person,period,4,5);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2004_t3_t4,person,period,5,6);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2005_t4_t1,person,period,6,7);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2005_t1_t2,person,period,7,8);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2005_t2_t3,person,period,8,9);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2005_t3_t4,person,period,9,10);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2006_t4_t1,person,period,10,11);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2006_t1_t2,person,period,11,12);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2006_t2_t3,person,period,12,13);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2006_t3_t4,person,period,13,14);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2007_t4_t1,person,period,14,15);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2007_t1_t2,person,period,15,16);
/*%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2007_t2_t3,person,period,16,17);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2007_t3_t4,person,period,17,18);*/
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2008_t4_t1,person,period,18,19);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2008_t1_t2,person,period,19,20);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2008_t2_t3,person,period,20,21);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2008_t3_t4,person,period,21,22);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2009_t4_t1,person,period,22,23);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2009_t1_t2,person,period,23,24);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2009_t2_t3,person,period,24,25);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2009_t3_t4,person,period,25,26);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2010_t4_t1,person,period,26,27);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2010_t1_t2,person,period,27,28);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2010_t2_t3,person,period,28,29);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2010_t3_t4,person,period,29,30);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2011_t4_t1,person,period,30,31);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2011_t1_t2,person,period,31,32);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2011_t2_t3,person,period,32,33);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2011_t3_t4,person,period,33,34);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2012_t4_t1,person,period,34,35);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2012_t1_t2,person,period,35,36);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2012_t2_t3,person,period,36,37);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2012_t3_t4,person,period,37,38);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2013_t4_t1,person,period,38,39);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2013_t1_t2,person,period,39,40);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2013_t2_t3,person,period,40,41);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2013_t3_t4,person,period,41,42);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2014_t4_t1,person,period,42,43);
/*%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2014_t1_t2,person,period,43,44);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2014_t2_t3,person,period,44,45);*/
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2014_t3_t4,person,period,45,46);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2015_t4_t1,person,period,46,47);
%couple_trim(leo.eph_data_formatted_2003_2015,leo.eph_pannel_2015_t1_t2,person,period,47,48);

/*The last step is adding information on the past characteristics of individuals (the past quarter) in the present quarter. This way, 
		we know for instance what was the labour-market state in t-1 of an individual surveyed in t. This information is crucial 
		for studying individual transitions, as it lets us observe these evolutions in the first place. We adopt a quarterly pace in our 
		simulations, but it is entirely possible to adopt a yearly pace (on the condition of rewriting the dynamic microsimulation model
		with a yearly step).*/

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
ageconti partner_id underage_children partner_formation formation partner_age partner_lab_mar_state partner_student little_children
sect_quartile quartile_all informal_independent civil_servant; 
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
rename informal_independent=lag_inf_indep; 
rename civil_servant=lag_civil_servant; 
run; 
data last_quarter;
set last_quarter; 
drop &estado. student ch07 ITL; 
run; 
data &outdata._period_&to_time.; 
merge current_quarter last_quarter;
by person; run;  
%mend;



%past_state(leo.eph_pannel_2015_t1_t2,leo.eph_past_state,labour_market_state,47,48);
%past_state(leo.eph_pannel_2015_t4_t1,leo.eph_past_state,labour_market_state,46,47);
%past_state(leo.eph_pannel_2014_t3_t4,leo.eph_past_state,labour_market_state,45,46);/*
%past_state(leo.eph_pannel_2014_t2_t3,labour_market_state,44,45);
%past_state(leo.eph_pannel_2014_t1_t2,labour_market_state,43,44);*/
%past_state(leo.eph_pannel_2014_t4_t1,leo.eph_past_state,labour_market_state,42,43);
%past_state(leo.eph_pannel_2013_t3_t4,leo.eph_past_state,labour_market_state,41,42);
%past_state(leo.eph_pannel_2013_t2_t3,leo.eph_past_state,labour_market_state,40,41);
%past_state(leo.eph_pannel_2013_t1_t2,leo.eph_past_state,labour_market_state,39,40);
%past_state(leo.eph_pannel_2013_t4_t1,leo.eph_past_state,labour_market_state,38,39);
%past_state(leo.eph_pannel_2012_t3_t4,leo.eph_past_state,labour_market_state,37,38);
%past_state(leo.eph_pannel_2012_t2_t3,leo.eph_past_state,labour_market_state,36,37);
%past_state(leo.eph_pannel_2012_t1_t2,leo.eph_past_state,labour_market_state,35,36);
%past_state(leo.eph_pannel_2012_t4_t1,leo.eph_past_state,labour_market_state,34,35);
%past_state(leo.eph_pannel_2011_t3_t4,leo.eph_past_state,labour_market_state,33,34);
%past_state(leo.eph_pannel_2011_t2_t3,leo.eph_past_state,labour_market_state,32,33);
%past_state(leo.eph_pannel_2011_t1_t2,leo.eph_past_state,labour_market_state,31,32);
%past_state(leo.eph_pannel_2011_t4_t1,leo.eph_past_state,labour_market_state,30,31);
%past_state(leo.eph_pannel_2010_t3_t4,leo.eph_past_state,labour_market_state,29,30);
%past_state(leo.eph_pannel_2010_t2_t3,leo.eph_past_state,labour_market_state,28,29);
%past_state(leo.eph_pannel_2010_t1_t2,leo.eph_past_state,labour_market_state,27,28);
%past_state(leo.eph_pannel_2010_t4_t1,leo.eph_past_state,labour_market_state,26,27);
%past_state(leo.eph_pannel_2009_t3_t4,leo.eph_past_state,labour_market_state,25,26);
%past_state(leo.eph_pannel_2009_t2_t3,leo.eph_past_state,labour_market_state,24,25);
%past_state(leo.eph_pannel_2009_t1_t2,leo.eph_past_state,labour_market_state,23,24);
%past_state(leo.eph_pannel_2009_t4_t1,leo.eph_past_state,labour_market_state,22,23);
%past_state(leo.eph_pannel_2008_t3_t4,leo.eph_past_state,labour_market_state,21,22);
%past_state(leo.eph_pannel_2008_t2_t3,leo.eph_past_state,labour_market_state,20,21);
%past_state(leo.eph_pannel_2008_t1_t2,leo.eph_past_state,labour_market_state,19,20);
%past_state(leo.eph_pannel_2008_t4_t1,leo.eph_past_state,labour_market_state,18,19);
%past_state(leo.eph_pannel_2007_t1_t2,leo.eph_past_state,labour_market_state,15,16);
%past_state(leo.eph_pannel_2007_t4_t1,leo.eph_past_state,labour_market_state,14,15);
%past_state(leo.eph_pannel_2006_t3_t4,leo.eph_past_state,labour_market_state,13,14);
%past_state(leo.eph_pannel_2006_t2_t3,leo.eph_past_state,labour_market_state,12,13);
%past_state(leo.eph_pannel_2006_t1_t2,leo.eph_past_state,labour_market_state,11,12);
%past_state(leo.eph_pannel_2006_t4_t1,leo.eph_past_state,labour_market_state,10,11);
%past_state(leo.eph_pannel_2005_t3_t4,leo.eph_past_state,labour_market_state,9,10);
%past_state(leo.eph_pannel_2005_t2_t3,leo.eph_past_state,labour_market_state,8,9);
%past_state(leo.eph_pannel_2005_t1_t2,leo.eph_past_state,labour_market_state,7,8);
%past_state(leo.eph_pannel_2005_t4_t1,leo.eph_past_state,labour_market_state,6,7);
%past_state(leo.eph_pannel_2004_t3_t4,leo.eph_past_state,labour_market_state,5,6);
%past_state(leo.eph_pannel_2004_t2_t3,leo.eph_past_state,labour_market_state,4,5);
%past_state(leo.eph_pannel_2004_t1_t2,leo.eph_past_state,labour_market_state,3,4);
%past_state(leo.eph_pannel_2004_t4_t1,leo.eph_past_state,labour_market_state,2,3);
%past_state(leo.eph_pannel_2003_t3_t4,leo.eph_past_state,labour_market_state,1,2);


data leo.eph_past_state; 
set leo.eph_past_state_period_2-leo.eph_past_state_period_16 
leo.eph_past_state_period_19-leo.eph_past_state_period_43 
leo.eph_past_state_period_46-leo.eph_past_state_period_48;
run;  

