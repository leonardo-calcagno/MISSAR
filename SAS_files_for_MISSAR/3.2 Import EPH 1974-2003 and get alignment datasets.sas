/*To delete both the log and the results file, run this: 

dm 'odsresults; clear'; 
dm 'clear log'; */

/*******************We work here with datasets outside of the 2003-2015 EPHc. These are only used for the macro calibration of the 
		model (such as historical proportion of formal workers), and we do not calibrate individual behaviour with it. This last point
		was already undertaken with 2003-2015 data on files 2.1. and 2.2. The revised EPHc dataset published since 2016 is also only 
		used for the macro calibration of the model, up to the first quarter of 2017. This case will be studied in a separate file.*/

/***************First, we import data sets before 2003, the "EPH puntual" (punctual EPH). Put the path of your liking. 
		The datasets can be downoladed from the INDEC website*/

/*Between 1995 and May 2003 was issued the Extended User Base (BUA). Both the datasets and the documentation on how to read these datasets
		are present in a dedicated folder of our ZENODO digital repository.*/
PROC IMPORT OUT=leo.eph_bua_2003_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2003_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_2002_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2002_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_2002_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2002_bua\per_okt"
            DBMS=dbf REPLACE;
			
PROC IMPORT OUT=leo.eph_bua_2001_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2001_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_2001_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2001_bua\per_okt"
            DBMS=dbf REPLACE;
			run; 
						
PROC IMPORT OUT=leo.eph_bua_2000_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2000_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_2000_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2000_bua\per_okt"
            DBMS=dbf REPLACE;
			run; 
						
PROC IMPORT OUT=leo.eph_bua_1999_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1999_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_1999_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1999_bua\per_okt"
            DBMS=dbf REPLACE;
			run; 
						
PROC IMPORT OUT=leo.eph_bua_1998_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1998_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_1998_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1998_bua\per_okt"
            DBMS=dbf REPLACE;
			run; 
							
PROC IMPORT OUT=leo.eph_bua_1997_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1997_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_1997_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1997_bua\per_okt"
            DBMS=dbf REPLACE;
			run; 
							
PROC IMPORT OUT=leo.eph_bua_1996_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1996_bua\per_may"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo.eph_bua_1996_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1996_bua\per_okt"
            DBMS=dbf REPLACE;
			run; 

/*Before 1995, the datasets are only available city by city, and some cities are present in some waves but not in others. The questionnaire 
			is still the same across the Extended User Base datasets (BUA), which is why we concatenate them together further down this 
			file. The cities that are not present for a given wave are commented out below.*/


PROC IMPORT OUT=leo._01_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua01195\per_bua"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua02195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._03_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua03195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._04_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua04195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._05_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua05195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._06_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua06195\per_bua"
            DBMS=dbf REPLACE;
RUN;


/*
PROC IMPORT OUT=leo._07_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua07195\per_bua"
            DBMS=dbf REPLACE;
RUN;
*/


PROC IMPORT OUT=leo._08_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua08195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._09_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua09195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._10_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua10195\per_bua"
            DBMS=dbf REPLACE;
RUN;
/*
PROC IMPORT OUT=leo._11_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua11195\per_bua"
            DBMS=dbf REPLACE;
RUN;
*/
PROC IMPORT OUT=leo._12_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua12195\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._13_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua13195\per_bua"
            DBMS=dbf REPLACE;
RUN;
/*
PROC IMPORT OUT=leo._14_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua14195\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._15_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua15195\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._16_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua16195\per_bua"
            DBMS=dbf REPLACE;
RUN;
*/
PROC IMPORT OUT=leo._17_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua17195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._18_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua18195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._19_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua19195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._20_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua20195\per_bua"
            DBMS=dbf REPLACE;
RUN;


PROC IMPORT OUT=leo._22_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua22195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._23_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua23195\per_bua"
            DBMS=dbf REPLACE;
RUN;



/*
PROC IMPORT OUT=leo._24_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua24195\per_bua"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._25_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua25195\per_bua"
            DBMS=dbf REPLACE;
RUN;*/
PROC IMPORT OUT=leo._26_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua26195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._27_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua27195\per_bua"
            DBMS=dbf REPLACE;
RUN;

/*

PROC IMPORT OUT=leo._28_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua28195\per_bua"
            DBMS=dbf REPLACE;
RUN;*/

PROC IMPORT OUT=leo._29_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua29195\per_bua"
            DBMS=dbf REPLACE;
RUN;


PROC IMPORT OUT=leo._30_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua30195\per_bua"
            DBMS=dbf REPLACE;
RUN;


PROC IMPORT OUT=leo._31_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua31195\per_bua"
            DBMS=dbf REPLACE;
RUN;
/*
PROC IMPORT OUT=leo._32_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua32195\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._33_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua33195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._34_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua34195\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._36_bua_1995_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua36195\per_bua"
            DBMS=dbf REPLACE;
RUN;

*/

 

PROC IMPORT OUT=leo._01_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua01395\per_bua"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua02395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._03_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua03395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._04_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua04395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._05_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua05395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._06_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua06395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._07_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua07395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._08_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua08395\per_bua"
            DBMS=dbf REPLACE;
RUN;

/*

PROC IMPORT OUT=leo._09_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua09395\per_bua"
            DBMS=dbf REPLACE;
RUN;

*/

PROC IMPORT OUT=leo._10_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua10395\per_bua"
            DBMS=dbf REPLACE;
RUN;
/*
PROC IMPORT OUT=leo._11_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua11395\per_bua"
            DBMS=dbf REPLACE;
RUN;
*/
PROC IMPORT OUT=leo._12_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua12395\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._13_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua13395\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._14_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua14395\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._15_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua15395\per_bua"
            DBMS=dbf REPLACE;
RUN;
/*
PROC IMPORT OUT=leo._16_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua16395\per_bua"
            DBMS=dbf REPLACE;
RUN;*/

PROC IMPORT OUT=leo._17_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua17395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._18_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua18395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._19_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua19395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._20_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua20395\per_bua"
            DBMS=dbf REPLACE;
RUN;

/*
PROC IMPORT OUT=leo._21_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua21395\per_bua"
            DBMS=dbf REPLACE;
RUN;*/

PROC IMPORT OUT=leo._22_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua22395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._23_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua23395\per_bua"
            DBMS=dbf REPLACE;
RUN;



/*
PROC IMPORT OUT=leo._24_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua24395\per_bua"
            DBMS=dbf REPLACE;
RUN;*/
PROC IMPORT OUT=leo._25_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua25395\per_bua"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua26395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._27_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua27395\per_bua"
            DBMS=dbf REPLACE;
RUN;


/*
PROC IMPORT OUT=leo._28_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua28395\per_bua"
            DBMS=dbf REPLACE;
RUN;
*/
PROC IMPORT OUT=leo._29_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua29395\per_bua"
            DBMS=dbf REPLACE;
RUN;


PROC IMPORT OUT=leo._30_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua30395\per_bua"
            DBMS=dbf REPLACE;
RUN;


PROC IMPORT OUT=leo._31_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua31395\per_bua"
            DBMS=dbf REPLACE;
RUN;
/*
PROC IMPORT OUT=leo._32_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua32395\per_bua"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._33_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua33395\per_bua"
            DBMS=dbf REPLACE;
RUN;
*/


PROC IMPORT OUT=leo._34_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua34395\per_bua"
            DBMS=dbf REPLACE;
RUN;



PROC IMPORT OUT=leo._36_bua_1995_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_1995_BUA\Bua36395\per_bua"
            DBMS=dbf REPLACE;
RUN;


data leo.eph_bua_1995_may; 
set  leo._01_bua_1995_may leo._02_bua_1995_may leo._03_bua_1995_may leo._04_bua_1995_may leo._05_bua_1995_may
leo._06_bua_1995_may leo._08_bua_1995_may leo._10_bua_1995_may 
 leo._12_bua_1995_may leo._13_bua_1995_may 
leo._17_bua_1995_may leo._18_bua_1995_may leo._19_bua_1995_may leo._20_bua_1995_may 
 leo._22_bua_1995_may leo._23_bua_1995_may leo._26_bua_1995_may 
leo._27_bua_1995_may leo._29_bua_1995_may leo._30_bua_1995_may leo._31_bua_1995_may; 
run; 

data leo.eph_bua_1995_okt; 
set  leo._01_bua_1995_okt leo._02_bua_1995_okt leo._03_bua_1995_okt leo._04_bua_1995_okt leo._05_bua_1995_okt
leo._06_bua_1995_okt leo._07_bua_1995_okt leo._08_bua_1995_okt leo._10_bua_1995_okt leo._10_bua_1995_okt
 leo._12_bua_1995_okt leo._13_bua_1995_okt leo._14_bua_1995_okt leo._15_bua_1995_okt 
leo._17_bua_1995_okt leo._18_bua_1995_okt leo._19_bua_1995_okt leo._20_bua_1995_okt 
 leo._22_bua_1995_okt leo._23_bua_1995_okt leo._25_bua_1995_okt leo._26_bua_1995_okt 
leo._27_bua_1995_okt leo._29_bua_1995_okt leo._30_bua_1995_okt leo._31_bua_1995_okt leo._34_bua_1995_okt leo._36_bua_1995_okt; 
run; 
data leo.eph_bua_1995_may; 
set leo.eph_bua_1995_may; 
drop p13aus; 
run; 
data leo.eph_bua_1995_okt; 
set leo.eph_bua_1995_okt; 
drop p13aus; 
run; 

		
data leo.eph_bua_1996_may; 
set leo.eph_bua_1996_may; 
drop p13aus; 
run;  
data leo.eph_bua_1996_okt; 
set leo.eph_bua_1996_okt; 
drop p13aus; 
run;  
data leo.eph_bua_1997_may; 
set leo.eph_bua_1997_may; 
drop p13aus; 
run;  
data leo.eph_bua_1997_okt; 
set leo.eph_bua_1997_okt; 
drop p13aus; 
run;  
data leo.eph_bua_1998_may; 
set leo.eph_bua_1998_may; 
drop p13aus; 
run;  
data leo.eph_bua_1998_okt; 
set leo.eph_bua_1998_okt; 
drop p13aus; 
run;  
data leo.eph_bua_1999_may; 
set leo.eph_bua_1999_may; 
drop p13aus; 
run;  
data leo.eph_bua_1999_okt; 
set leo.eph_bua_1999_okt; 
drop p13aus; 
run;  
data leo.eph_bua_2000_may; 
set leo.eph_bua_2000_may; 
drop p13aus; 
run;  
data leo.eph_bua_2000_okt; 
set leo.eph_bua_2000_okt; 
drop p13aus; 
run;  
data leo.eph_bua_2001_may; 
set leo.eph_bua_2001_may; 
drop p13aus; 
run;  
data leo.eph_bua_2001_okt; 
set leo.eph_bua_2001_okt; 
drop p13aus; 
run;  
data leo.eph_bua_2002_may; 
set leo.eph_bua_2002_may; 
drop p13aus; 
run;  
data leo.eph_bua_2002_okt; 
set leo.eph_bua_2002_okt; 
drop p13aus; 
run;  
data leo.eph_bua_2003_may; 
set leo.eph_bua_2003_may; 
drop p13aus; 
run;  
data leo.eph_bua_formatted_95_03; 
set leo.eph_bua_2003_may 
leo.eph_bua_2002_may leo.eph_bua_2002_okt
leo.eph_bua_2001_may leo.eph_bua_2001_okt
leo.eph_bua_2000_may leo.eph_bua_2000_okt
leo.eph_bua_1999_may leo.eph_bua_1999_okt
leo.eph_bua_1998_may leo.eph_bua_1998_okt
leo.eph_bua_1997_may leo.eph_bua_1997_okt
leo.eph_bua_1996_may leo.eph_bua_1996_okt
leo.eph_bua_1995_may leo.eph_bua_1995_okt; 
run; 

data leo.eph_bua_formatted_95_03; 
 set leo.eph_bua_formatted_95_03; 
ageconti=h12*1;
 run; 

 /*We get in the end a unified dataset that follows the Extended User Base and that covers the 1995-2003 period. We can concatenate it into 
 		one dataset from which we will then get aggregate alignment data.*/
data leo.eph_bua_formatted_95_03; 
length student $14.; 
length contributes $14.; 
set leo.eph_bua_formatted_95_03;

/*We want to harmonise the marital status variable across EPH datasets. We thus keep the coding adopted for the continuous EPH (2003-2015): 
		1: common-law union; 2: married; 3: divorced; 4: widowed; 5:single. */
if h14=1 then marital_status=5; 
if h14=2 then marital_status=1;
if h14=3 then marital_status=2; 
if h14=4 then marital_status=3; 
if h14=5 then marital_status=4;  
if p11=3 then student="True"; 
if p11^=3 then student="False"; 
/*We adopt a legalistic definition of labour formality for wage-earners: those who contribute to a retirement scheme are considered formal.
		See section 1.2.2. and Appendix H of my PhD thesis to get a full account of how I identify formal workers in the EPH BUA (95 / 03).*/
if benef2=11 | benef2=12 | benef2=14 then contributes="True"; 
if missing(benef2) | benef2=13 | benef2=15 | benef2=16 | benef2=9 | benef2=17 then contributes="False"; 
/*Reminder for variable labour_market_state: 1, formal wage-earner; 2, independent worker of the formal sector; 3, informal worker; 
		4, unemployed; 5, inactive. We keep numeric values for this polythomic variable because LIAM2 can only process variables that are
		floats, integers or booleans, not character variables.*/
if estado=1 & contributes="False" then labour_market_state=3; 
if estado=1 & contributes="True" then labour_market_state=1; 
if estado=3 | estado=0 | missing(estado) then labour_market_state=5; 
if estado=2 then labour_market_state=4;  
if (ageconti>0 and ageconti<5 or ageconti=-1) then agegroup_ext=0;
if (ageconti>4 and ageconti<10) then agegroup_ext=5;
if (ageconti>9 and ageconti<15) then agegroup_ext=10;
if (ageconti>14 and ageconti<20) then agegroup_ext=15;
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
if (ageconti>94 and ageconti=<98) then agegroup_ext=95;
 if ano4=2003 & onda=1 then period="2003_1";
 if ano4=2002 & onda=3 then period="2002_3";
 if ano4=2002 & onda=1 then period="2002_1";
 if ano4=2001 & onda=3 then period="2001_3";
 if ano4=2001 & onda=1 then period="2001_1";
 if ano4=2000 & onda=3 then period="2000_3";
 if ano4=2000 & onda=1 then period="2000_1";
 if ano4=1999 & onda=3 then period="1999_3";
 if ano4=1999 & onda=1 then period="1999_1";
 if ano4=1998 & onda=3 then period="1998_3";
 if ano4=1998 & onda=1 then period="1998_1";
 if ano4=1997 & onda=3 then period="1997_3";
 if ano4=1997 & onda=1 then period="1997_1";
 if ano4=1996 & onda=3 then period="1996_3";
 if ano4=1996 & onda=1 then period="1996_1";
 if ano=95 & onda=3 then period="1995_3";
 if ano=95 & onda=1 then period="1995_1";
if nivel_ed=6 then formation="3"; 
if nivel_ed=4 | nivel_ed=5 then formation="2"; 
if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 then formation="1";  
if ageconti=99 then delete; 

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
if (ageconti>64) then agegroup=300;
run; 

/*To get a proportion of independent workers of the formal sector that is consistent with the values estimated on the continuous EPH
		survey (2003-2015), we will assume that only qualified independent workers (so excluding those semi-qualified or with a profesionnal
		qualification) are in the formal sector.*/

%macro indep_endo_bua_btrab(indata,outdata);
data indep_workers_true; 
set &indata.; 
where p17=1 | p17=2; 
run; 
data indep_workers_false; 
set &indata.; 
where p17^=1 & p17^=2; 
run; 
/*Following the national occupation classifier (CNO), the last string of variable P20 gives out the occupation's qualification. We assume
		positions that require a professional qualification (1) or a qualified worker (2) are those of the formal sector. Most of the time
		variable P20 has 3 digits. When it is not the case, it is the second string that gives out the post's qualification, so we also
		measure the second string from the left (variable second_string) for those cases.*/ 
data indep_workers_true; 
length qualif_indep $32.; 
set indep_workers_true; 
third_string=substr(p20,3); 
second_string=substr(p20,2,1); 
if third_string="1"| third_string="2" then qualif_indep="Qualif";
else qualif_indep="Non_qualif"; 
if missing(third_string) then do; 
if second_string="1" | second_string="2" then qualif_indep="Qualif"; 
end; 
/* By hypothesis, independent workers of the public sector are formal*/
if p18b=1 then qualif_indep="Qualif";
/*Also, those that have 6 or more employees are supposed to be formal.*/
if p19=3|p19=4|p19=5|p19=6|p19=7|p19=8 then qualif_indep="Qualif"; 
if p19b=2 then qualif_indep="Qualif"; 
drop third_string second_string;  
run; 
data indep_workers_false; 
length qualif_indep $32.; 
set indep_workers_false; 
qualif_indep="Non_indep"; 
run; 
data &outdata.; 
set indep_workers_true indep_workers_false; 
if qualif_indep="Qualif" then labour_market_state=2; 
if qualif_indep="Qualif" then contributes="True"; 
run; 



%mend; 


%indep_endo_bua_btrab(leo.eph_bua_formatted_95_03,leo.eph_bua_format_95_03);
/*We can see here we get almost the same proportion of independent workers of the formal sector on May 2003 (last wave of the punctual EPH
		extended dataset) and on the third quarter of 2003 (first wave of the continuous EPH).*/
proc freq data=leo.eph_bua_format_95_03; 
weight pondera; 
where ageconti>15 & ((ageconti<65 & h13=1)|(ageconti<60 & h13=2))& ano4=2003; 

table labour_market_state; 
run; 
proc freq data=leo.eph_data_formatted_2003; 
where ano4=2003 & trimestre=3 & ageconti>15 & ((ageconti<65 & ch04=1)|(ageconti<60 & ch04=2)); 
table labour_market_state; run;  


proc sort data=leo.eph_bua_format_95_03; 
by period; 
run; 

/*We have to correct however the above identification of independent workers of the formal sector. This is becasue there was a progressive
		change in the adopted occupation classifier.*/
/*EXPLICATION:
There are actually two types of occupation classifiers adopted throughout the 1970s and 1990s: the CO-EPH (until October 1997) and the 
		CNO (National Occupation Classifier, from October 1992 to 2011). Both of these classifiers are available in INDEC's website, 
		but we upload them for reference ot our ZENODO repository. The last digit of both these classifiers indicates the position's
		qualification. For both of them, 1 means professionnal qualification (the highest level of qualification) and 4 not qualified
		(the lowest). However, intermediate qualifications 2 and 3 are different in those classifiers. For CO-EPH, 3 means semi-qualified. 
		All semi-qualified individuals in CO-EPH would also get a 3 if interviewed with the CNO occupation classifier. 
However, all workers with a 2 digit in CO-EPH (that indicates it is a qualified worker) would have either a technical qualification in 
		the CNO (ends with digit 2) or an operative qualification (ends with digit 3), which makes direct comparison between these two 
		qualifiers impossible. This implies an unknown share of workers that are considered qualified and thus formal in the CO-EPH, would 
		on the other hand be classified as having an operative qualification (digit 3) and thus as belonging to the informal sector. If we
		ignore this, we get a surge of independent workers of the formal sector around the early 1990s that simply comes from using the 
		CO-EPH instead of the CNO. 
If we however make the hypothesis that people surveyed with the CO-EPH, who report a qualification with last digit 2 but that do not have a complete
		secondary education actually are informal workers, we get stable proportions of independent workers of the formal sector over time. It fluctuates
		between 3% and 6% of working-age population, figures that are close to those of the EPHc.
We thus correct formal independent labour only for the agglomerations that used the CO-EPH classifier. The implementation of the CNO was 
		gradual over time in the 1992-1997 period, as can be shown in the file EPH_Clasif_Ocup_hasta_CNO_2001 present in the ZENODO
		repository. This correction is thus applied to all waves prior to October 1992, to some cities between October 1992 and October 1997, and 
		is not applied since March 1998 (since no city employes CO-EPH since that date).*/
data leo.eph_bua_format_95_03; 
	length third_string $1.; 
set leo.eph_bua_format_95_03; 
if missing(agegroup) then delete;
/*Education level*/
if p56="0" | p56="1"| p56="9" then for2=1; 
if p58=1 then do; 
if p56="7" | p56="8" then for2=3; 
if p56="2" | p56="3" | p56="4" | p56="5" | p56="6" then for2=2; 
end; 
if p58=2 then do; 
if p56="7" | p56="8" then for2=2; 
if p56="2" | p56="3" | p56="4" | p56="5" | p56="6" then for2=1; 
end; 
if p56^="0"& p56^="1" & p56^="2" & p56^="3" & p56^="4" & p56^="5" & p56^="6" & p56^="7" & p56^="8" & p56^="9" then for2=1; 
third_string=substr(p20,3); 
second_string=substr(p20,2,1); 
/*We tag the string that determines the qualification tied to the respondent's occupation. */
if third_string="1" then tag=1;
if third_string="2" then tag=2; 
if third_string^="1" & third_string^="2" then tag=3;
if missing(third_string) then do; 
if second_string="1" then tag=1;
if second_string="2" then tag=2;
end; 
/*Then we correc this reported qualification when the respondent was surveyed using the CO-EPH classifier instead of the CNO.*/
if period="1995_1" then do; 
if aglomerado^=32 & aglomerado^=33 & aglomerado^=6 & aglomerado^= 17 & aglomerado^=30 
& aglomerado^=13 & aglomerado^=29 & aglomerado^=4 & aglomerado^=5 & aglomerado^=10  then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if period="1995_3" then do; 
if aglomerado^=32 & aglomerado^=33 & aglomerado^=6 & aglomerado^= 17 & aglomerado^=30 
& aglomerado^=13 & aglomerado^=29 & aglomerado^=4 & aglomerado^=5 & aglomerado^=10  
& aglomerado^=2 & aglomerado^=14 & aglomerado^=34 & aglomerado^=36 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if period="1996_1" then do; 
if agloreal^=32 & agloreal^=33 & agloreal^=6 & agloreal^= 17 & agloreal^=30 
& agloreal^=13 & agloreal^=29 & agloreal^=4 & agloreal^=5 & agloreal^=10  
& agloreal^=2 & agloreal^=14 & agloreal^=34 & agloreal^=36 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;

if period="1996_3" then do; 
if agloreal^=32 & agloreal^=33 & agloreal^=6 & agloreal^= 17 & agloreal^=30 
& agloreal^=13 & agloreal^=29 & agloreal^=4 & agloreal^=5 & agloreal^=10  
& agloreal^=2 & agloreal^=14 & agloreal^=34 & agloreal^=36 & agloreal^=18 & agloreal^=19 & agloreal^=22 & agloreal^=25 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if period="1997_1" then do; 
if agloreal^=32 & agloreal^=33 & agloreal^=6 & agloreal^= 17 & agloreal^=30 
& agloreal^=13 & agloreal^=29 & agloreal^=4 & agloreal^=5 & agloreal^=10  
& agloreal^=2 & agloreal^=14 & agloreal^=34 & agloreal^=36 & agloreal^=18 & agloreal^=19 & agloreal^=22 & agloreal^=25 
& agloreal^=7 & agloreal^=8 & agloreal^=23 & agloreal^=12 & agloreal^=15
then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if period="1997_1" then do; 
if agloreal^=32 & agloreal^=33 & agloreal^=6 & agloreal^= 17 & agloreal^=30 
& agloreal^=13 & agloreal^=29 & agloreal^=4 & agloreal^=5 & agloreal^=10  
& agloreal^=2 & agloreal^=14 & agloreal^=34 & agloreal^=36 & agloreal^=18 & agloreal^=19 & agloreal^=22 & agloreal^=25 
& agloreal^=7 & agloreal^=8 & agloreal^=23 & agloreal^=12 & agloreal^=15
then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if period="1997_3" then do; 
if agloreal^=32 & agloreal^=33 & agloreal^=6 & agloreal^= 17 & agloreal^=30 
& agloreal^=13 & agloreal^=29 & agloreal^=4 & agloreal^=5 & agloreal^=10  
& agloreal^=2 & agloreal^=14 & agloreal^=34 & agloreal^=36 & agloreal^=18 & agloreal^=19 & agloreal^=22 & agloreal^=25 
& agloreal^=7 & agloreal^=8 & agloreal^=23 & agloreal^=12 & agloreal^=15 & agloreal^=3 
& agloreal^=9 & agloreal^=26 & agloreal^=27 & agloreal^=31 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if ano4>1997 then tag2=tag; 
/*Finally, people surveyed with the CO-EPH, that report a last string of 2 in their qualification variable but would actually have had 
		a string of 3 with the CNO (according to our hypothesis on their education level) are classified as informal workers.*/
if labour_market_state=2 & (tag2=3) then labour_market_state=3; 
run;

/*Now we import the datasets of the 1991-1994 period. We can only use for those periods the "work bases" (bases de trabajo), and not the 
		R2 surveys that lack too much information. Again, these datasets are available separately by agglomeration and period, 
		so we will concatenate the work bases for the 1991-1994 period.*/

PROC IMPORT OUT=leo._01_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\PBT01194\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM02194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._04_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM04194\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._05_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM05194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._06_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM06194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._08_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM08194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._09_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM09194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM10194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._12_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM12194\btper"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._13_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM13194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM17194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._18_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM18194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM19194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM20194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM23194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._25_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM25194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM26194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._27_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM27194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM29194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM30194\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._31_btrab_1994_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_may\DEM31194\btpertot"
            DBMS=dbf REPLACE;
RUN;
 
data leo.eph_work_base_1994_may; 
set leo._01_btrab_1994_may leo._02_btrab_1994_may leo._04_btrab_1994_may leo._05_btrab_1994_may leo._06_btrab_1994_may
 leo._08_btrab_1994_may leo._09_btrab_1994_may leo._10_btrab_1994_may leo._12_btrab_1994_may leo._13_btrab_1994_may
 leo._17_btrab_1994_may leo._18_btrab_1994_may leo._19_btrab_1994_may leo._20_btrab_1994_may leo._23_btrab_1994_may
 leo._25_btrab_1994_may leo._26_btrab_1994_may leo._27_btrab_1994_may leo._29_btrab_1994_may leo._30_btrab_1994_may
leo._31_btrab_1994_may; 
run; 

PROC IMPORT OUT=leo._01_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\PBT01394\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM02394\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._04_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM04394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._05_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM05394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._06_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM06394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._08_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM08394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._09_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM09394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM10394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._12_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM12394\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM13394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM17394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._18_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM18394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM19394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM20394\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._22_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM22394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM23394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._25_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM25394\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM26394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._27_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM27394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM29394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM30394\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._31_btrab_1994_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1994_btrab_okt\DEM31394\btper"
            DBMS=dbf REPLACE;
RUN;

data leo.eph_work_base_1994_okt; 
set leo._27_btrab_1994_okt leo._29_btrab_1994_okt leo._30_btrab_1994_okt leo._31_btrab_1994_okt 
leo._01_btrab_1994_okt leo._02_btrab_1994_okt leo._04_btrab_1994_okt leo._05_btrab_1994_okt leo._06_btrab_1994_okt
leo._08_btrab_1994_okt leo._09_btrab_1994_okt leo._10_btrab_1994_okt leo._12_btrab_1994_okt leo._13_btrab_1994_okt
leo._17_btrab_1994_okt leo._18_btrab_1994_okt leo._19_btrab_1994_okt leo._20_btrab_1994_okt leo._22_btrab_1994_okt 
leo._23_btrab_1994_okt leo._25_btrab_1994_okt leo._26_btrab_1994_okt; 
run;  



   

PROC IMPORT OUT=leo._01_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\PBT01193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM02193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._04_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM04193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._05_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM05193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._06_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM06193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._09_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM09193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM10193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM13193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM17193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM19193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM20193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._22_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM22193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM23193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM26193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM29193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM30193\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._31_btrab_1993_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_may\DEM31193\btper"
            DBMS=dbf REPLACE;
RUN;
 
data leo.eph_work_base_1993_may; 
set leo._01_btrab_1993_may leo._02_btrab_1993_may leo._04_btrab_1993_may leo._05_btrab_1993_may leo._06_btrab_1993_may
 leo._09_btrab_1993_may leo._10_btrab_1993_may  leo._13_btrab_1993_may
 leo._17_btrab_1993_may leo._19_btrab_1993_may leo._20_btrab_1993_may leo._23_btrab_1993_may
 leo._22_btrab_1993_may leo._26_btrab_1993_may  leo._29_btrab_1993_may leo._30_btrab_1993_may
leo._31_btrab_1993_may; 
run; 
PROC IMPORT OUT=leo._01_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\PBT01393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM02393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._04_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM04393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._05_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM05393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._06_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM06393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._09_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM09393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM10393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM13393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM17393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM19393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM20393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._22_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM22393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM23393\btpertot"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM26393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM29393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM30393\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._31_btrab_1993_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1993_btrab_okt\DEM31393\btpertot"
            DBMS=dbf REPLACE;
RUN;

data leo.eph_work_base_1993_okt; 
set leo._29_btrab_1993_okt leo._30_btrab_1993_okt leo._31_btrab_1993_okt 
leo._01_btrab_1993_okt leo._02_btrab_1993_okt leo._04_btrab_1993_okt leo._05_btrab_1993_okt leo._06_btrab_1993_okt
leo._09_btrab_1993_okt leo._10_btrab_1993_okt leo._13_btrab_1993_okt
leo._17_btrab_1993_okt leo._19_btrab_1993_okt leo._20_btrab_1993_okt leo._22_btrab_1993_okt 
leo._23_btrab_1993_okt leo._26_btrab_1993_okt; 
run;  


PROC IMPORT OUT=leo._01_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\PBT01192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM02192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._04_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM04192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._06_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM06192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._09_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM09192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM10192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM13192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM17192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM19192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM23192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM26192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._27_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM27192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM29192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM30192\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._31_btrab_1992_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_may\DEM31192\btper"
            DBMS=dbf REPLACE;
RUN;
 
data leo.eph_work_base_1992_may; 
set leo._01_btrab_1992_may leo._02_btrab_1992_may leo._04_btrab_1992_may leo._06_btrab_1992_may
 leo._09_btrab_1992_may leo._10_btrab_1992_may  leo._13_btrab_1992_may
 leo._17_btrab_1992_may leo._19_btrab_1992_may leo._23_btrab_1992_may
 leo._26_btrab_1992_may  leo._27_btrab_1992_may leo._29_btrab_1992_may leo._30_btrab_1992_may
leo._31_btrab_1992_may; 
run; 

PROC IMPORT OUT=leo._01_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\PBT01392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM02392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._05_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM05392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._06_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM06392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._09_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM09392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM13392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM17392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._18_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM18392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM19392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM20392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM23392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM26392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._27_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM27392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM30392\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._31_btrab_1992_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1992_btrab_okt\DEM31392\btper"
            DBMS=dbf REPLACE;
RUN;

data leo.eph_work_base_1992_okt; 
set leo._27_btrab_1992_okt leo._30_btrab_1992_okt leo._31_btrab_1992_okt 
leo._01_btrab_1992_okt leo._02_btrab_1992_okt leo._05_btrab_1992_okt leo._06_btrab_1992_okt
leo._09_btrab_1992_okt leo._13_btrab_1992_okt
leo._17_btrab_1992_okt leo._19_btrab_1992_okt leo._20_btrab_1992_okt leo._18_btrab_1992_okt 
leo._23_btrab_1992_okt leo._26_btrab_1992_okt; 
run;  

/*Maintenant on importe pour 1991*/
PROC IMPORT OUT=leo._01_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\PBT01191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM10191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM13191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM17191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM19191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM20191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM23191\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_btrab_1991_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_may\DEM30191\btper"
            DBMS=dbf REPLACE;
RUN;
 
data leo.eph_work_base_1991_may; 
set leo._01_btrab_1991_may leo._10_btrab_1991_may  leo._13_btrab_1991_may
 leo._17_btrab_1991_may leo._19_btrab_1991_may leo._20_btrab_1991_may
 leo._23_btrab_1991_may leo._30_btrab_1991_may;
run; 

PROC IMPORT OUT=leo._01_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\PBT01391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._02_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM02391\btper"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._10_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM10391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM13391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM17391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM19391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM20391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM23391\btper"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM29391\btper"
            DBMS=dbf REPLACE;
RUN;

PROC IMPORT OUT=leo._30_btrab_1991_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1991_btrab_okt\DEM30391\btper"
            DBMS=dbf REPLACE;
RUN;

data leo.eph_work_base_1991_okt; 
set leo._30_btrab_1991_okt leo._29_btrab_1991_okt leo._23_btrab_1991_okt
leo._01_btrab_1991_okt leo._02_btrab_1991_okt leo._13_btrab_1991_okt leo._10_btrab_1991_okt
leo._17_btrab_1991_okt leo._19_btrab_1991_okt leo._20_btrab_1991_okt ; 
run;  

data leo.eph_work_base_91_94; 
set leo.eph_work_base_1994_may leo.eph_work_base_1994_okt
leo.eph_work_base_1993_may leo.eph_work_base_1993_okt
leo.eph_work_base_1992_may leo.eph_work_base_1992_okt
leo.eph_work_base_1991_may leo.eph_work_base_1991_okt; 
run; 

data leo.eph_work_base_91_94; 
 set leo.eph_work_base_91_94; 
ageconti=h12*1;
 run; 
data leo.eph_work_base_91_94;
length student $14.; 
length contributes $14.; 
set leo.eph_work_base_91_94;
if ageconti=99 then delete; /*This takes out from the base respondents who do not give their age.*/
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
if (ageconti>64) then agegroup=300;

if (ageconti>0 and ageconti<5 or ageconti=-1) then agegroup_ext=0;
if (ageconti>4 and ageconti<10) then agegroup_ext=5;
if (ageconti>9 and ageconti<15) then agegroup_ext=10;
if (ageconti>14 and ageconti<20) then agegroup_ext=15;
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
if (ageconti>94 and ageconti=<98) then agegroup_ext=95;


/*We want to harmonise the marital status variable across EPH datasets. We thus keep the coding adopted for the continuous EPH (2003-2015): 
		1: common-law union; 2: married; 3: divorced; 4: widowed; 5:single. */
if h14=1 then marital_status=5; 
if h14=2 then marital_status=1;
if h14=3 then marital_status=2; 
if h14=4 then marital_status=3; 
if h14=5 then marital_status=4;  
if p11=3 then student="True"; 
if p11^=3 then student="False"; 
/*We adopt a legalistic definition of labour formality for wage-earners: those who contribute to a retirement scheme are considered formal.
		See section 1.2.2. and Appendix H of my PhD thesis to get a full account of how I identify formal workers in the EPH BUA (95 / 03).*/
/*Reminder for variable labour_market_state: 1, formal wage-earner; 2, independent worker of the formal sector; 3, informal worker; 
		4, unemployed; 5, inactive. We keep numeric values for this polythomic variable because LIAM2 can only process variables that are
		floats, integers or booleans, not character variables.*/
if estado=1 & contributes="False" then labour_market_state=3; 
if estado=1 & contributes="True" then labour_market_state=1; 
if estado=3 | estado=0 | missing(estado) then labour_market_state=5; 
if estado=2 then labour_market_state=4;  
/*For the work base, you have to use variable p23 to identify wage-earners that contribute to a retirement scheme. See point 11.5. of 
		the BUA EPH document, of October 2002, present in our ZENODO repository and downloadable from INDEC's website.*/
/*Pour toutes les combinaisons possibles avec retraite, voir le point 11.5 du document EPH BUA Oct. 2002*/
if p23=2 | p23=3 | p23=6 | p23=7 | p23=10| p23=11| p23=14| p23=15| p23=18| p23=19| p23=22| p23=23
| p23=26| p23=27| p23=30| p23=31| p23=34| p23=35| p23=38| p23=39| p23=42| p23=43| p23=46| p23=47| p23=50
| p23=51| p23=54| p23=55| p23=58| p23=59| p23=62| p23=63 then contributes="True"; 
else contributes="False"; 
if missing(p23) then contributes="False"; 
if estado=1 & contributes="False" then labour_market_state=3; 
if estado=1 & contributes="True" then labour_market_state=1; 
 if ano=94 & onda=3 then period="1994_3";
 if ano=94 & onda=1 then period="1994_1";
 if ano=93 & onda=3 then period="1993_3";
 if ano=93 & onda=1 then period="1993_1";
 if ano=92 & onda=3 then period="1992_3";
 if ano=92 & onda=1 then period="1992_1";
 if ano=91 & onda=3 then period="1991_3";
 if ano=91 & onda=1 then period="1991_1";
run; 

%macro indep_endo_btrab(indata,outdata);
/*On prend ici les travailleurs peu qualifiés, on les considère comme non cotisants, les autres étant cotisants*/

data indep_workers_true; 
set &indata.; 
where p17=1 | p17=2; 
run; 
data indep_workers_false; 
set &indata.; 
where p17^=1 & p17^=2; 
run; 

data indep_workers_true; 
length qualif_indep $32.; 
set indep_workers_true; 
third_string=substr(p20,3); 
second_string=substr(p20,2,1); 
if third_string="1"| third_string="2" then qualif_indep="Qualif";
else qualif_indep="Non_qualif"; 
if missing(third_string) then do; 
if second_string="1" | second_string="2" then qualif_indep="Qualif"; 
end; 
if p18b=1 then qualif_indep="Qualif"; 
if p19=3|p19=4|p19=5|p19=6|p19=7|p19=8 then qualif_indep="Qualif"; 
drop third_string second_string; run; 
data indep_workers_false; 
length qualif_indep $32.; 
set indep_workers_false; 
qualif_indep="Non_indep"; 
run; 
data &outdata.; 
set indep_workers_true indep_workers_false; 
if qualif_indep="Qualif" then labour_market_state=2; 
if qualif_indep="Qualif" then contributes="True"; 
run; 


/*On trouve des chiffres réalistes, avec une plus grande cotisation des patrons que des travailleurs indépendants*/

%mend; 

%indep_endo_btrab(leo.eph_work_base_91_94,leo.eph_work_base_formatted_91_94);
/*This shows we have significant differences in formal independent labour when we change the survey in 1995. This is because we have 
		not yet taken into account the occupation classifier employed in the survey. We do this below.*/
proc freq data=leo.eph_work_base_formatted_91_94; 
where ageconti>15 & ((ageconti<60 & h13=2) |(ageconti<65 & h13=1)) & ano="94";
weight pondera; 
tables contributes * qualif_indep;  
table labour_market_state; 
run; 
proc freq data=leo.eph_bua_format_95_03; 
where ageconti>15 & ((ageconti<60 & h13=2) |(ageconti<65 & h13=1))& ano=95;
weight pondera; 
tables contributes * qualif_indep;  
table labour_market_state; 
run; 
proc freq data=leo.eph_work_base_formatted_91_94; 
weight pondera; 
tables labour_market_state*contributes; 
run; 
data leo.eph_work_base_formatted_91_94; 
length third_string $1.; 
set leo.eph_work_base_formatted_91_94; 
if p56="0" | p56="1"| p56="9" then for2=1; 
if p58=1 then do; 
if p56="7" | p56="8" then for2=3; 
if p56="2" | p56="3" | p56="4" | p56="5" | p56="6" then for2=2; 
end; 
if p58=2 then do; 
if p56="7" | p56="8" then for2=2; 
if p56="2" | p56="3" | p56="4" | p56="5" | p56="6" then for2=1; 
end; 
if p56^="0"& p56^="1" & p56^="2" & p56^="3" & p56^="4" & p56^="5" & p56^="6" & p56^="7" & p56^="8" & p56^="9" then for2=1; 
third_string=substr(p20,3); 
second_string=substr(p20,2,1); 
if third_string="1" then tag=1;
if third_string="2" then tag=2; 
if third_string^="1" & third_string^="2" then tag=3;
if missing(third_string) then do; 
if second_string="1" then tag=1;
if second_string="2" then tag=2;
end; 
if period="1991_1" | period="1991_3" | period="1992_1" then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2;  
end; 
if period="1992_3" then do; 
if aglomerado^=32& aglomerado^=33 & aglomerado^=6 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end; 
if period="1993_1" then do; 
if aglomerado^=32& aglomerado^=33 & aglomerado^=6 & aglomerado^= 17 & aglomerado^=30 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end; 
if period="1993_3" then do; 
if aglomerado^=32 & aglomerado^=33 & aglomerado^=6 & aglomerado^= 17 & aglomerado^=30 
& aglomerado^=13 then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end; 
if period="1994_1" | period="1994_3" then do; 
if aglomerado^=32 & aglomerado^=33 & aglomerado^=6 & aglomerado^= 17 & aglomerado^=30 
& aglomerado^=13 & aglomerado^=29 & aglomerado^=4 & aglomerado^=5 & aglomerado^=10  then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2; 
end; 
else tag2=tag;
end;
if labour_market_state=2 & (tag2=3) then labour_market_state=3; 
run; 

/* **************************Before 1990, we have for some agglomerations the User Base (BU), for others the more complete Work Base 
		(Base de Trabajo, BT). We import and format here the old user bases. *********************************** */
/*1974*/
PROC IMPORT OUT=leo._01_USU_1974_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1974_USU_okt\BU01374\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_USU_1974_okt; 
set leo._01_USU_1974_okt; 
run;  
/*1981*/

PROC IMPORT OUT=leo._01_USU_1981_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1981_USU_okt\BU01381\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_USU_1981_okt; 
set leo._01_USU_1981_okt; 
run;  

/*1989*/

PROC IMPORT OUT=leo._01_usu_1989_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1989_BTRAB_okt\BU01389\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_usu_1989_okt; 
set leo._01_usu_1989_okt; 
run;  
/*1988*/
   
PROC IMPORT OUT=leo._02_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu02190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._03_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu03190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._04_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu04190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._07_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu07190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._10_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu10190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._12_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu12190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu13190\PERSONAS"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._17_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu17190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._19_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu19190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu20190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._22_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu22190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._23_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu23190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._26_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu26190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._27_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu27190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu29190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._30_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu30190\PERSO_US"
            DBMS=dbf REPLACE;
RUN;/*
PROC IMPORT OUT=leo._32_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu32190\PER_CAP"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._33_usu_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_may\bu33190\PER_PAR"
            DBMS=dbf REPLACE;
RUN;
 */

data leo._04_usu_1990_may; 
set leo._04_usu_1990_may; 
onda2= put(onda ,$1.);
drop onda; 
run; 
data leo._04_usu_1990_may; 
set leo._04_usu_1990_may; 
rename onda2=onda; 
run; 
data leo._13_usu_1990_may; 
set leo._13_usu_1990_may; 
onda2= put(onda ,$1.);
drop onda; 
run; 
data leo._13_usu_1990_may; 
set leo._13_usu_1990_may; 
rename onda2=onda; 
run; 
data leo.eph_usu_1990_may; 
set leo._02_usu_1990_may leo._03_usu_1990_may leo._04_usu_1990_may leo._07_usu_1990_may
 leo._12_usu_1990_may leo._10_usu_1990_may  leo._13_usu_1990_may  leo._22_usu_1990_may
 leo._17_usu_1990_may leo._19_usu_1990_may leo._23_usu_1990_may leo._20_usu_1990_may
 leo._26_usu_1990_may  leo._27_usu_1990_may leo._29_usu_1990_may leo._30_usu_1990_may; 
run; 


   
PROC IMPORT OUT=leo._17_usu_1990_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_okt\bu17390\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._20_usu_1990_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_okt\bu20390\PERSO_US"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._29_usu_1990_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_usu_okt\bu29390\PERSO_US"
            DBMS=dbf REPLACE;
RUN;

data leo.eph_usu_1990_okt; 
set  leo._17_usu_1990_okt leo._20_usu_1990_okt leo._29_usu_1990_okt ; 
run; 
data leo.eph_usu_1990; 
set leo.eph_usu_1990_may leo.eph_usu_1990_okt; 
run; 
DATA leo.eph_user_base_74_90; 
set leo.eph_usu_1990 leo.eph_usu_1989_okt leo.eph_usu_1981_okt leo.eph_usu_1974_okt; 
run; 
data leo.eph_user_base_74_90; 
length agegroup_ext $7.; 
length contributes $12.; 
set leo.eph_user_base_74_90;

length student $14.; 
length marital_status $32.; 
ageconti=edad*1;
if ageconti=99 then delete; /*This takes out from the base respondents who do not give their age.*/
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
if (ageconti>64) then agegroup=300;

if (ageconti>0 and ageconti<5 or ageconti=-1) then agegroup_ext=0;
if (ageconti>4 and ageconti<10) then agegroup_ext=5;
if (ageconti>9 and ageconti<15) then agegroup_ext=10;
if (ageconti>14 and ageconti<20) then agegroup_ext=15;
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
if (ageconti>94 and ageconti=<98) then agegroup_ext=95;

if civil=1 then marital_status=5; 
if civil=2 then marital_status=1; 
if civil=3 then marital_status=2; 
if civil=4 then marital_status=3; 
if civil=5 then marital_status=4;


if inactivo=3 then student="True"; 
if inactivo^=3 then student="False"; 
/*As we explain in Appendix H.1. of the PhD thesis, we have a problem for identifying formal wage-earners in the earlier user bases. 
		For a legalistic definition, we only have the benef variable that states whether a wage-earner gets benefits attached to his job 
		(paid holidays, retirement coverage, health coverage, severance pay...). The values of this variable are:
		"1- Only one benefit and 13th month and holidays" "2- Combinations with severance pay"  "3- Combinations without severance pay"
		"4- All benefits" and "5- No benefits". This variable does not let us directly know whether the respondent contributes to retirement.
		For reasons explained in detail in Appendix H.1., we assume values 1 and 5 correspond to informal labour, and 2, 3 and 4 to formal
		dependent labour. As we will show further down, this lets us have a coherent evolution of formal labour in the 1974-1990 period.*/
if benef=2 | benef=3 | benef=4 then contributes="True"; 
else contributes="False"; 
if missing(benef) then contributes="False"; 


if estado=1 & contributes="False" then labour_market_state=3; 
if estado=1 & contributes="True" then labour_market_state=1; 
if estado=3 or estado=0 or missing(estado) then labour_market_state=5; 
if estado=2 then labour_market_state=4; 

 if anio=90 & onda="1" then period="1990_1";
 if anio=90 & onda="3" then period="1990_3";
 if ano="90" & onda="3" then period="1990_3";
 if ano="90" & onda="1" then period="1990_1";
 if ano="89" & onda="3" then period="1989_3";
 if ano="89" & onda="1" then period="1989_1";
 if ano="88" & onda="3" then period="1988_3";
 if ano="88" & onda="1" then period="1988_1";
 if ano="87" & onda="3" then period="1987_3";
 if ano="87" & onda="1" then period="1987_1";
 if ano="86" & onda="3" then period="1986_3";
 if ano="86" & onda="1" then period="1986_1";
 if ano="85" & onda="3" then period="1985_3";
 if ano="82" & onda="3" then period="1982_3";
 if ano="81" & onda="3" then period="1981_3";
 if ano="80" & onda="3" then period="1980_3";
 if ano="74" & onda="3" then period="1974_3";
run; 
%macro indep_endo_bua(indata,outdata);
data indep_workers_true; 
set &indata.; 
where categoria=1 | categoria=2; 
run; 
data indep_workers_false; 
set &indata.; 
where categoria^=1 & categoria^=2; 
run; 
data indep_workers_true; 
length qualif_indep $32.; 
set indep_workers_true; 
/*We consider independents with low qualification as informal, the others are of the formal sector*/
if  tarea=11 | tarea=21 | tarea=31 | tarea=41 |tarea=12 | tarea=22 | tarea=32 | tarea=42
then qualif_indep="Qualif" ;
else qualif_indep="Non_qualif"; 
run; 
data indep_workers_true; 
set indep_workers_true; 
/*Independent workers of the public sector, or that have 6 or more employees, are considered as formal*/
if rama=16 then qualif_indep="Qualif"; 
if tamano=3|tamano=4|tamano=5|tamano=6 then qualif_indep="Qualif"; 
run; 
data indep_workers_false; 
length qualif_indep $32.; 
set indep_workers_false; 
qualif_indep="Non_indep"; 
run; 
data &outdata.; 
set indep_workers_true indep_workers_false; 
if qualif_indep="Qualif" then labour_market_state=2; 
if qualif_indep="Qualif" then contributes="True"; 
run; 


%mend; 

%indep_endo_bua(leo.eph_user_base_74_90,leo.eph_formatted_user_base_74_90);

/*For education level, we use variable nivel.*/
data leo.eph_formatted_user_base_74_90; 
set leo.eph_formatted_user_base_74_90; 
if missing(agegroup) then delete; 

if nivel=10 | nivel=11 | nivel=12| nivel=22 | nivel=42 |nivel=99 |missing(nivel) then for2=1;
if nivel=21 | nivel=41 | nivel=32 then for2=2; 
if nivel=31 then for2=3; 
run; 
/*
proc freq data=leo.eph_formatted_user_base_74_90; 
where ageconti>15; 
table nivel; run; 
proc freq data=leo.eph_formatted_user_base_74_90; 
where ageconti>15; 
table  for2; 
ruN; 

proc freq data=leo.eph_formatted_user_base_74_90; 
table labour_market_state; 
run; 
proc freq data=leo.eph_data_usu_74_90; 
table labour_market_state; 
run; 
*/

/******* Now we import the work bases (base de trabajo) released before 1990********** */

PROC IMPORT OUT=leo._01_btrab_1990_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_BTRAB_MAY\DEM01190\PERS_TOT"
            DBMS=dbf REPLACE;
RUN;

data leo._01_btrab_1990_may; 
set leo._01_btrab_1990_may; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo._01_btrab_1990_may; 
set leo._01_btrab_1990_may; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
data leo.eph_btrab_1990_may; 
set leo._01_btrab_1990_may ;
run; 

PROC IMPORT OUT=leo._01_btrab_1990_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_BTRAB_okt\DEM01390\PERS_TOT"
            DBMS=dbf REPLACE;
RUN;
PROC IMPORT OUT=leo._13_btrab_1990_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1990_BTRAB_okt\DEM13390\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo._01_btrab_1990_okt; 
set leo._01_btrab_1990_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo._01_btrab_1990_okt; 
set leo._01_btrab_1990_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
data leo.eph_btrab_1990_okt; 
set leo._01_btrab_1990_okt ;
run; 
data leo._13_btrab_1990_okt; 
set leo._13_btrab_1990_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo._13_btrab_1990_okt; 
set leo._13_btrab_1990_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
data leo.eph_btrab_1990_okt; 
set leo._13_btrab_1990_okt ;
run; 
data leo.eph_btrab_1990_okt; 
set leo._01_btrab_1990_okt leo._13_btrab_1990_okt ; 
run;  

/* 1974 - 1989:  Only Greater Buenos Aires*/

/*1989*/
PROC IMPORT OUT=leo._01_btrab_1989_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1989_BTRAB_MAY\DEM01189\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1989_may; 
set leo._01_btrab_1989_may;
run; 

data leo.eph_btrab_1989_may; 
set leo.eph_btrab_1989_may; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1989_may; 
set leo.eph_btrab_1989_may; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1989_may; run;
/*1988*/

PROC IMPORT OUT=leo._01_btrab_1988_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1988_BTRAB_MAY\DEM01188\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1988_may; 
set leo._01_btrab_1988_may;
run; 

data leo.eph_btrab_1988_may; 
set leo.eph_btrab_1988_may; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1988_may; 
set leo.eph_btrab_1988_may; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1988_may; run;
PROC IMPORT OUT=leo._01_btrab_1988_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1988_okt\DEM01388\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1988_okt; 
set leo._01_btrab_1988_okt; 
run;  

data leo.eph_btrab_1988_okt; 
set leo.eph_btrab_1988_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1988_okt; 
set leo.eph_btrab_1988_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1988_okt; run;
/*1987*/

PROC IMPORT OUT=leo._01_btrab_1987_may
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1987_BTRAB_MAY\DEM01187\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1987_may; 
set leo._01_btrab_1987_may;
run; 

data leo.eph_btrab_1987_may; 
set leo.eph_btrab_1987_may; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1987_may; 
set leo.eph_btrab_1987_may; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1987_may; run;
PROC IMPORT OUT=leo._01_btrab_1987_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1987_BTRAB_okt\DEM01387\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1987_okt; 
set leo._01_btrab_1987_okt; 
run;   

data leo.eph_btrab_1987_okt; 
set leo.eph_btrab_1987_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1987_okt; 
set leo.eph_btrab_1987_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1987_okt; run;
/*1986*/

PROC IMPORT OUT=leo._01_btrab_1986_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1986_BTRAB_okt\DEM01386\PERS_TOT"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1986_okt; 
set leo._01_btrab_1986_okt; 
run;  

data leo.eph_btrab_1986_okt; 
set leo.eph_btrab_1986_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1986_okt; 
set leo.eph_btrab_1986_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1986_okt; run;
/*1985*/

PROC IMPORT OUT=leo._01_btrab_1985_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1985_BTRAB_okt\DEM01385\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1985_okt; 
set leo._01_btrab_1985_okt; 
run;  

data leo.eph_btrab_1985_okt; 
set leo.eph_btrab_1985_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1985_okt; 
set leo.eph_btrab_1985_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1985_okt; run;
/*1982*/

PROC IMPORT OUT=leo._01_btrab_1982_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1982_BTRAB_okt\DEM01382\BTPER"
            DBMS=dbf REPLACE;
RUN; 
data leo.eph_btrab_1982_okt; 
set leo._01_btrab_1982_okt; 
run;  

data leo.eph_btrab_1982_okt; 
set leo.eph_btrab_1982_okt; 
onda2= put(onda ,$1.);
if p20="***" then p20="99"; 
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1982_okt; 
set leo.eph_btrab_1982_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1982_okt; run;
 

/*1980*/

PROC IMPORT OUT=leo._01_btrab_1980_okt
            DATAFILE="H:\Leonardo_orléans\EPH_base\Bases usuario y trabajo antes de 1995\EPH_1980_BTRAB_okt\DEM01380\BTPER"
            DBMS=dbf REPLACE;
RUN;
data leo.eph_btrab_1980_okt; 
set leo._01_btrab_1980_okt; 
run;  

data leo.eph_btrab_1980_okt; 
set leo.eph_btrab_1980_okt; 
onda2= put(onda ,$1.);
p20b= p20*1; 
p41b= p41*1; 
drop p20 p41 onda; 
run; 
data leo.eph_btrab_1980_okt; 
set leo.eph_btrab_1980_okt; 
rename p20b=p20; 
rename p41b=p41; 
rename onda2=onda; 
run;  
proc contents data=leo.eph_btrab_1980_okt; run;
 

DATA leo.eph_work_base_80_90; 
set leo.eph_btrab_1990_may leo.eph_btrab_1990_okt 
leo.eph_btrab_1989_may
leo.eph_btrab_1988_may leo.eph_btrab_1988_okt 
leo.eph_btrab_1987_may leo.eph_btrab_1987_okt 
leo.eph_btrab_1986_okt leo.eph_btrab_1985_okt 
leo.eph_btrab_1982_okt leo.eph_btrab_1980_okt; 
run; 

data leo.eph_work_base_80_90; 
length student $14.; 
length contributes $12.; 
set leo.eph_work_base_80_90;
ageconti=h12*1; 
if ageconti=99 then delete; /*This takes out from the base respondents who do not give their age.*/
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
if (ageconti>64) then agegroup=300;

if (ageconti>0 and ageconti<5 or ageconti=-1) then agegroup_ext=0;
if (ageconti>4 and ageconti<10) then agegroup_ext=5;
if (ageconti>9 and ageconti<15) then agegroup_ext=10;
if (ageconti>14 and ageconti<20) then agegroup_ext=15;
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
if (ageconti>94 and ageconti=<98) then agegroup_ext=95;



/*Reminder for marital status: 1, common_law union; 2, married; 3, divorced; 4, widowed; 5, single.*/
if h14=1 then marital_status=5; 
if h14=2 then marital_status=1; 
if h14=3 then marital_status=2; 
if h14=4 then marital_status=3; 
if h14=5 then marital_status=4; 

if p11=3 then student="True"; 
if p11^=3 then student="False"; 
if p23=2 | p23=3 | p23=6 | p23=7 | p23=10| p23=11| p23=14| p23=15| p23=18| p23=19| p23=22| p23=23
| p23=26| p23=27| p23=30| p23=31| p23=34| p23=35| p23=38| p23=39| p23=42| p23=43| p23=46| p23=47| p23=50
| p23=51| p23=54| p23=55| p23=58| p23=59| p23=62| p23=63 then contributes="True"; 
else contributes="False"; 
if missing(p23) then contributes="False"; 
/*Reminder for labour-market state. 1, formal wage-earner; 2, independent worker of the formal sector; 3, informal worker; 4, unemployed; 
		5, inactive.*/
if estado=1 & contributes="False" then labour_market_state=3; 
if estado=1 & contributes="True" then labour_market_state=1; 
if estado=3 or estado=0 or missing(estado) then labour_market_state=5; 
if estado=2 then labour_market_state=4; 


 if ano=90 & onda=3 then period="1990_3";
 if ano=90 & onda=1 then period="1990_1";
 if ano=89 & onda=3 then period="1989_3";
 if ano=89 & onda=1 then period="1989_1";
 if ano=88 & onda=3 then period="1988_3";
 if ano=88 & onda=1 then period="1988_1";
 if ano=87 & onda=3 then period="1987_3";
 if ano=87 & onda=1 then period="1987_1";
 if ano=86 & onda=3 then period="1986_3";
 if ano=86 & onda=1 then period="1986_1";
 if ano=85 & onda=3 then period="1985_3";
 if ano=85 & onda=1 then period="1985_1";
 if ano=84 & onda=3 then period="1984_3";
 if ano=84 & onda=1 then period="1984_1";
 if ano=83 & onda=3 then period="1983_3";
 if ano=83 & onda=1 then period="1983_1";
 if ano=82 & onda=3 then period="1982_3";
 if ano=81 & onda=3 then period="1981_3";
 if ano=80 & onda=3 then period="1980_3";
 /*Character version of the position's qualification variable*/
p20_c= put(p20, $12.);
run; 
%macro indep_endo_work_base_80_90(indata,outdata);
/*On prend ici les travailleurs peu qualifiés, on les considère comme non cotisants, les autres étant cotisants*/

data indep_workers_true; 
set &indata.; 
where p17=1 | p17=2; 
run; 
data indep_workers_false; 
set &indata.; 
where p17^=1 & p17^=2; 
run; 
data indep_workers_true; 
length qualif_indep $32.; 
length last_string $1.; 
set indep_workers_true; 
last_string=substr(p20_c,12,1);
/*Only independent workers with the highest qualifications are considered formal*/
if last_string="1"| last_string="2" then qualif_indep="Qualif";
else qualif_indep="Non_qualif"; 
/*Independent workers of the public sector, or with 6 or more employees are considered formal-*/
if p18b=1 then qualif_indep="Qualif"; 
if p19=3|p19=4|p19=5|p19=6|p19=7|p19=8 then qualif_indep="Qualif"; 
if p19b=2 then qualif_indep="Qualif"; 
drop last_string;
run; 
data indep_workers_false; 
length qualif_indep $32.; 
set indep_workers_false; 
qualif_indep="Non_indep"; 
run; 
data &outdata.; 
set indep_workers_true indep_workers_false; 
if qualif_indep="Qualif" then labour_market_state=2; 
if qualif_indep="Qualif" then contributes="True"; 
run; 


/*On trouve des chiffres réalistes, avec une plus grande cotisation des patrons que des travailleurs indépendants*/

%mend; 

%indep_endo_work_base_80_90(leo.eph_work_base_80_90,leo.eph_formatted_work_base_80_90);
data leo.eph_formatted_work_base_80_90; 
set leo.eph_formatted_work_base_80_90; 
/*Education level*/
if p56="0" | p56="1"| p56="9" then for2=1; 
if p58=1 then do; 
if p56="7" | p56="8" then for2=3; 
if p56="2" | p56="3" | p56="4" | p56="5" | p56="6" then for2=2; 
end; 
if p58=2 then do; 
if p56="7" | p56="8" then for2=2; 
if p56="2" | p56="3" | p56="4" | p56="5" | p56="6" then for2=1; 
end; 
if p56^="0"& p56^="1" & p56^="2" & p56^="3" & p56^="4" & p56^="5" & p56^="6" & p56^="7" & p56^="8" & p56^="9" then for2=1; 
if missing(agegroup) then delete; 
run; 

/*We correct the pre-1990 bases, to correct the problem with the CO-EPH occupation classifier where some qualified workers (last digit of 2)
		would be considered as formal independent workers with the CNO, and others as informal (following our methodology explained 
		earlier in this data file).*/
data leo.eph_formatted_user_base_74_90;
length last_string $2.;  
set leo.eph_formatted_user_base_74_90; 
tarea2= put(tarea,$2.);
last_string=substr(tarea2,2); 
if last_string="1" then tag=1;
if last_string="2" then tag=2; 
if last_string^="1" & last_string^="2" then tag=3;
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2;  
if labour_market_state=2 & tag2=3 then labour_market_state=3; 
run;
data leo.eph_formatted_work_base_80_90;
length last_string $2.;  
set leo.eph_formatted_work_base_80_90; 
tarea2= put(tarea,$2.);
last_string=substr(tarea2,2); 
if last_string="1" then tag=1;
if last_string="2" then tag=2; 
if last_string^="1" & last_string^="2" then tag=3;
if period^="1982_3" then do; 
if tag=2 & (for2=1| missing(for2))  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & for2>1 then tag2=2;  
end; 
if period="1982_3" then do; 
if tag=2 & (p55^=2| missing(p55)| p58=2)  then tag2=3; 
if tag=3 then tag2=3; 
if tag=1 then tag2=1; 
if tag=2 & p55=2 & p58=1 then tag2=2;  
if p17=2 & tag=2 then tag2=3; 
end; 

if labour_market_state=2 & tag2=3 then labour_market_state=3; 

run; 

/*******Now we merge the pre-1990 bases together, to then compute the aggregate proportions of (among others) formal workers over the 
		1974-1990 period and across the user and work bases.********************/


data simple_work_base; 
set leo.eph_formatted_work_base_80_90; 
keep ageconti agegroup h13 period estado labour_market_state h14 pondera p17 tarea for2 P55; 
run; 
data simple_work_base; 
length base $32.; 
set simple_work_base; 
base="work"; 
run; 

data simple_user_base; 
set leo.eph_formatted_user_base_74_90; 
keep ageconti agegroup period labour_market_state estado pondera civil sexo categoria tarea for2 p55; 
run; 
data simple_user_base; 
length base $32.; 
set simple_user_base; 
rename sexo=h13; 
rename civil=h14; 
rename categoria=p17;
base="user"; 
run; 

data leo.eph_compatible_datasets_74_90; 
set simple_work_base simple_user_base; 
run; 
proc freq data=leo.eph_compatible_datasets_74_90; 
table labour_market_state*period; 
run; 

/*************************************With this, we have formatted the datasets before 2003. A last step before computing the corresponding
		macro-level calibration is to compute the structural coefficients with which we correct exogenous mean wage variables (the RIPTE 
		and other wage indexes computed on section 1.3.2. of my PhD Thesis) so as to get mean wages by gender.*************************/	
data leo.eph_bua_format_95_03; 
set leo.eph_bua_format_95_03; 
/*We compute total labour income (ITL). For that, we take all income (p47t) and take out non labour sources of income (p48_1 to p48_9).*/
not_itl_1=p48_1; 
if missing(p48_1) | p48_1<=0 then not_itl_1=0; 
not_itl_2=p48_2; 
if missing(p48_2) | p48_2<=0 then not_itl_2=0; 
not_itl_3=p48_3; 
if missing(p48_3) | p48_3<=0 then not_itl_3=0; 
not_itl_4=p48_4; 
if missing(p48_4) | p48_4<=0 then not_itl_4=0; 
not_itl_5=p48_5; 
if missing(p48_5) | p48_5<=0 then not_itl_5=0; 
not_itl_6=p48_6; 
if missing(p48_6) | p48_6<=0 then not_itl_6=0; 
not_itl_7=p48_7; 
if missing(p48_7) | p48_7<=0 then not_itl_7=0; 
not_itl_8=p48_8; 
if missing(p48_8) | p48_8<=0 then not_itl_8=0; 
not_itl_9=p48_9; 
if missing(p48_9) | p48_9<=0 then not_itl_9=0; 
not_itl= not_itl_1+ not_itl_2+ not_itl_3+ not_itl_4+ not_itl_5+ not_itl_6+ not_itl_7+ not_itl_8+ not_itl_9; 
run; 
data leo.eph_bua_format_95_03; 
set leo.eph_bua_format_95_03; 
ITL= p47t - not_itl; 
run; 
data leo.eph_bua_format_95_03; 
set leo.eph_bua_format_95_03; 
if ITL<0 then ITL=0; 
run; 
proc freq data=leo.eph_bua_format_95_03; 
where labour_market_state=1 | labour_market_state=2 | labour_market_state=3; 
table not_itl;
table ITL;  
run; 

proc means data=leo.eph_bua_format_95_03; 
where labour_market_state=1 | labour_market_state=2 | labour_market_state=3; 
var ITL; 
run; 
data leo.eph_bua_format_95_03; 
set leo.eph_bua_format_95_03; 
/*We add age limits, on line with the progressive increase of retirement age over the 1995-2003 period.*/
if (period="2001_1" |  period="2001_3" |  period="2002_1" |  period="2002_3" |  period="2003_1") & h13=1 then agelim=65; 
if h13=1 & (p17=1 | p17=2) then agelim=65; 
if (period="2001_1" |  period="2001_3" |  period="2002_1" |  period="2002_3" |  period="2003_1") & h13=2 then agelim=60;
if h13=2 & (p17=1 | p17=2) then agelim=60;  
if (period="2000_3" | period="2000_1" | period="1999_1" | period="1999_3" | period="1998_3" |  period="1998_1") & h13=1 & (p17^=1 & p17^=2)  then agelim=64; 
if (period="2000_3" | period="2000_1" | period="1999_1" | period="1999_3" | period="1998_3" |  period="1998_1") & h13=2 & (p17^=1 & p17^=2)  then agelim=59; 
if (period="1997_3" | period="1997_1" | period="1996_1" | period="1996_3") & h13=1 & (p17^=1 & p17^=2)  then agelim=63; 
if (period="1997_3" | period="1997_1" | period="1996_1" | period="1996_3") & h13=2 & (p17^=1 & p17^=2)  then agelim=58; 
if (period="1995_3" | period="1995_1") & h13=1 & (p17^=1 & p17^=2)  then agelim=62; 
if (period="1995_3" | period="1995_1") & h13=2 & (p17^=1 & p17^=2)  then agelim=57; 
run; 

%macro ITL_centiles_past(indata,tvar,t);
proc univariate data=&indata. noprint;
where labour_market_state=1 & &tvar.="&t.";
   var ITL;
   output out=leo.formal_we_&t. pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
where labour_market_state=2 & &tvar.="&t.";
   var ITL;
   output out=leo.formal_ind_&t. pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
where labour_market_state=3 & &tvar.="&t.";
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
where &tvar.="&t."; 
run; 
data &indata._&t.; 
merge &indata._&t. income_centiles_&t.; 
by labour_market_state; 
run; 
%mend; 
%macro mean_var_past(indata,varname,lmsvar,periodname,period,gender); 
options nofmterr;

	/*We only took men and women of working age, but for the sake of consistency with our study of labour-market behaviour until age 70, 
			introduced later, it might be better to compute these coefficients among people aged 16 to 69 instead. This is left for future 
			work*/
options nofmterr; 
proc means data=&indata. noprint; 
	weight pondera; 
	where (&periodname.="&period." & ageconti>15 & ((h13=1 & ageconti<agelim)) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3) & &varname. >cent2 & &varname.<cent98); 
		var &varname.; 
	output out=mean_&varname._men  mean=mean_&varname._men;
run;
proc means data=&indata. noprint; 
	weight pondera; 
	where (&periodname.="&period." & ageconti>15 & ((h13=2 & ageconti<agelim)) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3) & &varname. >cent2 & &varname.<cent98); 
		var &varname.; 
	output out=mean_&varname._women  mean=mean_&varname._women;
run;
proc means data=&indata. noprint; 
weight pondera; 
	where (&periodname.="&period." & ageconti>15 & ((h13=1 & ageconti<agelim)|(h13=2 & ageconti<agelim)) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3) & &varname. >cent2 & &varname.<cent98); 
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
		&periodname.="&period."; 
		perc_&varname._men=mean_&varname._men/mean_&varname._all; 
		perc_&varname._women=mean_&varname._women/mean_&varname._all; 
run; 
 /*Then we take into account the percentage of men / women among all workers of working age*/
proc freq data=&indata. noprint; 
	weight pondera; 
	where (&periodname.="&period." & ageconti>15 & ((h13=1 & ageconti<agelim)| (h13=2 & ageconti<agelim))) & (&lmsvar.=1 | &lmsvar.=2 | &lmsvar.=3); 
		table h13 /outpct out=workers_by_gender; 
run; 

data working_men; 
set workers_by_gender; 
	where h13=1; 
		rename percent=percent_male_workers; 
		&periodname.="&period."; 
	drop h13 count; 
run; 

data working_women; 
set workers_by_gender;
	where h13=2; 
		rename percent=percent_female_workers; 
		&periodname.="&period."; 
	drop h13 count; 
run; 

data leo.&varname._mean_&period.; 
merge leo.&varname._mean_&period. working_men working_women; 
	by &periodname.; 
run; 

%mend;
%ITL_centiles_past(leo.eph_bua_format_95_03,period,2003_1);
%mean_var_past(leo.eph_bua_format_95_03_2003_1,ITL,labour_market_state,period,2003_1,h13);

%ITL_centiles_past(leo.eph_bua_format_95_03,period,2002_3);
%mean_var_past(leo.eph_bua_format_95_03_2002_3,ITL,labour_market_state,period,2002_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,2002_1);
%mean_var_past(leo.eph_bua_format_95_03_2002_1,ITL,labour_market_state,period,2002_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,2001_3);
%mean_var_past(leo.eph_bua_format_95_03_2001_3,ITL,labour_market_state,period,2001_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,2001_1);
%mean_var_past(leo.eph_bua_format_95_03_2001_1,ITL,labour_market_state,period,2001_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,2000_3);
%mean_var_past(leo.eph_bua_format_95_03_2000_3,ITL,labour_market_state,period,2000_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,2000_1);
%mean_var_past(leo.eph_bua_format_95_03_2000_1,ITL,labour_market_state,period,2000_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1999_3);
%mean_var_past(leo.eph_bua_format_95_03_1999_3,ITL,labour_market_state,period,1999_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1999_1);
%mean_var_past(leo.eph_bua_format_95_03_1999_1,ITL,labour_market_state,period,1999_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1998_3);
%mean_var_past(leo.eph_bua_format_95_03_1998_3,ITL,labour_market_state,period,1998_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1998_1);
%mean_var_past(leo.eph_bua_format_95_03_1998_1,ITL,labour_market_state,period,1998_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1997_3);
%mean_var_past(leo.eph_bua_format_95_03_1997_3,ITL,labour_market_state,period,1997_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1997_1);
%mean_var_past(leo.eph_bua_format_95_03_1997_1,ITL,labour_market_state,period,1997_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1996_3);
%mean_var_past(leo.eph_bua_format_95_03_1996_3,ITL,labour_market_state,period,1996_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1996_1);
%mean_var_past(leo.eph_bua_format_95_03_1996_1,ITL,labour_market_state,period,1996_1,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1995_3);
%mean_var_past(leo.eph_bua_format_95_03_1995_3,ITL,labour_market_state,period,1995_3,h13);
%ITL_centiles_past(leo.eph_bua_format_95_03,period,1995_1);
%mean_var_past(leo.eph_bua_format_95_03_1995_1,ITL,labour_market_state,period,1995_1,h13);


data leo.itl_mean_95_03; 
set leo.itl_mean_2003_1 
leo.itl_mean_2002_3
leo.itl_mean_2002_1
leo.itl_mean_2001_3
leo.itl_mean_2001_1
leo.itl_mean_2000_3
leo.itl_mean_2000_1
leo.itl_mean_1999_3
leo.itl_mean_1999_1
leo.itl_mean_1998_3
leo.itl_mean_1998_1
leo.itl_mean_1997_3
leo.itl_mean_1997_1
leo.itl_mean_1996_3
leo.itl_mean_1996_1
leo.itl_mean_1995_3
leo.itl_mean_1995_1; run; 

data leo.itl_mean_95_03; 
set leo.itl_mean_95_03; 
drop _type_ _freq_; 
run; 
data leo.itl_mean_95_03; 
set leo.itl_mean_95_03; 
		coefficient_men=mean_ITL_men/mean_ITL_all; 
		coefficient_women=mean_ITL_women/mean_ITL_all; 
run; 

/*We use these coefficients to correct past mean wage variables and get approximations of mean wages by gender.*/
data leo.structure_coefficients_95_03; 
set leo.itl_mean_95_03; 
keep coefficient_men coefficient_women period; 
run;

proc sort data=leo.structure_coefficients_95_03; 
by period; 
run;
proc export data=leo.structure_coefficients_95_03 
outfile="C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\globals\Structure_coefficients\structure_coefficients_95_03.csv"
dbms=csv replace; 
run; 

proc sort data=leo.eph_bua_format_95_03; 
by period; 
run; 
data leo.eph_bua_format_95_03; 
merge leo.eph_bua_format_95_03 leo.structure_coefficients_95_03; 
by period; 
run; 



/*We now compute the gender coefficients for the period 1991-1994.*/
data leo.eph_work_base_formatted_91_94;
set leo.eph_work_base_formatted_91_94; 
ITL=p21;
if ITL<0 then ITL=0;  
run; 
proc freq data=leo.eph_work_base_formatted_91_94; ; 
where labour_market_state=1 | labour_market_state=2 | labour_market_state=3; 
table ITL;  
run; 

data eph_work_base_91_94; 
set leo.eph_work_base_formatted_91_94; 
if h13=1 then agelim=60; 
if h13=2 then agelim=55; 
run; 


%ITL_centiles_past(eph_work_base_91_94,period,1994_3);
%mean_var_past(eph_work_base_91_94_1994_3,ITL,labour_market_state,period,1994_3,h13);
%ITL_centiles_past(eph_work_base_91_94,period,1994_1);
%mean_var_past(eph_work_base_91_94_1994_1,ITL,labour_market_state,period,1994_1,h13);

%ITL_centiles_past(eph_work_base_91_94,period,1993_3);
%mean_var_past(eph_work_base_91_94_1993_3,ITL,labour_market_state,period,1993_3,h13);
%ITL_centiles_past(eph_work_base_91_94,period,1993_1);
%mean_var_past(eph_work_base_91_94_1993_1,ITL,labour_market_state,period,1993_1,h13);

%ITL_centiles_past(eph_work_base_91_94,period,1992_3);
%mean_var_past(eph_work_base_91_94_1992_3,ITL,labour_market_state,period,1992_3,h13);
%ITL_centiles_past(eph_work_base_91_94,period,1992_1);
%mean_var_past(eph_work_base_91_94_1992_1,ITL,labour_market_state,period,1992_1,h13);

%ITL_centiles_past(eph_work_base_91_94,period,1991_3);
%mean_var_past(eph_work_base_91_94_1991_3,ITL,labour_market_state,period,1991_3,h13);
%ITL_centiles_past(eph_work_base_91_94,period,1991_1);
%mean_var_past(eph_work_base_91_94_1991_1,ITL,labour_market_state,period,1991_1,h13);


data leo.itl_mean_91_94; 
set leo.itl_mean_1991_1
	leo.itl_mean_1991_3
	leo.itl_mean_1992_1
	leo.itl_mean_1992_3
	leo.itl_mean_1993_1
	leo.itl_mean_1993_3
	leo.itl_mean_1994_1
	leo.itl_mean_1994_3
; run; 

data leo.itl_mean_91_94; 
set leo.itl_mean_91_94; 
drop _type_ _freq_; 
run; 
data leo.itl_mean_91_94; 
set leo.itl_mean_91_94; 
		coefficient_men=mean_ITL_men/mean_ITL_all; 
		coefficient_women=mean_ITL_women/mean_ITL_all; 
run; 

/*We use these coefficients to correct past mean wage variables and get approximations of mean wages by gender.*/
data leo.structure_coefficients_91_94; 
set leo.itl_mean_91_94; 
keep coefficient_men coefficient_women period; 
run;

proc sort data=leo.structure_coefficients_91_94; 
by period; 
run;

proc export data=leo.structure_coefficients_91_94 
outfile="C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\globals\Structure_coefficients\structure_coefficients_91_94.csv"
dbms=csv replace; 
run; 

/*For periods before 1990, the user and work bases are not compatible because labour income is measured differently in those two bases 
		(the user base gives hourly labour income, while the work base gives the total monthly income). For periods where the two bases 
		are available, we will use the work base (basically for surveys carried out in 1990). 
This methodological difference across datasets does make mixing these measured labour income levels impossible. However, these coefficients
		we compute for correcting mean wages by gender are mean wages among men / women divided by the overall mean wage. The coefficients 
		are thus comparable, whether they are computed on the work or user base. This is why we still compute the coefficients on user bases
		for periods where there are no work bases available.*/
data leo.eph_formatted_work_base_80_90; 
set leo.eph_formatted_work_base_80_90; 
if h13=1 then agelim=60; 
if h13=2 then agelim=55; 
ITL=p21; 
run; 
data leo.eph_formatted_user_base_74_90; 
set leo.eph_formatted_user_base_74_90; 
if period="1989_3" | period="1990_1" | period="1990_3" then ITL= horastot*p47hor /7 * 30; 

if period="1981_3" then ITL= INGHORA; 
if period="1974_3" then iTL=p47hor; 
if period="1974_3" & missing(p47hor) then ITL= INGHORA; 
if sexo=1 then agelim=60; 
if sexo=2 then agelim=55; 
h13=sexo; 
run;
/*We need to temporarily shorten the datasets' name, else we exceed the 32 strings with macro mean_var_past and the code crashes.*/

data eph_user_base_74_90; 
set leo.eph_formatted_user_base_74_90; 
run; 
proc print data=eph_user_base_74_90 (obs=10); ruN; 
data eph_work_base_80_90;
 set leo.eph_formatted_work_base_80_90; 
run; 
proc print data=eph_work_base_80_90 (Obs=10); run; 
/*dm 'odsresults; clear'; 
dm 'clear log'; 
*/
%ITL_centiles_past(eph_work_base_80_90,period,1990_3);
%mean_var_past(eph_work_base_80_90_1990_3,ITL,labour_market_state,period,1990_3,h13);

%ITL_centiles_past(eph_work_base_80_90,period,1990_1);
%mean_var_past(eph_work_base_80_90_1990_1,ITL,labour_market_state,period,1990_1,h13);

%ITL_centiles_past(eph_user_base_74_90,period,1989_3);
%mean_var_past(eph_user_base_74_90_1989_3,ITL,labour_market_state,period,1989_3,sexo);

%ITL_centiles_past(eph_user_base_74_90,period,1981_3);
%mean_var_past(eph_user_base_74_90_1981_3,ITL,labour_market_state,period,1981_3,sexo);
proc print data=leo.itl_mean_1981_3; run; 
%ITL_centiles_past(eph_user_base_74_90,period,1974_3);
proc print data=eph_user_base_74_90_1974_3 (obs=10); 
where labour_market_state=1; 
run; 
%mean_var_past(eph_user_base_74_90_1974_3,ITL,labour_market_state,period,1974_3,sexo);
proc print data=leo.itl_mean_1974_3; run; 
proc freq data=eph_work_base_80_90; 
table period; ruN;
proc freq data=eph_user_base_74_90;
table period; 
ruN; 
%ITL_centiles_past(eph_work_base_80_90,period,1989_1);
%mean_var_past(eph_work_base_80_90_1989_1,ITL,labour_market_state,period,1989_1,h13);
proc print data=leo.itl_mean_1989_3; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1988_3);
%mean_var_past(eph_work_base_80_90_1988_3,ITL,labour_market_state,period,1988_3,h13);
proc print data=leo.itl_mean_1988_3; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1988_1);
%mean_var_past(eph_work_base_80_90_1988_1,ITL,labour_market_state,period,1988_1,h13);
proc print data=leo.itl_mean_1988_1; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1987_3);
%mean_var_past(eph_work_base_80_90_1987_3,ITL,labour_market_state,period,1987_3,h13);
proc print data=leo.itl_mean_1987_3; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1987_1);
%mean_var_past(eph_work_base_80_90_1987_1,ITL,labour_market_state,period,1987_1,h13);
proc print data=leo.itl_mean_1987_1; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1986_3);
%mean_var_past(eph_work_base_80_90_1986_3,ITL,labour_market_state,period,1986_3,h13);
proc print data=leo.itl_mean_1986_3; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1985_3);
%mean_var_past(eph_work_base_80_90_1985_3,ITL,labour_market_state,period,1985_3,h13);
proc print data=leo.itl_mean_1985_3; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1982_3);
%mean_var_past(eph_work_base_80_90_1982_3,ITL,labour_market_state,period,1982_3,h13);
proc print data=leo.itl_mean_1982_3; run; 
%ITL_centiles_past(eph_work_base_80_90,period,1980_3);
%mean_var_past(eph_work_base_80_90_1980_3,ITL,labour_market_state,period,1980_3,h13);



proc print data=leo.itl_mean_1980_3; run; 

data leo.itl_mean_74_90; 
set leo.itl_mean_1990_3
leo.itl_mean_1990_1
leo.itl_mean_1989_3
leo.itl_mean_1989_1
leo.itl_mean_1988_3
leo.itl_mean_1988_1
leo.itl_mean_1987_3
leo.itl_mean_1987_1
leo.itl_mean_1986_3
leo.itl_mean_1985_3
leo.itl_mean_1982_3
leo.itl_mean_1981_3
leo.itl_mean_1980_3
leo.itl_mean_1974_3; 
run; 
data leo.itl_mean_74_90; 
set leo.itl_mean_74_90; 
drop _type_ _freq_; 
run; 
proc print data=leo.itl_mean_74_90; run; 
data leo.itl_mean_74_90; 
set leo.itl_mean_74_90; 
		coefficient_men=mean_ITL_men/mean_ITL_all; 
		coefficient_women=mean_ITL_women/mean_ITL_all; 
run; 
data leo.structure_coefficients_74_90; 
set leo.itl_mean_74_90; 
keep coefficient_men coefficient_women period; 
run;

proc export data=leo.structure_coefficients_74_90 
outfile="C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\LIAM2_commented_code\globals\Structure_coefficients\structure_coefficients_74_90.csv"
dbms=csv replace; 
run; 

/*It is then only needed to concatenate the exported structure coefficients excel files to input these coefficients into our 
		retrospective microsimulation module, as part of the module's global file (see the backwards microsimulation module folder).*/
