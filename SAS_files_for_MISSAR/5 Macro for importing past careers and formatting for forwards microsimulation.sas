 %macro prepare_prospective_simulations (library,year,quarter,short_period,long_period,lag_long_period,ten_years_lag_period,min_pension,seed);            
/*Run this code after you run the retrospective module.*/
/*We run the code first for the fourth quarter of 2014. We then replicate it for the second quarters of 2014 and 2015. */
%Macro M_Zero (ds);
     data &ds. (drop=_i);
          set &ds.;
          array A_VarNum[*] _NUMERIC_;     

          do _i=1 to dim( A_VarNum );
          If A_VarNum (_i)=. then A_VarNum (_i)=0;
     End;
   run;
%Mend;
%macro import_past_careers(library,year,quarter,period,first_period,seed); 
/*The earliest imported period in our retrospective simulations is 1001 (corresponds to the first quarter of 2015). Our main simulation uses as a starting dataset 
		the fourth quarter of 2014 (period 1002) wave of the EPHc, and thus the first period it imports from our retrospective module is 1003. It is thus perfectly 
		normal to have import errors for periods earlier than 1003. For the sake of robustness, we also carry out simulations with as starting datasets the second
		quarters of 2014 and 2015.  It is possible to use more recent waves as the starting period of the simulations, which is why we put in the macro periods
		going as early as 993 (first quarter of 2017). If you work with more recent periods, simply extend the macro accordingly. For instance, if your starting 
		period is the fourth quarter of 2017 (period 990), you must import csv files starting from period 991. 
		*/
proc import out=past_career_993 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_993.csv" dbms=csv replace; run;
proc import out=past_career_994 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_994.csv" dbms=csv replace; run;
proc import out=past_career_995 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_995.csv" dbms=csv replace; run;
proc import out=past_career_996 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_996.csv" dbms=csv replace; run;
proc import out=past_career_997 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_997.csv" dbms=csv replace; run;
proc import out=past_career_998 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_998.csv" dbms=csv replace; run;
proc import out=past_career_999 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_999.csv" dbms=csv replace; run;
proc import out=past_career_1000 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1000.csv" dbms=csv replace; run;
/**************************************************************************2015_T2*******************************************************************/
proc import out=past_career_1001 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1001.csv" dbms=csv replace; run;
proc import out=past_career_1002 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1002.csv" dbms=csv replace; run;
proc import out=past_career_1003 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1003.csv" dbms=csv replace; run;
proc import out=past_career_1004 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1004.csv" dbms=csv replace; run;
proc import out=past_career_1005 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1005.csv" dbms=csv replace; run;
proc import out=past_career_1006 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1006.csv" dbms=csv replace; run;
proc import out=past_career_1007 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1007.csv" dbms=csv replace; run;
proc import out=past_career_1008 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1008.csv" dbms=csv replace; run;
proc import out=past_career_1009 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1009.csv" dbms=csv replace; run;
proc import out=past_career_1010 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1010.csv" dbms=csv replace; run;
proc import out=past_career_1011 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1011.csv" dbms=csv replace; run;
proc import out=past_career_1012 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1012.csv" dbms=csv replace; run;
proc import out=past_career_1013 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1013.csv" dbms=csv replace; run;
proc import out=past_career_1014 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1014.csv" dbms=csv replace; run;
proc import out=past_career_1015 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1015.csv" dbms=csv replace; run;
proc import out=past_career_1016 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1016.csv" dbms=csv replace; run;
proc import out=past_career_1017 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1017.csv" dbms=csv replace; run;
proc import out=past_career_1018 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1018.csv" dbms=csv replace; run;
proc import out=past_career_1019 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1019.csv" dbms=csv replace; run;
proc import out=past_career_1020 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1020.csv" dbms=csv replace; run;
proc import out=past_career_1021 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1021.csv" dbms=csv replace; run;
proc import out=past_career_1022 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1022.csv" dbms=csv replace; run;
proc import out=past_career_1023 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1023.csv" dbms=csv replace; run;
proc import out=past_career_1024 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1024.csv" dbms=csv replace; run;
proc import out=past_career_1025 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1025.csv" dbms=csv replace; run;
proc import out=past_career_1026 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1026.csv" dbms=csv replace; run;
proc import out=past_career_1027 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1027.csv" dbms=csv replace; run;
proc import out=past_career_1028 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1028.csv" dbms=csv replace; run;
proc import out=past_career_1029 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1029.csv" dbms=csv replace; run;
proc import out=past_career_1030 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1030.csv" dbms=csv replace; run;
proc import out=past_career_1031 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1031.csv" dbms=csv replace; run;
proc import out=past_career_1032 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1032.csv" dbms=csv replace; run;
proc import out=past_career_1033 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1033.csv" dbms=csv replace; run;
proc import out=past_career_1034 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1034.csv" dbms=csv replace; run;
proc import out=past_career_1035 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1035.csv" dbms=csv replace; run;
proc import out=past_career_1036 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1036.csv" dbms=csv replace; run;
proc import out=past_career_1037 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1037.csv" dbms=csv replace; run;
proc import out=past_career_1038 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1038.csv" dbms=csv replace; run;
proc import out=past_career_1039 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1039.csv" dbms=csv replace; run;
proc import out=past_career_1040 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1040.csv" dbms=csv replace; run;
proc import out=past_career_1041 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1041.csv" dbms=csv replace; run;
proc import out=past_career_1042 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1042.csv" dbms=csv replace; run;
proc import out=past_career_1043 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1043.csv" dbms=csv replace; run;
proc import out=past_career_1044 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1044.csv" dbms=csv replace; run;
proc import out=past_career_1045 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1045.csv" dbms=csv replace; run;
proc import out=past_career_1046 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1046.csv" dbms=csv replace; run;
proc import out=past_career_1047 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1047.csv" dbms=csv replace; run;
proc import out=past_career_1048 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1048.csv" dbms=csv replace; run;
proc import out=past_career_1049 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1049.csv" dbms=csv replace; run;
proc import out=past_career_1050 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1050.csv" dbms=csv replace; run;
proc import out=past_career_1051 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1051.csv" dbms=csv replace; run;
proc import out=past_career_1052 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1052.csv" dbms=csv replace; run;
proc import out=past_career_1053 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1053.csv" dbms=csv replace; run;
proc import out=past_career_1054 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1054.csv" dbms=csv replace; run;
proc import out=past_career_1055 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1055.csv" dbms=csv replace; run;
proc import out=past_career_1056 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1056.csv" dbms=csv replace; run;
proc import out=past_career_1057 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1057.csv" dbms=csv replace; run;
proc import out=past_career_1058 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1058.csv" dbms=csv replace; run;
proc import out=past_career_1059 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1059.csv" dbms=csv replace; run;
proc import out=past_career_1060 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1060.csv" dbms=csv replace; run;
proc import out=past_career_1061 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1061.csv" dbms=csv replace; run;
proc import out=past_career_1062 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1062.csv" dbms=csv replace; run;
proc import out=past_career_1063 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1063.csv" dbms=csv replace; run;
proc import out=past_career_1064 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1064.csv" dbms=csv replace; run;
proc import out=past_career_1065 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1065.csv" dbms=csv replace; run;
proc import out=past_career_1066 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1066.csv" dbms=csv replace; run;
proc import out=past_career_1067 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1067.csv" dbms=csv replace; run;
proc import out=past_career_1068 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1068.csv" dbms=csv replace; run;
proc import out=past_career_1069 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1069.csv" dbms=csv replace; run;
proc import out=past_career_1070 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1070.csv" dbms=csv replace; run;
proc import out=past_career_1071 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1071.csv" dbms=csv replace; run;
proc import out=past_career_1072 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1072.csv" dbms=csv replace; run;
proc import out=past_career_1073 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1073.csv" dbms=csv replace; run;
proc import out=past_career_1074 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1074.csv" dbms=csv replace; run;
proc import out=past_career_1075 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1075.csv" dbms=csv replace; run;
proc import out=past_career_1076 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1076.csv" dbms=csv replace; run;
proc import out=past_career_1077 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1077.csv" dbms=csv replace; run;
proc import out=past_career_1078 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1078.csv" dbms=csv replace; run;
proc import out=past_career_1079 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1079.csv" dbms=csv replace; run;
proc import out=past_career_1080 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1080.csv" dbms=csv replace; run;
proc import out=past_career_1081 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1081.csv" dbms=csv replace; run;
proc import out=past_career_1082 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1082.csv" dbms=csv replace; run;
proc import out=past_career_1083 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1083.csv" dbms=csv replace; run;
proc import out=past_career_1084 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1084.csv" dbms=csv replace; run;
proc import out=past_career_1085 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1085.csv" dbms=csv replace; run;
proc import out=past_career_1086 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1086.csv" dbms=csv replace; run;
proc import out=past_career_1087 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1087.csv" dbms=csv replace; run;
proc import out=past_career_1088 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1088.csv" dbms=csv replace; run;
proc import out=past_career_1089 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1089.csv" dbms=csv replace; run;
proc import out=past_career_1090 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1090.csv" dbms=csv replace; run;
proc import out=past_career_1091 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1091.csv" dbms=csv replace; run;
proc import out=past_career_1092 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1092.csv" dbms=csv replace; run;
proc import out=past_career_1093 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1093.csv" dbms=csv replace; run;
proc import out=past_career_1094 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1094.csv" dbms=csv replace; run;
proc import out=past_career_1095 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1095.csv" dbms=csv replace; run;
proc import out=past_career_1096 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1096.csv" dbms=csv replace; run;
proc import out=past_career_1097 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1097.csv" dbms=csv replace; run;
proc import out=past_career_1098 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1098.csv" dbms=csv replace; run;
proc import out=past_career_1099 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1099.csv" dbms=csv replace; run;
proc import out=past_career_1100 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1100.csv" dbms=csv replace; run;
proc import out=past_career_1101 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1101.csv" dbms=csv replace; run;
proc import out=past_career_1102 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1102.csv" dbms=csv replace; run;
proc import out=past_career_1103 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1103.csv" dbms=csv replace; run;
proc import out=past_career_1104 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1104.csv" dbms=csv replace; run;
proc import out=past_career_1105 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1105.csv" dbms=csv replace; run;
proc import out=past_career_1106 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1106.csv" dbms=csv replace; run;
proc import out=past_career_1107 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1107.csv" dbms=csv replace; run;
proc import out=past_career_1108 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1108.csv" dbms=csv replace; run;
proc import out=past_career_1109 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1109.csv" dbms=csv replace; run;
proc import out=past_career_1110 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1110.csv" dbms=csv replace; run;
proc import out=past_career_1111 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1111.csv" dbms=csv replace; run;
proc import out=past_career_1112 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1112.csv" dbms=csv replace; run;
proc import out=past_career_1113 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1113.csv" dbms=csv replace; run;
proc import out=past_career_1114 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1114.csv" dbms=csv replace; run;
proc import out=past_career_1115 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1115.csv" dbms=csv replace; run;
proc import out=past_career_1116 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1116.csv" dbms=csv replace; run;
proc import out=past_career_1117 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1117.csv" dbms=csv replace; run;
proc import out=past_career_1118 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1118.csv" dbms=csv replace; run;
proc import out=past_career_1119 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1119.csv" dbms=csv replace; run;
proc import out=past_career_1120 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1120.csv" dbms=csv replace; run;
proc import out=past_career_1121 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1121.csv" dbms=csv replace; run;
proc import out=past_career_1122 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1122.csv" dbms=csv replace; run;
proc import out=past_career_1123 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1123.csv" dbms=csv replace; run;
proc import out=past_career_1124 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1124.csv" dbms=csv replace; run;
proc import out=past_career_1125 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1125.csv" dbms=csv replace; run;
proc import out=past_career_1126 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1126.csv" dbms=csv replace; run;
proc import out=past_career_1127 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1127.csv" dbms=csv replace; run;
proc import out=past_career_1128 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1128.csv" dbms=csv replace; run;
proc import out=past_career_1129 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1129.csv" dbms=csv replace; run;
proc import out=past_career_1130 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1130.csv" dbms=csv replace; run;
proc import out=past_career_1131 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1131.csv" dbms=csv replace; run;
proc import out=past_career_1132 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1132.csv" dbms=csv replace; run;
proc import out=past_career_1133 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1133.csv" dbms=csv replace; run;
proc import out=past_career_1134 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1134.csv" dbms=csv replace; run;
proc import out=past_career_1135 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1135.csv" dbms=csv replace; run;
proc import out=past_career_1136 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1136.csv" dbms=csv replace; run;
proc import out=past_career_1137 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1137.csv" dbms=csv replace; run;
proc import out=past_career_1138 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1138.csv" dbms=csv replace; run;
proc import out=past_career_1139 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1139.csv" dbms=csv replace; run;
proc import out=past_career_1140 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1140.csv" dbms=csv replace; run;
proc import out=past_career_1141 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1141.csv" dbms=csv replace; run;
proc import out=past_career_1142 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1142.csv" dbms=csv replace; run;
proc import out=past_career_1143 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1143.csv" dbms=csv replace; run;
proc import out=past_career_1144 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1144.csv" dbms=csv replace; run;
proc import out=past_career_1145 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1145.csv" dbms=csv replace; run;
proc import out=past_career_1146 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1146.csv" dbms=csv replace; run;
proc import out=past_career_1147 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1147.csv" dbms=csv replace; run;
proc import out=past_career_1148 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1148.csv" dbms=csv replace; run;
proc import out=past_career_1149 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1149.csv" dbms=csv replace; run;
proc import out=past_career_1150 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1150.csv" dbms=csv replace; run;
proc import out=past_career_1151 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1151.csv" dbms=csv replace; run;
proc import out=past_career_1152 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1152.csv" dbms=csv replace; run;
proc import out=past_career_1153 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1153.csv" dbms=csv replace; run;
proc import out=past_career_1154 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1154.csv" dbms=csv replace; run;
proc import out=past_career_1155 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1155.csv" dbms=csv replace; run;
proc import out=past_career_1156 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1156.csv" dbms=csv replace; run;
proc import out=past_career_1157 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1157.csv" dbms=csv replace; run;
proc import out=past_career_1158 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1158.csv" dbms=csv replace; run;
proc import out=past_career_1159 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1159.csv" dbms=csv replace; run;
proc import out=past_career_1160 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1160.csv" dbms=csv replace; run;
proc import out=past_career_1161 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1161.csv" dbms=csv replace; run;
proc import out=past_career_1162 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1162.csv" dbms=csv replace; run;
proc import out=past_career_1163 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1163.csv" dbms=csv replace; run;
proc import out=past_career_1164 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1164.csv" dbms=csv replace; run;
proc import out=past_career_1165 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1165.csv" dbms=csv replace; run;
proc import out=past_career_1166 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1166.csv" dbms=csv replace; run;
proc import out=past_career_1167 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1167.csv" dbms=csv replace; run;
proc import out=past_career_1168 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1168.csv" dbms=csv replace; run;
proc import out=past_career_1169 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1169.csv" dbms=csv replace; run;
proc import out=past_career_1170 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1170.csv" dbms=csv replace; run;
proc import out=past_career_1171 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1171.csv" dbms=csv replace; run;
proc import out=past_career_1172 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1172.csv" dbms=csv replace; run;
proc import out=past_career_1173 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1173.csv" dbms=csv replace; run;
proc import out=past_career_1174 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1174.csv" dbms=csv replace; run;
proc import out=past_career_1175 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1175.csv" dbms=csv replace; run;
proc import out=past_career_1176 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1176.csv" dbms=csv replace; run;
proc import out=past_career_1177 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1177.csv" dbms=csv replace; run;
proc import out=past_career_1178 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1178.csv" dbms=csv replace; run;
proc import out=past_career_1179 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1179.csv" dbms=csv replace; run;
proc import out=past_career_1180 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1180.csv" dbms=csv replace; run;
proc import out=past_career_1181 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1181.csv" dbms=csv replace; run;
proc import out=past_career_1182 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1182.csv" dbms=csv replace; run;
proc import out=past_career_1183 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1183.csv" dbms=csv replace; run;
proc import out=past_career_1184 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1184.csv" dbms=csv replace; run;
proc import out=past_career_1185 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1185.csv" dbms=csv replace; run;
proc import out=past_career_1186 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1186.csv" dbms=csv replace; run;
proc import out=past_career_1187 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1187.csv" dbms=csv replace; run;
proc import out=past_career_1188 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1188.csv" dbms=csv replace; run;
proc import out=past_career_1189 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1189.csv" dbms=csv replace; run;
proc import out=past_career_1190 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1190.csv" dbms=csv replace; run;
proc import out=past_career_1191 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1191.csv" dbms=csv replace; run;
proc import out=past_career_1192 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1192.csv" dbms=csv replace; run;
proc import out=past_career_1193 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1193.csv" dbms=csv replace; run;
proc import out=past_career_1194 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1194.csv" dbms=csv replace; run;
proc import out=past_career_1195 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1195.csv" dbms=csv replace; run;
proc import out=past_career_1196 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1196.csv" dbms=csv replace; run;
proc import out=past_career_1197 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1197.csv" dbms=csv replace; run;
proc import out=past_career_1198 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1198.csv" dbms=csv replace; run;
proc import out=past_career_1199 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1199.csv" dbms=csv replace; run;
proc import out=past_career_1200 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1200.csv" dbms=csv replace; run;
proc import out=past_career_1201 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1201.csv" dbms=csv replace; run;
proc import out=past_career_1202 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1202.csv" dbms=csv replace; run;
proc import out=past_career_1203 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1203.csv" dbms=csv replace; run;
proc import out=past_career_1204 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1204.csv" dbms=csv replace; run;
proc import out=past_career_1205 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1205.csv" dbms=csv replace; run;
proc import out=past_career_1206 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1206.csv" dbms=csv replace; run;
proc import out=past_career_1207 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1207.csv" dbms=csv replace; run;
proc import out=past_career_1208 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1208.csv" dbms=csv replace; run;
proc import out=past_career_1209 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1209.csv" dbms=csv replace; run;
proc import out=past_career_1210 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1210.csv" dbms=csv replace; run;
proc import out=past_career_1211 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1211.csv" dbms=csv replace; run;
proc import out=past_career_1212 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1212.csv" dbms=csv replace; run;
proc import out=past_career_1213 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1213.csv" dbms=csv replace; run;
proc import out=past_career_1214 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1214.csv" dbms=csv replace; run;
proc import out=past_career_1215 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1215.csv" dbms=csv replace; run;
proc import out=past_career_1216 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1216.csv" dbms=csv replace; run;
proc import out=past_career_1217 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1217.csv" dbms=csv replace; run;
proc import out=past_career_1218 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1218.csv" dbms=csv replace; run;
proc import out=past_career_1219 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1219.csv" dbms=csv replace; run;
proc import out=past_career_1220 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1220.csv" dbms=csv replace; run;
proc import out=past_career_1221 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1221.csv" dbms=csv replace; run;
proc import out=past_career_1222 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1222.csv" dbms=csv replace; run;
proc import out=past_career_1223 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1223.csv" dbms=csv replace; run;
proc import out=past_career_1224 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1224.csv" dbms=csv replace; run;
proc import out=past_career_1225 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1225.csv" dbms=csv replace; run;
proc import out=past_career_1226 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1226.csv" dbms=csv replace; run;
proc import out=past_career_1227 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1227.csv" dbms=csv replace; run;
proc import out=past_career_1228 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1228.csv" dbms=csv replace; run;
proc import out=past_career_1229 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1229.csv" dbms=csv replace; run;
proc import out=past_career_1230 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1230.csv" dbms=csv replace; run;
proc import out=past_career_1231 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1231.csv" dbms=csv replace; run;
proc import out=past_career_1232 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1232.csv" dbms=csv replace; run;
proc import out=past_career_1233 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1233.csv" dbms=csv replace; run;
proc import out=past_career_1234 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1234.csv" dbms=csv replace; run;
proc import out=past_career_1235 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1235.csv" dbms=csv replace; run;
proc import out=past_career_1236 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1236.csv" dbms=csv replace; run;
proc import out=past_career_1237 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1237.csv" dbms=csv replace; run;
proc import out=past_career_1238 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1238.csv" dbms=csv replace; run;
proc import out=past_career_1239 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1239.csv" dbms=csv replace; run;
proc import out=past_career_1240 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1240.csv" dbms=csv replace; run;
proc import out=past_career_1241 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1241.csv" dbms=csv replace; run;
proc import out=past_career_1242 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1242.csv" dbms=csv replace; run;
proc import out=past_career_1243 datafile="H:\LIAM2_commented_code\Retrospective_simulations\Seed_&seed._start_&year._t&quarter.\person_1243.csv" dbms=csv replace; run;

data past_career_0; set &library..microsim_base_&year._t&quarter.; itl_0=itl; itl_anses_0=itl; labour_market_state_0=0;  validated_quarters_0=0; if ( labour_market_state=1 | labour_market_state=2) then do; validated_quarters_0=1; end; keep id itl_0 itl_anses_0 validated_quarters_0 labour_market_state_0; run; 
proc sort data=past_career_0; by id; run;

data past_career_993; set past_career_993; monotributo_993=0; autonomo_993=0; if monotributo=1 then monotributo_993=1; if autonomo=1 then autonomo_993=1; labour_market_state_993= labour_market_state; itl_993=itl; itl_anses_993= itl_anses; validated_quarters_993=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_993=1;keep id validated_quarters_993 itl_993 itl_anses_993 labour_market_state_993 monotributo_993 autonomo_993; run; proc sort data=past_career_993; by id; run;
data past_career_994; set past_career_994; monotributo_994=0; autonomo_994=0; if monotributo=1 then monotributo_994=1; if autonomo=1 then autonomo_994=1; labour_market_state_994= labour_market_state; itl_994=itl; itl_anses_994= itl_anses; validated_quarters_994=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_994=1;keep id validated_quarters_994 itl_994 itl_anses_994 labour_market_state_994 monotributo_994 autonomo_994; run; proc sort data=past_career_994; by id; run;
data past_career_995; set past_career_995; monotributo_995=0; autonomo_995=0; if monotributo=1 then monotributo_995=1; if autonomo=1 then autonomo_995=1; labour_market_state_995= labour_market_state; itl_995=itl; itl_anses_995= itl_anses; validated_quarters_995=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_995=1;keep id validated_quarters_995 itl_995 itl_anses_995 labour_market_state_995 monotributo_995 autonomo_995; run; proc sort data=past_career_995; by id; run;
data past_career_996; set past_career_996; monotributo_996=0; autonomo_996=0; if monotributo=1 then monotributo_996=1; if autonomo=1 then autonomo_996=1; labour_market_state_996= labour_market_state; itl_996=itl; itl_anses_996= itl_anses; validated_quarters_996=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_996=1;keep id validated_quarters_996 itl_996 itl_anses_996 labour_market_state_996 monotributo_996 autonomo_996; run; proc sort data=past_career_996; by id; run;
data past_career_997; set past_career_997; monotributo_997=0; autonomo_997=0; if monotributo=1 then monotributo_997=1; if autonomo=1 then autonomo_997=1; labour_market_state_997= labour_market_state; itl_997=itl; itl_anses_997= itl_anses; validated_quarters_997=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_997=1;keep id validated_quarters_997 itl_997 itl_anses_997 labour_market_state_997 monotributo_997 autonomo_997; run; proc sort data=past_career_997; by id; run;
data past_career_998; set past_career_998; monotributo_998=0; autonomo_998=0; if monotributo=1 then monotributo_998=1; if autonomo=1 then autonomo_998=1; labour_market_state_998= labour_market_state; itl_998=itl; itl_anses_998= itl_anses; validated_quarters_998=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_998=1;keep id validated_quarters_998 itl_998 itl_anses_998 labour_market_state_998 monotributo_998 autonomo_998; run; proc sort data=past_career_998; by id; run;
data past_career_999; set past_career_999; monotributo_999=0; autonomo_999=0; if monotributo=1 then monotributo_999=1; if autonomo=1 then autonomo_999=1; labour_market_state_999= labour_market_state; itl_999=itl; itl_anses_999= itl_anses; validated_quarters_999=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_999=1;keep id validated_quarters_999 itl_999 itl_anses_999 labour_market_state_999 monotributo_999 autonomo_999; run; proc sort data=past_career_999; by id; run;
data past_career_1000; set past_career_1000; monotributo_1000=0; autonomo_1000=0; if monotributo=1 then monotributo_1000=1; if autonomo=1 then autonomo_1000=1; labour_market_state_1000= labour_market_state; itl_1000=itl; itl_anses_1000= itl_anses; validated_quarters_1000=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1000=1;keep id validated_quarters_1000 itl_1000 itl_anses_1000 labour_market_state_1000 monotributo_1000 autonomo_1000; run; proc sort data=past_career_1000; by id; run;
data past_career_1001; set past_career_1001; monotributo_1001=0; autonomo_1001=0; if monotributo=1 then monotributo_1001=1; if autonomo=1 then autonomo_1001=1; labour_market_state_1001= labour_market_state; itl_1001=itl; itl_anses_1001= itl_anses; validated_quarters_1001=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1001=1;keep id validated_quarters_1001 itl_1001 itl_anses_1001 labour_market_state_1001 monotributo_1001 autonomo_1001; run; proc sort data=past_career_1001; by id; run;
data past_career_1002; set past_career_1002; monotributo_1002=0; autonomo_1002=0; if monotributo=1 then monotributo_1002=1; if autonomo=1 then autonomo_1002=1; labour_market_state_1002= labour_market_state; itl_1002=itl; itl_anses_1002= itl_anses; validated_quarters_1002=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1002=1;keep id validated_quarters_1002 itl_1002 itl_anses_1002 labour_market_state_1002 monotributo_1002 autonomo_1002; run; proc sort data=past_career_1002; by id; run;
data past_career_1003; set past_career_1003; monotributo_1003=0; autonomo_1003=0; if monotributo=1 then monotributo_1003=1; if autonomo=1 then autonomo_1003=1; labour_market_state_1003= labour_market_state; itl_1003=itl; itl_anses_1003= itl_anses; validated_quarters_1003=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1003=1;keep id validated_quarters_1003 itl_1003 itl_anses_1003 labour_market_state_1003 monotributo_1003 autonomo_1003; run; proc sort data=past_career_1003; by id; run;
data past_career_1004; set past_career_1004; monotributo_1004=0; autonomo_1004=0; if monotributo=1 then monotributo_1004=1; if autonomo=1 then autonomo_1004=1; labour_market_state_1004= labour_market_state; itl_1004=itl; itl_anses_1004= itl_anses; validated_quarters_1004=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1004=1;keep id validated_quarters_1004 itl_1004 itl_anses_1004 labour_market_state_1004 monotributo_1004 autonomo_1004; run; proc sort data=past_career_1004; by id; run;
data past_career_1005; set past_career_1005; monotributo_1005=0; autonomo_1005=0; if monotributo=1 then monotributo_1005=1; if autonomo=1 then autonomo_1005=1; labour_market_state_1005= labour_market_state; itl_1005=itl; itl_anses_1005= itl_anses; validated_quarters_1005=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1005=1;keep id validated_quarters_1005 itl_1005 itl_anses_1005 labour_market_state_1005 monotributo_1005 autonomo_1005; run; proc sort data=past_career_1005; by id; run;
data past_career_1006; set past_career_1006; monotributo_1006=0; autonomo_1006=0; if monotributo=1 then monotributo_1006=1; if autonomo=1 then autonomo_1006=1; labour_market_state_1006= labour_market_state; itl_1006=itl; itl_anses_1006= itl_anses; validated_quarters_1006=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1006=1;keep id validated_quarters_1006 itl_1006 itl_anses_1006 labour_market_state_1006 monotributo_1006 autonomo_1006; run; proc sort data=past_career_1006; by id; run;
data past_career_1007; set past_career_1007; monotributo_1007=0; autonomo_1007=0; if monotributo=1 then monotributo_1007=1; if autonomo=1 then autonomo_1007=1; labour_market_state_1007= labour_market_state; itl_1007=itl; itl_anses_1007= itl_anses; validated_quarters_1007=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1007=1;keep id validated_quarters_1007 itl_1007 itl_anses_1007 labour_market_state_1007 monotributo_1007 autonomo_1007; run; proc sort data=past_career_1007; by id; run;
data past_career_1008; set past_career_1008; monotributo_1008=0; autonomo_1008=0; if monotributo=1 then monotributo_1008=1; if autonomo=1 then autonomo_1008=1; labour_market_state_1008= labour_market_state; itl_1008=itl; itl_anses_1008= itl_anses; validated_quarters_1008=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1008=1;keep id validated_quarters_1008 itl_1008 itl_anses_1008 labour_market_state_1008 monotributo_1008 autonomo_1008; run; proc sort data=past_career_1008; by id; run;
data past_career_1009; set past_career_1009; monotributo_1009=0; autonomo_1009=0; if monotributo=1 then monotributo_1009=1; if autonomo=1 then autonomo_1009=1; labour_market_state_1009= labour_market_state; itl_1009=itl; itl_anses_1009= itl_anses; validated_quarters_1009=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1009=1;keep id validated_quarters_1009 itl_1009 itl_anses_1009 labour_market_state_1009 monotributo_1009 autonomo_1009; run; proc sort data=past_career_1009; by id; run;
data past_career_1010; set past_career_1010; monotributo_1010=0; autonomo_1010=0; if monotributo=1 then monotributo_1010=1; if autonomo=1 then autonomo_1010=1; labour_market_state_1010= labour_market_state; itl_1010=itl; itl_anses_1010= itl_anses; validated_quarters_1010=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1010=1;keep id validated_quarters_1010 itl_1010 itl_anses_1010 labour_market_state_1010 monotributo_1010 autonomo_1010; run; proc sort data=past_career_1010; by id; run;
data past_career_1011; set past_career_1011; monotributo_1011=0; autonomo_1011=0; if monotributo=1 then monotributo_1011=1; if autonomo=1 then autonomo_1011=1; labour_market_state_1011= labour_market_state; itl_1011=itl; itl_anses_1011= itl_anses; validated_quarters_1011=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1011=1;keep id validated_quarters_1011 itl_1011 itl_anses_1011 labour_market_state_1011 monotributo_1011 autonomo_1011; run; proc sort data=past_career_1011; by id; run;
data past_career_1012; set past_career_1012; monotributo_1012=0; autonomo_1012=0; if monotributo=1 then monotributo_1012=1; if autonomo=1 then autonomo_1012=1; labour_market_state_1012= labour_market_state; itl_1012=itl; itl_anses_1012= itl_anses; validated_quarters_1012=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1012=1;keep id validated_quarters_1012 itl_1012 itl_anses_1012 labour_market_state_1012 monotributo_1012 autonomo_1012; run; proc sort data=past_career_1012; by id; run;
data past_career_1013; set past_career_1013; monotributo_1013=0; autonomo_1013=0; if monotributo=1 then monotributo_1013=1; if autonomo=1 then autonomo_1013=1; labour_market_state_1013= labour_market_state; itl_1013=itl; itl_anses_1013= itl_anses; validated_quarters_1013=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1013=1;keep id validated_quarters_1013 itl_1013 itl_anses_1013 labour_market_state_1013 monotributo_1013 autonomo_1013; run; proc sort data=past_career_1013; by id; run;
data past_career_1014; set past_career_1014; monotributo_1014=0; autonomo_1014=0; if monotributo=1 then monotributo_1014=1; if autonomo=1 then autonomo_1014=1; labour_market_state_1014= labour_market_state; itl_1014=itl; itl_anses_1014= itl_anses; validated_quarters_1014=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1014=1;keep id validated_quarters_1014 itl_1014 itl_anses_1014 labour_market_state_1014 monotributo_1014 autonomo_1014; run; proc sort data=past_career_1014; by id; run;
data past_career_1015; set past_career_1015; monotributo_1015=0; autonomo_1015=0; if monotributo=1 then monotributo_1015=1; if autonomo=1 then autonomo_1015=1; labour_market_state_1015= labour_market_state; itl_1015=itl; itl_anses_1015= itl_anses; validated_quarters_1015=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1015=1;keep id validated_quarters_1015 itl_1015 itl_anses_1015 labour_market_state_1015 monotributo_1015 autonomo_1015; run; proc sort data=past_career_1015; by id; run;
data past_career_1016; set past_career_1016; monotributo_1016=0; autonomo_1016=0; if monotributo=1 then monotributo_1016=1; if autonomo=1 then autonomo_1016=1; labour_market_state_1016= labour_market_state; itl_1016=itl; itl_anses_1016= itl_anses; validated_quarters_1016=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1016=1;keep id validated_quarters_1016 itl_1016 itl_anses_1016 labour_market_state_1016 monotributo_1016 autonomo_1016; run; proc sort data=past_career_1016; by id; run;
data past_career_1017; set past_career_1017; monotributo_1017=0; autonomo_1017=0; if monotributo=1 then monotributo_1017=1; if autonomo=1 then autonomo_1017=1; labour_market_state_1017= labour_market_state; itl_1017=itl; itl_anses_1017= itl_anses; validated_quarters_1017=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1017=1;keep id validated_quarters_1017 itl_1017 itl_anses_1017 labour_market_state_1017 monotributo_1017 autonomo_1017; run; proc sort data=past_career_1017; by id; run;
data past_career_1018; set past_career_1018; monotributo_1018=0; autonomo_1018=0; if monotributo=1 then monotributo_1018=1; if autonomo=1 then autonomo_1018=1; labour_market_state_1018= labour_market_state; itl_1018=itl; itl_anses_1018= itl_anses; validated_quarters_1018=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1018=1;keep id validated_quarters_1018 itl_1018 itl_anses_1018 labour_market_state_1018 monotributo_1018 autonomo_1018; run; proc sort data=past_career_1018; by id; run;
data past_career_1019; set past_career_1019; monotributo_1019=0; autonomo_1019=0; if monotributo=1 then monotributo_1019=1; if autonomo=1 then autonomo_1019=1; labour_market_state_1019= labour_market_state; itl_1019=itl; itl_anses_1019= itl_anses; validated_quarters_1019=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1019=1;keep id validated_quarters_1019 itl_1019 itl_anses_1019 labour_market_state_1019 monotributo_1019 autonomo_1019; run; proc sort data=past_career_1019; by id; run;
data past_career_1020; set past_career_1020; monotributo_1020=0; autonomo_1020=0; if monotributo=1 then monotributo_1020=1; if autonomo=1 then autonomo_1020=1; labour_market_state_1020= labour_market_state; itl_1020=itl; itl_anses_1020= itl_anses; validated_quarters_1020=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1020=1;keep id validated_quarters_1020 itl_1020 itl_anses_1020 labour_market_state_1020 monotributo_1020 autonomo_1020; run; proc sort data=past_career_1020; by id; run;
data past_career_1021; set past_career_1021; monotributo_1021=0; autonomo_1021=0; if monotributo=1 then monotributo_1021=1; if autonomo=1 then autonomo_1021=1; labour_market_state_1021= labour_market_state; itl_1021=itl; itl_anses_1021= itl_anses; validated_quarters_1021=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1021=1;keep id validated_quarters_1021 itl_1021 itl_anses_1021 labour_market_state_1021 monotributo_1021 autonomo_1021; run; proc sort data=past_career_1021; by id; run;
data past_career_1022; set past_career_1022; monotributo_1022=0; autonomo_1022=0; if monotributo=1 then monotributo_1022=1; if autonomo=1 then autonomo_1022=1; labour_market_state_1022= labour_market_state; itl_1022=itl; itl_anses_1022= itl_anses; validated_quarters_1022=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1022=1;keep id validated_quarters_1022 itl_1022 itl_anses_1022 labour_market_state_1022 monotributo_1022 autonomo_1022; run; proc sort data=past_career_1022; by id; run;
data past_career_1023; set past_career_1023; monotributo_1023=0; autonomo_1023=0; if monotributo=1 then monotributo_1023=1; if autonomo=1 then autonomo_1023=1; labour_market_state_1023= labour_market_state; itl_1023=itl; itl_anses_1023= itl_anses; validated_quarters_1023=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1023=1;keep id validated_quarters_1023 itl_1023 itl_anses_1023 labour_market_state_1023 monotributo_1023 autonomo_1023; run; proc sort data=past_career_1023; by id; run;
data past_career_1024; set past_career_1024; monotributo_1024=0; autonomo_1024=0; if monotributo=1 then monotributo_1024=1; if autonomo=1 then autonomo_1024=1; labour_market_state_1024= labour_market_state; itl_1024=itl; itl_anses_1024= itl_anses; validated_quarters_1024=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1024=1;keep id validated_quarters_1024 itl_1024 itl_anses_1024 labour_market_state_1024 monotributo_1024 autonomo_1024; run; proc sort data=past_career_1024; by id; run;
data past_career_1025; set past_career_1025; monotributo_1025=0; autonomo_1025=0; if monotributo=1 then monotributo_1025=1; if autonomo=1 then autonomo_1025=1; labour_market_state_1025= labour_market_state; itl_1025=itl; itl_anses_1025= itl_anses; validated_quarters_1025=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1025=1;keep id validated_quarters_1025 itl_1025 itl_anses_1025 labour_market_state_1025 monotributo_1025 autonomo_1025; run; proc sort data=past_career_1025; by id; run;
data past_career_1026; set past_career_1026; monotributo_1026=0; autonomo_1026=0; if monotributo=1 then monotributo_1026=1; if autonomo=1 then autonomo_1026=1; labour_market_state_1026= labour_market_state; itl_1026=itl; itl_anses_1026= itl_anses; validated_quarters_1026=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1026=1;keep id validated_quarters_1026 itl_1026 itl_anses_1026 labour_market_state_1026 monotributo_1026 autonomo_1026; run; proc sort data=past_career_1026; by id; run;
data past_career_1027; set past_career_1027; monotributo_1027=0; autonomo_1027=0; if monotributo=1 then monotributo_1027=1; if autonomo=1 then autonomo_1027=1; labour_market_state_1027= labour_market_state; itl_1027=itl; itl_anses_1027= itl_anses; validated_quarters_1027=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1027=1;keep id validated_quarters_1027 itl_1027 itl_anses_1027 labour_market_state_1027 monotributo_1027 autonomo_1027; run; proc sort data=past_career_1027; by id; run;
data past_career_1028; set past_career_1028; monotributo_1028=0; autonomo_1028=0; if monotributo=1 then monotributo_1028=1; if autonomo=1 then autonomo_1028=1; labour_market_state_1028= labour_market_state; itl_1028=itl; itl_anses_1028= itl_anses; validated_quarters_1028=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1028=1;keep id validated_quarters_1028 itl_1028 itl_anses_1028 labour_market_state_1028 monotributo_1028 autonomo_1028; run; proc sort data=past_career_1028; by id; run;
data past_career_1029; set past_career_1029; monotributo_1029=0; autonomo_1029=0; if monotributo=1 then monotributo_1029=1; if autonomo=1 then autonomo_1029=1; labour_market_state_1029= labour_market_state; itl_1029=itl; itl_anses_1029= itl_anses; validated_quarters_1029=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1029=1;keep id validated_quarters_1029 itl_1029 itl_anses_1029 labour_market_state_1029 monotributo_1029 autonomo_1029; run; proc sort data=past_career_1029; by id; run;
data past_career_1030; set past_career_1030; monotributo_1030=0; autonomo_1030=0; if monotributo=1 then monotributo_1030=1; if autonomo=1 then autonomo_1030=1; labour_market_state_1030= labour_market_state; itl_1030=itl; itl_anses_1030= itl_anses; validated_quarters_1030=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1030=1;keep id validated_quarters_1030 itl_1030 itl_anses_1030 labour_market_state_1030 monotributo_1030 autonomo_1030; run; proc sort data=past_career_1030; by id; run;
data past_career_1031; set past_career_1031; monotributo_1031=0; autonomo_1031=0; if monotributo=1 then monotributo_1031=1; if autonomo=1 then autonomo_1031=1; labour_market_state_1031= labour_market_state; itl_1031=itl; itl_anses_1031= itl_anses; validated_quarters_1031=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1031=1;keep id validated_quarters_1031 itl_1031 itl_anses_1031 labour_market_state_1031 monotributo_1031 autonomo_1031; run; proc sort data=past_career_1031; by id; run;
data past_career_1032; set past_career_1032; monotributo_1032=0; autonomo_1032=0; if monotributo=1 then monotributo_1032=1; if autonomo=1 then autonomo_1032=1; labour_market_state_1032= labour_market_state; itl_1032=itl; itl_anses_1032= itl_anses; validated_quarters_1032=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1032=1;keep id validated_quarters_1032 itl_1032 itl_anses_1032 labour_market_state_1032 monotributo_1032 autonomo_1032; run; proc sort data=past_career_1032; by id; run;
data past_career_1033; set past_career_1033; monotributo_1033=0; autonomo_1033=0; if monotributo=1 then monotributo_1033=1; if autonomo=1 then autonomo_1033=1; labour_market_state_1033= labour_market_state; itl_1033=itl; itl_anses_1033= itl_anses; validated_quarters_1033=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1033=1;keep id validated_quarters_1033 itl_1033 itl_anses_1033 labour_market_state_1033 monotributo_1033 autonomo_1033; run; proc sort data=past_career_1033; by id; run;
data past_career_1034; set past_career_1034; monotributo_1034=0; autonomo_1034=0; if monotributo=1 then monotributo_1034=1; if autonomo=1 then autonomo_1034=1; labour_market_state_1034= labour_market_state; itl_1034=itl; itl_anses_1034= itl_anses; validated_quarters_1034=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1034=1;keep id validated_quarters_1034 itl_1034 itl_anses_1034 labour_market_state_1034 monotributo_1034 autonomo_1034; run; proc sort data=past_career_1034; by id; run;
data past_career_1035; set past_career_1035; monotributo_1035=0; autonomo_1035=0; if monotributo=1 then monotributo_1035=1; if autonomo=1 then autonomo_1035=1; labour_market_state_1035= labour_market_state; itl_1035=itl; itl_anses_1035= itl_anses; validated_quarters_1035=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1035=1;keep id validated_quarters_1035 itl_1035 itl_anses_1035 labour_market_state_1035 monotributo_1035 autonomo_1035; run; proc sort data=past_career_1035; by id; run;
data past_career_1036; set past_career_1036; monotributo_1036=0; autonomo_1036=0; if monotributo=1 then monotributo_1036=1; if autonomo=1 then autonomo_1036=1; labour_market_state_1036= labour_market_state; itl_1036=itl; itl_anses_1036= itl_anses; validated_quarters_1036=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1036=1;keep id validated_quarters_1036 itl_1036 itl_anses_1036 labour_market_state_1036 monotributo_1036 autonomo_1036; run; proc sort data=past_career_1036; by id; run;
data past_career_1037; set past_career_1037; monotributo_1037=0; autonomo_1037=0; if monotributo=1 then monotributo_1037=1; if autonomo=1 then autonomo_1037=1; labour_market_state_1037= labour_market_state; itl_1037=itl; itl_anses_1037= itl_anses; validated_quarters_1037=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1037=1;keep id validated_quarters_1037 itl_1037 itl_anses_1037 labour_market_state_1037 monotributo_1037 autonomo_1037; run; proc sort data=past_career_1037; by id; run;
data past_career_1038; set past_career_1038; monotributo_1038=0; autonomo_1038=0; if monotributo=1 then monotributo_1038=1; if autonomo=1 then autonomo_1038=1; labour_market_state_1038= labour_market_state; itl_1038=itl; itl_anses_1038= itl_anses; validated_quarters_1038=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1038=1;keep id validated_quarters_1038 itl_1038 itl_anses_1038 labour_market_state_1038 monotributo_1038 autonomo_1038; run; proc sort data=past_career_1038; by id; run;
data past_career_1039; set past_career_1039; monotributo_1039=0; autonomo_1039=0; if monotributo=1 then monotributo_1039=1; if autonomo=1 then autonomo_1039=1; labour_market_state_1039= labour_market_state; itl_1039=itl; itl_anses_1039= itl_anses; validated_quarters_1039=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1039=1;keep id validated_quarters_1039 itl_1039 itl_anses_1039 labour_market_state_1039 monotributo_1039 autonomo_1039; run; proc sort data=past_career_1039; by id; run;
data past_career_1040; set past_career_1040; monotributo_1040=0; autonomo_1040=0; if monotributo=1 then monotributo_1040=1; if autonomo=1 then autonomo_1040=1; labour_market_state_1040= labour_market_state; itl_1040=itl; itl_anses_1040= itl_anses; validated_quarters_1040=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1040=1;keep id validated_quarters_1040 itl_1040 itl_anses_1040 labour_market_state_1040 monotributo_1040 autonomo_1040; run; proc sort data=past_career_1040; by id; run;
data past_career_1041; set past_career_1041; monotributo_1041=0; autonomo_1041=0; if monotributo=1 then monotributo_1041=1; if autonomo=1 then autonomo_1041=1; labour_market_state_1041= labour_market_state; itl_1041=itl; itl_anses_1041= itl_anses; validated_quarters_1041=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1041=1;keep id validated_quarters_1041 itl_1041 itl_anses_1041 labour_market_state_1041 monotributo_1041 autonomo_1041; run; proc sort data=past_career_1041; by id; run;
data past_career_1042; set past_career_1042; monotributo_1042=0; autonomo_1042=0; if monotributo=1 then monotributo_1042=1; if autonomo=1 then autonomo_1042=1; labour_market_state_1042= labour_market_state; itl_1042=itl; itl_anses_1042= itl_anses; validated_quarters_1042=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1042=1;keep id validated_quarters_1042 itl_1042 itl_anses_1042 labour_market_state_1042 monotributo_1042 autonomo_1042; run; proc sort data=past_career_1042; by id; run;
data past_career_1043; set past_career_1043; monotributo_1043=0; autonomo_1043=0; if monotributo=1 then monotributo_1043=1; if autonomo=1 then autonomo_1043=1; labour_market_state_1043= labour_market_state; itl_1043=itl; itl_anses_1043= itl_anses; validated_quarters_1043=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1043=1;keep id validated_quarters_1043 itl_1043 itl_anses_1043 labour_market_state_1043 monotributo_1043 autonomo_1043; run; proc sort data=past_career_1043; by id; run;
data past_career_1044; set past_career_1044; monotributo_1044=0; autonomo_1044=0; if monotributo=1 then monotributo_1044=1; if autonomo=1 then autonomo_1044=1; labour_market_state_1044= labour_market_state; itl_1044=itl; itl_anses_1044= itl_anses; validated_quarters_1044=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1044=1;keep id validated_quarters_1044 itl_1044 itl_anses_1044 labour_market_state_1044 monotributo_1044 autonomo_1044; run; proc sort data=past_career_1044; by id; run;
data past_career_1045; set past_career_1045; monotributo_1045=0; autonomo_1045=0; if monotributo=1 then monotributo_1045=1; if autonomo=1 then autonomo_1045=1; labour_market_state_1045= labour_market_state; itl_1045=itl; itl_anses_1045= itl_anses; validated_quarters_1045=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1045=1;keep id validated_quarters_1045 itl_1045 itl_anses_1045 labour_market_state_1045 monotributo_1045 autonomo_1045; run; proc sort data=past_career_1045; by id; run;
data past_career_1046; set past_career_1046; monotributo_1046=0; autonomo_1046=0; if monotributo=1 then monotributo_1046=1; if autonomo=1 then autonomo_1046=1; labour_market_state_1046= labour_market_state; itl_1046=itl; itl_anses_1046= itl_anses; validated_quarters_1046=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1046=1;keep id validated_quarters_1046 itl_1046 itl_anses_1046 labour_market_state_1046 monotributo_1046 autonomo_1046; run; proc sort data=past_career_1046; by id; run;
data past_career_1047; set past_career_1047; monotributo_1047=0; autonomo_1047=0; if monotributo=1 then monotributo_1047=1; if autonomo=1 then autonomo_1047=1; labour_market_state_1047= labour_market_state; itl_1047=itl; itl_anses_1047= itl_anses; validated_quarters_1047=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1047=1;keep id validated_quarters_1047 itl_1047 itl_anses_1047 labour_market_state_1047 monotributo_1047 autonomo_1047; run; proc sort data=past_career_1047; by id; run;
data past_career_1048; set past_career_1048; monotributo_1048=0; autonomo_1048=0; if monotributo=1 then monotributo_1048=1; if autonomo=1 then autonomo_1048=1; labour_market_state_1048= labour_market_state; itl_1048=itl; itl_anses_1048= itl_anses; validated_quarters_1048=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1048=1;keep id validated_quarters_1048 itl_1048 itl_anses_1048 labour_market_state_1048 monotributo_1048 autonomo_1048; run; proc sort data=past_career_1048; by id; run;
data past_career_1049; set past_career_1049; monotributo_1049=0; autonomo_1049=0; if monotributo=1 then monotributo_1049=1; if autonomo=1 then autonomo_1049=1; labour_market_state_1049= labour_market_state; itl_1049=itl; itl_anses_1049= itl_anses; validated_quarters_1049=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1049=1;keep id validated_quarters_1049 itl_1049 itl_anses_1049 labour_market_state_1049 monotributo_1049 autonomo_1049; run; proc sort data=past_career_1049; by id; run;
data past_career_1050; set past_career_1050; monotributo_1050=0; autonomo_1050=0; if monotributo=1 then monotributo_1050=1; if autonomo=1 then autonomo_1050=1; labour_market_state_1050= labour_market_state; itl_1050=itl; itl_anses_1050= itl_anses; validated_quarters_1050=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1050=1;keep id validated_quarters_1050 itl_1050 itl_anses_1050 labour_market_state_1050 monotributo_1050 autonomo_1050; run; proc sort data=past_career_1050; by id; run;
data past_career_1051; set past_career_1051; monotributo_1051=0; autonomo_1051=0; if monotributo=1 then monotributo_1051=1; if autonomo=1 then autonomo_1051=1; labour_market_state_1051= labour_market_state; itl_1051=itl; itl_anses_1051= itl_anses; validated_quarters_1051=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1051=1;keep id validated_quarters_1051 itl_1051 itl_anses_1051 labour_market_state_1051 monotributo_1051 autonomo_1051; run; proc sort data=past_career_1051; by id; run;
data past_career_1052; set past_career_1052; monotributo_1052=0; autonomo_1052=0; if monotributo=1 then monotributo_1052=1; if autonomo=1 then autonomo_1052=1; labour_market_state_1052= labour_market_state; itl_1052=itl; itl_anses_1052= itl_anses; validated_quarters_1052=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1052=1;keep id validated_quarters_1052 itl_1052 itl_anses_1052 labour_market_state_1052 monotributo_1052 autonomo_1052; run; proc sort data=past_career_1052; by id; run;
data past_career_1053; set past_career_1053; monotributo_1053=0; autonomo_1053=0; if monotributo=1 then monotributo_1053=1; if autonomo=1 then autonomo_1053=1; labour_market_state_1053= labour_market_state; itl_1053=itl; itl_anses_1053= itl_anses; validated_quarters_1053=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1053=1;keep id validated_quarters_1053 itl_1053 itl_anses_1053 labour_market_state_1053 monotributo_1053 autonomo_1053; run; proc sort data=past_career_1053; by id; run;
data past_career_1054; set past_career_1054; monotributo_1054=0; autonomo_1054=0; if monotributo=1 then monotributo_1054=1; if autonomo=1 then autonomo_1054=1; labour_market_state_1054= labour_market_state; itl_1054=itl; itl_anses_1054= itl_anses; validated_quarters_1054=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1054=1;keep id validated_quarters_1054 itl_1054 itl_anses_1054 labour_market_state_1054 monotributo_1054 autonomo_1054; run; proc sort data=past_career_1054; by id; run;
data past_career_1055; set past_career_1055; monotributo_1055=0; autonomo_1055=0; if monotributo=1 then monotributo_1055=1; if autonomo=1 then autonomo_1055=1; labour_market_state_1055= labour_market_state; itl_1055=itl; itl_anses_1055= itl_anses; validated_quarters_1055=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1055=1;keep id validated_quarters_1055 itl_1055 itl_anses_1055 labour_market_state_1055 monotributo_1055 autonomo_1055; run; proc sort data=past_career_1055; by id; run;
data past_career_1056; set past_career_1056; monotributo_1056=0; autonomo_1056=0; if monotributo=1 then monotributo_1056=1; if autonomo=1 then autonomo_1056=1; labour_market_state_1056= labour_market_state; itl_1056=itl; itl_anses_1056= itl_anses; validated_quarters_1056=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1056=1;keep id validated_quarters_1056 itl_1056 itl_anses_1056 labour_market_state_1056 monotributo_1056 autonomo_1056; run; proc sort data=past_career_1056; by id; run;
data past_career_1057; set past_career_1057; monotributo_1057=0; autonomo_1057=0; if monotributo=1 then monotributo_1057=1; if autonomo=1 then autonomo_1057=1; labour_market_state_1057= labour_market_state; itl_1057=itl; itl_anses_1057= itl_anses; validated_quarters_1057=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1057=1;keep id validated_quarters_1057 itl_1057 itl_anses_1057 labour_market_state_1057 monotributo_1057 autonomo_1057; run; proc sort data=past_career_1057; by id; run;
data past_career_1058; set past_career_1058; monotributo_1058=0; autonomo_1058=0; if monotributo=1 then monotributo_1058=1; if autonomo=1 then autonomo_1058=1; labour_market_state_1058= labour_market_state; itl_1058=itl; itl_anses_1058= itl_anses; validated_quarters_1058=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1058=1;keep id validated_quarters_1058 itl_1058 itl_anses_1058 labour_market_state_1058 monotributo_1058 autonomo_1058; run; proc sort data=past_career_1058; by id; run;
data past_career_1059; set past_career_1059; monotributo_1059=0; autonomo_1059=0; if monotributo=1 then monotributo_1059=1; if autonomo=1 then autonomo_1059=1; labour_market_state_1059= labour_market_state; itl_1059=itl; itl_anses_1059= itl_anses; validated_quarters_1059=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1059=1;keep id validated_quarters_1059 itl_1059 itl_anses_1059 labour_market_state_1059 monotributo_1059 autonomo_1059; run; proc sort data=past_career_1059; by id; run;
data past_career_1060; set past_career_1060; monotributo_1060=0; autonomo_1060=0; if monotributo=1 then monotributo_1060=1; if autonomo=1 then autonomo_1060=1; labour_market_state_1060= labour_market_state; itl_1060=itl; itl_anses_1060= itl_anses; validated_quarters_1060=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1060=1;keep id validated_quarters_1060 itl_1060 itl_anses_1060 labour_market_state_1060 monotributo_1060 autonomo_1060; run; proc sort data=past_career_1060; by id; run;
data past_career_1061; set past_career_1061; monotributo_1061=0; autonomo_1061=0; if monotributo=1 then monotributo_1061=1; if autonomo=1 then autonomo_1061=1; labour_market_state_1061= labour_market_state; itl_1061=itl; itl_anses_1061= itl_anses; validated_quarters_1061=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1061=1;keep id validated_quarters_1061 itl_1061 itl_anses_1061 labour_market_state_1061 monotributo_1061 autonomo_1061; run; proc sort data=past_career_1061; by id; run;
data past_career_1062; set past_career_1062; monotributo_1062=0; autonomo_1062=0; if monotributo=1 then monotributo_1062=1; if autonomo=1 then autonomo_1062=1; labour_market_state_1062= labour_market_state; itl_1062=itl; itl_anses_1062= itl_anses; validated_quarters_1062=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1062=1;keep id validated_quarters_1062 itl_1062 itl_anses_1062 labour_market_state_1062 monotributo_1062 autonomo_1062; run; proc sort data=past_career_1062; by id; run;
data past_career_1063; set past_career_1063; monotributo_1063=0; autonomo_1063=0; if monotributo=1 then monotributo_1063=1; if autonomo=1 then autonomo_1063=1; labour_market_state_1063= labour_market_state; itl_1063=itl; itl_anses_1063= itl_anses; validated_quarters_1063=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1063=1;keep id validated_quarters_1063 itl_1063 itl_anses_1063 labour_market_state_1063 monotributo_1063 autonomo_1063; run; proc sort data=past_career_1063; by id; run;
data past_career_1064; set past_career_1064; monotributo_1064=0; autonomo_1064=0; if monotributo=1 then monotributo_1064=1; if autonomo=1 then autonomo_1064=1; labour_market_state_1064= labour_market_state; itl_1064=itl; itl_anses_1064= itl_anses; validated_quarters_1064=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1064=1;keep id validated_quarters_1064 itl_1064 itl_anses_1064 labour_market_state_1064 monotributo_1064 autonomo_1064; run; proc sort data=past_career_1064; by id; run;
data past_career_1065; set past_career_1065; monotributo_1065=0; autonomo_1065=0; if monotributo=1 then monotributo_1065=1; if autonomo=1 then autonomo_1065=1; labour_market_state_1065= labour_market_state; itl_1065=itl; itl_anses_1065= itl_anses; validated_quarters_1065=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1065=1;keep id validated_quarters_1065 itl_1065 itl_anses_1065 labour_market_state_1065 monotributo_1065 autonomo_1065; run; proc sort data=past_career_1065; by id; run;
data past_career_1066; set past_career_1066; monotributo_1066=0; autonomo_1066=0; if monotributo=1 then monotributo_1066=1; if autonomo=1 then autonomo_1066=1; labour_market_state_1066= labour_market_state; itl_1066=itl; itl_anses_1066= itl_anses; validated_quarters_1066=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1066=1;keep id validated_quarters_1066 itl_1066 itl_anses_1066 labour_market_state_1066 monotributo_1066 autonomo_1066; run; proc sort data=past_career_1066; by id; run;
data past_career_1067; set past_career_1067; monotributo_1067=0; autonomo_1067=0; if monotributo=1 then monotributo_1067=1; if autonomo=1 then autonomo_1067=1; labour_market_state_1067= labour_market_state; itl_1067=itl; itl_anses_1067= itl_anses; validated_quarters_1067=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1067=1;keep id validated_quarters_1067 itl_1067 itl_anses_1067 labour_market_state_1067 monotributo_1067 autonomo_1067; run; proc sort data=past_career_1067; by id; run;
data past_career_1068; set past_career_1068; monotributo_1068=0; autonomo_1068=0; if monotributo=1 then monotributo_1068=1; if autonomo=1 then autonomo_1068=1; labour_market_state_1068= labour_market_state; itl_1068=itl; itl_anses_1068= itl_anses; validated_quarters_1068=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1068=1;keep id validated_quarters_1068 itl_1068 itl_anses_1068 labour_market_state_1068 monotributo_1068 autonomo_1068; run; proc sort data=past_career_1068; by id; run;
data past_career_1069; set past_career_1069; monotributo_1069=0; autonomo_1069=0; if monotributo=1 then monotributo_1069=1; if autonomo=1 then autonomo_1069=1; labour_market_state_1069= labour_market_state; itl_1069=itl; itl_anses_1069= itl_anses; validated_quarters_1069=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1069=1;keep id validated_quarters_1069 itl_1069 itl_anses_1069 labour_market_state_1069 monotributo_1069 autonomo_1069; run; proc sort data=past_career_1069; by id; run;
data past_career_1070; set past_career_1070; monotributo_1070=0; autonomo_1070=0; if monotributo=1 then monotributo_1070=1; if autonomo=1 then autonomo_1070=1; labour_market_state_1070= labour_market_state; itl_1070=itl; itl_anses_1070= itl_anses; validated_quarters_1070=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1070=1;keep id validated_quarters_1070 itl_1070 itl_anses_1070 labour_market_state_1070 monotributo_1070 autonomo_1070; run; proc sort data=past_career_1070; by id; run;
data past_career_1071; set past_career_1071; monotributo_1071=0; autonomo_1071=0; if monotributo=1 then monotributo_1071=1; if autonomo=1 then autonomo_1071=1; labour_market_state_1071= labour_market_state; itl_1071=itl; itl_anses_1071= itl_anses; validated_quarters_1071=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1071=1;keep id validated_quarters_1071 itl_1071 itl_anses_1071 labour_market_state_1071 monotributo_1071 autonomo_1071; run; proc sort data=past_career_1071; by id; run;
data past_career_1072; set past_career_1072; monotributo_1072=0; autonomo_1072=0; if monotributo=1 then monotributo_1072=1; if autonomo=1 then autonomo_1072=1; labour_market_state_1072= labour_market_state; itl_1072=itl; itl_anses_1072= itl_anses; validated_quarters_1072=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1072=1;keep id validated_quarters_1072 itl_1072 itl_anses_1072 labour_market_state_1072 monotributo_1072 autonomo_1072; run; proc sort data=past_career_1072; by id; run;
data past_career_1073; set past_career_1073; monotributo_1073=0; autonomo_1073=0; if monotributo=1 then monotributo_1073=1; if autonomo=1 then autonomo_1073=1; labour_market_state_1073= labour_market_state; itl_1073=itl; itl_anses_1073= itl_anses; validated_quarters_1073=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1073=1;keep id validated_quarters_1073 itl_1073 itl_anses_1073 labour_market_state_1073 monotributo_1073 autonomo_1073; run; proc sort data=past_career_1073; by id; run;
data past_career_1074; set past_career_1074; monotributo_1074=0; autonomo_1074=0; if monotributo=1 then monotributo_1074=1; if autonomo=1 then autonomo_1074=1; labour_market_state_1074= labour_market_state; itl_1074=itl; itl_anses_1074= itl_anses; validated_quarters_1074=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1074=1;keep id validated_quarters_1074 itl_1074 itl_anses_1074 labour_market_state_1074 monotributo_1074 autonomo_1074; run; proc sort data=past_career_1074; by id; run;
data past_career_1075; set past_career_1075; monotributo_1075=0; autonomo_1075=0; if monotributo=1 then monotributo_1075=1; if autonomo=1 then autonomo_1075=1; labour_market_state_1075= labour_market_state; itl_1075=itl; itl_anses_1075= itl_anses; validated_quarters_1075=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1075=1;keep id validated_quarters_1075 itl_1075 itl_anses_1075 labour_market_state_1075 monotributo_1075 autonomo_1075; run; proc sort data=past_career_1075; by id; run;
data past_career_1076; set past_career_1076; monotributo_1076=0; autonomo_1076=0; if monotributo=1 then monotributo_1076=1; if autonomo=1 then autonomo_1076=1; labour_market_state_1076= labour_market_state; itl_1076=itl; itl_anses_1076= itl_anses; validated_quarters_1076=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1076=1;keep id validated_quarters_1076 itl_1076 itl_anses_1076 labour_market_state_1076 monotributo_1076 autonomo_1076; run; proc sort data=past_career_1076; by id; run;
data past_career_1077; set past_career_1077; monotributo_1077=0; autonomo_1077=0; if monotributo=1 then monotributo_1077=1; if autonomo=1 then autonomo_1077=1; labour_market_state_1077= labour_market_state; itl_1077=itl; itl_anses_1077= itl_anses; validated_quarters_1077=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1077=1;keep id validated_quarters_1077 itl_1077 itl_anses_1077 labour_market_state_1077 monotributo_1077 autonomo_1077; run; proc sort data=past_career_1077; by id; run;
data past_career_1078; set past_career_1078; monotributo_1078=0; autonomo_1078=0; if monotributo=1 then monotributo_1078=1; if autonomo=1 then autonomo_1078=1; labour_market_state_1078= labour_market_state; itl_1078=itl; itl_anses_1078= itl_anses; validated_quarters_1078=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1078=1;keep id validated_quarters_1078 itl_1078 itl_anses_1078 labour_market_state_1078 monotributo_1078 autonomo_1078; run; proc sort data=past_career_1078; by id; run;
data past_career_1079; set past_career_1079; monotributo_1079=0; autonomo_1079=0; if monotributo=1 then monotributo_1079=1; if autonomo=1 then autonomo_1079=1; labour_market_state_1079= labour_market_state; itl_1079=itl; itl_anses_1079= itl_anses; validated_quarters_1079=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1079=1;keep id validated_quarters_1079 itl_1079 itl_anses_1079 labour_market_state_1079 monotributo_1079 autonomo_1079; run; proc sort data=past_career_1079; by id; run;
data past_career_1080; set past_career_1080; monotributo_1080=0; autonomo_1080=0; if monotributo=1 then monotributo_1080=1; if autonomo=1 then autonomo_1080=1; labour_market_state_1080= labour_market_state; itl_1080=itl; itl_anses_1080= itl_anses; validated_quarters_1080=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1080=1;keep id validated_quarters_1080 itl_1080 itl_anses_1080 labour_market_state_1080 monotributo_1080 autonomo_1080; run; proc sort data=past_career_1080; by id; run;
data past_career_1081; set past_career_1081; monotributo_1081=0; autonomo_1081=0; if monotributo=1 then monotributo_1081=1; if autonomo=1 then autonomo_1081=1; labour_market_state_1081= labour_market_state; itl_1081=itl; itl_anses_1081= itl_anses; validated_quarters_1081=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1081=1;keep id validated_quarters_1081 itl_1081 itl_anses_1081 labour_market_state_1081 monotributo_1081 autonomo_1081; run; proc sort data=past_career_1081; by id; run;
data past_career_1082; set past_career_1082; monotributo_1082=0; autonomo_1082=0; if monotributo=1 then monotributo_1082=1; if autonomo=1 then autonomo_1082=1; labour_market_state_1082= labour_market_state; itl_1082=itl; itl_anses_1082= itl_anses; validated_quarters_1082=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1082=1;keep id validated_quarters_1082 itl_1082 itl_anses_1082 labour_market_state_1082 monotributo_1082 autonomo_1082; run; proc sort data=past_career_1082; by id; run;
data past_career_1083; set past_career_1083; monotributo_1083=0; autonomo_1083=0; if monotributo=1 then monotributo_1083=1; if autonomo=1 then autonomo_1083=1; labour_market_state_1083= labour_market_state; itl_1083=itl; itl_anses_1083= itl_anses; validated_quarters_1083=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1083=1;keep id validated_quarters_1083 itl_1083 itl_anses_1083 labour_market_state_1083 monotributo_1083 autonomo_1083; run; proc sort data=past_career_1083; by id; run;
data past_career_1084; set past_career_1084; monotributo_1084=0; autonomo_1084=0; if monotributo=1 then monotributo_1084=1; if autonomo=1 then autonomo_1084=1; labour_market_state_1084= labour_market_state; itl_1084=itl; itl_anses_1084= itl_anses; validated_quarters_1084=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1084=1;keep id validated_quarters_1084 itl_1084 itl_anses_1084 labour_market_state_1084 monotributo_1084 autonomo_1084; run; proc sort data=past_career_1084; by id; run;
data past_career_1085; set past_career_1085; monotributo_1085=0; autonomo_1085=0; if monotributo=1 then monotributo_1085=1; if autonomo=1 then autonomo_1085=1; labour_market_state_1085= labour_market_state; itl_1085=itl; itl_anses_1085= itl_anses; validated_quarters_1085=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1085=1;keep id validated_quarters_1085 itl_1085 itl_anses_1085 labour_market_state_1085 monotributo_1085 autonomo_1085; run; proc sort data=past_career_1085; by id; run;
data past_career_1086; set past_career_1086; monotributo_1086=0; autonomo_1086=0; if monotributo=1 then monotributo_1086=1; if autonomo=1 then autonomo_1086=1; labour_market_state_1086= labour_market_state; itl_1086=itl; itl_anses_1086= itl_anses; validated_quarters_1086=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1086=1;keep id validated_quarters_1086 itl_1086 itl_anses_1086 labour_market_state_1086 monotributo_1086 autonomo_1086; run; proc sort data=past_career_1086; by id; run;
data past_career_1087; set past_career_1087; monotributo_1087=0; autonomo_1087=0; if monotributo=1 then monotributo_1087=1; if autonomo=1 then autonomo_1087=1; labour_market_state_1087= labour_market_state; itl_1087=itl; itl_anses_1087= itl_anses; validated_quarters_1087=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1087=1;keep id validated_quarters_1087 itl_1087 itl_anses_1087 labour_market_state_1087 monotributo_1087 autonomo_1087; run; proc sort data=past_career_1087; by id; run;
data past_career_1088; set past_career_1088; monotributo_1088=0; autonomo_1088=0; if monotributo=1 then monotributo_1088=1; if autonomo=1 then autonomo_1088=1; labour_market_state_1088= labour_market_state; itl_1088=itl; itl_anses_1088= itl_anses; validated_quarters_1088=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1088=1;keep id validated_quarters_1088 itl_1088 itl_anses_1088 labour_market_state_1088 monotributo_1088 autonomo_1088; run; proc sort data=past_career_1088; by id; run;
data past_career_1089; set past_career_1089; monotributo_1089=0; autonomo_1089=0; if monotributo=1 then monotributo_1089=1; if autonomo=1 then autonomo_1089=1; labour_market_state_1089= labour_market_state; itl_1089=itl; itl_anses_1089= itl_anses; validated_quarters_1089=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1089=1;keep id validated_quarters_1089 itl_1089 itl_anses_1089 labour_market_state_1089 monotributo_1089 autonomo_1089; run; proc sort data=past_career_1089; by id; run;
data past_career_1090; set past_career_1090; monotributo_1090=0; autonomo_1090=0; if monotributo=1 then monotributo_1090=1; if autonomo=1 then autonomo_1090=1; labour_market_state_1090= labour_market_state; itl_1090=itl; itl_anses_1090= itl_anses; validated_quarters_1090=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1090=1;keep id validated_quarters_1090 itl_1090 itl_anses_1090 labour_market_state_1090 monotributo_1090 autonomo_1090; run; proc sort data=past_career_1090; by id; run;
data past_career_1091; set past_career_1091; monotributo_1091=0; autonomo_1091=0; if monotributo=1 then monotributo_1091=1; if autonomo=1 then autonomo_1091=1; labour_market_state_1091= labour_market_state; itl_1091=itl; itl_anses_1091= itl_anses; validated_quarters_1091=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1091=1;keep id validated_quarters_1091 itl_1091 itl_anses_1091 labour_market_state_1091 monotributo_1091 autonomo_1091; run; proc sort data=past_career_1091; by id; run;
data past_career_1092; set past_career_1092; monotributo_1092=0; autonomo_1092=0; if monotributo=1 then monotributo_1092=1; if autonomo=1 then autonomo_1092=1; labour_market_state_1092= labour_market_state; itl_1092=itl; itl_anses_1092= itl_anses; validated_quarters_1092=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1092=1;keep id validated_quarters_1092 itl_1092 itl_anses_1092 labour_market_state_1092 monotributo_1092 autonomo_1092; run; proc sort data=past_career_1092; by id; run;
data past_career_1093; set past_career_1093; monotributo_1093=0; autonomo_1093=0; if monotributo=1 then monotributo_1093=1; if autonomo=1 then autonomo_1093=1; labour_market_state_1093= labour_market_state; itl_1093=itl; itl_anses_1093= itl_anses; validated_quarters_1093=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1093=1;keep id validated_quarters_1093 itl_1093 itl_anses_1093 labour_market_state_1093 monotributo_1093 autonomo_1093; run; proc sort data=past_career_1093; by id; run;
data past_career_1094; set past_career_1094; monotributo_1094=0; autonomo_1094=0; if monotributo=1 then monotributo_1094=1; if autonomo=1 then autonomo_1094=1; labour_market_state_1094= labour_market_state; itl_1094=itl; itl_anses_1094= itl_anses; validated_quarters_1094=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1094=1;keep id validated_quarters_1094 itl_1094 itl_anses_1094 labour_market_state_1094 monotributo_1094 autonomo_1094; run; proc sort data=past_career_1094; by id; run;
data past_career_1095; set past_career_1095; monotributo_1095=0; autonomo_1095=0; if monotributo=1 then monotributo_1095=1; if autonomo=1 then autonomo_1095=1; labour_market_state_1095= labour_market_state; itl_1095=itl; itl_anses_1095= itl_anses; validated_quarters_1095=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1095=1;keep id validated_quarters_1095 itl_1095 itl_anses_1095 labour_market_state_1095 monotributo_1095 autonomo_1095; run; proc sort data=past_career_1095; by id; run;
data past_career_1096; set past_career_1096; monotributo_1096=0; autonomo_1096=0; if monotributo=1 then monotributo_1096=1; if autonomo=1 then autonomo_1096=1; labour_market_state_1096= labour_market_state; itl_1096=itl; itl_anses_1096= itl_anses; validated_quarters_1096=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1096=1;keep id validated_quarters_1096 itl_1096 itl_anses_1096 labour_market_state_1096 monotributo_1096 autonomo_1096; run; proc sort data=past_career_1096; by id; run;
data past_career_1097; set past_career_1097; monotributo_1097=0; autonomo_1097=0; if monotributo=1 then monotributo_1097=1; if autonomo=1 then autonomo_1097=1; labour_market_state_1097= labour_market_state; itl_1097=itl; itl_anses_1097= itl_anses; validated_quarters_1097=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1097=1;keep id validated_quarters_1097 itl_1097 itl_anses_1097 labour_market_state_1097 monotributo_1097 autonomo_1097; run; proc sort data=past_career_1097; by id; run;
data past_career_1098; set past_career_1098; monotributo_1098=0; autonomo_1098=0; if monotributo=1 then monotributo_1098=1; if autonomo=1 then autonomo_1098=1; labour_market_state_1098= labour_market_state; itl_1098=itl; itl_anses_1098= itl_anses; validated_quarters_1098=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1098=1;keep id validated_quarters_1098 itl_1098 itl_anses_1098 labour_market_state_1098 monotributo_1098 autonomo_1098; run; proc sort data=past_career_1098; by id; run;
data past_career_1099; set past_career_1099; monotributo_1099=0; autonomo_1099=0; if monotributo=1 then monotributo_1099=1; if autonomo=1 then autonomo_1099=1; labour_market_state_1099= labour_market_state; itl_1099=itl; itl_anses_1099= itl_anses; validated_quarters_1099=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1099=1;keep id validated_quarters_1099 itl_1099 itl_anses_1099 labour_market_state_1099 monotributo_1099 autonomo_1099; run; proc sort data=past_career_1099; by id; run;
data past_career_1100; set past_career_1100; monotributo_1100=0; autonomo_1100=0; if monotributo=1 then monotributo_1100=1; if autonomo=1 then autonomo_1100=1; labour_market_state_1100= labour_market_state; itl_1100=itl; itl_anses_1100= itl_anses; validated_quarters_1100=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1100=1;keep id validated_quarters_1100 itl_1100 itl_anses_1100 labour_market_state_1100 monotributo_1100 autonomo_1100; run; proc sort data=past_career_1100; by id; run;
data past_career_1101; set past_career_1101; monotributo_1101=0; autonomo_1101=0; if monotributo=1 then monotributo_1101=1; if autonomo=1 then autonomo_1101=1; labour_market_state_1101= labour_market_state; itl_1101=itl; itl_anses_1101= itl_anses; validated_quarters_1101=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1101=1;keep id validated_quarters_1101 itl_1101 itl_anses_1101 labour_market_state_1101 monotributo_1101 autonomo_1101; run; proc sort data=past_career_1101; by id; run;
data past_career_1102; set past_career_1102; monotributo_1102=0; autonomo_1102=0; if monotributo=1 then monotributo_1102=1; if autonomo=1 then autonomo_1102=1; labour_market_state_1102= labour_market_state; itl_1102=itl; itl_anses_1102= itl_anses; validated_quarters_1102=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1102=1;keep id validated_quarters_1102 itl_1102 itl_anses_1102 labour_market_state_1102 monotributo_1102 autonomo_1102; run; proc sort data=past_career_1102; by id; run;
data past_career_1103; set past_career_1103; monotributo_1103=0; autonomo_1103=0; if monotributo=1 then monotributo_1103=1; if autonomo=1 then autonomo_1103=1; labour_market_state_1103= labour_market_state; itl_1103=itl; itl_anses_1103= itl_anses; validated_quarters_1103=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1103=1;keep id validated_quarters_1103 itl_1103 itl_anses_1103 labour_market_state_1103 monotributo_1103 autonomo_1103; run; proc sort data=past_career_1103; by id; run;
data past_career_1104; set past_career_1104; monotributo_1104=0; autonomo_1104=0; if monotributo=1 then monotributo_1104=1; if autonomo=1 then autonomo_1104=1; labour_market_state_1104= labour_market_state; itl_1104=itl; itl_anses_1104= itl_anses; validated_quarters_1104=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1104=1;keep id validated_quarters_1104 itl_1104 itl_anses_1104 labour_market_state_1104 monotributo_1104 autonomo_1104; run; proc sort data=past_career_1104; by id; run;
data past_career_1105; set past_career_1105; monotributo_1105=0; autonomo_1105=0; if monotributo=1 then monotributo_1105=1; if autonomo=1 then autonomo_1105=1; labour_market_state_1105= labour_market_state; itl_1105=itl; itl_anses_1105= itl_anses; validated_quarters_1105=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1105=1;keep id validated_quarters_1105 itl_1105 itl_anses_1105 labour_market_state_1105 monotributo_1105 autonomo_1105; run; proc sort data=past_career_1105; by id; run;
data past_career_1106; set past_career_1106; monotributo_1106=0; autonomo_1106=0; if monotributo=1 then monotributo_1106=1; if autonomo=1 then autonomo_1106=1; labour_market_state_1106= labour_market_state; itl_1106=itl; itl_anses_1106= itl_anses; validated_quarters_1106=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1106=1;keep id validated_quarters_1106 itl_1106 itl_anses_1106 labour_market_state_1106 monotributo_1106 autonomo_1106; run; proc sort data=past_career_1106; by id; run;
data past_career_1107; set past_career_1107; monotributo_1107=0; autonomo_1107=0; if monotributo=1 then monotributo_1107=1; if autonomo=1 then autonomo_1107=1; labour_market_state_1107= labour_market_state; itl_1107=itl; itl_anses_1107= itl_anses; validated_quarters_1107=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1107=1;keep id validated_quarters_1107 itl_1107 itl_anses_1107 labour_market_state_1107 monotributo_1107 autonomo_1107; run; proc sort data=past_career_1107; by id; run;
data past_career_1108; set past_career_1108; monotributo_1108=0; autonomo_1108=0; if monotributo=1 then monotributo_1108=1; if autonomo=1 then autonomo_1108=1; labour_market_state_1108= labour_market_state; itl_1108=itl; itl_anses_1108= itl_anses; validated_quarters_1108=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1108=1;keep id validated_quarters_1108 itl_1108 itl_anses_1108 labour_market_state_1108 monotributo_1108 autonomo_1108; run; proc sort data=past_career_1108; by id; run;
data past_career_1109; set past_career_1109; monotributo_1109=0; autonomo_1109=0; if monotributo=1 then monotributo_1109=1; if autonomo=1 then autonomo_1109=1; labour_market_state_1109= labour_market_state; itl_1109=itl; itl_anses_1109= itl_anses; validated_quarters_1109=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1109=1;keep id validated_quarters_1109 itl_1109 itl_anses_1109 labour_market_state_1109 monotributo_1109 autonomo_1109; run; proc sort data=past_career_1109; by id; run;
data past_career_1110; set past_career_1110; monotributo_1110=0; autonomo_1110=0; if monotributo=1 then monotributo_1110=1; if autonomo=1 then autonomo_1110=1; labour_market_state_1110= labour_market_state; itl_1110=itl; itl_anses_1110= itl_anses; validated_quarters_1110=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1110=1;keep id validated_quarters_1110 itl_1110 itl_anses_1110 labour_market_state_1110 monotributo_1110 autonomo_1110; run; proc sort data=past_career_1110; by id; run;
data past_career_1111; set past_career_1111; monotributo_1111=0; autonomo_1111=0; if monotributo=1 then monotributo_1111=1; if autonomo=1 then autonomo_1111=1; labour_market_state_1111= labour_market_state; itl_1111=itl; itl_anses_1111= itl_anses; validated_quarters_1111=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1111=1;keep id validated_quarters_1111 itl_1111 itl_anses_1111 labour_market_state_1111 monotributo_1111 autonomo_1111; run; proc sort data=past_career_1111; by id; run;
data past_career_1112; set past_career_1112; monotributo_1112=0; autonomo_1112=0; if monotributo=1 then monotributo_1112=1; if autonomo=1 then autonomo_1112=1; labour_market_state_1112= labour_market_state; itl_1112=itl; itl_anses_1112= itl_anses; validated_quarters_1112=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1112=1;keep id validated_quarters_1112 itl_1112 itl_anses_1112 labour_market_state_1112 monotributo_1112 autonomo_1112; run; proc sort data=past_career_1112; by id; run;
data past_career_1113; set past_career_1113; monotributo_1113=0; autonomo_1113=0; if monotributo=1 then monotributo_1113=1; if autonomo=1 then autonomo_1113=1; labour_market_state_1113= labour_market_state; itl_1113=itl; itl_anses_1113= itl_anses; validated_quarters_1113=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1113=1;keep id validated_quarters_1113 itl_1113 itl_anses_1113 labour_market_state_1113 monotributo_1113 autonomo_1113; run; proc sort data=past_career_1113; by id; run;
data past_career_1114; set past_career_1114; monotributo_1114=0; autonomo_1114=0; if monotributo=1 then monotributo_1114=1; if autonomo=1 then autonomo_1114=1; labour_market_state_1114= labour_market_state; itl_1114=itl; itl_anses_1114= itl_anses; validated_quarters_1114=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1114=1;keep id validated_quarters_1114 itl_1114 itl_anses_1114 labour_market_state_1114 monotributo_1114 autonomo_1114; run; proc sort data=past_career_1114; by id; run;
data past_career_1115; set past_career_1115; monotributo_1115=0; autonomo_1115=0; if monotributo=1 then monotributo_1115=1; if autonomo=1 then autonomo_1115=1; labour_market_state_1115= labour_market_state; itl_1115=itl; itl_anses_1115= itl_anses; validated_quarters_1115=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1115=1;keep id validated_quarters_1115 itl_1115 itl_anses_1115 labour_market_state_1115 monotributo_1115 autonomo_1115; run; proc sort data=past_career_1115; by id; run;
data past_career_1116; set past_career_1116; monotributo_1116=0; autonomo_1116=0; if monotributo=1 then monotributo_1116=1; if autonomo=1 then autonomo_1116=1; labour_market_state_1116= labour_market_state; itl_1116=itl; itl_anses_1116= itl_anses; validated_quarters_1116=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1116=1;keep id validated_quarters_1116 itl_1116 itl_anses_1116 labour_market_state_1116 monotributo_1116 autonomo_1116; run; proc sort data=past_career_1116; by id; run;
data past_career_1117; set past_career_1117; monotributo_1117=0; autonomo_1117=0; if monotributo=1 then monotributo_1117=1; if autonomo=1 then autonomo_1117=1; labour_market_state_1117= labour_market_state; itl_1117=itl; itl_anses_1117= itl_anses; validated_quarters_1117=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1117=1;keep id validated_quarters_1117 itl_1117 itl_anses_1117 labour_market_state_1117 monotributo_1117 autonomo_1117; run; proc sort data=past_career_1117; by id; run;
data past_career_1118; set past_career_1118; monotributo_1118=0; autonomo_1118=0; if monotributo=1 then monotributo_1118=1; if autonomo=1 then autonomo_1118=1; labour_market_state_1118= labour_market_state; itl_1118=itl; itl_anses_1118= itl_anses; validated_quarters_1118=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1118=1;keep id validated_quarters_1118 itl_1118 itl_anses_1118 labour_market_state_1118 monotributo_1118 autonomo_1118; run; proc sort data=past_career_1118; by id; run;
data past_career_1119; set past_career_1119; monotributo_1119=0; autonomo_1119=0; if monotributo=1 then monotributo_1119=1; if autonomo=1 then autonomo_1119=1; labour_market_state_1119= labour_market_state; itl_1119=itl; itl_anses_1119= itl_anses; validated_quarters_1119=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1119=1;keep id validated_quarters_1119 itl_1119 itl_anses_1119 labour_market_state_1119 monotributo_1119 autonomo_1119; run; proc sort data=past_career_1119; by id; run;
data past_career_1120; set past_career_1120; monotributo_1120=0; autonomo_1120=0; if monotributo=1 then monotributo_1120=1; if autonomo=1 then autonomo_1120=1; labour_market_state_1120= labour_market_state; itl_1120=itl; itl_anses_1120= itl_anses; validated_quarters_1120=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1120=1;keep id validated_quarters_1120 itl_1120 itl_anses_1120 labour_market_state_1120 monotributo_1120 autonomo_1120; run; proc sort data=past_career_1120; by id; run;
data past_career_1121; set past_career_1121; monotributo_1121=0; autonomo_1121=0; if monotributo=1 then monotributo_1121=1; if autonomo=1 then autonomo_1121=1; labour_market_state_1121= labour_market_state; itl_1121=itl; itl_anses_1121= itl_anses; validated_quarters_1121=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1121=1;keep id validated_quarters_1121 itl_1121 itl_anses_1121 labour_market_state_1121 monotributo_1121 autonomo_1121; run; proc sort data=past_career_1121; by id; run;
data past_career_1122; set past_career_1122; monotributo_1122=0; autonomo_1122=0; if monotributo=1 then monotributo_1122=1; if autonomo=1 then autonomo_1122=1; labour_market_state_1122= labour_market_state; itl_1122=itl; itl_anses_1122= itl_anses; validated_quarters_1122=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1122=1;keep id validated_quarters_1122 itl_1122 itl_anses_1122 labour_market_state_1122 monotributo_1122 autonomo_1122; run; proc sort data=past_career_1122; by id; run;
data past_career_1123; set past_career_1123; monotributo_1123=0; autonomo_1123=0; if monotributo=1 then monotributo_1123=1; if autonomo=1 then autonomo_1123=1; labour_market_state_1123= labour_market_state; itl_1123=itl; itl_anses_1123= itl_anses; validated_quarters_1123=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1123=1;keep id validated_quarters_1123 itl_1123 itl_anses_1123 labour_market_state_1123 monotributo_1123 autonomo_1123; run; proc sort data=past_career_1123; by id; run;
data past_career_1124; set past_career_1124; monotributo_1124=0; autonomo_1124=0; if monotributo=1 then monotributo_1124=1; if autonomo=1 then autonomo_1124=1; labour_market_state_1124= labour_market_state; itl_1124=itl; itl_anses_1124= itl_anses; validated_quarters_1124=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1124=1;keep id validated_quarters_1124 itl_1124 itl_anses_1124 labour_market_state_1124 monotributo_1124 autonomo_1124; run; proc sort data=past_career_1124; by id; run;
data past_career_1125; set past_career_1125; monotributo_1125=0; autonomo_1125=0; if monotributo=1 then monotributo_1125=1; if autonomo=1 then autonomo_1125=1; labour_market_state_1125= labour_market_state; itl_1125=itl; itl_anses_1125= itl_anses; validated_quarters_1125=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1125=1;keep id validated_quarters_1125 itl_1125 itl_anses_1125 labour_market_state_1125 monotributo_1125 autonomo_1125; run; proc sort data=past_career_1125; by id; run;
data past_career_1126; set past_career_1126; monotributo_1126=0; autonomo_1126=0; if monotributo=1 then monotributo_1126=1; if autonomo=1 then autonomo_1126=1; labour_market_state_1126= labour_market_state; itl_1126=itl; itl_anses_1126= itl_anses; validated_quarters_1126=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1126=1;keep id validated_quarters_1126 itl_1126 itl_anses_1126 labour_market_state_1126 monotributo_1126 autonomo_1126; run; proc sort data=past_career_1126; by id; run;
data past_career_1127; set past_career_1127; monotributo_1127=0; autonomo_1127=0; if monotributo=1 then monotributo_1127=1; if autonomo=1 then autonomo_1127=1; labour_market_state_1127= labour_market_state; itl_1127=itl; itl_anses_1127= itl_anses; validated_quarters_1127=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1127=1;keep id validated_quarters_1127 itl_1127 itl_anses_1127 labour_market_state_1127 monotributo_1127 autonomo_1127; run; proc sort data=past_career_1127; by id; run;
data past_career_1128; set past_career_1128; monotributo_1128=0; autonomo_1128=0; if monotributo=1 then monotributo_1128=1; if autonomo=1 then autonomo_1128=1; labour_market_state_1128= labour_market_state; itl_1128=itl; itl_anses_1128= itl_anses; validated_quarters_1128=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1128=1;keep id validated_quarters_1128 itl_1128 itl_anses_1128 labour_market_state_1128 monotributo_1128 autonomo_1128; run; proc sort data=past_career_1128; by id; run;
data past_career_1129; set past_career_1129; monotributo_1129=0; autonomo_1129=0; if monotributo=1 then monotributo_1129=1; if autonomo=1 then autonomo_1129=1; labour_market_state_1129= labour_market_state; itl_1129=itl; itl_anses_1129= itl_anses; validated_quarters_1129=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1129=1;keep id validated_quarters_1129 itl_1129 itl_anses_1129 labour_market_state_1129 monotributo_1129 autonomo_1129; run; proc sort data=past_career_1129; by id; run;
data past_career_1130; set past_career_1130; monotributo_1130=0; autonomo_1130=0; if monotributo=1 then monotributo_1130=1; if autonomo=1 then autonomo_1130=1; labour_market_state_1130= labour_market_state; itl_1130=itl; itl_anses_1130= itl_anses; validated_quarters_1130=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1130=1;keep id validated_quarters_1130 itl_1130 itl_anses_1130 labour_market_state_1130 monotributo_1130 autonomo_1130; run; proc sort data=past_career_1130; by id; run;
data past_career_1131; set past_career_1131; monotributo_1131=0; autonomo_1131=0; if monotributo=1 then monotributo_1131=1; if autonomo=1 then autonomo_1131=1; labour_market_state_1131= labour_market_state; itl_1131=itl; itl_anses_1131= itl_anses; validated_quarters_1131=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1131=1;keep id validated_quarters_1131 itl_1131 itl_anses_1131 labour_market_state_1131 monotributo_1131 autonomo_1131; run; proc sort data=past_career_1131; by id; run;
data past_career_1132; set past_career_1132; monotributo_1132=0; autonomo_1132=0; if monotributo=1 then monotributo_1132=1; if autonomo=1 then autonomo_1132=1; labour_market_state_1132= labour_market_state; itl_1132=itl; itl_anses_1132= itl_anses; validated_quarters_1132=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1132=1;keep id validated_quarters_1132 itl_1132 itl_anses_1132 labour_market_state_1132 monotributo_1132 autonomo_1132; run; proc sort data=past_career_1132; by id; run;
data past_career_1133; set past_career_1133; monotributo_1133=0; autonomo_1133=0; if monotributo=1 then monotributo_1133=1; if autonomo=1 then autonomo_1133=1; labour_market_state_1133= labour_market_state; itl_1133=itl; itl_anses_1133= itl_anses; validated_quarters_1133=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1133=1;keep id validated_quarters_1133 itl_1133 itl_anses_1133 labour_market_state_1133 monotributo_1133 autonomo_1133; run; proc sort data=past_career_1133; by id; run;
data past_career_1134; set past_career_1134; monotributo_1134=0; autonomo_1134=0; if monotributo=1 then monotributo_1134=1; if autonomo=1 then autonomo_1134=1; labour_market_state_1134= labour_market_state; itl_1134=itl; itl_anses_1134= itl_anses; validated_quarters_1134=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1134=1;keep id validated_quarters_1134 itl_1134 itl_anses_1134 labour_market_state_1134 monotributo_1134 autonomo_1134; run; proc sort data=past_career_1134; by id; run;
data past_career_1135; set past_career_1135; monotributo_1135=0; autonomo_1135=0; if monotributo=1 then monotributo_1135=1; if autonomo=1 then autonomo_1135=1; labour_market_state_1135= labour_market_state; itl_1135=itl; itl_anses_1135= itl_anses; validated_quarters_1135=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1135=1;keep id validated_quarters_1135 itl_1135 itl_anses_1135 labour_market_state_1135 monotributo_1135 autonomo_1135; run; proc sort data=past_career_1135; by id; run;
data past_career_1136; set past_career_1136; monotributo_1136=0; autonomo_1136=0; if monotributo=1 then monotributo_1136=1; if autonomo=1 then autonomo_1136=1; labour_market_state_1136= labour_market_state; itl_1136=itl; itl_anses_1136= itl_anses; validated_quarters_1136=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1136=1;keep id validated_quarters_1136 itl_1136 itl_anses_1136 labour_market_state_1136 monotributo_1136 autonomo_1136; run; proc sort data=past_career_1136; by id; run;
data past_career_1137; set past_career_1137; monotributo_1137=0; autonomo_1137=0; if monotributo=1 then monotributo_1137=1; if autonomo=1 then autonomo_1137=1; labour_market_state_1137= labour_market_state; itl_1137=itl; itl_anses_1137= itl_anses; validated_quarters_1137=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1137=1;keep id validated_quarters_1137 itl_1137 itl_anses_1137 labour_market_state_1137 monotributo_1137 autonomo_1137; run; proc sort data=past_career_1137; by id; run;
data past_career_1138; set past_career_1138; monotributo_1138=0; autonomo_1138=0; if monotributo=1 then monotributo_1138=1; if autonomo=1 then autonomo_1138=1; labour_market_state_1138= labour_market_state; itl_1138=itl; itl_anses_1138= itl_anses; validated_quarters_1138=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1138=1;keep id validated_quarters_1138 itl_1138 itl_anses_1138 labour_market_state_1138 monotributo_1138 autonomo_1138; run; proc sort data=past_career_1138; by id; run;
data past_career_1139; set past_career_1139; monotributo_1139=0; autonomo_1139=0; if monotributo=1 then monotributo_1139=1; if autonomo=1 then autonomo_1139=1; labour_market_state_1139= labour_market_state; itl_1139=itl; itl_anses_1139= itl_anses; validated_quarters_1139=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1139=1;keep id validated_quarters_1139 itl_1139 itl_anses_1139 labour_market_state_1139 monotributo_1139 autonomo_1139; run; proc sort data=past_career_1139; by id; run;
data past_career_1140; set past_career_1140; monotributo_1140=0; autonomo_1140=0; if monotributo=1 then monotributo_1140=1; if autonomo=1 then autonomo_1140=1; labour_market_state_1140= labour_market_state; itl_1140=itl; itl_anses_1140= itl_anses; validated_quarters_1140=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1140=1;keep id validated_quarters_1140 itl_1140 itl_anses_1140 labour_market_state_1140 monotributo_1140 autonomo_1140; run; proc sort data=past_career_1140; by id; run;
data past_career_1141; set past_career_1141; monotributo_1141=0; autonomo_1141=0; if monotributo=1 then monotributo_1141=1; if autonomo=1 then autonomo_1141=1; labour_market_state_1141= labour_market_state; itl_1141=itl; itl_anses_1141= itl_anses; validated_quarters_1141=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1141=1;keep id validated_quarters_1141 itl_1141 itl_anses_1141 labour_market_state_1141 monotributo_1141 autonomo_1141; run; proc sort data=past_career_1141; by id; run;
data past_career_1142; set past_career_1142; monotributo_1142=0; autonomo_1142=0; if monotributo=1 then monotributo_1142=1; if autonomo=1 then autonomo_1142=1; labour_market_state_1142= labour_market_state; itl_1142=itl; itl_anses_1142= itl_anses; validated_quarters_1142=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1142=1;keep id validated_quarters_1142 itl_1142 itl_anses_1142 labour_market_state_1142 monotributo_1142 autonomo_1142; run; proc sort data=past_career_1142; by id; run;
data past_career_1143; set past_career_1143; monotributo_1143=0; autonomo_1143=0; if monotributo=1 then monotributo_1143=1; if autonomo=1 then autonomo_1143=1; labour_market_state_1143= labour_market_state; itl_1143=itl; itl_anses_1143= itl_anses; validated_quarters_1143=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1143=1;keep id validated_quarters_1143 itl_1143 itl_anses_1143 labour_market_state_1143 monotributo_1143 autonomo_1143; run; proc sort data=past_career_1143; by id; run;
data past_career_1144; set past_career_1144; monotributo_1144=0; autonomo_1144=0; if monotributo=1 then monotributo_1144=1; if autonomo=1 then autonomo_1144=1; labour_market_state_1144= labour_market_state; itl_1144=itl; itl_anses_1144= itl_anses; validated_quarters_1144=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1144=1;keep id validated_quarters_1144 itl_1144 itl_anses_1144 labour_market_state_1144 monotributo_1144 autonomo_1144; run; proc sort data=past_career_1144; by id; run;
data past_career_1145; set past_career_1145; monotributo_1145=0; autonomo_1145=0; if monotributo=1 then monotributo_1145=1; if autonomo=1 then autonomo_1145=1; labour_market_state_1145= labour_market_state; itl_1145=itl; itl_anses_1145= itl_anses; validated_quarters_1145=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1145=1;keep id validated_quarters_1145 itl_1145 itl_anses_1145 labour_market_state_1145 monotributo_1145 autonomo_1145; run; proc sort data=past_career_1145; by id; run;
data past_career_1146; set past_career_1146; monotributo_1146=0; autonomo_1146=0; if monotributo=1 then monotributo_1146=1; if autonomo=1 then autonomo_1146=1; labour_market_state_1146= labour_market_state; itl_1146=itl; itl_anses_1146= itl_anses; validated_quarters_1146=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1146=1;keep id validated_quarters_1146 itl_1146 itl_anses_1146 labour_market_state_1146 monotributo_1146 autonomo_1146; run; proc sort data=past_career_1146; by id; run;
data past_career_1147; set past_career_1147; monotributo_1147=0; autonomo_1147=0; if monotributo=1 then monotributo_1147=1; if autonomo=1 then autonomo_1147=1; labour_market_state_1147= labour_market_state; itl_1147=itl; itl_anses_1147= itl_anses; validated_quarters_1147=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1147=1;keep id validated_quarters_1147 itl_1147 itl_anses_1147 labour_market_state_1147 monotributo_1147 autonomo_1147; run; proc sort data=past_career_1147; by id; run;
data past_career_1148; set past_career_1148; monotributo_1148=0; autonomo_1148=0; if monotributo=1 then monotributo_1148=1; if autonomo=1 then autonomo_1148=1; labour_market_state_1148= labour_market_state; itl_1148=itl; itl_anses_1148= itl_anses; validated_quarters_1148=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1148=1;keep id validated_quarters_1148 itl_1148 itl_anses_1148 labour_market_state_1148 monotributo_1148 autonomo_1148; run; proc sort data=past_career_1148; by id; run;
data past_career_1149; set past_career_1149; monotributo_1149=0; autonomo_1149=0; if monotributo=1 then monotributo_1149=1; if autonomo=1 then autonomo_1149=1; labour_market_state_1149= labour_market_state; itl_1149=itl; itl_anses_1149= itl_anses; validated_quarters_1149=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1149=1;keep id validated_quarters_1149 itl_1149 itl_anses_1149 labour_market_state_1149 monotributo_1149 autonomo_1149; run; proc sort data=past_career_1149; by id; run;
data past_career_1150; set past_career_1150; monotributo_1150=0; autonomo_1150=0; if monotributo=1 then monotributo_1150=1; if autonomo=1 then autonomo_1150=1; labour_market_state_1150= labour_market_state; itl_1150=itl; itl_anses_1150= itl_anses; validated_quarters_1150=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1150=1;keep id validated_quarters_1150 itl_1150 itl_anses_1150 labour_market_state_1150 monotributo_1150 autonomo_1150; run; proc sort data=past_career_1150; by id; run;
data past_career_1151; set past_career_1151; monotributo_1151=0; autonomo_1151=0; if monotributo=1 then monotributo_1151=1; if autonomo=1 then autonomo_1151=1; labour_market_state_1151= labour_market_state; itl_1151=itl; itl_anses_1151= itl_anses; validated_quarters_1151=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1151=1;keep id validated_quarters_1151 itl_1151 itl_anses_1151 labour_market_state_1151 monotributo_1151 autonomo_1151; run; proc sort data=past_career_1151; by id; run;
data past_career_1152; set past_career_1152; monotributo_1152=0; autonomo_1152=0; if monotributo=1 then monotributo_1152=1; if autonomo=1 then autonomo_1152=1; labour_market_state_1152= labour_market_state; itl_1152=itl; itl_anses_1152= itl_anses; validated_quarters_1152=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1152=1;keep id validated_quarters_1152 itl_1152 itl_anses_1152 labour_market_state_1152 monotributo_1152 autonomo_1152; run; proc sort data=past_career_1152; by id; run;
data past_career_1153; set past_career_1153; monotributo_1153=0; autonomo_1153=0; if monotributo=1 then monotributo_1153=1; if autonomo=1 then autonomo_1153=1; labour_market_state_1153= labour_market_state; itl_1153=itl; itl_anses_1153= itl_anses; validated_quarters_1153=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1153=1;keep id validated_quarters_1153 itl_1153 itl_anses_1153 labour_market_state_1153 monotributo_1153 autonomo_1153; run; proc sort data=past_career_1153; by id; run;
data past_career_1154; set past_career_1154; monotributo_1154=0; autonomo_1154=0; if monotributo=1 then monotributo_1154=1; if autonomo=1 then autonomo_1154=1; labour_market_state_1154= labour_market_state; itl_1154=itl; itl_anses_1154= itl_anses; validated_quarters_1154=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1154=1;keep id validated_quarters_1154 itl_1154 itl_anses_1154 labour_market_state_1154 monotributo_1154 autonomo_1154; run; proc sort data=past_career_1154; by id; run;
data past_career_1155; set past_career_1155; monotributo_1155=0; autonomo_1155=0; if monotributo=1 then monotributo_1155=1; if autonomo=1 then autonomo_1155=1; labour_market_state_1155= labour_market_state; itl_1155=itl; itl_anses_1155= itl_anses; validated_quarters_1155=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1155=1;keep id validated_quarters_1155 itl_1155 itl_anses_1155 labour_market_state_1155 monotributo_1155 autonomo_1155; run; proc sort data=past_career_1155; by id; run;
data past_career_1156; set past_career_1156; monotributo_1156=0; autonomo_1156=0; if monotributo=1 then monotributo_1156=1; if autonomo=1 then autonomo_1156=1; labour_market_state_1156= labour_market_state; itl_1156=itl; itl_anses_1156= itl_anses; validated_quarters_1156=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1156=1;keep id validated_quarters_1156 itl_1156 itl_anses_1156 labour_market_state_1156 monotributo_1156 autonomo_1156; run; proc sort data=past_career_1156; by id; run;
data past_career_1157; set past_career_1157; monotributo_1157=0; autonomo_1157=0; if monotributo=1 then monotributo_1157=1; if autonomo=1 then autonomo_1157=1; labour_market_state_1157= labour_market_state; itl_1157=itl; itl_anses_1157= itl_anses; validated_quarters_1157=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1157=1;keep id validated_quarters_1157 itl_1157 itl_anses_1157 labour_market_state_1157 monotributo_1157 autonomo_1157; run; proc sort data=past_career_1157; by id; run;
data past_career_1158; set past_career_1158; monotributo_1158=0; autonomo_1158=0; if monotributo=1 then monotributo_1158=1; if autonomo=1 then autonomo_1158=1; labour_market_state_1158= labour_market_state; itl_1158=itl; itl_anses_1158= itl_anses; validated_quarters_1158=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1158=1;keep id validated_quarters_1158 itl_1158 itl_anses_1158 labour_market_state_1158 monotributo_1158 autonomo_1158; run; proc sort data=past_career_1158; by id; run;
data past_career_1159; set past_career_1159; monotributo_1159=0; autonomo_1159=0; if monotributo=1 then monotributo_1159=1; if autonomo=1 then autonomo_1159=1; labour_market_state_1159= labour_market_state; itl_1159=itl; itl_anses_1159= itl_anses; validated_quarters_1159=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1159=1;keep id validated_quarters_1159 itl_1159 itl_anses_1159 labour_market_state_1159 monotributo_1159 autonomo_1159; run; proc sort data=past_career_1159; by id; run;
data past_career_1160; set past_career_1160; monotributo_1160=0; autonomo_1160=0; if monotributo=1 then monotributo_1160=1; if autonomo=1 then autonomo_1160=1; labour_market_state_1160= labour_market_state; itl_1160=itl; itl_anses_1160= itl_anses; validated_quarters_1160=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1160=1;keep id validated_quarters_1160 itl_1160 itl_anses_1160 labour_market_state_1160 monotributo_1160 autonomo_1160; run; proc sort data=past_career_1160; by id; run;
data past_career_1161; set past_career_1161; monotributo_1161=0; autonomo_1161=0; if monotributo=1 then monotributo_1161=1; if autonomo=1 then autonomo_1161=1; labour_market_state_1161= labour_market_state; itl_1161=itl; itl_anses_1161= itl_anses; validated_quarters_1161=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1161=1;keep id validated_quarters_1161 itl_1161 itl_anses_1161 labour_market_state_1161 monotributo_1161 autonomo_1161; run; proc sort data=past_career_1161; by id; run;
data past_career_1162; set past_career_1162; monotributo_1162=0; autonomo_1162=0; if monotributo=1 then monotributo_1162=1; if autonomo=1 then autonomo_1162=1; labour_market_state_1162= labour_market_state; itl_1162=itl; itl_anses_1162= itl_anses; validated_quarters_1162=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1162=1;keep id validated_quarters_1162 itl_1162 itl_anses_1162 labour_market_state_1162 monotributo_1162 autonomo_1162; run; proc sort data=past_career_1162; by id; run;
data past_career_1163; set past_career_1163; monotributo_1163=0; autonomo_1163=0; if monotributo=1 then monotributo_1163=1; if autonomo=1 then autonomo_1163=1; labour_market_state_1163= labour_market_state; itl_1163=itl; itl_anses_1163= itl_anses; validated_quarters_1163=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1163=1;keep id validated_quarters_1163 itl_1163 itl_anses_1163 labour_market_state_1163 monotributo_1163 autonomo_1163; run; proc sort data=past_career_1163; by id; run;
data past_career_1164; set past_career_1164; monotributo_1164=0; autonomo_1164=0; if monotributo=1 then monotributo_1164=1; if autonomo=1 then autonomo_1164=1; labour_market_state_1164= labour_market_state; itl_1164=itl; itl_anses_1164= itl_anses; validated_quarters_1164=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1164=1;keep id validated_quarters_1164 itl_1164 itl_anses_1164 labour_market_state_1164 monotributo_1164 autonomo_1164; run; proc sort data=past_career_1164; by id; run;
data past_career_1165; set past_career_1165; monotributo_1165=0; autonomo_1165=0; if monotributo=1 then monotributo_1165=1; if autonomo=1 then autonomo_1165=1; labour_market_state_1165= labour_market_state; itl_1165=itl; itl_anses_1165= itl_anses; validated_quarters_1165=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1165=1;keep id validated_quarters_1165 itl_1165 itl_anses_1165 labour_market_state_1165 monotributo_1165 autonomo_1165; run; proc sort data=past_career_1165; by id; run;
data past_career_1166; set past_career_1166; monotributo_1166=0; autonomo_1166=0; if monotributo=1 then monotributo_1166=1; if autonomo=1 then autonomo_1166=1; labour_market_state_1166= labour_market_state; itl_1166=itl; itl_anses_1166= itl_anses; validated_quarters_1166=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1166=1;keep id validated_quarters_1166 itl_1166 itl_anses_1166 labour_market_state_1166 monotributo_1166 autonomo_1166; run; proc sort data=past_career_1166; by id; run;
data past_career_1167; set past_career_1167; monotributo_1167=0; autonomo_1167=0; if monotributo=1 then monotributo_1167=1; if autonomo=1 then autonomo_1167=1; labour_market_state_1167= labour_market_state; itl_1167=itl; itl_anses_1167= itl_anses; validated_quarters_1167=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1167=1;keep id validated_quarters_1167 itl_1167 itl_anses_1167 labour_market_state_1167 monotributo_1167 autonomo_1167; run; proc sort data=past_career_1167; by id; run;
data past_career_1168; set past_career_1168; monotributo_1168=0; autonomo_1168=0; if monotributo=1 then monotributo_1168=1; if autonomo=1 then autonomo_1168=1; labour_market_state_1168= labour_market_state; itl_1168=itl; itl_anses_1168= itl_anses; validated_quarters_1168=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1168=1;keep id validated_quarters_1168 itl_1168 itl_anses_1168 labour_market_state_1168 monotributo_1168 autonomo_1168; run; proc sort data=past_career_1168; by id; run;
data past_career_1169; set past_career_1169; monotributo_1169=0; autonomo_1169=0; if monotributo=1 then monotributo_1169=1; if autonomo=1 then autonomo_1169=1; labour_market_state_1169= labour_market_state; itl_1169=itl; itl_anses_1169= itl_anses; validated_quarters_1169=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1169=1;keep id validated_quarters_1169 itl_1169 itl_anses_1169 labour_market_state_1169 monotributo_1169 autonomo_1169; run; proc sort data=past_career_1169; by id; run;
data past_career_1170; set past_career_1170; monotributo_1170=0; autonomo_1170=0; if monotributo=1 then monotributo_1170=1; if autonomo=1 then autonomo_1170=1; labour_market_state_1170= labour_market_state; itl_1170=itl; itl_anses_1170= itl_anses; validated_quarters_1170=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1170=1;keep id validated_quarters_1170 itl_1170 itl_anses_1170 labour_market_state_1170 monotributo_1170 autonomo_1170; run; proc sort data=past_career_1170; by id; run;
data past_career_1171; set past_career_1171; monotributo_1171=0; autonomo_1171=0; if monotributo=1 then monotributo_1171=1; if autonomo=1 then autonomo_1171=1; labour_market_state_1171= labour_market_state; itl_1171=itl; itl_anses_1171= itl_anses; validated_quarters_1171=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1171=1;keep id validated_quarters_1171 itl_1171 itl_anses_1171 labour_market_state_1171 monotributo_1171 autonomo_1171; run; proc sort data=past_career_1171; by id; run;
data past_career_1172; set past_career_1172; monotributo_1172=0; autonomo_1172=0; if monotributo=1 then monotributo_1172=1; if autonomo=1 then autonomo_1172=1; labour_market_state_1172= labour_market_state; itl_1172=itl; itl_anses_1172= itl_anses; validated_quarters_1172=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1172=1;keep id validated_quarters_1172 itl_1172 itl_anses_1172 labour_market_state_1172 monotributo_1172 autonomo_1172; run; proc sort data=past_career_1172; by id; run;
data past_career_1173; set past_career_1173; monotributo_1173=0; autonomo_1173=0; if monotributo=1 then monotributo_1173=1; if autonomo=1 then autonomo_1173=1; labour_market_state_1173= labour_market_state; itl_1173=itl; itl_anses_1173= itl_anses; validated_quarters_1173=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1173=1;keep id validated_quarters_1173 itl_1173 itl_anses_1173 labour_market_state_1173 monotributo_1173 autonomo_1173; run; proc sort data=past_career_1173; by id; run;
data past_career_1174; set past_career_1174; monotributo_1174=0; autonomo_1174=0; if monotributo=1 then monotributo_1174=1; if autonomo=1 then autonomo_1174=1; labour_market_state_1174= labour_market_state; itl_1174=itl; itl_anses_1174= itl_anses; validated_quarters_1174=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1174=1;keep id validated_quarters_1174 itl_1174 itl_anses_1174 labour_market_state_1174 monotributo_1174 autonomo_1174; run; proc sort data=past_career_1174; by id; run;
data past_career_1175; set past_career_1175; monotributo_1175=0; autonomo_1175=0; if monotributo=1 then monotributo_1175=1; if autonomo=1 then autonomo_1175=1; labour_market_state_1175= labour_market_state; itl_1175=itl; itl_anses_1175= itl_anses; validated_quarters_1175=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1175=1;keep id validated_quarters_1175 itl_1175 itl_anses_1175 labour_market_state_1175 monotributo_1175 autonomo_1175; run; proc sort data=past_career_1175; by id; run;
data past_career_1176; set past_career_1176; monotributo_1176=0; autonomo_1176=0; if monotributo=1 then monotributo_1176=1; if autonomo=1 then autonomo_1176=1; labour_market_state_1176= labour_market_state; itl_1176=itl; itl_anses_1176= itl_anses; validated_quarters_1176=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1176=1;keep id validated_quarters_1176 itl_1176 itl_anses_1176 labour_market_state_1176 monotributo_1176 autonomo_1176; run; proc sort data=past_career_1176; by id; run;
data past_career_1177; set past_career_1177; monotributo_1177=0; autonomo_1177=0; if monotributo=1 then monotributo_1177=1; if autonomo=1 then autonomo_1177=1; labour_market_state_1177= labour_market_state; itl_1177=itl; itl_anses_1177= itl_anses; validated_quarters_1177=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1177=1;keep id validated_quarters_1177 itl_1177 itl_anses_1177 labour_market_state_1177 monotributo_1177 autonomo_1177; run; proc sort data=past_career_1177; by id; run;
data past_career_1178; set past_career_1178; monotributo_1178=0; autonomo_1178=0; if monotributo=1 then monotributo_1178=1; if autonomo=1 then autonomo_1178=1; labour_market_state_1178= labour_market_state; itl_1178=itl; itl_anses_1178= itl_anses; validated_quarters_1178=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1178=1;keep id validated_quarters_1178 itl_1178 itl_anses_1178 labour_market_state_1178 monotributo_1178 autonomo_1178; run; proc sort data=past_career_1178; by id; run;
data past_career_1179; set past_career_1179; monotributo_1179=0; autonomo_1179=0; if monotributo=1 then monotributo_1179=1; if autonomo=1 then autonomo_1179=1; labour_market_state_1179= labour_market_state; itl_1179=itl; itl_anses_1179= itl_anses; validated_quarters_1179=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1179=1;keep id validated_quarters_1179 itl_1179 itl_anses_1179 labour_market_state_1179 monotributo_1179 autonomo_1179; run; proc sort data=past_career_1179; by id; run;
data past_career_1180; set past_career_1180; monotributo_1180=0; autonomo_1180=0; if monotributo=1 then monotributo_1180=1; if autonomo=1 then autonomo_1180=1; labour_market_state_1180= labour_market_state; itl_1180=itl; itl_anses_1180= itl_anses; validated_quarters_1180=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1180=1;keep id validated_quarters_1180 itl_1180 itl_anses_1180 labour_market_state_1180 monotributo_1180 autonomo_1180; run; proc sort data=past_career_1180; by id; run;
data past_career_1181; set past_career_1181; monotributo_1181=0; autonomo_1181=0; if monotributo=1 then monotributo_1181=1; if autonomo=1 then autonomo_1181=1; labour_market_state_1181= labour_market_state; itl_1181=itl; itl_anses_1181= itl_anses; validated_quarters_1181=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1181=1;keep id validated_quarters_1181 itl_1181 itl_anses_1181 labour_market_state_1181 monotributo_1181 autonomo_1181; run; proc sort data=past_career_1181; by id; run;
data past_career_1182; set past_career_1182; monotributo_1182=0; autonomo_1182=0; if monotributo=1 then monotributo_1182=1; if autonomo=1 then autonomo_1182=1; labour_market_state_1182= labour_market_state; itl_1182=itl; itl_anses_1182= itl_anses; validated_quarters_1182=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1182=1;keep id validated_quarters_1182 itl_1182 itl_anses_1182 labour_market_state_1182 monotributo_1182 autonomo_1182; run; proc sort data=past_career_1182; by id; run;
data past_career_1183; set past_career_1183; monotributo_1183=0; autonomo_1183=0; if monotributo=1 then monotributo_1183=1; if autonomo=1 then autonomo_1183=1; labour_market_state_1183= labour_market_state; itl_1183=itl; itl_anses_1183= itl_anses; validated_quarters_1183=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1183=1;keep id validated_quarters_1183 itl_1183 itl_anses_1183 labour_market_state_1183 monotributo_1183 autonomo_1183; run; proc sort data=past_career_1183; by id; run;
data past_career_1184; set past_career_1184; monotributo_1184=0; autonomo_1184=0; if monotributo=1 then monotributo_1184=1; if autonomo=1 then autonomo_1184=1; labour_market_state_1184= labour_market_state; itl_1184=itl; itl_anses_1184= itl_anses; validated_quarters_1184=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1184=1;keep id validated_quarters_1184 itl_1184 itl_anses_1184 labour_market_state_1184 monotributo_1184 autonomo_1184; run; proc sort data=past_career_1184; by id; run;
data past_career_1185; set past_career_1185; monotributo_1185=0; autonomo_1185=0; if monotributo=1 then monotributo_1185=1; if autonomo=1 then autonomo_1185=1; labour_market_state_1185= labour_market_state; itl_1185=itl; itl_anses_1185= itl_anses; validated_quarters_1185=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1185=1;keep id validated_quarters_1185 itl_1185 itl_anses_1185 labour_market_state_1185 monotributo_1185 autonomo_1185; run; proc sort data=past_career_1185; by id; run;
data past_career_1186; set past_career_1186; monotributo_1186=0; autonomo_1186=0; if monotributo=1 then monotributo_1186=1; if autonomo=1 then autonomo_1186=1; labour_market_state_1186= labour_market_state; itl_1186=itl; itl_anses_1186= itl_anses; validated_quarters_1186=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1186=1;keep id validated_quarters_1186 itl_1186 itl_anses_1186 labour_market_state_1186 monotributo_1186 autonomo_1186; run; proc sort data=past_career_1186; by id; run;
data past_career_1187; set past_career_1187; monotributo_1187=0; autonomo_1187=0; if monotributo=1 then monotributo_1187=1; if autonomo=1 then autonomo_1187=1; labour_market_state_1187= labour_market_state; itl_1187=itl; itl_anses_1187= itl_anses; validated_quarters_1187=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1187=1;keep id validated_quarters_1187 itl_1187 itl_anses_1187 labour_market_state_1187 monotributo_1187 autonomo_1187; run; proc sort data=past_career_1187; by id; run;
data past_career_1188; set past_career_1188; monotributo_1188=0; autonomo_1188=0; if monotributo=1 then monotributo_1188=1; if autonomo=1 then autonomo_1188=1; labour_market_state_1188= labour_market_state; itl_1188=itl; itl_anses_1188= itl_anses; validated_quarters_1188=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1188=1;keep id validated_quarters_1188 itl_1188 itl_anses_1188 labour_market_state_1188 monotributo_1188 autonomo_1188; run; proc sort data=past_career_1188; by id; run;
data past_career_1189; set past_career_1189; monotributo_1189=0; autonomo_1189=0; if monotributo=1 then monotributo_1189=1; if autonomo=1 then autonomo_1189=1; labour_market_state_1189= labour_market_state; itl_1189=itl; itl_anses_1189= itl_anses; validated_quarters_1189=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1189=1;keep id validated_quarters_1189 itl_1189 itl_anses_1189 labour_market_state_1189 monotributo_1189 autonomo_1189; run; proc sort data=past_career_1189; by id; run;
data past_career_1190; set past_career_1190; monotributo_1190=0; autonomo_1190=0; if monotributo=1 then monotributo_1190=1; if autonomo=1 then autonomo_1190=1; labour_market_state_1190= labour_market_state; itl_1190=itl; itl_anses_1190= itl_anses; validated_quarters_1190=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1190=1;keep id validated_quarters_1190 itl_1190 itl_anses_1190 labour_market_state_1190 monotributo_1190 autonomo_1190; run; proc sort data=past_career_1190; by id; run;
data past_career_1191; set past_career_1191; monotributo_1191=0; autonomo_1191=0; if monotributo=1 then monotributo_1191=1; if autonomo=1 then autonomo_1191=1; labour_market_state_1191= labour_market_state; itl_1191=itl; itl_anses_1191= itl_anses; validated_quarters_1191=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1191=1;keep id validated_quarters_1191 itl_1191 itl_anses_1191 labour_market_state_1191 monotributo_1191 autonomo_1191; run; proc sort data=past_career_1191; by id; run;
data past_career_1192; set past_career_1192; monotributo_1192=0; autonomo_1192=0; if monotributo=1 then monotributo_1192=1; if autonomo=1 then autonomo_1192=1; labour_market_state_1192= labour_market_state; itl_1192=itl; itl_anses_1192= itl_anses; validated_quarters_1192=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1192=1;keep id validated_quarters_1192 itl_1192 itl_anses_1192 labour_market_state_1192 monotributo_1192 autonomo_1192; run; proc sort data=past_career_1192; by id; run;
data past_career_1193; set past_career_1193; monotributo_1193=0; autonomo_1193=0; if monotributo=1 then monotributo_1193=1; if autonomo=1 then autonomo_1193=1; labour_market_state_1193= labour_market_state; itl_1193=itl; itl_anses_1193= itl_anses; validated_quarters_1193=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1193=1;keep id validated_quarters_1193 itl_1193 itl_anses_1193 labour_market_state_1193 monotributo_1193 autonomo_1193; run; proc sort data=past_career_1193; by id; run;
data past_career_1194; set past_career_1194; monotributo_1194=0; autonomo_1194=0; if monotributo=1 then monotributo_1194=1; if autonomo=1 then autonomo_1194=1; labour_market_state_1194= labour_market_state; itl_1194=itl; itl_anses_1194= itl_anses; validated_quarters_1194=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1194=1;keep id validated_quarters_1194 itl_1194 itl_anses_1194 labour_market_state_1194 monotributo_1194 autonomo_1194; run; proc sort data=past_career_1194; by id; run;
data past_career_1195; set past_career_1195; monotributo_1195=0; autonomo_1195=0; if monotributo=1 then monotributo_1195=1; if autonomo=1 then autonomo_1195=1; labour_market_state_1195= labour_market_state; itl_1195=itl; itl_anses_1195= itl_anses; validated_quarters_1195=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1195=1;keep id validated_quarters_1195 itl_1195 itl_anses_1195 labour_market_state_1195 monotributo_1195 autonomo_1195; run; proc sort data=past_career_1195; by id; run;
data past_career_1196; set past_career_1196; monotributo_1196=0; autonomo_1196=0; if monotributo=1 then monotributo_1196=1; if autonomo=1 then autonomo_1196=1; labour_market_state_1196= labour_market_state; itl_1196=itl; itl_anses_1196= itl_anses; validated_quarters_1196=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1196=1;keep id validated_quarters_1196 itl_1196 itl_anses_1196 labour_market_state_1196 monotributo_1196 autonomo_1196; run; proc sort data=past_career_1196; by id; run;
data past_career_1197; set past_career_1197; monotributo_1197=0; autonomo_1197=0; if monotributo=1 then monotributo_1197=1; if autonomo=1 then autonomo_1197=1; labour_market_state_1197= labour_market_state; itl_1197=itl; itl_anses_1197= itl_anses; validated_quarters_1197=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1197=1;keep id validated_quarters_1197 itl_1197 itl_anses_1197 labour_market_state_1197 monotributo_1197 autonomo_1197; run; proc sort data=past_career_1197; by id; run;
data past_career_1198; set past_career_1198; monotributo_1198=0; autonomo_1198=0; if monotributo=1 then monotributo_1198=1; if autonomo=1 then autonomo_1198=1; labour_market_state_1198= labour_market_state; itl_1198=itl; itl_anses_1198= itl_anses; validated_quarters_1198=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1198=1;keep id validated_quarters_1198 itl_1198 itl_anses_1198 labour_market_state_1198 monotributo_1198 autonomo_1198; run; proc sort data=past_career_1198; by id; run;
data past_career_1199; set past_career_1199; monotributo_1199=0; autonomo_1199=0; if monotributo=1 then monotributo_1199=1; if autonomo=1 then autonomo_1199=1; labour_market_state_1199= labour_market_state; itl_1199=itl; itl_anses_1199= itl_anses; validated_quarters_1199=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1199=1;keep id validated_quarters_1199 itl_1199 itl_anses_1199 labour_market_state_1199 monotributo_1199 autonomo_1199; run; proc sort data=past_career_1199; by id; run;
data past_career_1200; set past_career_1200; monotributo_1200=0; autonomo_1200=0; if monotributo=1 then monotributo_1200=1; if autonomo=1 then autonomo_1200=1; labour_market_state_1200= labour_market_state; itl_1200=itl; itl_anses_1200= itl_anses; validated_quarters_1200=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1200=1;keep id validated_quarters_1200 itl_1200 itl_anses_1200 labour_market_state_1200 monotributo_1200 autonomo_1200; run; proc sort data=past_career_1200; by id; run;
data past_career_1201; set past_career_1201; monotributo_1201=0; autonomo_1201=0; if monotributo=1 then monotributo_1201=1; if autonomo=1 then autonomo_1201=1; labour_market_state_1201= labour_market_state; itl_1201=itl; itl_anses_1201= itl_anses; validated_quarters_1201=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1201=1;keep id validated_quarters_1201 itl_1201 itl_anses_1201 labour_market_state_1201 monotributo_1201 autonomo_1201; run; proc sort data=past_career_1201; by id; run;
data past_career_1202; set past_career_1202; monotributo_1202=0; autonomo_1202=0; if monotributo=1 then monotributo_1202=1; if autonomo=1 then autonomo_1202=1; labour_market_state_1202= labour_market_state; itl_1202=itl; itl_anses_1202= itl_anses; validated_quarters_1202=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1202=1;keep id validated_quarters_1202 itl_1202 itl_anses_1202 labour_market_state_1202 monotributo_1202 autonomo_1202; run; proc sort data=past_career_1202; by id; run;
data past_career_1203; set past_career_1203; monotributo_1203=0; autonomo_1203=0; if monotributo=1 then monotributo_1203=1; if autonomo=1 then autonomo_1203=1; labour_market_state_1203= labour_market_state; itl_1203=itl; itl_anses_1203= itl_anses; validated_quarters_1203=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1203=1;keep id validated_quarters_1203 itl_1203 itl_anses_1203 labour_market_state_1203 monotributo_1203 autonomo_1203; run; proc sort data=past_career_1203; by id; run;
data past_career_1204; set past_career_1204; monotributo_1204=0; autonomo_1204=0; if monotributo=1 then monotributo_1204=1; if autonomo=1 then autonomo_1204=1; labour_market_state_1204= labour_market_state; itl_1204=itl; itl_anses_1204= itl_anses; validated_quarters_1204=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1204=1;keep id validated_quarters_1204 itl_1204 itl_anses_1204 labour_market_state_1204 monotributo_1204 autonomo_1204; run; proc sort data=past_career_1204; by id; run;
data past_career_1205; set past_career_1205; monotributo_1205=0; autonomo_1205=0; if monotributo=1 then monotributo_1205=1; if autonomo=1 then autonomo_1205=1; labour_market_state_1205= labour_market_state; itl_1205=itl; itl_anses_1205= itl_anses; validated_quarters_1205=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1205=1;keep id validated_quarters_1205 itl_1205 itl_anses_1205 labour_market_state_1205 monotributo_1205 autonomo_1205; run; proc sort data=past_career_1205; by id; run;
data past_career_1206; set past_career_1206; monotributo_1206=0; autonomo_1206=0; if monotributo=1 then monotributo_1206=1; if autonomo=1 then autonomo_1206=1; labour_market_state_1206= labour_market_state; itl_1206=itl; itl_anses_1206= itl_anses; validated_quarters_1206=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1206=1;keep id validated_quarters_1206 itl_1206 itl_anses_1206 labour_market_state_1206 monotributo_1206 autonomo_1206; run; proc sort data=past_career_1206; by id; run;
data past_career_1207; set past_career_1207; monotributo_1207=0; autonomo_1207=0; if monotributo=1 then monotributo_1207=1; if autonomo=1 then autonomo_1207=1; labour_market_state_1207= labour_market_state; itl_1207=itl; itl_anses_1207= itl_anses; validated_quarters_1207=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1207=1;keep id validated_quarters_1207 itl_1207 itl_anses_1207 labour_market_state_1207 monotributo_1207 autonomo_1207; run; proc sort data=past_career_1207; by id; run;
data past_career_1208; set past_career_1208; monotributo_1208=0; autonomo_1208=0; if monotributo=1 then monotributo_1208=1; if autonomo=1 then autonomo_1208=1; labour_market_state_1208= labour_market_state; itl_1208=itl; itl_anses_1208= itl_anses; validated_quarters_1208=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1208=1;keep id validated_quarters_1208 itl_1208 itl_anses_1208 labour_market_state_1208 monotributo_1208 autonomo_1208; run; proc sort data=past_career_1208; by id; run;
data past_career_1209; set past_career_1209; monotributo_1209=0; autonomo_1209=0; if monotributo=1 then monotributo_1209=1; if autonomo=1 then autonomo_1209=1; labour_market_state_1209= labour_market_state; itl_1209=itl; itl_anses_1209= itl_anses; validated_quarters_1209=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1209=1;keep id validated_quarters_1209 itl_1209 itl_anses_1209 labour_market_state_1209 monotributo_1209 autonomo_1209; run; proc sort data=past_career_1209; by id; run;
data past_career_1210; set past_career_1210; monotributo_1210=0; autonomo_1210=0; if monotributo=1 then monotributo_1210=1; if autonomo=1 then autonomo_1210=1; labour_market_state_1210= labour_market_state; itl_1210=itl; itl_anses_1210= itl_anses; validated_quarters_1210=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1210=1;keep id validated_quarters_1210 itl_1210 itl_anses_1210 labour_market_state_1210 monotributo_1210 autonomo_1210; run; proc sort data=past_career_1210; by id; run;
data past_career_1211; set past_career_1211; monotributo_1211=0; autonomo_1211=0; if monotributo=1 then monotributo_1211=1; if autonomo=1 then autonomo_1211=1; labour_market_state_1211= labour_market_state; itl_1211=itl; itl_anses_1211= itl_anses; validated_quarters_1211=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1211=1;keep id validated_quarters_1211 itl_1211 itl_anses_1211 labour_market_state_1211 monotributo_1211 autonomo_1211; run; proc sort data=past_career_1211; by id; run;
data past_career_1212; set past_career_1212; monotributo_1212=0; autonomo_1212=0; if monotributo=1 then monotributo_1212=1; if autonomo=1 then autonomo_1212=1; labour_market_state_1212= labour_market_state; itl_1212=itl; itl_anses_1212= itl_anses; validated_quarters_1212=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1212=1;keep id validated_quarters_1212 itl_1212 itl_anses_1212 labour_market_state_1212 monotributo_1212 autonomo_1212; run; proc sort data=past_career_1212; by id; run;
data past_career_1213; set past_career_1213; monotributo_1213=0; autonomo_1213=0; if monotributo=1 then monotributo_1213=1; if autonomo=1 then autonomo_1213=1; labour_market_state_1213= labour_market_state; itl_1213=itl; itl_anses_1213= itl_anses; validated_quarters_1213=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1213=1;keep id validated_quarters_1213 itl_1213 itl_anses_1213 labour_market_state_1213 monotributo_1213 autonomo_1213; run; proc sort data=past_career_1213; by id; run;
data past_career_1214; set past_career_1214; monotributo_1214=0; autonomo_1214=0; if monotributo=1 then monotributo_1214=1; if autonomo=1 then autonomo_1214=1; labour_market_state_1214= labour_market_state; itl_1214=itl; itl_anses_1214= itl_anses; validated_quarters_1214=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1214=1;keep id validated_quarters_1214 itl_1214 itl_anses_1214 labour_market_state_1214 monotributo_1214 autonomo_1214; run; proc sort data=past_career_1214; by id; run;
data past_career_1215; set past_career_1215; monotributo_1215=0; autonomo_1215=0; if monotributo=1 then monotributo_1215=1; if autonomo=1 then autonomo_1215=1; labour_market_state_1215= labour_market_state; itl_1215=itl; itl_anses_1215= itl_anses; validated_quarters_1215=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1215=1;keep id validated_quarters_1215 itl_1215 itl_anses_1215 labour_market_state_1215 monotributo_1215 autonomo_1215; run; proc sort data=past_career_1215; by id; run;
data past_career_1216; set past_career_1216; monotributo_1216=0; autonomo_1216=0; if monotributo=1 then monotributo_1216=1; if autonomo=1 then autonomo_1216=1; labour_market_state_1216= labour_market_state; itl_1216=itl; itl_anses_1216= itl_anses; validated_quarters_1216=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1216=1;keep id validated_quarters_1216 itl_1216 itl_anses_1216 labour_market_state_1216 monotributo_1216 autonomo_1216; run; proc sort data=past_career_1216; by id; run;
data past_career_1217; set past_career_1217; monotributo_1217=0; autonomo_1217=0; if monotributo=1 then monotributo_1217=1; if autonomo=1 then autonomo_1217=1; labour_market_state_1217= labour_market_state; itl_1217=itl; itl_anses_1217= itl_anses; validated_quarters_1217=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1217=1;keep id validated_quarters_1217 itl_1217 itl_anses_1217 labour_market_state_1217 monotributo_1217 autonomo_1217; run; proc sort data=past_career_1217; by id; run;
data past_career_1218; set past_career_1218; monotributo_1218=0; autonomo_1218=0; if monotributo=1 then monotributo_1218=1; if autonomo=1 then autonomo_1218=1; labour_market_state_1218= labour_market_state; itl_1218=itl; itl_anses_1218= itl_anses; validated_quarters_1218=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1218=1;keep id validated_quarters_1218 itl_1218 itl_anses_1218 labour_market_state_1218 monotributo_1218 autonomo_1218; run; proc sort data=past_career_1218; by id; run;
data past_career_1219; set past_career_1219; monotributo_1219=0; autonomo_1219=0; if monotributo=1 then monotributo_1219=1; if autonomo=1 then autonomo_1219=1; labour_market_state_1219= labour_market_state; itl_1219=itl; itl_anses_1219= itl_anses; validated_quarters_1219=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1219=1;keep id validated_quarters_1219 itl_1219 itl_anses_1219 labour_market_state_1219 monotributo_1219 autonomo_1219; run; proc sort data=past_career_1219; by id; run;
data past_career_1220; set past_career_1220; monotributo_1220=0; autonomo_1220=0; if monotributo=1 then monotributo_1220=1; if autonomo=1 then autonomo_1220=1; labour_market_state_1220= labour_market_state; itl_1220=itl; itl_anses_1220= itl_anses; validated_quarters_1220=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1220=1;keep id validated_quarters_1220 itl_1220 itl_anses_1220 labour_market_state_1220 monotributo_1220 autonomo_1220; run; proc sort data=past_career_1220; by id; run;
data past_career_1221; set past_career_1221; monotributo_1221=0; autonomo_1221=0; if monotributo=1 then monotributo_1221=1; if autonomo=1 then autonomo_1221=1; labour_market_state_1221= labour_market_state; itl_1221=itl; itl_anses_1221= itl_anses; validated_quarters_1221=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1221=1;keep id validated_quarters_1221 itl_1221 itl_anses_1221 labour_market_state_1221 monotributo_1221 autonomo_1221; run; proc sort data=past_career_1221; by id; run;
data past_career_1222; set past_career_1222; monotributo_1222=0; autonomo_1222=0; if monotributo=1 then monotributo_1222=1; if autonomo=1 then autonomo_1222=1; labour_market_state_1222= labour_market_state; itl_1222=itl; itl_anses_1222= itl_anses; validated_quarters_1222=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1222=1;keep id validated_quarters_1222 itl_1222 itl_anses_1222 labour_market_state_1222 monotributo_1222 autonomo_1222; run; proc sort data=past_career_1222; by id; run;
data past_career_1223; set past_career_1223; monotributo_1223=0; autonomo_1223=0; if monotributo=1 then monotributo_1223=1; if autonomo=1 then autonomo_1223=1; labour_market_state_1223= labour_market_state; itl_1223=itl; itl_anses_1223= itl_anses; validated_quarters_1223=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1223=1;keep id validated_quarters_1223 itl_1223 itl_anses_1223 labour_market_state_1223 monotributo_1223 autonomo_1223; run; proc sort data=past_career_1223; by id; run;
data past_career_1224; set past_career_1224; monotributo_1224=0; autonomo_1224=0; if monotributo=1 then monotributo_1224=1; if autonomo=1 then autonomo_1224=1; labour_market_state_1224= labour_market_state; itl_1224=itl; itl_anses_1224= itl_anses; validated_quarters_1224=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1224=1;keep id validated_quarters_1224 itl_1224 itl_anses_1224 labour_market_state_1224 monotributo_1224 autonomo_1224; run; proc sort data=past_career_1224; by id; run;
data past_career_1225; set past_career_1225; monotributo_1225=0; autonomo_1225=0; if monotributo=1 then monotributo_1225=1; if autonomo=1 then autonomo_1225=1; labour_market_state_1225= labour_market_state; itl_1225=itl; itl_anses_1225= itl_anses; validated_quarters_1225=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1225=1;keep id validated_quarters_1225 itl_1225 itl_anses_1225 labour_market_state_1225 monotributo_1225 autonomo_1225; run; proc sort data=past_career_1225; by id; run;
data past_career_1226; set past_career_1226; monotributo_1226=0; autonomo_1226=0; if monotributo=1 then monotributo_1226=1; if autonomo=1 then autonomo_1226=1; labour_market_state_1226= labour_market_state; itl_1226=itl; itl_anses_1226= itl_anses; validated_quarters_1226=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1226=1;keep id validated_quarters_1226 itl_1226 itl_anses_1226 labour_market_state_1226 monotributo_1226 autonomo_1226; run; proc sort data=past_career_1226; by id; run;
data past_career_1227; set past_career_1227; monotributo_1227=0; autonomo_1227=0; if monotributo=1 then monotributo_1227=1; if autonomo=1 then autonomo_1227=1; labour_market_state_1227= labour_market_state; itl_1227=itl; itl_anses_1227= itl_anses; validated_quarters_1227=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1227=1;keep id validated_quarters_1227 itl_1227 itl_anses_1227 labour_market_state_1227 monotributo_1227 autonomo_1227; run; proc sort data=past_career_1227; by id; run;
data past_career_1228; set past_career_1228; monotributo_1228=0; autonomo_1228=0; if monotributo=1 then monotributo_1228=1; if autonomo=1 then autonomo_1228=1; labour_market_state_1228= labour_market_state; itl_1228=itl; itl_anses_1228= itl_anses; validated_quarters_1228=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1228=1;keep id validated_quarters_1228 itl_1228 itl_anses_1228 labour_market_state_1228 monotributo_1228 autonomo_1228; run; proc sort data=past_career_1228; by id; run;
data past_career_1229; set past_career_1229; monotributo_1229=0; autonomo_1229=0; if monotributo=1 then monotributo_1229=1; if autonomo=1 then autonomo_1229=1; labour_market_state_1229= labour_market_state; itl_1229=itl; itl_anses_1229= itl_anses; validated_quarters_1229=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1229=1;keep id validated_quarters_1229 itl_1229 itl_anses_1229 labour_market_state_1229 monotributo_1229 autonomo_1229; run; proc sort data=past_career_1229; by id; run;
data past_career_1230; set past_career_1230; monotributo_1230=0; autonomo_1230=0; if monotributo=1 then monotributo_1230=1; if autonomo=1 then autonomo_1230=1; labour_market_state_1230= labour_market_state; itl_1230=itl; itl_anses_1230= itl_anses; validated_quarters_1230=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1230=1;keep id validated_quarters_1230 itl_1230 itl_anses_1230 labour_market_state_1230 monotributo_1230 autonomo_1230; run; proc sort data=past_career_1230; by id; run;
data past_career_1231; set past_career_1231; monotributo_1231=0; autonomo_1231=0; if monotributo=1 then monotributo_1231=1; if autonomo=1 then autonomo_1231=1; labour_market_state_1231= labour_market_state; itl_1231=itl; itl_anses_1231= itl_anses; validated_quarters_1231=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1231=1;keep id validated_quarters_1231 itl_1231 itl_anses_1231 labour_market_state_1231 monotributo_1231 autonomo_1231; run; proc sort data=past_career_1231; by id; run;
data past_career_1232; set past_career_1232; monotributo_1232=0; autonomo_1232=0; if monotributo=1 then monotributo_1232=1; if autonomo=1 then autonomo_1232=1; labour_market_state_1232= labour_market_state; itl_1232=itl; itl_anses_1232= itl_anses; validated_quarters_1232=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1232=1;keep id validated_quarters_1232 itl_1232 itl_anses_1232 labour_market_state_1232 monotributo_1232 autonomo_1232; run; proc sort data=past_career_1232; by id; run;
data past_career_1233; set past_career_1233; monotributo_1233=0; autonomo_1233=0; if monotributo=1 then monotributo_1233=1; if autonomo=1 then autonomo_1233=1; labour_market_state_1233= labour_market_state; itl_1233=itl; itl_anses_1233= itl_anses; validated_quarters_1233=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1233=1;keep id validated_quarters_1233 itl_1233 itl_anses_1233 labour_market_state_1233 monotributo_1233 autonomo_1233; run; proc sort data=past_career_1233; by id; run;
data past_career_1234; set past_career_1234; monotributo_1234=0; autonomo_1234=0; if monotributo=1 then monotributo_1234=1; if autonomo=1 then autonomo_1234=1; labour_market_state_1234= labour_market_state; itl_1234=itl; itl_anses_1234= itl_anses; validated_quarters_1234=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1234=1;keep id validated_quarters_1234 itl_1234 itl_anses_1234 labour_market_state_1234 monotributo_1234 autonomo_1234; run; proc sort data=past_career_1234; by id; run;
data past_career_1235; set past_career_1235; monotributo_1235=0; autonomo_1235=0; if monotributo=1 then monotributo_1235=1; if autonomo=1 then autonomo_1235=1; labour_market_state_1235= labour_market_state; itl_1235=itl; itl_anses_1235= itl_anses; validated_quarters_1235=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1235=1;keep id validated_quarters_1235 itl_1235 itl_anses_1235 labour_market_state_1235 monotributo_1235 autonomo_1235; run; proc sort data=past_career_1235; by id; run;
data past_career_1236; set past_career_1236; monotributo_1236=0; autonomo_1236=0; if monotributo=1 then monotributo_1236=1; if autonomo=1 then autonomo_1236=1; labour_market_state_1236= labour_market_state; itl_1236=itl; itl_anses_1236= itl_anses; validated_quarters_1236=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1236=1;keep id validated_quarters_1236 itl_1236 itl_anses_1236 labour_market_state_1236 monotributo_1236 autonomo_1236; run; proc sort data=past_career_1236; by id; run;
data past_career_1237; set past_career_1237; monotributo_1237=0; autonomo_1237=0; if monotributo=1 then monotributo_1237=1; if autonomo=1 then autonomo_1237=1; labour_market_state_1237= labour_market_state; itl_1237=itl; itl_anses_1237= itl_anses; validated_quarters_1237=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1237=1;keep id validated_quarters_1237 itl_1237 itl_anses_1237 labour_market_state_1237 monotributo_1237 autonomo_1237; run; proc sort data=past_career_1237; by id; run;
data past_career_1238; set past_career_1238; monotributo_1238=0; autonomo_1238=0; if monotributo=1 then monotributo_1238=1; if autonomo=1 then autonomo_1238=1; labour_market_state_1238= labour_market_state; itl_1238=itl; itl_anses_1238= itl_anses; validated_quarters_1238=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1238=1;keep id validated_quarters_1238 itl_1238 itl_anses_1238 labour_market_state_1238 monotributo_1238 autonomo_1238; run; proc sort data=past_career_1238; by id; run;
data past_career_1239; set past_career_1239; monotributo_1239=0; autonomo_1239=0; if monotributo=1 then monotributo_1239=1; if autonomo=1 then autonomo_1239=1; labour_market_state_1239= labour_market_state; itl_1239=itl; itl_anses_1239= itl_anses; validated_quarters_1239=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1239=1;keep id validated_quarters_1239 itl_1239 itl_anses_1239 labour_market_state_1239 monotributo_1239 autonomo_1239; run; proc sort data=past_career_1239; by id; run;
data past_career_1240; set past_career_1240; monotributo_1240=0; autonomo_1240=0; if monotributo=1 then monotributo_1240=1; if autonomo=1 then autonomo_1240=1; labour_market_state_1240= labour_market_state; itl_1240=itl; itl_anses_1240= itl_anses; validated_quarters_1240=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1240=1;keep id validated_quarters_1240 itl_1240 itl_anses_1240 labour_market_state_1240 monotributo_1240 autonomo_1240; run; proc sort data=past_career_1240; by id; run;
data past_career_1241; set past_career_1241; monotributo_1241=0; autonomo_1241=0; if monotributo=1 then monotributo_1241=1; if autonomo=1 then autonomo_1241=1; labour_market_state_1241= labour_market_state; itl_1241=itl; itl_anses_1241= itl_anses; validated_quarters_1241=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1241=1;keep id validated_quarters_1241 itl_1241 itl_anses_1241 labour_market_state_1241 monotributo_1241 autonomo_1241; run; proc sort data=past_career_1241; by id; run;
data past_career_1242; set past_career_1242; monotributo_1242=0; autonomo_1242=0; if monotributo=1 then monotributo_1242=1; if autonomo=1 then autonomo_1242=1; labour_market_state_1242= labour_market_state; itl_1242=itl; itl_anses_1242= itl_anses; validated_quarters_1242=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1242=1;keep id validated_quarters_1242 itl_1242 itl_anses_1242 labour_market_state_1242 monotributo_1242 autonomo_1242; run; proc sort data=past_career_1242; by id; run;
data past_career_1243; set past_career_1243; monotributo_1243=0; autonomo_1243=0; if monotributo=1 then monotributo_1243=1; if autonomo=1 then autonomo_1243=1; labour_market_state_1243= labour_market_state; itl_1243=itl; itl_anses_1243= itl_anses; validated_quarters_1243=0; if ( labour_market_state=1| labour_market_state=2| monotributo=1| autonomo=1) then validated_quarters_1243=1;keep id validated_quarters_1243 itl_1243 itl_anses_1243 labour_market_state_1243 monotributo_1243 autonomo_1243; run; proc sort data=past_career_1243; by id; run;
data past_career; 
merge past_career_0 past_career_&first_period. -past_career_1243; 
by id; 
run; 
%m_zero(past_career);
 
data past_career; 
set past_career; 

validated_quarters_tot=sum(of validated_quarters_0 validated_quarters_&first_period.-validated_quarters_1243);
/*1162  is the fourth quarter of 1974, the first wave of the EPH (October 1974). Thus, the career estimated before that date is done 
		with fictitious labour-market participation proportions. We opted to also count these pre-74 validated quarters in a distinct 
		variable. */
validated_quarters_74_tot=sum(of validated_quarters_1162-validated_quarters_1243);
run; 

data past_career; 
SET past_career; 
keep id validated_quarters_tot validated_quarters_74_tot 
itl_0 itl_&first_period.-itl_1243 itl_anses_0 itl_anses_&first_period.-itl_anses_1243
labour_market_state_0 labour_market_state_&first_period.-labour_market_state_1243
monotributo_&first_period.-monotributo_1066 autonomo_&first_period.-autonomo_1066 ; 
run; 
options nofmterr; 
data id_dataset;
set &library..both_id_&year._t&quarter.; 
keep id_long id_short; 
run; 
data past_career; 
set past_career; 
rename id=id_short; 
run; 
proc sort data=past_career; 
by id_short; 
run; 
proc sort data=id_dataset; 
by id_short; 
run; 
data id_dataset; 
merge past_career id_dataset; 
by id_short; 
drop id_long;
run; 
data formatted_dataset; 
set &library..microsim_base_&year._t&quarter.; 
run; 
data id_dataset; 
set id_dataset; 
rename id_short=id; 
run; 
proc sort data=id_dataset;
by id; 
run; 
proc sort data=formatted_dataset; 
by id; run; 
data &library..career_data_&period.; 
merge formatted_dataset id_dataset; 
by id; 
if missing(male) then delete;
run; 
%mend;
%import_past_careers(&library.,&year.,&quarter.,&short_period.,&long_period.,&seed.);

/*We then import four different actualisation indexes: one is the official CPI index (or the average of the CPI indexes of San Luis and the City 
		of Buenos Aires when this index was not issued by late 2015 /early 2016). 
		The others are various discounting indexes that may be used to compute the reference income, from which is then computed the first
		retirement pension. These are the pre-2016 discounting index designed by ANSES (ANSES_1), the post-2016 index adopted by ANSES 
		(ANSES_2), which mostly follows wage indexes, and the discounting index established by the Eliff ruling. See section 1.3.3. of the 
		thesis to learn more about these conflicting discounting indexes. 
The base of all these indexes is November 2014 / the fourth quarter of 2014. */
/*We use these indexes further down to compute accumulated retirement rights with SAS.*/
proc import out= &library..discounting_indexes file="H:\LIAM2_commented_code\Historical_indexes\discounting and inflation indexes.csv"
dbms=csv replace; run; 
data &library..career_data_&short_period.; 
set &library..career_data_&short_period.;  
merging_variable=1; 
run; 
data discounting_indexes; 
set &library..discounting_indexes; 
merging_variable=1; run; 
data &library..career_data_&short_period.; 
merge &library..career_data_&short_period. discounting_indexes; 
by merging_variable; 
run; 
data &library..career_data_&short_period.; 
set &library..career_data_&short_period.; 
drop merging_variable; run; 

/*We then import historical proportions of independent workers affiliated either in the Monotributo or the Autonomous Workers regimes.
		We only use these proportions since the introduction of the monotributo in late 1998, since we assume independent workers of the 
		formal sector before that date were contributing at least to the Autonomous Workers regime. */
PROC IMPORT OUT=&library..auton_and_monotributistas
            DATAFILE="H:\LIAM2_commented_code\Historical_indexes\Computed proportions of monotributistas and autonomous workers\base_coeff_mono_auto.csv"
            DBMS=csv REPLACE;
RUN;
/*We then use these proportions to assign independent workers of the formal sector or informal workers to either the autonomous workers 
		or the small independent workers (monotributo) regimes. See section 1.2.2. of the thesis, and specifically Figure 1.4., for an explanation
		on how we take into account independent contributors to social security. */
/*The general idea is we rank separately formal sector independent workers and informal workers by earned income. We already do that in our
		retrospective simulations. The only thing is we also need the proportion of independent contributors for the starting dataset, 
		an information not present in the EPHc (we only know whether wage-earners contribute to social security). This is what the 
		auton_mono macro is for. */
%macro auton_mono(library,period,ano4,trimestre,period_bis); 
data men_base; 
set &library..microsim_base_&ano4._t&trimestre.; 
	where male="True" & 15<age<70; 
	keep id age agegroup male itl labour_market_state period; 
run; 
data wom_base; 
set &library..microsim_base_&ano4._t&trimestre.; 
	where male="False"& 15<age<70;  
	keep id age agegroup male itl labour_market_state period; 
run; 
proc sort data=men_base; 
	by agegroup male; 
run; 
proc sort data=wom_base; 
	by agegroup male; 
run; 
proc sort data=&library..auton_and_monotributistas; 
	by agegroup male; 
ruN; 
/*We cover in this macro starting datasets that range from the second quarter of 2015 to the first quarter of 2014. The csv has proportions
		of people in the autonomous workers or monotributo regimes up to the fourth quarter of 2017. You may execute the code with different 
		starting datasets if you modify this macro accordingly (remember, the fourth quarter of 2014 is period 48 and 1000 in our enumeration).
*/
data men_base; 
merge men_base &library..auton_and_monotributistas; 
	by agegroup male; 
		if missing(id) 
			then delete; 
		if period=48 
			then do; 
				coeff_aut=_1000a; 
				coeff_mono=_1000b; 
			end; 
		if period=47 
			then do; 
				coeff_aut=_1001a; 
				coeff_mono=_1001b; 
			end; 
		if period=46
			then do; 
				coeff_aut=_1002a; 
				coeff_mono=_1002b;
			end; 
		if period=45 
			then do; 
				coeff_aut=_1003a; 
				coeff_mono=_1003b;
			end; 
		if period=44 
			then do; 
				coeff_aut=_1004a; 
				coeff_mono=_1004b; 
			end; 
		if period=43
			then do; 
				coeff_aut=_1005a; 
				coeff_mono=_1005b; 
			end; 
run; 
data wom_base; 
merge wom_base &library..auton_and_monotributistas; 
	by agegroup male; 
		if missing(id) 
			then delete; 
		if period=48 
			then do; 
				coeff_aut=_1000a; 
				coeff_mono=_1000b;
			end; 
		if period=47 
			then do; 
				coeff_aut=_1001a; 
				coeff_mono=_1001b; 
			end; 
		if period=46 
			then do; 
				coeff_aut=_1002a;
				coeff_mono=_1002b;
			end; 
		if period=45
			then do; 
				coeff_aut=_1003a; 
				coeff_mono=_1003b;
			end; 
		if period=44
			then do; 
				coeff_aut=_1004a; 
				coeff_mono=_1004b;
			end; 
		if period=43
			then do; 
				coeff_aut=_1005a;
				coeff_mono=_1005b; 
			end; 
run; 
proc freq data=men_base; 
	table agegroup / out=agegroup_men; 
run; 
proc freq data=wom_base; 
	table agegroup / out=agegroup_wom; 
run; 
data agegroup_men; 
set agegroup_men; 
	keep count agegroup;
run; 

data agegroup_wom; 
set agegroup_wom; 
	keep count agegroup;
run; 
proc sort data=men_base; 
	by agegroup; 
run; 
proc sort data=wom_base; 
	by agegroup;
run; 
data men_base; 
merge men_base agegroup_men; 
	by agegroup; 
run; 
data wom_base; 
merge wom_base agegroup_wom; 
	by agegroup;
run; 
/*Are possible independent contributors people which we identified as independent workers of the formal sector or informal workers. 
		For the sake of consistency with our dynamic microsimulation model, we opted to include in the analysis dependent informal 
		workers. The wealthiest informal workers will be considered monotributistas, regardless of whether their main occupation is 
		as an own-account worker. In future versions of this model, it may be better to simulate independent workers of the informal 
		sector separately from dependent wage-earners (and thus add a sixth possible value to the labour market state variable).*/
data men_base; 
set men_base; 
	where labour_market_state=2 | labour_market_state=3; 
run; 
data wom_base; 
set wom_base; 
	where labour_market_state=2 | labour_market_state=3; 
run; 
proc sort data=men_base; 
	by agegroup labour_market_state descending itl; 
run;
proc sort data=wom_base; 
	by agegroup labour_market_state descending itl; 
run;


data men_base; 
set men_base; 
	by agegroup labour_market_state descending itl;
		autonomo_&period_bis.=0; 
		monotributo_&period_bis.=0; 
		if agegroup=16 
			then do; 
				if first.id 
					then rank_16=1; 
					else rank_16+1; 
				if rank_16<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=20 
			then do; 
				if first.id 
					then rank_20=1; 
					else rank_20+1; 
				if rank_20<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=25 
			then do; 
				if first.id 
					then rank_25=1; 
					else rank_25+1;
				if rank_25<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=30 
			then do; 
				if first.id 
					then rank_30=1; 
					else rank_30+1; 
				if rank_30<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=35 
			then do; 
				if first.id 
					then rank_35=1; 
					else rank_35+1; 
				if rank_35<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=40 
			then do; 
				if first.id 
					then rank_40=1; 
					else rank_40+1; 
				if rank_40<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=45 
			then do; 
				if first.id 
					then rank_45=1; 
					else rank_45+1; 
				if rank_45<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=50 
			then do; 
				if first.id
					then rank_50=1; 
					else rank_50+1; 
				if rank_50<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=55 
			then do; 
				if first.id 
					then rank_55=1; 
					else rank_55+1; 
				if rank_55<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=60 
			then do; 
				if first.id 
					then rank_60=1; 
					else rank_60+1; 
				if rank_60<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1; 
			end; 
		if agegroup=65 
			then do; 
				if first.id
					then rank_65=1; 
					else rank_65+1; 
				if rank_65<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup^=16
			then rank_16=0; 
		if agegroup^=20 
			then rank_20=0; 
		if agegroup^=25 
			then rank_25=0; 
		if agegroup^=30 
			then rank_30=0; 
		if agegroup^=35 
			then rank_35=0; 
		if agegroup^=40 
			then rank_40=0; 
		if agegroup^=45 
			then rank_45=0; 
		if agegroup^=50 
			then rank_50=0; 
		if agegroup^=55 
			then rank_55=0; 
		if agegroup^=60 
			then rank_60=0; 
		if agegroup^=65 
			then rank_65=0; 
run; 




data wom_base; 
set wom_base; 
	by agegroup labour_market_state descending itl;
		autonomo_&period_bis.=0; 
		monotributo_&period_bis.=0; 
		if agegroup=16 
			then do; 
				if first.id 
					then rank_16=1; 
					else rank_16+1; 
				if rank_16<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=20 
			then do; 
				if first.id 
					then rank_20=1; 
					else rank_20+1; 
				if rank_20<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=25 
			then do; 
				if first.id 
					then rank_25=1; 
					else rank_25+1;
				if rank_25<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=30 
			then do; 
				if first.id 
					then rank_30=1; 
					else rank_30+1; 
				if rank_30<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=35 
			then do; 
				if first.id 
					then rank_35=1; 
					else rank_35+1; 
				if rank_35<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=40 
			then do; 
				if first.id 
					then rank_40=1; 
					else rank_40+1; 
				if rank_40<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=45 
			then do; 
				if first.id 
					then rank_45=1; 
					else rank_45+1; 
				if rank_45<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=50 
			then do; 
				if first.id
					then rank_50=1; 
					else rank_50+1; 
				if rank_50<=round(count*coeff_aut)
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=55 
			then do; 
				if first.id 
					then rank_55=1; 
					else rank_55+1; 
				if rank_55<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup=60 
			then do; 
				if first.id 
					then rank_60=1; 
					else rank_60+1; 
				if rank_60<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1; 
			end; 
		if agegroup=65 
			then do; 
				if first.id
					then rank_65=1; 
					else rank_65+1; 
				if rank_65<=round(count*coeff_aut) 
					then autonomo_&period_bis.=1;
			end; 
		if agegroup^=16
			then rank_16=0; 
		if agegroup^=20 
			then rank_20=0; 
		if agegroup^=25 
			then rank_25=0; 
		if agegroup^=30 
			then rank_30=0; 
		if agegroup^=35 
			then rank_35=0; 
		if agegroup^=40 
			then rank_40=0; 
		if agegroup^=45 
			then rank_45=0; 
		if agegroup^=50 
			then rank_50=0; 
		if agegroup^=55 
			then rank_55=0; 
		if agegroup^=60 
			then rank_60=0; 
		if agegroup^=65 
			then rank_65=0; 
run; 

data men_base_aut; 
set men_base; 
	keep id autonomo_&period_bis.; 
run; 
data wom_base_aut; 
set wom_base; 
	keep id autonomo_&period_bis.; 
run; 

proc sort data=men_base_aut; 
	by id; 
run; 
proc sort data=wom_base_aut; 
	by id; 
ruN; 
proc sort data=&library..career_data_&period.; 
	by id; 
run; 
data &library..career_data_&period.; 
set &library..career_data_&period.; 
		autonomo_&period_bis.=0; 
		monotributo_&period_bis.=0; 
ruN; 
data &library..career_data_&period.; 
merge &library..career_data_&period. men_base_aut wom_base_aut; 
	by id; 
run; 
data men_base_mono; 
set men_base; 
	where autonomo_&period_bis.=0; 
	drop rank_16 rank_20 rank_25 rank_30 rank_35 rank_40 rank_45 rank_50 rank_55 rank_60 rank_65;   
run; 
data wom_base_mono; 
set wom_base; 
	where autonomo_&period_bis.=0; 
	drop rank_16 rank_20 rank_25 rank_30 rank_35 rank_40 rank_45 rank_50 rank_55 rank_60 rank_65;   
run; 


proc sort data=men_base_mono; 
	by agegroup labour_market_state descending itl; 
run;
proc sort data=wom_base_mono; 
	by agegroup labour_market_state descending itl; 
run;

data men_base_mono; 
set men_base_mono; 
	by agegroup labour_market_state descending itl;
		autonomo_&period_bis.=0; 
		monotributo_&period_bis.=0; 
		if agegroup=16 
			then do; 
				if first.id
					then rank_16=1; 
					else rank_16+1; 
				if autonomo_&period_bis.=0 & rank_16<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=20 
			then do; 
				if first.id 
					then rank_20=1; 
					else rank_20+1; 
				if autonomo_&period_bis.=0 & rank_20<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=25
			then do; 
				if first.id 
					then rank_25=1; 
					else rank_25+1;
				if autonomo_&period_bis.=0 & rank_25<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1;  
			end; 
		if agegroup=30
			then do; 
				if first.id 
					then rank_30=1; 
					else rank_30+1; 
				if autonomo_&period_bis.=0 & rank_30<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=35 
			then do; 
				if first.id 
					then rank_35=1; 
					else rank_35+1; 
				if autonomo_&period_bis.=0 & rank_35<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=40
			then do; 
				if first.id 
					then rank_40=1; 
					else rank_40+1; 
				if autonomo_&period_bis.=0 & rank_40<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=45 
			then do; 
				if first.id 
					then rank_45=1; 
					else rank_45+1; 
				if autonomo_&period_bis.=0 & rank_45<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=50
			then do; 
				if first.id
					then rank_50=1; 
					else rank_50+1; 
				if autonomo_&period_bis.=0 & rank_50<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=55 
			then do; 
				if first.id 
					then rank_55=1; 
					else rank_55+1; 
				if autonomo_&period_bis.=0 & rank_55<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=60
			then do; 
				if first.id
					then rank_60=1; 
					else rank_60+1; 
				if autonomo_&period_bis.=0 & rank_60<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=65
			then do; 
				if first.id 
					then rank_65=1; 
					else rank_65+1; 
				if autonomo_&period_bis.=0 & rank_65<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup^=16 
			then rank_16=0; 
		if agegroup^=20 	
			then rank_20=0; 
		if agegroup^=25 
			then rank_25=0; 
		if agegroup^=30 
			then rank_30=0; 
		if agegroup^=35 
			then rank_35=0; 
		if agegroup^=40 
			then rank_40=0; 
		if agegroup^=45 
			then rank_45=0; 
		if agegroup^=50 
			then rank_50=0; 
		if agegroup^=55 
			then rank_55=0; 
		if agegroup^=60 
			then rank_60=0; 
		if agegroup^=65 
			then rank_65=0; 
run; 




data wom_base_mono; 
set wom_base_mono; 
by agegroup labour_market_state descending itl;
		autonomo_&period_bis.=0; 
		monotributo_&period_bis.=0; 
		if agegroup=16 
			then do; 
				if first.id
					then rank_16=1; 
					else rank_16+1; 
				if autonomo_&period_bis.=0 & rank_16<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=20 
			then do; 
				if first.id 
					then rank_20=1; 
					else rank_20+1; 
				if autonomo_&period_bis.=0 & rank_20<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=25
			then do; 
				if first.id 
					then rank_25=1; 
					else rank_25+1;
				if autonomo_&period_bis.=0 & rank_25<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1;  
			end; 
		if agegroup=30
			then do; 
				if first.id 
					then rank_30=1; 
					else rank_30+1; 
				if autonomo_&period_bis.=0 & rank_30<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=35 
			then do; 
				if first.id 
					then rank_35=1; 
					else rank_35+1; 
				if autonomo_&period_bis.=0 & rank_35<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=40
			then do; 
				if first.id 
					then rank_40=1; 
					else rank_40+1; 
				if autonomo_&period_bis.=0 & rank_40<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=45 
			then do; 
				if first.id 
					then rank_45=1; 
					else rank_45+1; 
				if autonomo_&period_bis.=0 & rank_45<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=50
			then do; 
				if first.id
					then rank_50=1; 
					else rank_50+1; 
				if autonomo_&period_bis.=0 & rank_50<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=55 
			then do; 
				if first.id 
					then rank_55=1; 
					else rank_55+1; 
				if autonomo_&period_bis.=0 & rank_55<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=60
			then do; 
				if first.id
					then rank_60=1; 
					else rank_60+1; 
				if autonomo_&period_bis.=0 & rank_60<=round(count*coeff_mono)
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup=65
			then do; 
				if first.id 
					then rank_65=1; 
					else rank_65+1; 
				if autonomo_&period_bis.=0 & rank_65<=round(count*coeff_mono) 
					then monotributo_&period_bis.=1; 
			end; 
		if agegroup^=16 
			then rank_16=0; 
		if agegroup^=20 	
			then rank_20=0; 
		if agegroup^=25 
			then rank_25=0; 
		if agegroup^=30 
			then rank_30=0; 
		if agegroup^=35 
			then rank_35=0; 
		if agegroup^=40 
			then rank_40=0; 
		if agegroup^=45 
			then rank_45=0; 
		if agegroup^=50 
			then rank_50=0; 
		if agegroup^=55 
			then rank_55=0; 
		if agegroup^=60 
			then rank_60=0; 
		if agegroup^=65 
			then rank_65=0; 
run; 




data men_base_mono; 
set men_base_mono; 
	keep id  monotributo_&period_bis.; 
run; 
data wom_base_mono; 
set wom_base_mono; 
	keep id monotributo_&period_bis.; 
run; 

proc sort data=men_base_mono; 
	by id; 
run; 
proc sort data=wom_base_mono; 
	by id; 
ruN; 
proc sort data=&library..career_data_&period.; 
	by id; 
run; 
data &library..career_data_&period.; 
set &library..career_data_&period.; 
		autonomo_&period_bis.=0; 
		monotributo_&period_bis.=0; 
ruN; 
data &library..career_data_&period.; 
merge &library..career_data_&period. men_base_mono wom_base_mono; 
	by id; 
		val_mono_tot=sum(of monotributo_&period_bis.-monotributo_1066); 
		val_mono_tot_rref=sum(of monotributo_1061-monotributo_1066); 
run; 

%mend; 
%auton_mono(&library.,&short_period.,&year.,&quarter.,&lag_long_period.);
/*The next step after identifying autonomous workers and monotributistas in the past is deducing their retirement rights. This is done in 
		the macro %independent_rent below.
*/
%macro independent_rent(indata,primer_periodo);
/*There are income-linked autonomous workers and monotributista categories. Belonging to a given category is decided in our model 
		when comparing the real past simulated wage (with official CPI indexes) with the income conditions for belonging to a category. 
		On the other hand, the rent of reference of a given category, that is, the element that enters in the computation of the reference
		income, is discounted following the discounting index adopted by ANSES. 
		In this code, we use the discounting index that was in force on February 2015 for determining the reference income. It can be easily
		converted to the current discounting index, using in particular the &library..discounting_indexes dataset. 
*/
data &indata.; 
set &indata.;
/*Since 2007, people in the autonomous workers regime may roughly enter two contribution categories. The cheapest one is for own-account 
		workers, that do not employ workers. The more expensive category is for independent workers that employ other workers. We 
		can see with the instruction below that independent workers of the formal sector are evenly split between own-account workers 
		and bosses. 
proc freq data=&library..eph_data_formatted_2003_2015; 
weight pondera; 
where labour_market_state=2; 
table cat_ocup; 
run; 
As such, for the sake of simplicity, we assumed half of independent workers of the formal sector, randomly selected, are bosses. 
		It may be possible to stipulate the wealthiest independent workers of the formal sector are bosses, or use actual historical
		proportions of bosses / own-account workers for each period instead of the 50/50 split. This slightly complicates the code though, 
		without strongly affecting overall retirement rights. It is thus left for future work.
*/

array boss_{*} boss_993-boss_1032;
/********************************************************************************************/
array autonomo_{40} autonomo_993-autonomo_1032;
/********************************************************************************************/
do i=1 to 40;
call streaminit(&seed.) /*Put a negative number if you do not want a random seed. Else, this is the seed we use.*/;
boss_{i}=0; 
if autonomo_{i}=1 then do; 
x=RAND('BERNOULLI', 0.5); 
if x=1 then boss_{i}=1; 
end; 
drop x; 
end;
drop i;
run;

data &indata.; 
set &indata.; 


rent_aut_1083=0; 
rent_aut_1082=0; 
rent_aut_1081=0; 
rent_aut_1080=0; 
rent_aut_1079=0; 
rent_aut_1078=0; 
rent_aut_1077=0; 
rent_aut_1076=0; 
rent_aut_1075=0; 
rent_aut_1074=0; 
rent_aut_1073=0; 
rent_aut_1072=0; 
rent_aut_1071=0; 
rent_aut_1070=0; 
rent_aut_1069=0; 
rent_aut_1068=0; 
rent_aut_1067=0; 
rent_aut_1066=0; 
rent_aut_1065=0; 
rent_aut_1064=0; 
rent_aut_1063=0; 
rent_aut_1062=0; 
rent_aut_1061=0; 
rent_aut_1060=0; 
rent_aut_1059=0; 
rent_aut_1058=0; 
rent_aut_1057=0; 
rent_aut_1056=0; 
rent_aut_1055=0; 
rent_aut_1054=0; 
rent_aut_1053=0; 
rent_aut_1052=0; 
rent_aut_1051=0; 
rent_aut_1050=0; 
rent_aut_1049=0; 
rent_aut_1048=0; 
rent_aut_1047=0; 
rent_aut_1046=0; 
rent_aut_1045=0; 
rent_aut_1044=0; 
rent_aut_1043=0; 
rent_aut_1042=0; 
rent_aut_1041=0; 
rent_aut_1040=0; 
rent_aut_1039=0; 
rent_aut_1038=0; 
rent_aut_1037=0; 
rent_aut_1036=0; 
rent_aut_1035=0; 
rent_aut_1034=0; 
rent_aut_1033=0; 
rent_aut_1032=0; 
rent_aut_1031=0; 
rent_aut_1030=0; 
rent_aut_1029=0; 
rent_aut_1028=0; 
rent_aut_1027=0; 
rent_aut_1026=0; 
rent_aut_1025=0; 
rent_aut_1024=0; 
rent_aut_1023=0; 
rent_aut_1022=0; 
rent_aut_1021=0; 
rent_aut_1020=0; 
rent_aut_1019=0; 
rent_aut_1018=0; 
rent_aut_1017=0; 
rent_aut_1016=0; 
rent_aut_1015=0; 
rent_aut_1014=0; 
rent_aut_1013=0; 
rent_aut_1012=0; 
rent_aut_1011=0; 
rent_aut_1010=0; 
rent_aut_1009=0; 
rent_aut_1008=0; 
rent_aut_1007=0; 
rent_aut_1006=0; 
rent_aut_1005=0; 
rent_aut_1004=0; 
rent_aut_1003=0; 
rent_aut_1002=0; 
rent_aut_1001=0; 
rent_aut_1000=0; 
rent_aut_999=0; 
rent_aut_998=0; 
rent_aut_997=0; 
rent_aut_996=0; 
rent_aut_995=0; 
rent_aut_994=0; 
rent_aut_993=0; 


/*rent_aut_992=0; 
rent_aut_991=0; 
rent_aut_990=0; 
*/

if monotributo_1066=1 then rent_aut_1066=2520.2942668696;
if monotributo_1065=1 then rent_aut_1065=2520.2942668696;
if monotributo_1064=1 then rent_aut_1064=2520.2942668696;
if monotributo_1063=1 then rent_aut_1063=2520.2942668696;
if monotributo_1062=1 then rent_aut_1062=2520.2942668696;
if monotributo_1061=1 then rent_aut_1061=2520.2942668696;

auton_A_1083=0; Auton_B_1083=0; Auton_C_1083=0; Auton_D_1083=0; Auton_E_1083=0; Auton_F_1083=0; auton_g_1083=0; auton_h_1083=0; auton_i_1083=0; auton_J_1083=0;  
auton_A_1082=0; Auton_B_1082=0; Auton_C_1082=0; Auton_D_1082=0; Auton_E_1082=0; Auton_F_1082=0; auton_g_1082=0; auton_h_1082=0; auton_i_1082=0; auton_J_1082=0;  
 auton_A_1081=0; Auton_B_1081=0; Auton_C_1081=0; Auton_D_1081=0; Auton_E_1081=0; Auton_F_1081=0; auton_g_1081=0; auton_h_1081=0; auton_i_1081=0; auton_J_1081=0;  
auton_A_1080=0; Auton_B_1080=0; Auton_C_1080=0; Auton_D_1080=0; Auton_E_1080=0; Auton_F_1080=0; auton_g_1080=0; auton_h_1080=0; auton_i_1080=0; auton_J_1080=0;  
 auton_A_1079=0; Auton_B_1079=0; Auton_C_1079=0; Auton_D_1079=0; Auton_E_1079=0; Auton_F_1079=0; auton_g_1079=0; auton_h_1079=0; auton_i_1079=0; auton_J_1079=0;  
auton_A_1078=0; Auton_B_1078=0; Auton_C_1078=0; Auton_D_1078=0; Auton_E_1078=0; Auton_F_1078=0; auton_g_1078=0; auton_h_1078=0; auton_i_1078=0; auton_J_1078=0;  
 auton_A_1077=0; Auton_B_1077=0; Auton_C_1077=0; Auton_D_1077=0; Auton_E_1077=0; Auton_F_1077=0; auton_g_1077=0; auton_h_1077=0; auton_i_1077=0; auton_J_1077=0;  
auton_A_1076=0; Auton_B_1076=0; Auton_C_1076=0; Auton_D_1076=0; Auton_E_1076=0; Auton_F_1076=0; auton_g_1076=0; auton_h_1076=0; auton_i_1076=0; auton_J_1076=0;  
auton_A_1075=0; Auton_B_1075=0; Auton_C_1075=0; Auton_D_1075=0; Auton_E_1075=0; Auton_F_1075=0; auton_g_1075=0; auton_h_1075=0; auton_i_1075=0; auton_J_1075=0;  
 auton_A_1074=0; Auton_B_1074=0; Auton_C_1074=0; Auton_D_1074=0; Auton_E_1074=0; Auton_F_1074=0; auton_g_1074=0; auton_h_1074=0; auton_i_1074=0; auton_J_1074=0;  
 auton_A_1073=0; Auton_B_1073=0; Auton_C_1073=0; Auton_D_1073=0; Auton_E_1073=0; Auton_F_1073=0; auton_g_1073=0; auton_h_1073=0; auton_i_1073=0; auton_J_1073=0;  
 auton_A_1072=0; Auton_B_1072=0; Auton_C_1072=0; Auton_D_1072=0; Auton_E_1072=0; Auton_F_1072=0; auton_g_1072=0; auton_h_1072=0; auton_i_1072=0; auton_J_1072=0;  
auton_A_1071=0; Auton_B_1071=0; Auton_C_1071=0; Auton_D_1071=0; Auton_E_1071=0; Auton_F_1071=0; auton_g_1071=0; auton_h_1071=0; auton_i_1071=0; auton_J_1071=0;  
 auton_A_1070=0; Auton_B_1070=0; Auton_C_1070=0; Auton_D_1070=0; Auton_E_1070=0; Auton_F_1070=0; auton_g_1070=0; auton_h_1070=0; auton_i_1070=0; auton_J_1070=0;  
auton_A_1069=0; Auton_B_1069=0; Auton_C_1069=0; Auton_D_1069=0; Auton_E_1069=0; Auton_F_1069=0; auton_g_1069=0; auton_h_1069=0; auton_i_1069=0; auton_J_1069=0;  
auton_A_1068=0; Auton_B_1068=0; Auton_C_1068=0; Auton_D_1068=0; Auton_E_1068=0; Auton_F_1068=0; auton_g_1068=0; auton_h_1068=0; auton_i_1068=0; auton_J_1068=0;  
 auton_A_1067=0; Auton_B_1067=0; Auton_C_1067=0; Auton_D_1067=0; Auton_E_1067=0; Auton_F_1067=0; auton_g_1067=0; auton_h_1067=0; auton_i_1067=0; auton_J_1067=0; 
 
if autonomo_1066=0 then do; auton_A_1066=0; Auton_B_1066=0; Auton_C_1066=0; Auton_D_1066=0; Auton_E_1066=0; Auton_F_1066=0; auton_g_1066=0; auton_h_1066=0; auton_i_1066=0; auton_J_1066=0; end; 
if autonomo_1065=0 then do; auton_A_1065=0; Auton_B_1065=0; Auton_C_1065=0; Auton_D_1065=0; Auton_E_1065=0; Auton_F_1065=0; auton_g_1065=0; auton_h_1065=0; auton_i_1065=0; auton_J_1065=0; end; 
if autonomo_1064=0 then do; auton_A_1064=0; Auton_B_1064=0; Auton_C_1064=0; Auton_D_1064=0; Auton_E_1064=0; Auton_F_1064=0; auton_g_1064=0; auton_h_1064=0; auton_i_1064=0; auton_J_1064=0; end; 
if autonomo_1063=0 then do; auton_A_1063=0; Auton_B_1063=0; Auton_C_1063=0; Auton_D_1063=0; Auton_E_1063=0; Auton_F_1063=0; auton_g_1063=0; auton_h_1063=0; auton_i_1063=0; auton_J_1063=0; end; 
if autonomo_1062=0 then do; auton_A_1062=0; Auton_B_1062=0; Auton_C_1062=0; Auton_D_1062=0; Auton_E_1062=0; Auton_F_1062=0; auton_g_1062=0; auton_h_1062=0; auton_i_1062=0; auton_J_1062=0; end; 
if autonomo_1061=0 then do; auton_A_1061=0; Auton_B_1061=0; Auton_C_1061=0; Auton_D_1061=0; Auton_E_1061=0; Auton_F_1061=0; auton_g_1061=0; auton_h_1061=0; auton_i_1061=0; auton_J_1061=0; end; 
if autonomo_1060=0 then do; auton_A_1060=0; Auton_B_1060=0; Auton_C_1060=0; Auton_D_1060=0; Auton_E_1060=0; Auton_F_1060=0; auton_g_1060=0; auton_h_1060=0; auton_i_1060=0; auton_J_1060=0; end; 
if autonomo_1059=0 then do; auton_A_1059=0; Auton_B_1059=0; Auton_C_1059=0; Auton_D_1059=0; Auton_E_1059=0; Auton_F_1059=0; auton_g_1059=0; auton_h_1059=0; auton_i_1059=0; auton_J_1059=0; end; 
if autonomo_1058=0 then do; auton_A_1058=0; Auton_B_1058=0; Auton_C_1058=0; Auton_D_1058=0; Auton_E_1058=0; Auton_F_1058=0; auton_g_1058=0; auton_h_1058=0; auton_i_1058=0; auton_J_1058=0; end; 
if autonomo_1057=0 then do; auton_A_1057=0; Auton_B_1057=0; Auton_C_1057=0; Auton_D_1057=0; Auton_E_1057=0; Auton_F_1057=0; auton_g_1057=0; auton_h_1057=0; auton_i_1057=0; auton_J_1057=0; end; 
if autonomo_1056=0 then do; auton_A_1056=0; Auton_B_1056=0; Auton_C_1056=0; Auton_D_1056=0; Auton_E_1056=0; Auton_F_1056=0; auton_g_1056=0; auton_h_1056=0; auton_i_1056=0; auton_J_1056=0; end; 
if autonomo_1055=0 then do; auton_A_1055=0; Auton_B_1055=0; Auton_C_1055=0; Auton_D_1055=0; Auton_E_1055=0; Auton_F_1055=0; auton_g_1055=0; auton_h_1055=0; auton_i_1055=0; auton_J_1055=0; end; 
if autonomo_1054=0 then do; auton_A_1054=0; Auton_B_1054=0; Auton_C_1054=0; Auton_D_1054=0; Auton_E_1054=0; Auton_F_1054=0; auton_g_1054=0; auton_h_1054=0; auton_i_1054=0; auton_J_1054=0; end; 
if autonomo_1053=0 then do; auton_A_1053=0; Auton_B_1053=0; Auton_C_1053=0; Auton_D_1053=0; Auton_E_1053=0; Auton_F_1053=0; auton_g_1053=0; auton_h_1053=0; auton_i_1053=0; auton_J_1053=0; end; 
if autonomo_1052=0 then do; auton_A_1052=0; Auton_B_1052=0; Auton_C_1052=0; Auton_D_1052=0; Auton_E_1052=0; Auton_F_1052=0; auton_g_1052=0; auton_h_1052=0; auton_i_1052=0; auton_J_1052=0; end; 
if autonomo_1051=0 then do; auton_A_1051=0; Auton_B_1051=0; Auton_C_1051=0; Auton_D_1051=0; Auton_E_1051=0; Auton_F_1051=0; auton_g_1051=0; auton_h_1051=0; auton_i_1051=0; auton_J_1051=0; end; 
if autonomo_1050=0 then do; auton_A_1050=0; Auton_B_1050=0; Auton_C_1050=0; Auton_D_1050=0; Auton_E_1050=0; Auton_F_1050=0; auton_g_1050=0; auton_h_1050=0; auton_i_1050=0; auton_J_1050=0; end; 
if autonomo_1049=0 then do; auton_A_1049=0; Auton_B_1049=0; Auton_C_1049=0; Auton_D_1049=0; Auton_E_1049=0; Auton_F_1049=0; auton_g_1049=0; auton_h_1049=0; auton_i_1049=0; auton_J_1049=0; end; 
if autonomo_1048=0 then do; auton_A_1048=0; Auton_B_1048=0; Auton_C_1048=0; Auton_D_1048=0; Auton_E_1048=0; Auton_F_1048=0; auton_g_1048=0; auton_h_1048=0; auton_i_1048=0; auton_J_1048=0; end; 
if autonomo_1047=0 then do; auton_A_1047=0; Auton_B_1047=0; Auton_C_1047=0; Auton_D_1047=0; Auton_E_1047=0; Auton_F_1047=0; auton_g_1047=0; auton_h_1047=0; auton_i_1047=0; auton_J_1047=0; end; 
if autonomo_1046=0 then do; auton_A_1046=0; Auton_B_1046=0; Auton_C_1046=0; Auton_D_1046=0; Auton_E_1046=0; Auton_F_1046=0; auton_g_1046=0; auton_h_1046=0; auton_i_1046=0; auton_J_1046=0; end; 
if autonomo_1045=0 then do; auton_A_1045=0; Auton_B_1045=0; Auton_C_1045=0; Auton_D_1045=0; Auton_E_1045=0; Auton_F_1045=0; auton_g_1045=0; auton_h_1045=0; auton_i_1045=0; auton_J_1045=0; end; 
if autonomo_1044=0 then do; auton_A_1044=0; Auton_B_1044=0; Auton_C_1044=0; Auton_D_1044=0; Auton_E_1044=0; Auton_F_1044=0; auton_g_1044=0; auton_h_1044=0; auton_i_1044=0; auton_J_1044=0; end; 
if autonomo_1043=0 then do; auton_A_1043=0; Auton_B_1043=0; Auton_C_1043=0; Auton_D_1043=0; Auton_E_1043=0; Auton_F_1043=0; auton_g_1043=0; auton_h_1043=0; auton_i_1043=0; auton_J_1043=0; end; 
if autonomo_1042=0 then do; auton_A_1042=0; Auton_B_1042=0; Auton_C_1042=0; Auton_D_1042=0; Auton_E_1042=0; Auton_F_1042=0; auton_g_1042=0; auton_h_1042=0; auton_i_1042=0; auton_J_1042=0; end; 
if autonomo_1041=0 then do; auton_A_1041=0; Auton_B_1041=0; Auton_C_1041=0; Auton_D_1041=0; Auton_E_1041=0; Auton_F_1041=0; auton_g_1041=0; auton_h_1041=0; auton_i_1041=0; auton_J_1041=0; end; 
if autonomo_1040=0 then do; auton_A_1040=0; Auton_B_1040=0; Auton_C_1040=0; Auton_D_1040=0; Auton_E_1040=0; Auton_F_1040=0; auton_g_1040=0; auton_h_1040=0; auton_i_1040=0; auton_J_1040=0; end; 
if autonomo_1039=0 then do; auton_A_1039=0; Auton_B_1039=0; Auton_C_1039=0; Auton_D_1039=0; Auton_E_1039=0; Auton_F_1039=0; auton_g_1039=0; auton_h_1039=0; auton_i_1039=0; auton_J_1039=0; end; 
if autonomo_1038=0 then do; auton_A_1038=0; Auton_B_1038=0; Auton_C_1038=0; Auton_D_1038=0; Auton_E_1038=0; Auton_F_1038=0; auton_g_1038=0; auton_h_1038=0; auton_i_1038=0; auton_J_1038=0; end; 
if autonomo_1037=0 then do; auton_A_1037=0; Auton_B_1037=0; Auton_C_1037=0; Auton_D_1037=0; Auton_E_1037=0; Auton_F_1037=0; auton_g_1037=0; auton_h_1037=0; auton_i_1037=0; auton_J_1037=0; end; 
if autonomo_1036=0 then do; auton_A_1036=0; Auton_B_1036=0; Auton_C_1036=0; Auton_D_1036=0; Auton_E_1036=0; Auton_F_1036=0; auton_g_1036=0; auton_h_1036=0; auton_i_1036=0; auton_J_1036=0; end; 
if autonomo_1035=0 then do; auton_A_1035=0; Auton_B_1035=0; Auton_C_1035=0; Auton_D_1035=0; Auton_E_1035=0; Auton_F_1035=0; auton_g_1035=0; auton_h_1035=0; auton_i_1035=0; auton_J_1035=0; end; 
if autonomo_1034=0 then do; auton_A_1034=0; Auton_B_1034=0; Auton_C_1034=0; Auton_D_1034=0; Auton_E_1034=0; Auton_F_1034=0; auton_g_1034=0; auton_h_1034=0; auton_i_1034=0; auton_J_1034=0; end; 
if autonomo_1033=0 then do; auton_A_1033=0; Auton_B_1033=0; Auton_C_1033=0; Auton_D_1033=0; Auton_E_1033=0; Auton_F_1033=0; auton_g_1033=0; auton_h_1033=0; auton_i_1033=0; auton_J_1033=0; end; 



if  labour_market_state_1083=2 then do; if  itl_1083<=830.09 then auton_A_1083=1; if  830.09<itl_1083<=1018.94 then auton_B_1083=1; if  1018.94<itl_1083<=1361.52 then auton_C_1083=1; if  1361.52<itl_1083<=2042.27 then auton_D_1083=1; if  2042.27< itl_1083<=3403.79 then auton_E_1083=1; if 3403.79< itl_1083<=4760.92 then auton_F_1083=1; if 4760.92< itl_1083<=6803.19 then auton_G_1083=1; if 6803.19< itl_1083<=10206.98 then auton_H_1083=1; if 10206.98< itl_1083<=13606.38 then Auton_I_1083=1; if 13606.38< itl_1083 then Auton_J_1083=1; end; 
if  labour_market_state_1082=2 then do; if  itl_1082<=819.96 then auton_A_1082=1; if  819.96<itl_1082<=1006.51 then auton_B_1082=1; if  1006.51<itl_1082<=1344.90 then auton_C_1082=1; if  1344.90<itl_1082<=2017.35 then auton_D_1082=1; if  2017.35< itl_1082<=3362.25 then auton_E_1082=1; if 3362.25< itl_1082<=4702.82 then auton_F_1082=1; if 4702.82< itl_1082<=6720.17 then auton_G_1082=1; if 6720.17< itl_1082<=10082.42 then auton_H_1082=1; if 10082.42< itl_1082<=13440.34 then Auton_I_1082=1; if 13440.34< itl_1082 then Auton_J_1082=1; end; 
if  labour_market_state_1081=2 then do; if  itl_1081<=808.13 then auton_A_1081=1; if  808.13<itl_1081<=991.99 then auton_B_1081=1; if  991.99<itl_1081<=1325.50 then auton_C_1081=1; if  1325.50<itl_1081<=1988.26 then auton_D_1081=1; if  1988.26< itl_1081<=3313.76 then auton_E_1081=1; if 3313.76< itl_1081<=4634.99 then auton_F_1081=1; if 4634.99< itl_1081<=6623.25 then auton_G_1081=1; if 6623.25< itl_1081<=9937.01 then auton_H_1081=1; if 9937.01< itl_1081<=13246.49 then Auton_I_1081=1; if 13246.49< itl_1081 then Auton_J_1081=1; end; 
if  labour_market_state_1080=2 then do; if  itl_1080<=923.33 then auton_A_1080=1; if  923.33<itl_1080<=1132.79 then auton_B_1080=1; if  1132.79<itl_1080<=1513.23 then auton_C_1080=1; if  1513.23<itl_1080<=2269.85 then auton_D_1080=1; if  2269.85< itl_1080<=3787.35 then auton_E_1080=1; if 3787.35< itl_1080<=5296.31 then auton_F_1080=1; if 5296.31< itl_1080<=7566.16 then auton_G_1080=1; if 7566.16< itl_1080<=11353.51 then auton_H_1080=1; if 11353.51< itl_1080<=15136.59 then Auton_I_1080=1; if 15136.59< itl_1080 then Auton_J_1080=1; end; 
if  labour_market_state_1079=2 then do; if  itl_1079<=923.73 then auton_A_1079=1; if  923.73<itl_1079<=1133.28 then auton_B_1079=1; if  1133.28<itl_1079<=1513.90 then auton_C_1079=1; if  1513.90<itl_1079<=2270.84 then auton_D_1079=1; if  2270.84< itl_1079<=3789.02 then auton_E_1079=1; if 3789.02< itl_1079<=5298.64 then auton_F_1079=1; if 5298.64< itl_1079<=7569.48 then auton_G_1079=1; if 7569.48< itl_1079<=11358.50 then auton_H_1079=1; if 11358.50< itl_1079<=15143.24 then Auton_I_1079=1; if 15143.24< itl_1079 then Auton_J_1079=1; end; 
if  labour_market_state_1078=2 then do; if  itl_1078<=959.58 then auton_A_1078=1; if  959.58<itl_1078<=1177.08 then auton_B_1078=1; if  1177.08<itl_1078<=1573.71 then auton_C_1078=1; if  1573.71<itl_1078<=2358.43 then auton_D_1078=1; if  2358.43< itl_1078<=3936.41 then auton_E_1078=1; if 3936.41< itl_1078<=5505.85 then auton_F_1078=1; if 5505.85< itl_1078<=7864.29 then auton_G_1078=1; if 7864.29< itl_1078<=11800.69 then auton_H_1078=1; if 11800.69< itl_1078<=15732.84 then Auton_I_1078=1; if 15732.84< itl_1078 then Auton_J_1078=1; end; 
if  labour_market_state_1077=2 then do; if  itl_1077<=958.86 then auton_A_1077=1; if  958.86<itl_1077<=1176.20 then auton_B_1077=1; if  1176.20<itl_1077<=1572.53 then auton_C_1077=1; if  1572.53<itl_1077<=2356.66 then auton_D_1077=1; if  2356.66< itl_1077<=3933.45 then auton_E_1077=1; if 3933.45< itl_1077<=5501.72 then auton_F_1077=1; if 5501.72< itl_1077<=7858.38 then auton_G_1077=1; if 7858.38< itl_1077<=11791.83 then auton_H_1077=1; if 11791.83< itl_1077<=15721.02 then Auton_I_1077=1; if 15721.02< itl_1077 then Auton_J_1077=1; end; 
if  labour_market_state_1076=2 then do; if  itl_1076<=977.77 then auton_A_1076=1; if  977.77<itl_1076<=1200.77 then auton_B_1076=1; if  1200.77<itl_1076<=1603.89 then auton_C_1076=1; if  1603.89<itl_1076<=2401.54 then auton_D_1076=1; if  2401.54< itl_1076<=4009.72 then auton_E_1076=1; if 4009.72< itl_1076<=5609.32 then auton_F_1076=1; if 5609.32< itl_1076<=8015.15 then auton_G_1076=1; if 8015.15< itl_1076<=12024.87 then auton_H_1076=1; if 12024.87< itl_1076<=16030.29 then Auton_I_1076=1; if 16030.29< itl_1076 then Auton_J_1076=1; end; 
if  labour_market_state_1075=2 then do; if  itl_1075<=973.23 then auton_A_1075=1; if  973.23<itl_1075<=1195.19 then auton_B_1075=1; if  1195.19<itl_1075<=1596.43 then auton_C_1075=1; if  1596.43<itl_1075<=2390.38 then auton_D_1075=1; if  2390.38< itl_1075<=3991.08 then auton_E_1075=1; if 3991.08< itl_1075<=5583.25 then auton_F_1075=1; if 5583.25< itl_1075<=7977.90 then auton_G_1075=1; if 7977.90< itl_1075<=11968.98 then auton_H_1075=1; if 11968.98< itl_1075<=15955.79 then Auton_I_1075=1; if 15955.79< itl_1075 then Auton_J_1075=1; end; 
if  labour_market_state_1074=2 then do; if  itl_1074<=1256.82 then auton_A_1074=1; if  1256.82<itl_1074<=1545.55 then auton_B_1074=1; if  1545.55<itl_1074<=2063.57 then auton_C_1074=1; if  2063.57<itl_1074<=3091.11 then auton_D_1074=1; if  3091.11< itl_1074<=5158.92 then auton_E_1074=1; if 5158.92< itl_1074<=7218.24 then auton_F_1074=1; if 7218.24< itl_1074<=10313.59 then auton_G_1074=1; if 10313.59< itl_1074<=15476.76 then auton_H_1074=1; if 15476.76< itl_1074<=19361.87 then Auton_I_1074=1; if 19361.87< itl_1074 then Auton_J_1074=1; end; 
if  labour_market_state_1073=2 then do; if  itl_1073<=1249.75 then auton_A_1073=1; if  1249.75<itl_1073<=1536.86 then auton_B_1073=1; if  1536.86<itl_1073<=2051.96 then auton_C_1073=1; if  2051.96<itl_1073<=3073.71 then auton_D_1073=1; if  3073.71< itl_1073<=5129.90 then auton_E_1073=1; if 5129.90< itl_1073<=7177.63 then auton_F_1073=1; if 7177.63< itl_1073<=10255.57 then auton_G_1073=1; if 10255.57< itl_1073<=15389.69 then auton_H_1073=1; if 15389.69< itl_1073<=19252.94 then Auton_I_1073=1; if 19252.94< itl_1073 then Auton_J_1073=1; end; 
if  labour_market_state_1072=2 then do; if  itl_1072<=1329.33 then auton_A_1072=1; if  1329.33<itl_1072<=1631.83 then auton_B_1072=1; if  1631.83<itl_1072<=2181.46 then auton_C_1072=1; if  2181.46<itl_1072<=3263.66 then auton_D_1072=1; if  3263.66< itl_1072<=5449.38 then auton_E_1072=1; if 5449.38< itl_1072<=7622.32 then auton_F_1072=1; if 7622.32< itl_1072<=10894.50 then auton_G_1072=1; if 10894.50< itl_1072<=16348.14 then auton_H_1072=1; if 16348.14< itl_1072<=20451.16 then Auton_I_1072=1; if 20451.16< itl_1072 then Auton_J_1072=1; end; 
if  labour_market_state_1071=2 then do; if  itl_1071<=1321.19 then auton_A_1071=1; if  1321.19<itl_1071<=1621.85 then auton_B_1071=1; if  1621.85<itl_1071<=2168.11 then auton_C_1071=1; if  2168.11<itl_1071<=3243.69 then auton_D_1071=1; if  3243.69< itl_1071<=5416.03 then auton_E_1071=1; if 5416.03< itl_1071<=7575.67 then auton_F_1071=1; if 7575.67< itl_1071<=10827.83 then auton_G_1071=1; if 10827.83< itl_1071<=16248.10 then auton_H_1071=1; if 16248.10< itl_1071<=20326.01 then Auton_I_1071=1; if 20326.01< itl_1071 then Auton_J_1071=1; end; 
if  labour_market_state_1070=2 then do; if  itl_1070<=1326.46 then auton_A_1070=1; if  1326.46<itl_1070<=1628.32 then auton_B_1070=1; if  1628.32<itl_1070<=2176.76 then auton_C_1070=1; if  2176.76<itl_1070<=3256.63 then auton_D_1070=1; if  3256.63< itl_1070<=5437.64 then auton_E_1070=1; if 5437.64< itl_1070<=7605.89 then auton_F_1070=1; if 7605.89< itl_1070<=10871.03 then auton_G_1070=1; if 10871.03< itl_1070<=16312.92 then auton_H_1070=1; if 16312.92< itl_1070<=20407.09 then Auton_I_1070=1; if 20407.09< itl_1070 then Auton_J_1070=1; end; 
if  labour_market_state_1069=2 then do; if  itl_1069<=1311.36 then auton_A_1069=1; if  1311.36<itl_1069<=1609.78 then auton_B_1069=1; if  1609.78<itl_1069<=2151.98 then auton_C_1069=1; if  2151.98<itl_1069<=3219.56 then auton_D_1069=1; if  3219.56< itl_1069<=5375.74 then auton_E_1069=1; if 5375.74< itl_1069<=7519.31 then auton_F_1069=1; if 7519.31< itl_1069<=10747.27 then auton_G_1069=1; if 10747.27< itl_1069<=16127.21 then auton_H_1069=1; if 16127.21< itl_1069<=20174.78 then Auton_I_1069=1; if 20174.78< itl_1069 then Auton_J_1069=1; end; 
if  labour_market_state_1068=2 then do; if  itl_1068<=1313.81 then auton_A_1068=1; if  1313.81<itl_1068<=1612.79 then auton_B_1068=1; if  1612.79<itl_1068<=2156 then auton_C_1068=1; if  2156<itl_1068<=3225.57 then auton_D_1068=1; if  3225.57< itl_1068<=5385.78 then auton_E_1068=1; if 5385.78< itl_1068<=7533.36 then auton_F_1068=1; if 7533.36< itl_1068<=10767.35 then auton_G_1068=1; if 10767.35< itl_1068<=16157.34 then auton_H_1068=1; if 16157.34< itl_1068<=20212.47 then Auton_I_1068=1; if 20212.47< itl_1068 then Auton_J_1068=1; end; 
if  labour_market_state_1067=2 then do; if  itl_1067<=1306.96 then auton_A_1067=1; if  1306.96<itl_1067<=1604.37 then auton_B_1067=1; if  1604.37<itl_1067<=2144.75 then auton_C_1067=1; if  2144.75<itl_1067<=3208.75 then auton_D_1067=1; if  3208.75< itl_1067<=5357.69 then auton_E_1067=1; if 5357.69< itl_1067<=7494.06 then auton_F_1067=1; if 7494.06< itl_1067<=10711.19 then auton_G_1067=1; if 10711.19< itl_1067<=16073.07 then auton_H_1067=1; if 16073.07< itl_1067<=20107.04 then Auton_I_1067=1; if 20107.04< itl_1067 then Auton_J_1067=1; end; 
/*Avant l'introudction du monotributo, on suppose que tous les labour_market_state=2 sont autonomes. Après, on applique la distincion dans la macro auton_mono*/
if  autonomo_1066=1  then do; if  itl_1066<=1315.29 then auton_A_1066=1; if  1315.29<itl_1066<=1614.60 then auton_B_1066=1; if  1614.60<itl_1066<=2158.42 then auton_C_1066=1; if  2158.42<itl_1066<=3229.19 then auton_D_1066=1; if  3229.19< itl_1066<=5391.83 then auton_E_1066=1; if 5391.83< itl_1066<=7541.81 then auton_F_1066=1; if 7541.81< itl_1066<=10779.44 then auton_G_1066=1; if 10779.44< itl_1066<=16175.48 then auton_H_1066=1; if 16175.48< itl_1066<=20235.16 then Auton_I_1066=1; if 20235.16< itl_1066 then Auton_J_1066=1; end; 
if  autonomo_1065=1  then do; if  itl_1065<=1311.40 then auton_A_1065=1; if  1311.40<itl_1065<=1609.83 then auton_B_1065=1; if  1609.83<itl_1065<=2152.04 then auton_C_1065=1; if  2152.04<itl_1065<=3219.65 then auton_D_1065=1; if  3219.65< itl_1065<=5375.89 then auton_E_1065=1; if 5375.89< itl_1065<=7519.52 then auton_F_1065=1; if 7519.52< itl_1065<=10747.58 then auton_G_1065=1; if 10747.58< itl_1065<=16127.68 then auton_H_1065=1; if 16127.68< itl_1065<=20175.36 then Auton_I_1065=1; if 20175.36< itl_1065 then Auton_J_1065=1; end; 
if  autonomo_1064=1  then do; if  itl_1064<=1329.16 then auton_A_1064=1; if  1329.16<itl_1064<=1631.63 then auton_B_1064=1; if  1631.63<itl_1064<=2181.18 then auton_C_1064=1; if  2181.18<itl_1064<=3263.25 then auton_D_1064=1; if  3263.25< itl_1064<=5448.70 then auton_E_1064=1; if 5448.70< itl_1064<=7621.36 then auton_F_1064=1; if 7621.36< itl_1064<=10893.13 then auton_G_1064=1; if 10893.13< itl_1064<=16346.09 then auton_H_1064=1; if 16346.09< itl_1064<=20448.59 then Auton_I_1064=1; if 20448.59< itl_1064 then Auton_J_1064=1; end; 
if  autonomo_1063=1  then do; if  itl_1063<=1331.79 then auton_A_1063=1; if  1331.79<itl_1063<=1634.85 then auton_B_1063=1; if  1634.85<itl_1063<=2185.50 then auton_C_1063=1; if  2185.50<itl_1063<=3269.71 then auton_D_1063=1; if  3269.71< itl_1063<=5459.47 then auton_E_1063=1; if 5459.47< itl_1063<=7636.43 then auton_F_1063=1; if 7636.43< itl_1063<=10914.67 then auton_G_1063=1; if 10914.67< itl_1063<=16378.41 then auton_H_1063=1; if 16378.41< itl_1063<=20489.02 then Auton_I_1063=1; if 20489.02< itl_1063 then Auton_J_1063=1; end; 
if  autonomo_1062=1  then do; if  itl_1062<=1338.89 then auton_A_1062=1; if  1338.89<itl_1062<=1643.57 then auton_B_1062=1; if  1643.57<itl_1062<=2197.15 then auton_C_1062=1; if  2197.15<itl_1062<=3287.14 then auton_D_1062=1; if  3287.14< itl_1062<=5488.57 then auton_E_1062=1; if 5488.57< itl_1062<=7677.14 then auton_F_1062=1; if 7677.14< itl_1062<=10972.85 then auton_G_1062=1; if 10972.85< itl_1062<=16465.72 then auton_H_1062=1; if 16465.72< itl_1062<=20598.24 then Auton_I_1062=1; if 20598.24< itl_1062 then Auton_J_1062=1; end; 
if  autonomo_1061=1  then do; if  itl_1061<=1328.44 then auton_A_1061=1; if  1328.44<itl_1061<=1630.74 then auton_B_1061=1; if  1630.74<itl_1061<=2180 then auton_C_1061=1; if  2180<itl_1061<=3261.48 then auton_D_1061=1; if  3261.48< itl_1061<=5445.73 then auton_E_1061=1; if 5445.73< itl_1061<=7617.21 then auton_F_1061=1; if 7617.21< itl_1061<=10887.21 then auton_G_1061=1; if 10887.21< itl_1061<=16337.20 then auton_H_1061=1; if 16337.20< itl_1061<=20437.47 then Auton_I_1061=1; if 20437.47< itl_1061 then Auton_J_1061=1; end; 
if  autonomo_1060=1  then do; if  itl_1060<=1342.21 then auton_A_1060=1; if  1342.21<itl_1060<=1647.65 then auton_B_1060=1; if  1647.65<itl_1060<=2202.60 then auton_C_1060=1; if  2202.60<itl_1060<=3295.30 then auton_D_1060=1; if  3295.30< itl_1060<=5502.21 then auton_E_1060=1; if 5502.21< itl_1060<=7696.21 then auton_F_1060=1; if 7696.21< itl_1060<=11000.12 then auton_G_1060=1; if 11000.12< itl_1060<=16506.63 then auton_H_1060=1; if 16506.63< itl_1060<=20649.42 then Auton_I_1060=1; if 20649.42< itl_1060 then Auton_J_1060=1; end; 
if  autonomo_1059=1  then do; if  itl_1059<=1341.77 then auton_A_1059=1; if  1341.77<itl_1059<=1647.11 then auton_B_1059=1; if  1647.11<itl_1059<=2201.88 then auton_C_1059=1; if  2201.88<itl_1059<=3294.22 then auton_D_1059=1; if  3294.22< itl_1059<=5500.40 then auton_E_1059=1; if 5500.40< itl_1059<=7693.68 then auton_F_1059=1; if 7693.68< itl_1059<=10996.49 then auton_G_1059=1; if 10996.49< itl_1059<=16501.19 then auton_H_1059=1; if 16501.19< itl_1059<=20642.62 then Auton_I_1059=1; if 20642.62< itl_1059 then Auton_J_1059=1; end; 
if  autonomo_1058=1  then do; if  itl_1058<=1348.06 then auton_A_1058=1; if  1348.06<itl_1058<=1654.83 then auton_B_1058=1; if  1654.83<itl_1058<=2212.20 then auton_C_1058=1; if  2212.20<itl_1058<=3309.65 then auton_D_1058=1; if  3309.65< itl_1058<=5526.17 then auton_E_1058=1; if 5526.17< itl_1058<=7729.72 then auton_F_1058=1; if 7729.72< itl_1058<=11048.01 then auton_G_1058=1; if 11048.01< itl_1058<=16578.50 then auton_H_1058=1; if 16578.50< itl_1058<=20739.33 then Auton_I_1058=1; if 20739.33< itl_1058 then Auton_J_1058=1; end; 
if  autonomo_1057=1  then do; if  itl_1057<=1351.56 then auton_A_1057=1; if  1351.56<itl_1057<=1659.13 then auton_B_1057=1; if  1659.13<itl_1057<=2217.94 then auton_C_1057=1; if  2217.94<itl_1057<=3318.25 then auton_D_1057=1; if  3318.25< itl_1057<=5540.53 then auton_E_1057=1; if 5540.53< itl_1057<=7749.81 then auton_F_1057=1; if 7749.81< itl_1057<=11076.72 then auton_G_1057=1; if 11076.72< itl_1057<=16621.58 then auton_H_1057=1; if 16621.58< itl_1057<=20793.22 then Auton_I_1057=1; if 20793.22< itl_1057 then Auton_J_1057=1; end; 
if  autonomo_1056=1  then do; if  itl_1056<=1339.16 then auton_A_1056=1; if  1339.16<itl_1056<=1643.91 then auton_B_1056=1; if  1643.91<itl_1056<=2197.60 then auton_C_1056=1; if  2197.60<itl_1056<=3287.82 then auton_D_1056=1; if  3287.82< itl_1056<=5489.72 then auton_E_1056=1; if 5489.72< itl_1056<=7678.74 then auton_F_1056=1; if 7678.74< itl_1056<=10975.14 then auton_G_1056=1; if 10975.14< itl_1056<=16469.15 then auton_H_1056=1; if 16469.15< itl_1056<=20602.54 then Auton_I_1056=1; if 20602.54< itl_1056 then Auton_J_1056=1; end; 
if  autonomo_1055=1  then do; if  itl_1055<=1358.18 then auton_A_1055=1; if  1358.18<itl_1055<=1667.25 then auton_B_1055=1; if  1667.25<itl_1055<=2228.81 then auton_C_1055=1; if  2228.81<itl_1055<=3334.50 then auton_D_1055=1; if  3334.50< itl_1055<=5567.66 then auton_E_1055=1; if 5567.66< itl_1055<=7787.76 then auton_F_1055=1; if 7787.76< itl_1055<=11130.97 then auton_G_1055=1; if 11130.97< itl_1055<=16702.98 then auton_H_1055=1; if 16702.98< itl_1055<=20895.05 then Auton_I_1055=1; if 20895.05< itl_1055 then Auton_J_1055=1; end; 
if  autonomo_1054=1  then do; if  itl_1054<=1369.72 then auton_A_1054=1; if  1369.72<itl_1054<=1681.42 then auton_B_1054=1; if  1681.42<itl_1054<=2247.75 then auton_C_1054=1; if  2247.75<itl_1054<=3362.84 then auton_D_1054=1; if  3362.84< itl_1054<=5614.98 then auton_E_1054=1; if 5614.98< itl_1054<=7853.95 then auton_F_1054=1; if 7853.95< itl_1054<=11225.58 then auton_G_1054=1; if 11225.58< itl_1054<=16844.95 then auton_H_1054=1; if 16844.95< itl_1054<=21072.65 then Auton_I_1054=1; if 21072.65< itl_1054 then Auton_J_1054=1; end; 
if  autonomo_1053=1  then do; if  itl_1053<=1299.24 then auton_A_1053=1; if  1299.24<itl_1053<=1594.90 then auton_B_1053=1; if  1594.90<itl_1053<=2132.09 then auton_C_1053=1; if  2132.09<itl_1053<=3189.80 then auton_D_1053=1; if  3189.80< itl_1053<=5326.05 then auton_E_1053=1; if 5326.05< itl_1053<=7449.81 then auton_F_1053=1; if 7449.81< itl_1053<=10647.94 then auton_G_1053=1; if 10647.94< itl_1053<=15978.16 then auton_H_1053=1; if 15978.16< itl_1053<=19988.31 then Auton_I_1053=1; if 19988.31< itl_1053 then Auton_J_1053=1; end; 
if  autonomo_1052=1  then do; if  itl_1052<=1088.53 then auton_A_1052=1; if  1088.53<itl_1052<=1336.24 then auton_B_1052=1; if  1336.24<itl_1052<=1786.30 then auton_C_1052=1; if  1786.30<itl_1052<=2672.48 then auton_D_1052=1; if  2672.48< itl_1052<=4462.27 then auton_E_1052=1; if 4462.27< itl_1052<=6241.59 then auton_F_1052=1; if 6241.59< itl_1052<=8921.04 then auton_G_1052=1; if 8921.04< itl_1052<=13386.80 then auton_H_1052=1; if 13386.80< itl_1052<=16746.58 then Auton_I_1052=1; if 16746.58< itl_1052 then Auton_J_1052=1; end; 
if  autonomo_1051=1  then do; if  itl_1051<=994.72 then auton_A_1051=1; if  994.72<itl_1051<=1221.09 then auton_B_1051=1; if  1221.09<itl_1051<=1632.36 then auton_C_1051=1; if  1632.36<itl_1051<=2442.17 then auton_D_1051=1; if  2442.17< itl_1051<=4077.72 then auton_E_1051=1; if 4077.72< itl_1051<=5703.71 then auton_F_1051=1; if 5703.71< itl_1051<=8152.26 then auton_G_1051=1; if 8152.26< itl_1051<=12233.17 then auton_H_1051=1; if 12233.17< itl_1051<=15303.42 then Auton_I_1051=1; if 15303.42< itl_1051 then Auton_J_1051=1; end; 
if  autonomo_1050=1  then do; if  itl_1050<=974.36 then auton_A_1050=1; if  974.36<itl_1050<=1196.09 then auton_B_1050=1; if  1196.09<itl_1050<=1598.96 then auton_C_1050=1; if  1598.96<itl_1050<=2392.19 then auton_D_1050=1; if  2392.19< itl_1050<=3994.27 then auton_E_1050=1; if 3994.27< itl_1050<=5586.97 then auton_F_1050=1; if 5586.97< itl_1050<=7985.41 then auton_G_1050=1; if 7985.41< itl_1050<=11982.80 then auton_H_1050=1; if 11982.80< itl_1050<=14990.21 then Auton_I_1050=1; if 14990.21< itl_1050 then Auton_J_1050=1; end; 
if  autonomo_1049=1  then do; if  itl_1049<=954.48 then auton_A_1049=1; if  954.48<itl_1049<=1171.68 then auton_B_1049=1; if  1171.68<itl_1049<=1566.32 then auton_C_1049=1; if  1566.32<itl_1049<=2343.36 then auton_D_1049=1; if  2343.36< itl_1049<=3912.74 then auton_E_1049=1; if 3912.74< itl_1049<=5472.94 then auton_F_1049=1; if 5472.94< itl_1049<=7822.42 then auton_G_1049=1; if 7822.42< itl_1049<=11738.22 then auton_H_1049=1; if 11738.22< itl_1049<=14684.25 then Auton_I_1049=1; if 14684.25< itl_1049 then Auton_J_1049=1; end; 
if  autonomo_1048=1  then do; if  itl_1048<=952.06 then auton_A_1048=1; if  952.06<itl_1048<=1168.72 then auton_B_1048=1; if  1168.72<itl_1048<=1562.36 then auton_C_1048=1; if  1562.36<itl_1048<=2337.44 then auton_D_1048=1; if  2337.44< itl_1048<=3902.85 then auton_E_1048=1; if 3902.85< itl_1048<=5459.11 then auton_F_1048=1; if 5459.11< itl_1048<=7802.66 then auton_G_1048=1; if 7802.66< itl_1048<=11708.56 then auton_H_1048=1; if 11708.56< itl_1048<=14647.14 then Auton_I_1048=1; if 14647.14< itl_1048 then Auton_J_1048=1; end; 
if  autonomo_1047=1  then do; if  itl_1047<=948.44 then auton_A_1047=1; if  948.44<itl_1047<=1164.27 then auton_B_1047=1; if  1164.27<itl_1047<=1556.41 then auton_C_1047=1; if  1556.41<itl_1047<=2328.53 then auton_D_1047=1; if  2328.53< itl_1047<=3887.98 then auton_E_1047=1; if 3887.98< itl_1047<=5438.31 then auton_F_1047=1; if 5438.31< itl_1047<=7772.93 then auton_G_1047=1; if 7772.93< itl_1047<=11663.95 then auton_H_1047=1; if 11663.95< itl_1047<=14591.34 then Auton_I_1047=1; if 14591.34< itl_1047 then Auton_J_1047=1; end; 
if  autonomo_1046=1  then do; if  itl_1046<=940.19 then auton_A_1046=1; if  940.19<itl_1046<=1154.14 then auton_B_1046=1; if  1154.14<itl_1046<=1542.87 then auton_C_1046=1; if  1542.87<itl_1046<=2308.28 then auton_D_1046=1; if  2308.28< itl_1046<=3854.16 then auton_E_1046=1; if 3854.16< itl_1046<=5391.01 then auton_F_1046=1; if 5391.01< itl_1046<=7705.31 then auton_G_1046=1; if 7705.31< itl_1046<=11562.49 then auton_H_1046=1; if 11562.49< itl_1046<=14464.41 then Auton_I_1046=1; if 14464.41< itl_1046 then Auton_J_1046=1; end; 
if  autonomo_1045=1  then do; if  itl_1045<=933.33 then auton_A_1045=1; if  933.33<itl_1045<=1145.72 then auton_B_1045=1; if  1145.72<itl_1045<=1531.62 then auton_C_1045=1; if  1531.62<itl_1045<=2291.44 then auton_D_1045=1; if  2291.44< itl_1045<=3826.05 then auton_E_1045=1; if 3826.05< itl_1045<=5351.68 then auton_F_1045=1; if 5351.68< itl_1045<=7649.11 then auton_G_1045=1; if 7649.11< itl_1045<=11478.15 then auton_H_1045=1; if 11478.15< itl_1045<=14358.90 then Auton_I_1045=1; if 14358.90< itl_1045 then Auton_J_1045=1; end; 
if  autonomo_1044=1  then do; if  itl_1044<=913.26 then auton_A_1044=1; if  913.26<itl_1044<=1121.08 then auton_B_1044=1; if  1121.08<itl_1044<=1498.68 then auton_C_1044=1; if  1498.68<itl_1044<=2242.17 then auton_D_1044=1; if  2242.17< itl_1044<=3743.77 then auton_E_1044=1; if 3743.77< itl_1044<=5236.60 then auton_F_1044=1; if 5236.60< itl_1044<=7484.62 then auton_G_1044=1; if 7484.62< itl_1044<=11231.32 then auton_H_1044=1; if 11231.32< itl_1044<=14050.13 then Auton_I_1044=1; if 14050.13< itl_1044 then Auton_J_1044=1; end; 
if  autonomo_1043=1  then do; if  itl_1043<=900.86 then auton_A_1043=1; if  900.86<itl_1043<=1105.86 then auton_B_1043=1; if  1105.86<itl_1043<=1478.33 then auton_C_1043=1; if  1478.33<itl_1043<=2211.72 then auton_D_1043=1; if  2211.72< itl_1043<=3692.94 then auton_E_1043=1; if 3692.94< itl_1043<=5165.50 then auton_F_1043=1; if 5165.50< itl_1043<=7382.99 then auton_G_1043=1; if 7382.99< itl_1043<=11078.82 then auton_H_1043=1; if 11078.82< itl_1043<=13859.35 then Auton_I_1043=1; if 13859.35< itl_1043 then Auton_J_1043=1; end; 
if  autonomo_1042=1  then do; if  itl_1042<=891.67 then auton_A_1042=1; if  891.67<itl_1042<=1094.59 then auton_B_1042=1; if  1094.59<itl_1042<=1463.26 then auton_C_1042=1; if  1463.26<itl_1042<=2189.18 then auton_D_1042=1; if  2189.18< itl_1042<=3655.30 then auton_E_1042=1; if 3655.30< itl_1042<=5112.84 then auton_F_1042=1; if 5112.84< itl_1042<=7307.73 then auton_G_1042=1; if 7307.73< itl_1042<=10965.89 then auton_H_1042=1; if 10965.89< itl_1042<=13718.07 then Auton_I_1042=1; if 13718.07< itl_1042 then Auton_J_1042=1; end; 
if  autonomo_1041=1  then do; if  itl_1041<=863.17 then auton_A_1041=1; if  863.17<itl_1041<=1059.60 then auton_B_1041=1; if  1059.60<itl_1041<=1416.48 then auton_C_1041=1; if  1416.48<itl_1041<=2119.19 then auton_D_1041=1; if  2119.19< itl_1041<=3538.44 then auton_E_1041=1; if 3538.44< itl_1041<=4949.39 then auton_F_1041=1; if 4949.39< itl_1041<=7074.12 then auton_G_1041=1; if 7074.12< itl_1041<=10615.33 then auton_H_1041=1; if 10615.33< itl_1041<=13279.54 then Auton_I_1041=1; if 13279.54< itl_1041 then Auton_J_1041=1; end; 
if  autonomo_1040=1  then do; if  itl_1040<=840.83 then auton_A_1040=1; if  840.83<itl_1040<=1032.17 then auton_B_1040=1; if  1032.17<itl_1040<=1379.83 then auton_C_1040=1; if  1379.83<itl_1040<=2064.35 then auton_D_1040=1; if  2064.35< itl_1040<=3446.87 then auton_E_1040=1; if 3446.87< itl_1040<=4821.31 then auton_F_1040=1; if 4821.31< itl_1040<=6891.05 then auton_G_1040=1; if 6891.05< itl_1040<=10340.61 then auton_H_1040=1; if 10340.61< itl_1040<=12935.87 then Auton_I_1040=1; if 12935.87< itl_1040 then Auton_J_1040=1; end; 
if  autonomo_1039=1  then do; if  itl_1039<=821.33 then auton_A_1039=1; if  821.33<itl_1039<=1008.23 then auton_B_1039=1; if  1008.23<itl_1039<=1347.82 then auton_C_1039=1; if  1347.82<itl_1039<=2016.47 then auton_D_1039=1; if  2016.47< itl_1039<=3366.92 then auton_E_1039=1; if 3366.92< itl_1039<=4709.48 then auton_F_1039=1; if 4709.48< itl_1039<=6731.21 then auton_G_1039=1; if 6731.21< itl_1039<=10100.77 then auton_H_1039=1; if 10100.77< itl_1039<=12635.83 then Auton_I_1039=1; if 12635.83< itl_1039 then Auton_J_1039=1; end; 
if  autonomo_1038=1  then do; if  itl_1038<=795.99 then auton_A_1038=1; if  795.99<itl_1038<=977.13 then auton_B_1038=1; if  977.13<itl_1038<=1306.24 then auton_C_1038=1; if  1306.24<itl_1038<=1954.26 then auton_D_1038=1; if  1954.26< itl_1038<=3263.05 then auton_E_1038=1; if 3263.05< itl_1038<=4564.18 then auton_F_1038=1; if 4564.18< itl_1038<=6523.54 then auton_G_1038=1; if 6523.54< itl_1038<=9789.14 then auton_H_1038=1; if 9789.14< itl_1038<=12245.99 then Auton_I_1038=1; if 12245.99< itl_1038 then Auton_J_1038=1; end; 
if  autonomo_1037=1  then do; if  itl_1037<=774.24 then auton_A_1037=1; if  774.24<itl_1037<=950.43 then auton_B_1037=1; if  950.43<itl_1037<=1270.55 then auton_C_1037=1; if  1270.55<itl_1037<=1900.86 then auton_D_1037=1; if  1900.86< itl_1037<=3173.89 then auton_E_1037=1; if 3173.89< itl_1037<=4439.47 then auton_F_1037=1; if 4439.47< itl_1037<=6345.29 then auton_G_1037=1; if 6345.29< itl_1037<=9521.66 then auton_H_1037=1; if 9521.66< itl_1037<=11911.38 then Auton_I_1037=1; if 11911.38< itl_1037 then Auton_J_1037=1; end; 
if  autonomo_1036=1  then do; if  itl_1036<=754.12 then auton_A_1036=1; if  754.12<itl_1036<=925.73 then auton_B_1036=1; if  925.73<itl_1036<=1237.53 then auton_C_1036=1; if  1237.53<itl_1036<=1851.46 then auton_D_1036=1; if  1851.46< itl_1036<=3091.41 then auton_E_1036=1; if 3091.41< itl_1036<=4324.11 then auton_F_1036=1; if 4324.11< itl_1036<=6180.41 then auton_G_1036=1; if 6180.41< itl_1036<=9274.23 then auton_H_1036=1; if 9274.23< itl_1036<=11601.86 then Auton_I_1036=1; if 11601.86< itl_1036 then Auton_J_1036=1; end; 
if  autonomo_1035=1  then do; if  itl_1035<=741.71 then auton_A_1035=1; if  741.71<itl_1035<=910.50 then auton_B_1035=1; if  910.50<itl_1035<=1217.17 then auton_C_1035=1; if  1217.17<itl_1035<=1821 then auton_D_1035=1; if  1821< itl_1035<=3040.54 then auton_E_1035=1; if 3040.54< itl_1035<=4252.96 then auton_F_1035=1; if 4252.96< itl_1035<=6078.71 then auton_G_1035=1; if 6078.71< itl_1035<=9121.63 then auton_H_1035=1; if 9121.63< itl_1035<=11410.95 then Auton_I_1035=1; if 11410.95< itl_1035 then Auton_J_1035=1; end; 
if  autonomo_1034=1  then do; if  itl_1034<=723.74 then auton_A_1034=1; if  723.74<itl_1034<=888.44 then auton_B_1034=1; if  888.44<itl_1034<=1187.68 then auton_C_1034=1; if  1187.68<itl_1034<=1776.88 then auton_D_1034=1; if  1776.88< itl_1034<=2966.87 then auton_E_1034=1; if 2966.87< itl_1034<=4149.91 then auton_F_1034=1; if 4149.91< itl_1034<=5931.42 then auton_G_1034=1; if 5931.42< itl_1034<=8900.62 then auton_H_1034=1; if 8900.62< itl_1034<=11134.47 then Auton_I_1034=1; if 11134.47< itl_1034 then Auton_J_1034=1; end; 
if  autonomo_1033=1  then do; if  itl_1033<=706.47 then auton_A_1033=1; if  706.47<itl_1033<=867.23 then auton_B_1033=1; if  867.23<itl_1033<=1159.33 then auton_C_1033=1; if  1159.33<itl_1033<=1734.47 then auton_D_1033=1; if  1734.47< itl_1033<=2896.06 then auton_E_1033=1; if 2896.06< itl_1033<=4050.86 then auton_F_1033=1; if 4050.86< itl_1033<=5789.86 then auton_G_1033=1; if 5789.86< itl_1033<=8688.19 then auton_H_1033=1; if 8688.19< itl_1033<=10868.73 then Auton_I_1033=1; if 10868.73< itl_1033 then Auton_J_1033=1; end; 




if auton_A_1083=1 then rent_aut_1083=1587.79;
if auton_A_1082=1 then rent_aut_1082=1587.79;
if auton_A_1081=1 then rent_aut_1081=1587.79;
if auton_A_1080=1 then rent_aut_1080=1814.61;
if auton_A_1079=1 then rent_aut_1079=1814.61;
if auton_A_1078=1 then rent_aut_1078=1890.22;
if auton_A_1077=1 then rent_aut_1077=1890.22;
if auton_A_1076=1 then rent_aut_1076=1915.42;
if auton_A_1075=1 then rent_aut_1075=1915.42;
if auton_A_1074=1 then rent_aut_1074=2486.69;
if auton_A_1073=1 then rent_aut_1073=2486.69;
if auton_A_1072=1 then rent_aut_1072=2621.11;
if auton_A_1071=1 then rent_aut_1071=2621.11;
if auton_A_1070=1 then rent_aut_1070=2621.11;
if auton_A_1069=1 then rent_aut_1069=2621.11;
if auton_A_1068=1 then rent_aut_1068=2621.11;
if auton_A_1067=1 then rent_aut_1067=2621.11;
if auton_A_1066=1 then rent_aut_1066=2621.11;
if auton_A_1065=1 then rent_aut_1065=2621.11;
if auton_A_1064=1 then rent_aut_1064=2621.11;
if auton_A_1063=1 then rent_aut_1063=2621.11;
if auton_A_1062=1 then rent_aut_1062=2621.11;
if auton_A_1061=1 then rent_aut_1061=2621.11;
if auton_A_1060=1 then rent_aut_1060=2621.11;
if auton_A_1059=1 then rent_aut_1059=2621.11;
if auton_A_1058=1 then rent_aut_1058=2621.11;
if auton_A_1057=1 then rent_aut_1057=2621.11;
if auton_A_1056=1 then rent_aut_1056=2621.11;
if auton_A_1055=1 then rent_aut_1055=2621.11;
if auton_A_1054=1 then rent_aut_1054=2621.11;
if auton_A_1053=1 then rent_aut_1053=2621.11;
if auton_A_1052=1 then rent_aut_1052=2621.11;
if auton_A_1051=1 then rent_aut_1051=2621.11;
if auton_A_1050=1 then rent_aut_1050=2621.11;
if auton_A_1049=1 then rent_aut_1049=2621.11;
if auton_A_1048=1 then rent_aut_1048=2621.11;
if auton_A_1047=1 then rent_aut_1047=2621.11;
if auton_A_1046=1 then rent_aut_1046=2621.11;
if auton_A_1045=1 then rent_aut_1045=2621.11;
if auton_A_1044=1 then rent_aut_1044=2621.11;
if auton_A_1043=1 then rent_aut_1043=2621.11;
if auton_A_1042=1 then rent_aut_1042=2562.88;
if auton_A_1041=1 then rent_aut_1041=2477.90;
if auton_A_1040=1 then rent_aut_1040=2395.77;
if auton_A_1039=1 then rent_aut_1039=2316.36;
if auton_A_1038=1 then rent_aut_1038=2239.56;
if auton_A_1037=1 then rent_aut_1037=2165.35;
if auton_A_1036=1 then rent_aut_1036=2093.56;
if auton_A_1035=1 then rent_aut_1035=2024.15;
if auton_A_1034=1 then rent_aut_1034=1957.06;
if auton_A_1033=1 then rent_aut_1033=1892.18;


if auton_B_1083=1 then rent_aut_1083=1949.03;
if auton_B_1082=1 then rent_aut_1082=1949.03;
if auton_B_1081=1 then rent_aut_1081=1949.03;
if auton_B_1080=1 then rent_aut_1080=2226.26;
if auton_B_1079=1 then rent_aut_1079=2226.26;
if auton_B_1078=1 then rent_aut_1078=2318.67;
if auton_B_1077=1 then rent_aut_1077=2318.67;
if auton_B_1076=1 then rent_aut_1076=2352.27;
if auton_B_1075=1 then rent_aut_1075=2352.27;
if auton_B_1074=1 then rent_aut_1074=3057.96;
if auton_B_1073=1 then rent_aut_1073=3057.96;
if auton_B_1072=1 then rent_aut_1072=3217.58;
if auton_B_1071=1 then rent_aut_1071=3217.58;
if auton_B_1070=1 then rent_aut_1070=3217.58;
if auton_B_1069=1 then rent_aut_1069=3217.58;
if auton_B_1068=1 then rent_aut_1068=3217.58;
if auton_B_1067=1 then rent_aut_1067=3217.58;
if auton_B_1066=1 then rent_aut_1066=3217.58;
if auton_B_1065=1 then rent_aut_1065=3217.58;
if auton_B_1064=1 then rent_aut_1064=3217.58;
if auton_B_1063=1 then rent_aut_1063=3217.58;
if auton_B_1062=1 then rent_aut_1062=3217.58;
if auton_B_1061=1 then rent_aut_1061=3217.58;
if auton_B_1060=1 then rent_aut_1060=3217.58;
if auton_B_1059=1 then rent_aut_1059=3217.58;
if auton_B_1058=1 then rent_aut_1058=3217.58;
if auton_B_1057=1 then rent_aut_1057=3217.58;
if auton_B_1056=1 then rent_aut_1056=3217.58;
if auton_B_1055=1 then rent_aut_1055=3217.58;
if auton_B_1054=1 then rent_aut_1054=3217.58;
if auton_B_1053=1 then rent_aut_1053=3217.58;
if auton_B_1052=1 then rent_aut_1052=3217.58;
if auton_B_1051=1 then rent_aut_1051=3217.58;
if auton_B_1050=1 then rent_aut_1050=3217.58;
if auton_B_1049=1 then rent_aut_1049=3217.58;
if auton_B_1048=1 then rent_aut_1048=3217.58;
if auton_B_1047=1 then rent_aut_1047=3217.58;
if auton_B_1046=1 then rent_aut_1046=3217.58;
if auton_B_1045=1 then rent_aut_1045=3217.58;
if auton_B_1044=1 then rent_aut_1044=3217.58;
if auton_B_1043=1 then rent_aut_1043=3217.58;
if auton_B_1042=1 then rent_aut_1042=3146.10;
if auton_B_1041=1 then rent_aut_1041=3041.78;
if auton_B_1040=1 then rent_aut_1040=2940.96;
if auton_B_1039=1 then rent_aut_1039=2843.48;
if auton_B_1038=1 then rent_aut_1038=2749.21;
if auton_B_1037=1 then rent_aut_1037=2658.10;
if auton_B_1036=1 then rent_aut_1036=2569.98;
if auton_B_1035=1 then rent_aut_1035=2484.77;
if auton_B_1034=1 then rent_aut_1034=2402.41;
if auton_B_1033=1 then rent_aut_1033=2322.78;



if auton_C_1083=1 then rent_aut_1083=2604.30;
if auton_C_1082=1 then rent_aut_1082=2604.30;
if auton_C_1081=1 then rent_aut_1081=2604.30;
if auton_C_1080=1 then rent_aut_1080=2973.95;
if auton_C_1079=1 then rent_aut_1079=2973.95;
if auton_C_1078=1 then rent_aut_1078=3099.96;
if auton_C_1077=1 then rent_aut_1077=3099.96;
if auton_C_1076=1 then rent_aut_1076=3141.97;
if auton_C_1075=1 then rent_aut_1075=3141.97;
if auton_C_1074=1 then rent_aut_1074=4082.88;
if auton_C_1073=1 then rent_aut_1073=4082.88;
if auton_C_1072=1 then rent_aut_1072=4301.30;
if auton_C_1071=1 then rent_aut_1071=4301.30;
if auton_C_1070=1 then rent_aut_1070=4301.30;
if auton_C_1069=1 then rent_aut_1069=4301.30;
if auton_C_1068=1 then rent_aut_1068=4301.30;
if auton_C_1067=1 then rent_aut_1067=4301.30;
if auton_C_1066=1 then rent_aut_1066=4301.30;
if auton_C_1065=1 then rent_aut_1065=4301.30;
if auton_C_1064=1 then rent_aut_1064=4301.30;
if auton_C_1063=1 then rent_aut_1063=4301.30;
if auton_C_1062=1 then rent_aut_1062=4301.30;
if auton_C_1061=1 then rent_aut_1061=4301.30;
if auton_C_1060=1 then rent_aut_1060=4301.30;
if auton_C_1059=1 then rent_aut_1059=4301.30;
if auton_C_1058=1 then rent_aut_1058=4301.30;
if auton_C_1057=1 then rent_aut_1057=4301.30;
if auton_C_1056=1 then rent_aut_1056=4301.30;
if auton_C_1055=1 then rent_aut_1055=4301.30;
if auton_C_1054=1 then rent_aut_1054=4301.30;
if auton_C_1053=1 then rent_aut_1053=4301.30;
if auton_C_1052=1 then rent_aut_1052=4301.30;
if auton_C_1051=1 then rent_aut_1051=4301.30;
if auton_C_1050=1 then rent_aut_1050=4301.30;
if auton_C_1049=1 then rent_aut_1049=4301.30;
if auton_C_1048=1 then rent_aut_1048=4301.30;
if auton_C_1047=1 then rent_aut_1047=4301.30;
if auton_C_1046=1 then rent_aut_1046=4301.30;
if auton_C_1045=1 then rent_aut_1045=4301.30;
if auton_C_1044=1 then rent_aut_1044=4301.30;
if auton_C_1043=1 then rent_aut_1043=4301.30;
if auton_C_1042=1 then rent_aut_1042=4205.75;
if auton_C_1041=1 then rent_aut_1041=4066.30;
if auton_C_1040=1 then rent_aut_1040=3931.52;
if auton_C_1039=1 then rent_aut_1039=3801.21;
if auton_C_1038=1 then rent_aut_1038=3675.18;
if auton_C_1037=1 then rent_aut_1037=3553.39;
if auton_C_1036=1 then rent_aut_1036=3435.59;
if auton_C_1035=1 then rent_aut_1035=3321.68;
if auton_C_1034=1 then rent_aut_1034=3211.58;
if auton_C_1033=1 then rent_aut_1033=3105.12;



if auton_D_1083=1 then rent_aut_1083=3906.46;
if auton_D_1082=1 then rent_aut_1082=3906.46;
if auton_D_1081=1 then rent_aut_1081=3906.46;
if auton_D_1080=1 then rent_aut_1080=4460.92;
if auton_D_1079=1 then rent_aut_1079=4460.92;
if auton_D_1078=1 then rent_aut_1078=4645.74;
if auton_D_1077=1 then rent_aut_1077=4645.74;
if auton_D_1076=1 then rent_aut_1076=4704.55;
if auton_D_1075=1 then rent_aut_1075=4704.55;
if auton_D_1074=1 then rent_aut_1074=6115.91;
if auton_D_1073=1 then rent_aut_1073=6115.91;
if auton_D_1072=1 then rent_aut_1072=6435.15;
if auton_D_1071=1 then rent_aut_1071=6435.15;
if auton_D_1070=1 then rent_aut_1070=6435.15;
if auton_D_1069=1 then rent_aut_1069=6435.15;
if auton_D_1068=1 then rent_aut_1068=6435.15;
if auton_D_1067=1 then rent_aut_1067=6435.15;
if auton_D_1066=1 then rent_aut_1066=6435.15;
if auton_D_1065=1 then rent_aut_1065=6435.15;
if auton_D_1064=1 then rent_aut_1064=6435.15;
if auton_D_1063=1 then rent_aut_1063=6435.15;
if auton_D_1062=1 then rent_aut_1062=6435.15;
if auton_D_1061=1 then rent_aut_1061=6435.15;
if auton_D_1060=1 then rent_aut_1060=6435.15;
if auton_D_1059=1 then rent_aut_1059=6435.15;
if auton_D_1058=1 then rent_aut_1058=6435.15;
if auton_D_1057=1 then rent_aut_1057=6435.15;
if auton_D_1056=1 then rent_aut_1056=6435.15;
if auton_D_1055=1 then rent_aut_1055=6435.15;
if auton_D_1054=1 then rent_aut_1054=6435.15;
if auton_D_1053=1 then rent_aut_1053=6435.15;
if auton_D_1052=1 then rent_aut_1052=6435.15;
if auton_D_1051=1 then rent_aut_1051=6435.15;
if auton_D_1050=1 then rent_aut_1050=6435.15;
if auton_D_1049=1 then rent_aut_1049=6435.15;
if auton_D_1048=1 then rent_aut_1048=6435.15;
if auton_D_1047=1 then rent_aut_1047=6435.15;
if auton_D_1046=1 then rent_aut_1046=6435.15;
if auton_D_1045=1 then rent_aut_1045=6435.15;
if auton_D_1044=1 then rent_aut_1044=6435.15;
if auton_D_1043=1 then rent_aut_1043=6435.15;
if auton_D_1042=1 then rent_aut_1042=6292.20;
if auton_D_1041=1 then rent_aut_1041=6083.57;
if auton_D_1040=1 then rent_aut_1040=5881.93;
if auton_D_1039=1 then rent_aut_1039=5686.96;
if auton_D_1038=1 then rent_aut_1038=5498.41;
if auton_D_1037=1 then rent_aut_1037=5316.21;
if auton_D_1036=1 then rent_aut_1036=5139.96;
if auton_D_1035=1 then rent_aut_1035=4969.54;
if auton_D_1034=1 then rent_aut_1034=4804.83;
if auton_D_1033=1 then rent_aut_1033=4645.55;


if auton_E_1083=1 then rent_aut_1083=6510.76;
if auton_E_1082=1 then rent_aut_1082=6510.76;
if auton_E_1081=1 then rent_aut_1081=6510.76;
if auton_E_1080=1 then rent_aut_1080=7443.27;
if auton_E_1079=1 then rent_aut_1079=7443.27;
if auton_E_1078=1 then rent_aut_1078=7754.11;
if auton_E_1077=1 then rent_aut_1077=7754.11;
if auton_E_1076=1 then rent_aut_1076=7854.92;
if auton_E_1075=1 then rent_aut_1075=7854.92;
if auton_E_1074=1 then rent_aut_1074=10207.19;
if auton_E_1073=1 then rent_aut_1073=10207.19;
if auton_E_1072=1 then rent_aut_1072=10744.85;
if auton_E_1071=1 then rent_aut_1071=10744.85;
if auton_E_1070=1 then rent_aut_1070=10744.85;
if auton_E_1069=1 then rent_aut_1069=10744.85;
if auton_E_1068=1 then rent_aut_1068=10744.85;
if auton_E_1067=1 then rent_aut_1067=10744.85;
if auton_E_1066=1 then rent_aut_1066=10744.85;
if auton_E_1065=1 then rent_aut_1065=10744.85;
if auton_E_1064=1 then rent_aut_1064=10744.85;
if auton_E_1063=1 then rent_aut_1063=10744.85;
if auton_E_1062=1 then rent_aut_1062=10744.85;
if auton_E_1061=1 then rent_aut_1061=10744.85;
if auton_E_1060=1 then rent_aut_1060=10744.85;
if auton_E_1059=1 then rent_aut_1059=10744.85;
if auton_E_1058=1 then rent_aut_1058=10744.85;
if auton_E_1057=1 then rent_aut_1057=10744.85;
if auton_E_1056=1 then rent_aut_1056=10744.85;
if auton_E_1055=1 then rent_aut_1055=10744.85;
if auton_E_1054=1 then rent_aut_1054=10744.85;
if auton_E_1053=1 then rent_aut_1053=10744.85;
if auton_E_1052=1 then rent_aut_1052=10744.85;
if auton_E_1051=1 then rent_aut_1051=10744.85;
if auton_E_1050=1 then rent_aut_1050=10744.85;
if auton_E_1049=1 then rent_aut_1049=10744.85;
if auton_E_1048=1 then rent_aut_1048=10744.85;
if auton_E_1047=1 then rent_aut_1047=10744.85;
if auton_E_1046=1 then rent_aut_1046=10744.85;
if auton_E_1045=1 then rent_aut_1045=10744.85;
if auton_E_1044=1 then rent_aut_1044=10744.85;
if auton_E_1043=1 then rent_aut_1043=10744.85;
if auton_E_1042=1 then rent_aut_1042=10506.16;
if auton_E_1041=1 then rent_aut_1041=10157.81;
if auton_E_1040=1 then rent_aut_1040=9821.13;
if auton_E_1039=1 then rent_aut_1039=9495.60;
if auton_E_1038=1 then rent_aut_1038=9180.77;
if auton_E_1037=1 then rent_aut_1037=8876.54;
if auton_E_1036=1 then rent_aut_1036=8582.26;
if auton_E_1035=1 then rent_aut_1035=8297.71;
if auton_E_1034=1 then rent_aut_1034=8022.68;
if auton_E_1033=1 then rent_aut_1033=7756.74;


if auton_F_1083=1 then rent_aut_1083=9106.66;
if auton_F_1082=1 then rent_aut_1082=9106.66;
if auton_F_1081=1 then rent_aut_1081=9106.66;
if auton_F_1080=1 then rent_aut_1080=10408.82;
if auton_F_1079=1 then rent_aut_1079=10408.82;
if auton_F_1078=1 then rent_aut_1078=10845.67;
if auton_F_1077=1 then rent_aut_1077=10845.67;
if auton_F_1076=1 then rent_aut_1076=10988.48;
if auton_F_1075=1 then rent_aut_1075=10988.48;
if auton_F_1074=1 then rent_aut_1074=14281.67;
if auton_F_1073=1 then rent_aut_1073=14281.67;
if auton_F_1072=1 then rent_aut_1072=15029.35;
if auton_F_1071=1 then rent_aut_1071=15029.35;
if auton_F_1070=1 then rent_aut_1070=15029.35;
if auton_F_1069=1 then rent_aut_1069=15029.35;
if auton_F_1068=1 then rent_aut_1068=15029.35;
if auton_F_1067=1 then rent_aut_1067=15029.35;
if auton_F_1066=1 then rent_aut_1066=15029.35;
if auton_F_1065=1 then rent_aut_1065=15029.35;
if auton_F_1064=1 then rent_aut_1064=15029.35;
if auton_F_1063=1 then rent_aut_1063=15029.35;
if auton_F_1062=1 then rent_aut_1062=15029.35;
if auton_F_1061=1 then rent_aut_1061=15029.35;
if auton_F_1060=1 then rent_aut_1060=15029.35;
if auton_F_1059=1 then rent_aut_1059=15029.35;
if auton_F_1058=1 then rent_aut_1058=15029.35;
if auton_F_1057=1 then rent_aut_1057=15029.35;
if auton_F_1056=1 then rent_aut_1056=15029.35;
if auton_F_1055=1 then rent_aut_1055=15029.35;
if auton_F_1054=1 then rent_aut_1054=15029.35;
if auton_F_1053=1 then rent_aut_1053=15029.35;
if auton_F_1052=1 then rent_aut_1052=15029.35;
if auton_F_1051=1 then rent_aut_1051=15029.35;
if auton_F_1050=1 then rent_aut_1050=15029.35;
if auton_F_1049=1 then rent_aut_1049=15029.35;
if auton_F_1048=1 then rent_aut_1048=15029.35;
if auton_F_1047=1 then rent_aut_1047=15029.35;
if auton_F_1046=1 then rent_aut_1046=15029.35;
if auton_F_1045=1 then rent_aut_1045=15029.35;
if auton_F_1044=1 then rent_aut_1044=15029.35;
if auton_F_1043=1 then rent_aut_1043=15029.35;
if auton_F_1042=1 then rent_aut_1042=14695.49;
if auton_F_1041=1 then rent_aut_1041=14208.22;
if auton_F_1040=1 then rent_aut_1040=13737.30;
if auton_F_1039=1 then rent_aut_1039=13281.96;
if auton_F_1038=1 then rent_aut_1038=12841.59;
if auton_F_1037=1 then rent_aut_1037=12416.05;
if auton_F_1036=1 then rent_aut_1036=12004.42;
if auton_F_1035=1 then rent_aut_1035=11606.41;
if auton_F_1034=1 then rent_aut_1034=11221.72;
if auton_F_1033=1 then rent_aut_1033=10849.73;


if auton_G_1083=1 then rent_aut_1083=13013.12;
if auton_G_1082=1 then rent_aut_1082=13013.12;
if auton_G_1081=1 then rent_aut_1081=13013.12;
if auton_G_1080=1 then rent_aut_1080=14869.74;
if auton_G_1079=1 then rent_aut_1079=14869.74;
if auton_G_1078=1 then rent_aut_1078=15491.41;
if auton_G_1077=1 then rent_aut_1077=15491.41;
if auton_G_1076=1 then rent_aut_1076=15701.43;
if auton_G_1075=1 then rent_aut_1075=15701.43;
if auton_G_1074=1 then rent_aut_1074=20405.98;
if auton_G_1073=1 then rent_aut_1073=20405.98;
if auton_G_1072=1 then rent_aut_1072=21481.31;
if auton_G_1071=1 then rent_aut_1071=21481.31;
if auton_G_1070=1 then rent_aut_1070=21481.31;
if auton_G_1069=1 then rent_aut_1069=21481.31;
if auton_G_1068=1 then rent_aut_1068=21481.31;
if auton_G_1067=1 then rent_aut_1067=21481.31;
if auton_G_1066=1 then rent_aut_1066=21481.31;
if auton_G_1065=1 then rent_aut_1065=21481.31;
if auton_G_1064=1 then rent_aut_1064=21481.31;
if auton_G_1063=1 then rent_aut_1063=21481.31;
if auton_G_1062=1 then rent_aut_1062=21481.31;
if auton_G_1061=1 then rent_aut_1061=21481.31;
if auton_G_1060=1 then rent_aut_1060=21481.31;
if auton_G_1059=1 then rent_aut_1059=21481.31;
if auton_G_1058=1 then rent_aut_1058=21481.31;
if auton_G_1057=1 then rent_aut_1057=21481.31;
if auton_G_1056=1 then rent_aut_1056=21481.31;
if auton_G_1055=1 then rent_aut_1055=21481.31;
if auton_G_1054=1 then rent_aut_1054=21481.31;
if auton_G_1053=1 then rent_aut_1053=21481.31;
if auton_G_1052=1 then rent_aut_1052=21481.31;
if auton_G_1051=1 then rent_aut_1051=21481.31;
if auton_G_1050=1 then rent_aut_1050=21481.31;
if auton_G_1049=1 then rent_aut_1049=21481.31;
if auton_G_1048=1 then rent_aut_1048=21481.31;
if auton_G_1047=1 then rent_aut_1047=21481.31;
if auton_G_1046=1 then rent_aut_1046=21481.31;
if auton_G_1045=1 then rent_aut_1045=21481.31;
if auton_G_1044=1 then rent_aut_1044=21481.31;
if auton_G_1043=1 then rent_aut_1043=21481.31;
if auton_G_1042=1 then rent_aut_1042=21004.11;
if auton_G_1041=1 then rent_aut_1041=20307.67;
if auton_G_1040=1 then rent_aut_1040=19634.59;
if auton_G_1039=1 then rent_aut_1039=18983.77;
if auton_G_1038=1 then rent_aut_1038=18354.36;
if auton_G_1037=1 then rent_aut_1037=17746.13;
if auton_G_1036=1 then rent_aut_1036=17157.80;
if auton_G_1035=1 then rent_aut_1035=16588.93;
if auton_G_1034=1 then rent_aut_1034=16039.09;
if auton_G_1033=1 then rent_aut_1033=15507.41;


if auton_H_1083=1 then rent_aut_1083=19523.88;
if auton_H_1082=1 then rent_aut_1082=19523.88;
if auton_H_1081=1 then rent_aut_1081=19523.88;
if auton_H_1080=1 then rent_aut_1080=22313.01;
if auton_H_1079=1 then rent_aut_1079=22313.01;
if auton_H_1078=1 then rent_aut_1078=23245.51;
if auton_H_1077=1 then rent_aut_1077=23245.51;
if auton_H_1076=1 then rent_aut_1076=23556.35;
if auton_H_1075=1 then rent_aut_1075=23556.35;
if auton_H_1074=1 then rent_aut_1074=30621.58;
if auton_H_1073=1 then rent_aut_1073=30621.58;
if auton_H_1072=1 then rent_aut_1072=32234.56;
if auton_H_1071=1 then rent_aut_1071=32234.56;
if auton_H_1070=1 then rent_aut_1070=32234.56;
if auton_H_1069=1 then rent_aut_1069=32234.56;
if auton_H_1068=1 then rent_aut_1068=32234.56;
if auton_H_1067=1 then rent_aut_1067=32234.56;
if auton_H_1066=1 then rent_aut_1066=32234.56;
if auton_H_1065=1 then rent_aut_1065=32234.56;
if auton_H_1064=1 then rent_aut_1064=32234.56;
if auton_H_1063=1 then rent_aut_1063=32234.56;
if auton_H_1062=1 then rent_aut_1062=32234.56;
if auton_H_1061=1 then rent_aut_1061=32234.56;
if auton_H_1060=1 then rent_aut_1060=32234.56;
if auton_H_1059=1 then rent_aut_1059=32234.56;
if auton_H_1058=1 then rent_aut_1058=32234.56;
if auton_H_1057=1 then rent_aut_1057=32234.56;
if auton_H_1056=1 then rent_aut_1056=32234.56;
if auton_H_1055=1 then rent_aut_1055=32234.56;
if auton_H_1054=1 then rent_aut_1054=32234.56;
if auton_H_1053=1 then rent_aut_1053=32234.56;
if auton_H_1052=1 then rent_aut_1052=32234.56;
if auton_H_1051=1 then rent_aut_1051=32234.56;
if auton_H_1050=1 then rent_aut_1050=32234.56;
if auton_H_1049=1 then rent_aut_1049=32234.56;
if auton_H_1048=1 then rent_aut_1048=32234.56;
if auton_H_1047=1 then rent_aut_1047=32234.56;
if auton_H_1046=1 then rent_aut_1046=32234.56;
if auton_H_1045=1 then rent_aut_1045=32234.56;
if auton_H_1044=1 then rent_aut_1044=32234.56;
if auton_H_1043=1 then rent_aut_1043=32234.56;
if auton_H_1042=1 then rent_aut_1042=31518.49;
if auton_H_1041=1 then rent_aut_1041=30473.42;
if auton_H_1040=1 then rent_aut_1040=29463.40;
if auton_H_1039=1 then rent_aut_1039=28486.79;
if auton_H_1038=1 then rent_aut_1038=27542.30;
if auton_H_1037=1 then rent_aut_1037=26629.61;
if auton_H_1036=1 then rent_aut_1036=25746.77;
if auton_H_1035=1 then rent_aut_1035=24893.13;
if auton_H_1034=1 then rent_aut_1034=24068.04;
if auton_H_1033=1 then rent_aut_1033=23270.21;


if auton_I_1083=1 then rent_aut_1083=26026.24;
if auton_I_1082=1 then rent_aut_1082=26026.24;
if auton_I_1081=1 then rent_aut_1081=26026.24;
if auton_I_1080=1 then rent_aut_1080=29747.87;
if auton_I_1079=1 then rent_aut_1079=29747.87;
if auton_I_1078=1 then rent_aut_1078=30991.22;
if auton_I_1077=1 then rent_aut_1077=30991.22;
if auton_I_1076=1 then rent_aut_1076=31402.87;
if auton_I_1075=1 then rent_aut_1075=31402.87;
if auton_I_1074=1 then rent_aut_1074=38308.47;
if auton_I_1073=1 then rent_aut_1073=38308.47;
if auton_I_1072=1 then rent_aut_1072=40324.71;
if auton_I_1071=1 then rent_aut_1071=40324.71;
if auton_I_1070=1 then rent_aut_1070=40324.71;
if auton_I_1069=1 then rent_aut_1069=40324.71;
if auton_I_1068=1 then rent_aut_1068=40324.71;
if auton_I_1067=1 then rent_aut_1067=40324.71;
if auton_I_1066=1 then rent_aut_1066=40324.71;
if auton_I_1065=1 then rent_aut_1065=40324.71;
if auton_I_1064=1 then rent_aut_1064=40324.71;
if auton_I_1063=1 then rent_aut_1063=40324.71;
if auton_I_1062=1 then rent_aut_1062=40324.71;
if auton_I_1061=1 then rent_aut_1061=40324.71;
if auton_I_1060=1 then rent_aut_1060=40324.71;
if auton_I_1059=1 then rent_aut_1059=40324.71;
if auton_I_1058=1 then rent_aut_1058=40324.71;
if auton_I_1057=1 then rent_aut_1057=40324.71;
if auton_I_1056=1 then rent_aut_1056=40324.71;
if auton_I_1055=1 then rent_aut_1055=40324.71;
if auton_I_1054=1 then rent_aut_1054=40324.71;
if auton_I_1053=1 then rent_aut_1053=40324.71;
if auton_I_1052=1 then rent_aut_1052=40324.71;
if auton_I_1051=1 then rent_aut_1051=40324.71;
if auton_I_1050=1 then rent_aut_1050=40324.71;
if auton_I_1049=1 then rent_aut_1049=40324.71;
if auton_I_1048=1 then rent_aut_1048=40324.71;
if auton_I_1047=1 then rent_aut_1047=40324.71;
if auton_I_1046=1 then rent_aut_1046=40324.71;
if auton_I_1045=1 then rent_aut_1045=40324.71;
if auton_I_1044=1 then rent_aut_1044=40324.71;
if auton_I_1043=1 then rent_aut_1043=40324.71;
if auton_I_1042=1 then rent_aut_1042=39428.92;
if auton_I_1041=1 then rent_aut_1041=38121.56;
if auton_I_1040=1 then rent_aut_1040=36858.04;
if auton_I_1039=1 then rent_aut_1039=35636.33;
if auton_I_1038=1 then rent_aut_1038=34454.79;
if auton_I_1037=1 then rent_aut_1037=33313.04;
if auton_I_1036=1 then rent_aut_1036=32208.63;
if auton_I_1035=1 then rent_aut_1035=31140.74;
if auton_I_1034=1 then rent_aut_1034=30108.57;
if auton_I_1033=1 then rent_aut_1033=29110.50;

if auton_J_1083=1 then rent_aut_1083=31755.71;
if auton_J_1082=1 then rent_aut_1082=31755.71;
if auton_J_1081=1 then rent_aut_1081=31755.71;
if auton_J_1080=1 then rent_aut_1080=36292.24;
if auton_J_1079=1 then rent_aut_1079=36292.24;
if auton_J_1078=1 then rent_aut_1078=37804.41;
if auton_J_1077=1 then rent_aut_1077=37804.41;
if auton_J_1076=1 then rent_aut_1076=38308.47;
if auton_J_1075=1 then rent_aut_1075=38308.47;
if auton_J_1074=1 then rent_aut_1074=38308.47;
if auton_J_1073=1 then rent_aut_1073=38308.47;
if auton_J_1072=1 then rent_aut_1072=40324.71;
if auton_J_1071=1 then rent_aut_1071=40324.71;
if auton_J_1070=1 then rent_aut_1070=40324.71;
if auton_J_1069=1 then rent_aut_1069=40324.71;
if auton_J_1068=1 then rent_aut_1068=40324.71;
if auton_J_1067=1 then rent_aut_1067=40324.71;
if auton_J_1066=1 then rent_aut_1066=40324.71;
if auton_J_1065=1 then rent_aut_1065=40324.71;
if auton_J_1064=1 then rent_aut_1064=40324.71;
if auton_J_1063=1 then rent_aut_1063=40324.71;
if auton_J_1062=1 then rent_aut_1062=40324.71;
if auton_J_1061=1 then rent_aut_1061=40324.71;
if auton_J_1060=1 then rent_aut_1060=40324.71;
if auton_J_1059=1 then rent_aut_1059=40324.71;
if auton_J_1058=1 then rent_aut_1058=40324.71;
if auton_J_1057=1 then rent_aut_1057=40324.71;
if auton_J_1056=1 then rent_aut_1056=40324.71;
if auton_J_1055=1 then rent_aut_1055=40324.71;
if auton_J_1054=1 then rent_aut_1054=40324.71;
if auton_J_1053=1 then rent_aut_1053=40324.71;
if auton_J_1052=1 then rent_aut_1052=40324.71;
if auton_J_1051=1 then rent_aut_1051=40324.71;
if auton_J_1050=1 then rent_aut_1050=40324.71;
if auton_J_1049=1 then rent_aut_1049=40324.71;
if auton_J_1048=1 then rent_aut_1048=40324.71;
if auton_J_1047=1 then rent_aut_1047=40324.71;
if auton_J_1046=1 then rent_aut_1046=40324.71;
if auton_J_1045=1 then rent_aut_1045=40324.71;
if auton_J_1044=1 then rent_aut_1044=40324.71;
if auton_J_1043=1 then rent_aut_1043=40324.71;
if auton_J_1042=1 then rent_aut_1042=39428.92;
if auton_J_1041=1 then rent_aut_1041=38121.56;
if auton_J_1040=1 then rent_aut_1040=36858.04;
if auton_J_1039=1 then rent_aut_1039=35636.33;
if auton_J_1038=1 then rent_aut_1038=34454.79;
if auton_J_1037=1 then rent_aut_1037=33313.04;
if auton_J_1036=1 then rent_aut_1036=32208.63;
if auton_J_1035=1 then rent_aut_1035=31140.74;
if auton_J_1034=1 then rent_aut_1034=30108.57;
if auton_J_1033=1 then rent_aut_1033=29110.50;


auton_1_1032=0; 
auton_2_1032=0; 
auton_3_1032=0; 
auton_4_1032=0; 
auton_5_1032=0; 
auton_1_1031=0; 
auton_2_1031=0; 
auton_3_1031=0; 
auton_4_1031=0; 
auton_5_1031=0; 
auton_1_1030=0; 
auton_2_1030=0; 
auton_3_1030=0; 
auton_4_1030=0; 
auton_5_1030=0; 
auton_1_1029=0; 
auton_2_1029=0; 
auton_3_1029=0; 
auton_4_1029=0; 
auton_5_1029=0; 
auton_1_1028=0; 
auton_2_1028=0; 
auton_3_1028=0; 
auton_4_1028=0; 
auton_5_1028=0; 
auton_1_1027=0; 
auton_2_1027=0; 
auton_3_1027=0; 
auton_4_1027=0; 
auton_5_1027=0; 
auton_1_1026=0; 
auton_2_1026=0; 
auton_3_1026=0; 
auton_4_1026=0; 
auton_5_1026=0; 
auton_1_1025=0; 
auton_2_1025=0; 
auton_3_1025=0; 
auton_4_1025=0; 
auton_5_1025=0; 
auton_1_1024=0; 
auton_2_1024=0; 
auton_3_1024=0; 
auton_4_1024=0; 
auton_5_1024=0; 
auton_1_1023=0; 
auton_2_1023=0; 
auton_3_1023=0; 
auton_4_1023=0; 
auton_5_1023=0; 
auton_1_1022=0; 
auton_2_1022=0; 
auton_3_1022=0; 
auton_4_1022=0; 
auton_5_1022=0; 
auton_1_1021=0; 
auton_2_1021=0; 
auton_3_1021=0; 
auton_4_1021=0; 
auton_5_1021=0; 
auton_1_1020=0; 
auton_2_1020=0; 
auton_3_1020=0; 
auton_4_1020=0; 
auton_5_1020=0; 
auton_1_1019=0; 
auton_2_1019=0; 
auton_3_1019=0; 
auton_4_1019=0; 
auton_5_1019=0; 
auton_1_1018=0; 
auton_2_1018=0; 
auton_3_1018=0; 
auton_4_1018=0; 
auton_5_1018=0; 
auton_1_1017=0; 
auton_2_1017=0; 
auton_3_1017=0; 
auton_4_1017=0; 
auton_5_1017=0; 
auton_1_1016=0; 
auton_2_1016=0; 
auton_3_1016=0; 
auton_4_1016=0; 
auton_5_1016=0; 
auton_1_1015=0; 
auton_2_1015=0; 
auton_3_1015=0; 
auton_4_1015=0; 
auton_5_1015=0; 
auton_1_1014=0; 
auton_2_1014=0; 
auton_3_1014=0; 
auton_4_1014=0; 
auton_5_1014=0; 
auton_1_1013=0; 
auton_2_1013=0; 
auton_3_1013=0; 
auton_4_1013=0; 
auton_5_1013=0; 
auton_1_1012=0; 
auton_2_1012=0; 
auton_3_1012=0; 
auton_4_1012=0; 
auton_5_1012=0; 
auton_1_1011=0; 
auton_2_1011=0; 
auton_3_1011=0; 
auton_4_1011=0; 
auton_5_1011=0; 
auton_1_1010=0; 
auton_2_1010=0; 
auton_3_1010=0; 
auton_4_1010=0; 
auton_5_1010=0; 
auton_1_1009=0; 
auton_2_1009=0; 
auton_3_1009=0; 
auton_4_1009=0; 
auton_5_1009=0; 
auton_1_1008=0; 
auton_2_1008=0; 
auton_3_1008=0; 
auton_4_1008=0; 
auton_5_1008=0; 
auton_1_1007=0; 
auton_2_1007=0; 
auton_3_1007=0; 
auton_4_1007=0; 
auton_5_1007=0; 
auton_1_1006=0; 
auton_2_1006=0; 
auton_3_1006=0; 
auton_4_1006=0; 
auton_5_1006=0; 
auton_1_1005=0; 
auton_2_1005=0; 
auton_3_1005=0; 
auton_4_1005=0; 
auton_5_1005=0; 
auton_1_1004=0; 
auton_2_1004=0; 
auton_3_1004=0; 
auton_4_1004=0; 
auton_5_1004=0; 
auton_1_1003=0; 
auton_2_1003=0; 
auton_3_1003=0; 
auton_4_1003=0; 
auton_5_1003=0; 
auton_1_1002=0; 
auton_2_1002=0; 
auton_3_1002=0; 
auton_4_1002=0; 
auton_5_1002=0; 
auton_1_1001=0; 
auton_2_1001=0; 
auton_3_1001=0; 
auton_4_1001=0; 
auton_5_1001=0; 
auton_1_1000=0; 
auton_2_1000=0; 
auton_3_1000=0; 
auton_4_1000=0; 
auton_5_1000=0; 
auton_1_999=0; 
auton_2_999=0; 
auton_3_999=0; 
auton_4_999=0; 
auton_5_999=0; 
auton_1_998=0; 
auton_2_998=0; 
auton_3_998=0; 
auton_4_998=0; 
auton_5_998=0; 
auton_1_997=0; 
auton_2_997=0; 
auton_3_997=0; 
auton_4_997=0; 
auton_5_997=0; 
auton_1_996=0; 
auton_2_996=0; 
auton_3_996=0; 
auton_4_996=0; 
auton_5_996=0; 
auton_1_995=0; 
auton_2_995=0; 
auton_3_995=0; 
auton_4_995=0; 
auton_5_995=0; 
auton_1_994=0; 
auton_2_994=0; 
auton_3_994=0; 
auton_4_994=0; 
auton_5_994=0; 
auton_1_993=0; 
auton_2_993=0; 
auton_3_993=0; 
auton_4_993=0; 
auton_5_993=0; 

 if boss_1032=1 then do; if itl_1032<=2776.53 then auton_3_1032=1; if 2776.53< itl_1032<=5553.06 then auton_4_1032=1; if itl_1032>5553.06 then auton_5_1032=1; end; 
 if boss_1031=1 then do; if itl_1031<=2734.61 then auton_3_1031=1; if 2734.61< itl_1031<=5469.21 then auton_4_1031=1; if itl_1031>5469.21 then auton_5_1031=1; end; 
 if boss_1030=1 then do; if itl_1030<=2671.67 then auton_3_1030=1; if 2671.67< itl_1030<=5343.34 then auton_4_1030=1; if itl_1030>5343.34 then auton_5_1030=1; end; 
 if boss_1029=1 then do; if itl_1029<=2610.52 then auton_3_1029=1; if 2610.52< itl_1029<=5221.03 then auton_4_1029=1; if itl_1029>5221.03 then auton_5_1029=1; end; 
 if boss_1028=1 then do; if itl_1028<=2545.79 then auton_3_1028=1; if 2545.79< itl_1028<=5091.58 then auton_4_1028=1; if itl_1028>5091.58 then auton_5_1028=1; end; 
 if boss_1027=1 then do; if itl_1027<=2508.62 then auton_3_1027=1; if 2508.62< itl_1027<=5017.24 then auton_4_1027=1; if itl_1027>5017.24 then auton_5_1027=1; end; 
 if boss_1026=1 then do; if itl_1026<=2476.82 then auton_3_1026=1; if 2476.82< itl_1026<=4953.65 then auton_4_1026=1; if itl_1026>4953.65 then auton_5_1026=1; end; 
 if boss_1025=1 then do; if itl_1025<=2444.89 then auton_3_1025=1; if 2444.89< itl_1025<=4889.78 then auton_4_1025=1; if itl_1025>4889.78 then auton_5_1025=1; end; 
 if boss_1024=1 then do; if itl_1024<=2413.32 then auton_3_1024=1; if 2413.32< itl_1024<=4826.63 then auton_4_1024=1; if itl_1024>4826.63 then auton_5_1024=1; end; 
 if boss_1023=1 then do; if itl_1023<=2368.66 then auton_3_1023=1; if 2368.66< itl_1023<=4737.32 then auton_4_1023=1; if itl_1023>4737.32 then auton_5_1023=1; end; 
 if boss_1022=1 then do; if itl_1022<=2313.43 then auton_3_1022=1; if 2313.43< itl_1022<=4626.87 then auton_4_1022=1; if itl_1022>4626.87 then auton_5_1022=1; end; 
 if boss_1021=1 then do; if itl_1021<=2240.54 then auton_3_1021=1; if 2240.54< itl_1021<=4481.09 then auton_4_1021=1; if itl_1021>4481.09 then auton_5_1021=1; end; 
 if boss_1020=1 then do; if itl_1020<=2180.80 then auton_3_1020=1; if 2180.80< itl_1020<=4361.61 then auton_4_1020=1; if itl_1020>4361.61 then auton_5_1020=1; end; 
 if boss_1019=1 then do; if itl_1019<=2131.95 then auton_3_1019=1; if 2131.95< itl_1019<=4263.90 then auton_4_1019=1; if itl_1019>4263.90 then auton_5_1019=1; end; 
 if boss_1018=1 then do; if itl_1018<=2083.71 then auton_3_1018=1; if 2083.71< itl_1018<=4167.42 then auton_4_1018=1; if itl_1018>4167.42 then auton_5_1018=1; end; 
 if boss_1017=1 then do; if itl_1017<=2036.47 then auton_3_1017=1; if 2036.47< itl_1017<=4072.94 then auton_4_1017=1; if itl_1017>4072.94 then auton_5_1017=1; end; 
 if boss_1016=1 then do; if itl_1016<=1988.08 then auton_3_1016=1; if 1988.08< itl_1016<=3976.15 then auton_4_1016=1; if itl_1016>3976.15 then auton_5_1016=1; end; 
 if boss_1015=1 then do; if itl_1015<=1942.22 then auton_3_1015=1; if 1942.22< itl_1015<=3884.45 then auton_4_1015=1; if itl_1015>3884.45 then auton_5_1015=1; end; 
 if boss_1014=1 then do; if itl_1014<=1902.81 then auton_3_1014=1; if 1902.81< itl_1014<=3805.63 then auton_4_1014=1; if itl_1014>3805.63 then auton_5_1014=1; end; 
 if boss_1013=1 then do; if itl_1013<=1856.18 then auton_3_1013=1; if 1856.18< itl_1013<=3712.36 then auton_4_1013=1; if itl_1013>3712.36 then auton_5_1013=1; end; 
 if boss_1012=1 then do; if itl_1012<=1809.09 then auton_3_1012=1; if 1809.09< itl_1012<=3618.18 then auton_4_1012=1; if itl_1012>3618.18 then auton_5_1012=1; end; 
 if boss_1011=1 then do; if itl_1011<=1766.28 then auton_3_1011=1; if 1766.28< itl_1011<=3532.56 then auton_4_1011=1; if itl_1011>3532.56 then auton_5_1011=1; end; 
 if boss_1010=1 then do; if itl_1010<=1720.11 then auton_3_1010=1; if 1720.11< itl_1010<=3440.23 then auton_4_1010=1; if itl_1010>3440.23 then auton_5_1010=1; end; 
 if boss_1009=1 then do; if itl_1009<=1674.98 then auton_3_1009=1; if 1674.98< itl_1009<=3349.97 then auton_4_1009=1; if itl_1009>3349.97 then auton_5_1009=1; end; 
 if boss_1008=1 then do; if itl_1008<=1639.58 then auton_3_1008=1; if 1639.58< itl_1008<=3279.17 then auton_4_1008=1; if itl_1008>3279.17 then auton_5_1008=1; end; 
 if boss_1007=1 then do; if itl_1007<=1597.73 then auton_3_1007=1; if 1597.73< itl_1007<=3195.46 then auton_4_1007=1; if itl_1007>3195.46 then auton_5_1007=1; end; 
 if boss_1006=1 then do; if itl_1006<=1556.16 then auton_3_1006=1; if 1556.16< itl_1006<=3112.33 then auton_4_1006=1; if itl_1006>3112.33 then auton_5_1006=1; end; 
 if boss_1005=1 then do; if itl_1005<=1430.80 then auton_3_1005=1; if 1430.80< itl_1005<=2861.59 then auton_4_1005=1; if itl_1005>2861.59 then auton_5_1005=1; end; 
 if boss_1004=1 then do; if itl_1004<=1350.73 then auton_3_1004=1; if 1350.73< itl_1004<=2701.47 then auton_4_1004=1; if itl_1004>2701.47 then auton_5_1004=1; end; 
 if boss_1003=1 then do; if itl_1003<=1297.37 then auton_3_1003=1; if 1297.37< itl_1003<=2594.74 then auton_4_1003=1; if itl_1003>2594.74 then auton_5_1003=1; end; 
 if boss_1002=1 then do; if itl_1002<=1250 then auton_3_1002=1; if 1250< itl_1002<=2500 then auton_4_1002=1; if itl_1002>2500 then auton_5_1002=1; end; 
 if boss_1001=1 then do; if itl_1001<=1212.52 then auton_3_1001=1; if 1212.52< itl_1001<=2425.04 then auton_4_1001=1; if itl_1001>2425.04 then auton_5_1001=1; end; 
 if boss_1000=1 then do; if itl_1000<=1171.13 then auton_3_1000=1; if 1171.13< itl_1000<=2342.26 then auton_4_1000=1; if itl_1000>2342.26 then auton_5_1000=1; end; 
 if boss_999=1 then do; if itl_999<=1131.38 then auton_3_999=1; if 1131.38< itl_999<=2262.76 then auton_4_999=1; if itl_999>2262.76 then auton_5_999=1; end; 
 if boss_998=1 then do; if itl_998<=1079.52 then auton_3_998=1; if 1079.52< itl_998<=2159.04 then auton_4_998=1; if itl_998>2159.04 then auton_5_998=1; end; 
 if boss_997=1 then do; if itl_997<=953.33 then auton_3_997=1; if 953.33< itl_997<=1906.67 then auton_4_997=1; if itl_997>1906.67 then auton_5_997=1; end; 
 if boss_996=1 then do; if itl_996<=845.19 then auton_3_996=1; if 845.19< itl_996<=1690.37 then auton_4_996=1; if itl_996>1690.37 then auton_5_996=1; end; 
 if boss_995=1 then do; if itl_995<=801.89 then auton_3_995=1; if 801.89< itl_995<=1603.78 then auton_4_995=1; if itl_995>1603.78 then auton_5_995=1; end; 
 if boss_994=1 then do; if itl_994<=762.15 then auton_3_994=1; if 762.15< itl_994<=1524.30 then auton_4_994=1; if itl_994>1524.30 then auton_5_994=1; end; 
 if boss_993=1 then do; if itl_993<=726.34 then auton_3_993=1; if 726.34< itl_993<=1452.68 then auton_4_993=1; if itl_993>1452.68 then auton_5_993=1; end; 
 /*if boss_992=1 then do; if itl_992<=681.36 then auton_3_992=1; if 681.36< itl_992<=1362.73 then auton_4_992=1; if itl_992>1362.73 then auton_5_992=1; end; 
 if boss_991=1 then do; if itl_991<=652.71 then auton_3_991=1; if 652.71< itl_991<=1305.42 then auton_4_991=1; if itl_991>1305.42 then auton_5_991=1; end; 
 if boss_990=1 then do; if itl_990<=622.28 then auton_3_990=1; if 622.28< itl_990<=1244.57 then auton_4_990=1; if itl_990>1244.57 then auton_5_990=1; end; 
*/
 if boss_1032=0 & autonomo_1032=1 then do; if itl_1032<=4164.79 then auton_1_1032=1; if itl_1032>4164.79 then auton_1_1032=1; end; 
if boss_1031=0 & autonomo_1031=1 then do; if itl_1031<=4101.91 then auton_1_1031=1; if itl_1031>4101.91 then auton_1_1031=1; end; 
if boss_1030=0 & autonomo_1030=1 then do; if itl_1030<=4007.51 then auton_1_1030=1; if itl_1030>4007.51 then auton_1_1030=1; end; 
if boss_1029=0 & autonomo_1029=1 then do; if itl_1029<=3915.77 then auton_1_1029=1; if itl_1029>3915.77 then auton_1_1029=1; end; 
if boss_1028=0 & autonomo_1028=1 then do; if itl_1028<=3818.68 then auton_1_1028=1; if itl_1028>3818.68 then auton_1_1028=1; end; 
if boss_1027=0 & autonomo_1027=1 then do; if itl_1027<=3762.93 then auton_1_1027=1; if itl_1027>3762.93 then auton_1_1027=1; end; 
if boss_1026=0 & autonomo_1026=1 then do; if itl_1026<=3715.24 then auton_1_1026=1; if itl_1026>3715.24 then auton_1_1026=1; end; 
if boss_1025=0 & autonomo_1025=1 then do; if itl_1025<=3667.34 then auton_1_1025=1; if itl_1025>3667.34 then auton_1_1025=1; end; 
if boss_1024=0 & autonomo_1024=1 then do; if itl_1024<=3619.97 then auton_1_1024=1; if itl_1024>3619.97 then auton_1_1024=1; end; 
if boss_1023=0 & autonomo_1023=1 then do; if itl_1023<=3552.99 then auton_1_1023=1; if itl_1023>3552.99 then auton_1_1023=1; end; 
if boss_1022=0 & autonomo_1022=1 then do; if itl_1022<=3470.15 then auton_1_1022=1; if itl_1022>3470.15 then auton_1_1022=1; end; 
if boss_1021=0 & autonomo_1021=1 then do; if itl_1021<=3360.82 then auton_1_1021=1; if itl_1021>3360.82 then auton_1_1021=1; end; 
if boss_1020=0 & autonomo_1020=1 then do; if itl_1020<=3271.21 then auton_1_1020=1; if itl_1020>3271.21 then auton_1_1020=1; end; 
if boss_1019=0 & autonomo_1019=1 then do; if itl_1019<=3197.93 then auton_1_1019=1; if itl_1019>3197.93 then auton_1_1019=1; end; 
if boss_1018=0 & autonomo_1018=1 then do; if itl_1018<=3125.57 then auton_1_1018=1; if itl_1018>3125.57 then auton_1_1018=1; end; 
if boss_1017=0 & autonomo_1017=1 then do; if itl_1017<=3054.70 then auton_1_1017=1; if itl_1017>3054.70 then auton_1_1017=1; end; 
if boss_1016=0 & autonomo_1016=1 then do; if itl_1016<=2982.11 then auton_1_1016=1; if itl_1016>2982.11 then auton_1_1016=1; end; 
if boss_1015=0 & autonomo_1015=1 then do; if itl_1015<=2913.34 then auton_1_1015=1; if itl_1015>2913.34 then auton_1_1015=1; end; 
if boss_1014=0 & autonomo_1014=1 then do; if itl_1014<=2854.22 then auton_1_1014=1; if itl_1014>2854.22 then auton_1_1014=1; end; 
if boss_1013=0 & autonomo_1013=1 then do; if itl_1013<=2784.27 then auton_1_1013=1; if itl_1013>2784.27 then auton_1_1013=1; end; 
if boss_1012=0 & autonomo_1012=1 then do; if itl_1012<=2713.64 then auton_1_1012=1; if itl_1012>2713.64 then auton_1_1012=1; end; 
if boss_1011=0 & autonomo_1011=1 then do; if itl_1011<=2649.42 then auton_1_1011=1; if itl_1011>2649.42 then auton_1_1011=1; end; 
if boss_1010=0 & autonomo_1010=1 then do; if itl_1010<=2580.17 then auton_1_1010=1; if itl_1010>2580.17 then auton_1_1010=1; end; 
if boss_1009=0 & autonomo_1009=1 then do; if itl_1009<=2512.48 then auton_1_1009=1; if itl_1009>2512.48 then auton_1_1009=1; end; 
if boss_1008=0 & autonomo_1008=1 then do; if itl_1008<=2459.38 then auton_1_1008=1; if itl_1008>2459.38 then auton_1_1008=1; end; 
if boss_1007=0 & autonomo_1007=1 then do; if itl_1007<=2396.60 then auton_1_1007=1; if itl_1007>2396.60 then auton_1_1007=1; end; 
if boss_1006=0 & autonomo_1006=1 then do; if itl_1006<=2334.25 then auton_1_1006=1; if itl_1006>2334.25 then auton_1_1006=1; end; 
if boss_1005=0 & autonomo_1005=1 then do; if itl_1005<=2146.19 then auton_1_1005=1; if itl_1005>2146.19 then auton_1_1005=1; end; 
if boss_1004=0 & autonomo_1004=1 then do; if itl_1004<=2026.10 then auton_1_1004=1; if itl_1004>2026.10 then auton_1_1004=1; end; 
if boss_1003=0 & autonomo_1003=1 then do; if itl_1003<=1946.06 then auton_1_1003=1; if itl_1003>1946.06 then auton_1_1003=1; end; 
if boss_1002=0 & autonomo_1002=1 then do; if itl_1002<=1875 then auton_1_1002=1; if itl_1002>1875 then auton_1_1002=1; end; 
if boss_1001=0 & autonomo_1001=1 then do; if itl_1001<=1818.78 then auton_1_1001=1; if itl_1001>1818.78 then auton_1_1001=1; end; 
if boss_1000=0 & autonomo_1000=1 then do; if itl_1000<=1756.70 then auton_1_1000=1; if itl_1000>1756.70 then auton_1_1000=1; end; 
if boss_999=0 & autonomo_999=1 then do; if itl_999<=1697.07 then auton_1_999=1; if itl_999>1697.07 then auton_1_999=1; end; 
if boss_998=0 & autonomo_998=1 then do; if itl_998<=1619.28 then auton_1_998=1; if itl_998>1619.28 then auton_1_998=1; end; 
if boss_997=0 & autonomo_997=1 then do; if itl_997<=1430 then auton_1_997=1; if itl_997>1430 then auton_1_997=1; end; 
if boss_996=0 & autonomo_996=1 then do; if itl_996<=1267.78 then auton_1_996=1; if itl_996>1267.78 then auton_1_996=1; end; 
if boss_995=0 & autonomo_995=1 then do; if itl_995<=1202.84 then auton_1_995=1; if itl_995>1202.84 then auton_1_995=1; end; 
if boss_994=0 & autonomo_994=1 then do; if itl_994<=1143.22 then auton_1_994=1; if itl_994>1143.22 then auton_1_994=1; end; 
if boss_993=0 & autonomo_993=1 then do; if itl_993<=1089.51 then auton_1_993=1; if itl_993>1089.51 then auton_1_993=1; end; /*
if boss_992=0 & autonomo_992=1 then do; if itl_992<=1022.04 then auton_1_992=1; if itl_992>1022.04 then auton_1_992=1; end; 
if boss_991=0 & autonomo_991=1 then do; if itl_991<=979.07 then auton_1_991=1; if itl_991>979.07 then auton_1_991=1; end; 
if boss_990=0 & autonomo_990=1 then do; if itl_990<=933.43 then auton_1_990=1; if itl_990>933.43 then auton_1_990=1; end;*/ 

if auton_1_1032=1 then rent_aut_1032=2345.48; if auton_2_1032=1 then rent_aut_1032=3283.67; if auton_3_1032=1 then rent_aut_1032=4690.95; if auton_4_1032=1 then rent_aut_1032=7505.52; if auton_5_1032=1 then rent_aut_1032=10320.09;
if auton_1_1031=1 then rent_aut_1031=2267.72; if auton_2_1031=1 then rent_aut_1031=3174.80; if auton_3_1031=1 then rent_aut_1031=4535.43; if auton_4_1031=1 then rent_aut_1031=7256.69; if auton_5_1031=1 then rent_aut_1031=9977.95;
if auton_1_1030=1 then rent_aut_1030=2192.56; if auton_2_1030=1 then rent_aut_1030=3069.58; if auton_3_1030=1 then rent_aut_1030=4385.12; if auton_4_1030=1 then rent_aut_1030=7016.19; if auton_5_1030=1 then rent_aut_1030=9647.26;
if auton_1_1029=1 then rent_aut_1029=2119.87; if auton_2_1029=1 then rent_aut_1029=2967.82; if auton_3_1029=1 then rent_aut_1029=4239.74; if auton_4_1029=1 then rent_aut_1029=6783.59; if auton_5_1029=1 then rent_aut_1029=9327.43;
if auton_1_1028=1 then rent_aut_1028=2049.59; if auton_2_1028=1 then rent_aut_1028=2869.42; if auton_3_1028=1 then rent_aut_1028=4099.17; if auton_4_1028=1 then rent_aut_1028=6558.67; if auton_5_1028=1 then rent_aut_1028=9018.18;
if auton_1_1027=1 then rent_aut_1027=1981.67; if auton_2_1027=1 then rent_aut_1027=2774.33; if auton_3_1027=1 then rent_aut_1027=3963.34; if auton_4_1027=1 then rent_aut_1027=6341.34; if auton_5_1027=1 then rent_aut_1027=8719.34;
if auton_1_1026=1 then rent_aut_1026=1915.98; if auton_2_1026=1 then rent_aut_1026=2682.37; if auton_3_1026=1 then rent_aut_1026=3831.96; if auton_4_1026=1 then rent_aut_1026=6131.14; if auton_5_1026=1 then rent_aut_1026=8430.32;
if auton_1_1025=1 then rent_aut_1025=1873.40; if auton_2_1025=1 then rent_aut_1025=2622.76; if auton_3_1025=1 then rent_aut_1025=3746.80; if auton_4_1025=1 then rent_aut_1025=5994.87; if auton_5_1025=1 then rent_aut_1025=8242.95;
if auton_1_1024=1 then rent_aut_1024=1873.42; if auton_2_1024=1 then rent_aut_1024=2622.77; if auton_3_1024=1 then rent_aut_1024=3746.83; if auton_4_1024=1 then rent_aut_1024=5994.92; if auton_5_1024=1 then rent_aut_1024=8243.02;
if auton_1_1023=1 then rent_aut_1023=1873.42; if auton_2_1023=1 then rent_aut_1023=2622.77; if auton_3_1023=1 then rent_aut_1023=3746.83; if auton_4_1023=1 then rent_aut_1023=5994.92; if auton_5_1023=1 then rent_aut_1023=8243.02;
if auton_1_1022=1 then rent_aut_1022=1873.42; if auton_2_1022=1 then rent_aut_1022=2622.77; if auton_3_1022=1 then rent_aut_1022=3746.83; if auton_4_1022=1 then rent_aut_1022=5994.93; if auton_5_1022=1 then rent_aut_1022=8243.02;
if auton_1_1021=1 then rent_aut_1021=1873.42; if auton_2_1021=1 then rent_aut_1021=2622.77; if auton_3_1021=1 then rent_aut_1021=3746.83; if auton_4_1021=1 then rent_aut_1021=5994.93; if auton_5_1021=1 then rent_aut_1021=8243.02;
if auton_1_1020=1 then rent_aut_1020=1873.42; if auton_2_1020=1 then rent_aut_1020=2622.78; if auton_3_1020=1 then rent_aut_1020=3746.85; if auton_4_1020=1 then rent_aut_1020=5994.95; if auton_5_1020=1 then rent_aut_1020=8243.05;
if auton_1_1019=1 then rent_aut_1019=1873.42; if auton_2_1019=1 then rent_aut_1019=2622.78; if auton_3_1019=1 then rent_aut_1019=3746.85; if auton_4_1019=1 then rent_aut_1019=5994.95; if auton_5_1019=1 then rent_aut_1019=8243.05;
if auton_1_1018=1 then rent_aut_1018=1873.38; if auton_2_1018=1 then rent_aut_1018=2622.72; if auton_3_1018=1 then rent_aut_1018=3746.76; if auton_4_1018=1 then rent_aut_1018=5994.82; if auton_5_1018=1 then rent_aut_1018=8242.87;
if auton_1_1017=1 then rent_aut_1017=1873.38; if auton_2_1017=1 then rent_aut_1017=2622.72; if auton_3_1017=1 then rent_aut_1017=3746.76; if auton_4_1017=1 then rent_aut_1017=5994.82; if auton_5_1017=1 then rent_aut_1017=8242.87;
if auton_1_1016=1 then rent_aut_1016=1873.40; if auton_2_1016=1 then rent_aut_1016=2622.74; if auton_3_1016=1 then rent_aut_1016=3746.80; if auton_4_1016=1 then rent_aut_1016=5994.87; if auton_5_1016=1 then rent_aut_1016=8242.94;
if auton_1_1015=1 then rent_aut_1015=1873.40; if auton_2_1015=1 then rent_aut_1015=2622.74; if auton_3_1015=1 then rent_aut_1015=3746.80; if auton_4_1015=1 then rent_aut_1015=5994.87; if auton_5_1015=1 then rent_aut_1015=8242.94;
if auton_1_1014=1 then rent_aut_1014=1873.38; if auton_2_1014=1 then rent_aut_1014=2622.72; if auton_3_1014=1 then rent_aut_1014=3746.76; if auton_4_1014=1 then rent_aut_1014=5994.81; if auton_5_1014=1 then rent_aut_1014=8242.85;
if auton_1_1013=1 then rent_aut_1013=1873.38; if auton_2_1013=1 then rent_aut_1013=2622.72; if auton_3_1013=1 then rent_aut_1013=3746.76; if auton_4_1013=1 then rent_aut_1013=5994.81; if auton_5_1013=1 then rent_aut_1013=8242.85;
if auton_1_1012=1 then rent_aut_1012=1873.42; if auton_2_1012=1 then rent_aut_1012=2622.78; if auton_3_1012=1 then rent_aut_1012=3746.85; if auton_4_1012=1 then rent_aut_1012=5994.95; if auton_5_1012=1 then rent_aut_1012=8243.05;
if auton_1_1011=1 then rent_aut_1011=1873.42; if auton_2_1011=1 then rent_aut_1011=2622.78; if auton_3_1011=1 then rent_aut_1011=3746.85; if auton_4_1011=1 then rent_aut_1011=5994.95; if auton_5_1011=1 then rent_aut_1011=8243.05;
if auton_1_1010=1 then rent_aut_1010=1873.42; if auton_2_1010=1 then rent_aut_1010=2622.77; if auton_3_1010=1 then rent_aut_1010=3746.83; if auton_4_1010=1 then rent_aut_1010=5994.93; if auton_5_1010=1 then rent_aut_1010=8243.02;
if auton_1_1009=1 then rent_aut_1009=1873.42; if auton_2_1009=1 then rent_aut_1009=2622.77; if auton_3_1009=1 then rent_aut_1009=3746.83; if auton_4_1009=1 then rent_aut_1009=5994.93; if auton_5_1009=1 then rent_aut_1009=8243.02;
if auton_1_1008=1 then rent_aut_1008=1873.38; if auton_2_1008=1 then rent_aut_1008=2622.71; if auton_3_1008=1 then rent_aut_1008=3746.76; if auton_4_1008=1 then rent_aut_1008=5994.80; if auton_5_1008=1 then rent_aut_1008=8242.85;
if auton_1_1007=1 then rent_aut_1007=1873.38; if auton_2_1007=1 then rent_aut_1007=2622.71; if auton_3_1007=1 then rent_aut_1007=3746.76; if auton_4_1007=1 then rent_aut_1007=5994.80; if auton_5_1007=1 then rent_aut_1007=8242.85;
if auton_1_1006=1 then rent_aut_1006=1873.41; if auton_2_1006=1 then rent_aut_1006=2622.76; if auton_3_1006=1 then rent_aut_1006=3746.82; if auton_4_1006=1 then rent_aut_1006=5994.91; if auton_5_1006=1 then rent_aut_1006=8242.99;
if auton_1_1005=1 then rent_aut_1005=1873.41; if auton_2_1005=1 then rent_aut_1005=2622.76; if auton_3_1005=1 then rent_aut_1005=3746.82; if auton_4_1005=1 then rent_aut_1005=5994.91; if auton_5_1005=1 then rent_aut_1005=8242.99;
if auton_1_1004=1 then rent_aut_1004=1873.37; if auton_2_1004=1 then rent_aut_1004=2622.71; if auton_3_1004=1 then rent_aut_1004=3746.74; if auton_4_1004=1 then rent_aut_1004=5994.78; if auton_5_1004=1 then rent_aut_1004=8242.82;
if auton_1_1003=1 then rent_aut_1003=1873.37; if auton_2_1003=1 then rent_aut_1003=2622.71; if auton_3_1003=1 then rent_aut_1003=3746.74; if auton_4_1003=1 then rent_aut_1003=5994.78; if auton_5_1003=1 then rent_aut_1003=8242.82;
if auton_1_1002=1 then rent_aut_1002=1873.41; if auton_2_1002=1 then rent_aut_1002=2622.75; if auton_3_1002=1 then rent_aut_1002=3746.81; if auton_4_1002=1 then rent_aut_1002=5994.89; if auton_5_1002=1 then rent_aut_1002=8242.97;
if auton_1_1001=1 then rent_aut_1001=1873.41; if auton_2_1001=1 then rent_aut_1001=2622.75; if auton_3_1001=1 then rent_aut_1001=3746.81; if auton_4_1001=1 then rent_aut_1001=5994.89; if auton_5_1001=1 then rent_aut_1001=8242.97;
if auton_1_1000=1 then rent_aut_1000=1873.41; if auton_2_1000=1 then rent_aut_1000=2622.75; if auton_3_1000=1 then rent_aut_1000=3746.81; if auton_4_1000=1 then rent_aut_1000=5994.89; if auton_5_1000=1 then rent_aut_1000=8242.97;
if auton_1_999=1 then rent_aut_999=1873.41; if auton_2_999=1 then rent_aut_999=2622.75; if auton_3_999=1 then rent_aut_999=3746.81; if auton_4_999=1 then rent_aut_999=5994.89; if auton_5_999=1 then rent_aut_999=8242.97;
if auton_1_998=1 then rent_aut_998=1873.41; if auton_2_998=1 then rent_aut_998=2622.75; if auton_3_998=1 then rent_aut_998=3746.81; if auton_4_998=1 then rent_aut_998=5994.89; if auton_5_998=1 then rent_aut_998=8242.97;
if auton_1_997=1 then rent_aut_997=1873.41; if auton_2_997=1 then rent_aut_997=2622.75; if auton_3_997=1 then rent_aut_997=3746.81; if auton_4_997=1 then rent_aut_997=5994.89; if auton_5_997=1 then rent_aut_997=8242.97;
if auton_1_996=1 then rent_aut_996=1873.41; if auton_2_996=1 then rent_aut_996=2622.75; if auton_3_996=1 then rent_aut_996=3746.81; if auton_4_996=1 then rent_aut_996=5994.89; if auton_5_996=1 then rent_aut_996=8242.97;
if auton_1_995=1 then rent_aut_995=1873.41; if auton_2_995=1 then rent_aut_995=2622.75; if auton_3_995=1 then rent_aut_995=3746.81; if auton_4_995=1 then rent_aut_995=5994.89; if auton_5_995=1 then rent_aut_995=8242.97;
if auton_1_994=1 then rent_aut_994=1873.41; if auton_2_994=1 then rent_aut_994=2622.75; if auton_3_994=1 then rent_aut_994=3746.81; if auton_4_994=1 then rent_aut_994=5994.89; if auton_5_994=1 then rent_aut_994=8242.97;
if auton_1_993=1 then rent_aut_993=1873.41; if auton_2_993=1 then rent_aut_993=2622.75; if auton_3_993=1 then rent_aut_993=3746.81; if auton_4_993=1 then rent_aut_993=5994.89; if auton_5_993=1 then rent_aut_993=8242.97;
/*if auton_1_992=1 then rent_aut_992=1873.41; if auton_2_992=1 then rent_aut_992=2622.75; if auton_3_992=1 then rent_aut_992=3746.81; if auton_4_992=1 then rent_aut_992=5994.89; if auton_5_992=1 then rent_aut_992=8242.97;
if auton_1_991=1 then rent_aut_991=1873.41; if auton_2_991=1 then rent_aut_991=2622.75; if auton_3_991=1 then rent_aut_991=3746.81; if auton_4_991=1 then rent_aut_991=5994.89; if auton_5_991=1 then rent_aut_991=8242.97;
if auton_1_990=1 then rent_aut_990=1873.41; if auton_2_990=1 then rent_aut_990=2622.75; if auton_3_990=1 then rent_aut_990=3746.81; if auton_4_990=1 then rent_aut_990=5994.89; if auton_5_990=1 then rent_aut_990=8242.97;
*/
run; 

/*For periods prior to July 1994, we opted to compute the reference income of formal sector independent workers as if they were formal 
		wage-earners. This is why we consider their labour income as their income of reference.*/
data &indata.; 
set &indata.; 
/*We identify in the retrospective simulation periods validated as either a formal wage-earner (sal) or independent (ind) worker.*/
array count_sal_{*} count_sal_993-count_sal_1243; 
array count_ind_{*} count_ind_993-count_ind_1243; 
array itl_anses_sal_{*} itl_anses_sal_993-itl_anses_sal_1243; 
array temp{251} labour_market_state_993-labour_market_state_1243;
array temp_itl{251} itl_anses_993-itl_anses_1243;
do i=1 to 251; 
count_sal_{i}=0; 
count_ind_{i}=0; 
if temp{i}=1 then count_sal_{i}=1; 
if temp{i}=2 then count_ind_{i}=1; 
itl_anses_sal_{i}=count_sal_{i}*temp_itl{i}; 
end; 
drop i; 
run; 



data &indata.; 
set &indata.; 
array other_rent{157} itl_anses_1087-itl_anses_1243; 
array dummy_ind{157} count_ind_1087-count_ind_1243;
array rent_aut{157} rent_aut_1087-rent_aut_1243; 
do i=1 to 157; 
rent_aut{i}= dummy_ind{i}*other_rent{i}; 
end; 
drop i;
run; 

/********* The earliest information on wages we have is in 1970. Before that period, we assume ANSES discounts the reference income 
		with the same index it used for 1970. 
		Remember that period 1000 is the second quarter of 2015.*/
/*1181
1182-1243*/
data &indata.;
set &indata.;
array anses_2_{*} anses_2_1182-anses_2_1243;
array anses_1_{*} anses_1_1182-anses_1_1243;
array eliff_{*} eliff_1182-eliff_1243;
array ipc_{*} ipc_1182-ipc_1243;
do i=1 to 61;
anses_1_{i}=anses_1_1181;
anses_2_{i}=anses_2_1181;
eliff_{i}=eliff_1181;
ipc_{i}=ipc_1181;
end;
drop i;
itl_anses_&primer_periodo.=itl_anses_0;
count_sal_&primer_periodo.=0; 
if labour_market_state=1 then count_sal_&primer_periodo.=1;  
run; 
data &indata.;
set &indata.;
array anses_1_{251} anses_1_993-anses_1_1243;
array anses_2_{251} anses_2_993-anses_2_1243;
array eliff_{251} eliff_993-eliff_1243;
array itl_anses_{251} itl_anses_993-itl_anses_1243;
array rent_aut_{251} rent_aut_993-rent_aut_1243;
array itl_anses_2_{*} itl_anses_2_993-itl_anses_2_1243;
array itl_eliff_{*} itl_eliff_993- itl_eliff_1243;
array rent_aut_2_{*} rent_aut_2_993-rent_aut_2_1243;
array rent_aut_el_{*} rent_aut_el_993-rent_aut_el_1243;
do i=1 to 251;
itl_anses_2_{i}=0;
itl_eliff_{i}=0;
rent_aut_2_{i}=0;
rent_aut_el_{i}=0;
/*In our backwards simulations, we only use the discounting index in effect before June 2016. Below, we correct the discounted values
		of past income during validated quarters so as to discount it with either the current post June 2016 discountinf index (ANSES_2_)
		or the discounting index established by the Eliff ruling.*/
itl_anses_2_{i}=itl_anses_{i} * anses_1_{i} / anses_2_{i};
itl_eliff_{i}=itl_anses_{i} * anses_1_{i} / eliff_{i};
rent_aut_2_{i}=rent_aut_{i} * anses_1_{i} / anses_2_{i};
rent_aut_el_{i} = rent_aut_{i} * anses_1_{i} / eliff_{i};
end;
drop i;

run;

data &indata.;
set &indata.;
array itl_anses_sal_{*} itl_anses_sal_993-itl_anses_sal_1243;
array itl_anses_2_sal_{*} itl_anses_2_sal_993-itl_anses_2_sal_1243;
array itl_eliff_sal_{*} itl_eliff_sal_993-itl_eliff_sal_1243;
/********************************************************************************************/
array temp_itl{251} itl_anses_993-itl_anses_1243;
array temp_anses_2{251} itl_anses_2_993-itl_anses_2_1243;
array temp_eliff{251} itl_eliff_993-itl_eliff_1243;
/********************************************************************************************/
array count_sal_{251} count_sal_993-count_sal_1243;

/********************************************************************************************/
do i=1 to 251;
itl_anses_sal_{i}=count_sal_{i}*temp_itl{i};
itl_anses_2_sal_{i}=count_sal_{i}*temp_anses_2{i};
itl_eliff_sal_{i}=count_sal_{i}*temp_eliff{i};
end; 
drop i; 
run; 


data &indata.;
set &indata.;

array itl_anses_ind_{*} itl_anses_ind_1067-itl_anses_ind_1243;
array itl_anses_2_ind_{*} itl_anses_2_ind_1067-itl_anses_2_ind_1243;
array itl_eliff_ind_{*} itl_eliff_ind_1067-itl_eliff_ind_1243;
/**************************************************************************/
array temp_rent{177} rent_aut_1067-rent_aut_1243;
array temp_rent_2{177} rent_aut_2_1067-rent_aut_2_1243; 
array temp_rent_el{177} rent_aut_el_1067-rent_aut_el_1243; 
array count_ind_{177} count_ind_1067-count_ind_1243;
/********************************************************************************************/
do i=1 to 177;
itl_anses_ind_{i}=count_ind_{i}*temp_rent{i};
itl_anses_2_ind_{i}=count_ind_{i}*temp_rent_2{i};
itl_eliff_ind_{i}=count_ind_{i}*temp_rent_el{i};
end; 
drop i; 
run; 


data &indata.;
set &indata.;
do i=1 to 74;
array itl_anses_ind_{*} itl_anses_ind_993-itl_anses_ind_1066;
array itl_anses_2_ind_{*} itl_anses_2_ind_993-itl_anses_2_ind_1066;
array itl_eliff_ind_{*} itl_eliff_ind_993-itl_eliff_ind_1066;
/**************************************************************************/
array temp_rent{74} rent_aut_993-rent_aut_1066;
array temp_rent_2{74} rent_aut_2_993-rent_aut_2_1066; 
array temp_rent_el{74} rent_aut_el_993-rent_aut_el_1066; 
array autonomo_{74} autonomo_993-autonomo_1066; 
/***************************************************************/

itl_anses_ind_{i}=autonomo_{i}*temp_rent{i}; 
itl_anses_2_ind_{i}=autonomo_{i}*temp_rent_2{i};
itl_eliff_ind_{i}=autonomo_{i}*temp_rent_el{i};


end;
drop i;
run; 
data &indata.; 
set &indata.; 
do i=1 to 6; 
array itl_anses_ind_{*} itl_anses_ind_1061-itl_anses_ind_1066;
array itl_anses_2_ind_{*} itl_anses_2_ind_1061-itl_anses_2_ind_1066;
array itl_eliff_ind_{*} itl_eliff_ind_1061-itl_eliff_ind_1066;
/*************************************************************************/
array monotributo_{6} monotributo_1061-monotributo_1066; 
array autonomo_{6} autonomo_1061-autonomo_1066; 
array temp_rent_{6} rent_aut_1061-rent_aut_1066;
array temp_rent_2{6} rent_aut_2_1061-rent_aut_2_1066; 
array temp_rent_el{6} rent_aut_el_1061-rent_aut_el_1066; 

itl_anses_ind_{i}=monotributo_{i}*temp_rent_{i}+autonomo_{i}*temp_rent_{i};
itl_anses_2_ind_{i}=monotributo_{i}*temp_rent_2{i}+autonomo_{i}*temp_rent_2{i};
itl_eliff_ind_{i}=monotributo_{i}*temp_rent_el{i}+autonomo_{i}*temp_rent_el{i};
end; 
drop i; 
run; 

%mend;

%independent_rent(&library..career_data_&short_period.,&lag_long_period.); 
/*After that, we compute the retirement rights derived from dependent labour in macro %past_wage_earner_career below*/
%macro past_wage_earner_career(indata,outdata,first_period,first_period_lagged_10_years); 
data &outdata.; 
set &indata.; 
car_sal=sum(of count_sal_993-count_sal_1243); 
car_ind=sum(of count_ind_1067-count_ind_1243) + sum(of autonomo_993-autonomo_1066) + sum(of monotributo_1061-monotributo_1066); 
car_mono_norref=sum(of monotributo_993-monotributo_1060);
sum_rent_aut=sum(of itl_anses_ind_993-itl_anses_ind_1243);
sum_rent_aut_2=sum(of itl_anses_2_ind_993-itl_anses_2_ind_1243);
sum_rent_aut_el=sum(of itl_eliff_ind_993-itl_eliff_ind_1243); 
if car_ind=0 & car_sal^=0 then ratio_sal_ind=1; 
if car_ind=0 & car_sal=0 then ratio_sal_ind=0; 
if car_ind^=0 then ratio_sal_ind=car_sal/car_ind; 

if car_ind^=0 then mean_rent_aut=sum_rent_aut/car_ind; 
if car_ind=0 then mean_rent_aut=0;

if car_ind^=0 then mean_rent_aut_2=sum_rent_aut_2/car_ind; 
if car_ind=0 then mean_rent_aut_2=0;

if car_ind^=0 then mean_rent_aut_el=sum_rent_aut_el/car_ind; 
if car_ind=0 then mean_rent_aut_el=0;
/*Following Appendix I of Decree 679/1995, the number of validated years is equal to validated months divided by twelve, rounded down.*/
/*We assume when someone validated a quarter in our retrospcetive simulations, that he/she validated the full three months of said quarter.*/
car_ind_y=floor(car_ind*3/12); 
car_sal_y=floor(car_sal*3/12); 
car_mono_y=floor(car_mono_norref*3/12);
run; 
/*The reference income is computed on the last ten years of wages for wage-earners, but on all contributed years for independent labour 
		spells. We thus only keep individual career information on the last 10 years before the survey. We still compute an accumulated rent
		of reference for independent labour spells, over the whole simulated period. */
data &outdata.; 
set &outdata.; 
array count_sal_{40} count_sal_&first_period.-count_sal_&first_period_lagged_10_years.; 
array itl_anses_sal_{40} itl_anses_sal_&first_period.-itl_anses_sal_&first_period_lagged_10_years.;
array itl_anses_2_sal_{40} itl_anses_2_sal_&first_period.-itl_anses_2_sal_&first_period_lagged_10_years.;
array itl_eliff_sal_{40} itl_eliff_sal_&first_period.-itl_eliff_sal_&first_period_lagged_10_years.;

array count_ind_{40} count_ind_&first_period.-count_ind_&first_period_lagged_10_years.; 
array itl_anses_ind_{40} itl_anses_ind_&first_period.-itl_anses_ind_&first_period_lagged_10_years.;
array itl_anses_2_ind_{40} itl_anses_2_ind_&first_period.-itl_anses_2_ind_&first_period_lagged_10_years.;
array itl_eliff_ind_{40} itl_eliff_ind_&first_period.-itl_eliff_ind_&first_period_lagged_10_years.;


array autonomo_{40} autonomo_&first_period.-autonomo_&first_period_lagged_10_years.; 
array monotributo_{40} monotributo_&first_period.-monotributo_&first_period_lagged_10_years.; 
array lag_sal_{*} lag_sal_1-lag_sal_40;   
array lag_sal_2_{*} lag_sal_2_1-lag_sal_2_40;   
array lag_sal_el_{*} lag_sal_el_1-lag_sal_el_40;   
array lag_count_sal_{*} lag_count_sal_1-lag_count_sal_40; 
array lag_ind_{*} lag_ind_1-lag_ind_40;   
array lag_ind_2_{*} lag_ind_2_1-lag_ind_2_40;   
array lag_ind_el_{*} lag_ind_el_1-lag_ind_el_40;   
array lag_count_ind_{*} lag_count_ind_1-lag_count_ind_40; 
array lag_mono_{*} lag_mono_1-lag_mono_40; 
do i=1 to 40; 
lag_sal_{i}=itl_anses_sal_{i};
lag_sal_2_{i}=itl_anses_2_sal_{i};
lag_sal_el_{i}=itl_eliff_sal_{i};
lag_count_sal_{i}=count_sal_{i}; 
lag_ind_{i}=itl_anses_ind_{i};
lag_ind_2_{i}=itl_anses_2_ind_{i};
lag_ind_el_{i}=itl_eliff_ind_{i};
lag_count_ind_{i}=autonomo_{i}; 
lag_mono_{i}=monotributo_{i}; 
end; 

drop i; 
/*lag_10_count_sal=sum(of count_sal_&first_period.-count_sal_&first_period_lagged_10_years.); */
run; 

%mend;

%past_wage_earner_career(&library..career_data_&short_period.,computed_career_&short_period.,&lag_long_period.,&ten_years_lag_period.);
data &library..microsim_base_forward_&year._t&quarter.; 
set computed_career_&short_period.; 
keep pondera id ITL student polimodal university_year housewife perm_housewife age labour_market_state marital_status period male formation agegroup 
	household_id mother_id partner_id father_id age_quarters underage_children little_children v2_m ln_wage retired seniority quarterly_seniority 
	resid 
lag_sal_1-lag_sal_40 lag_sal_2_1-lag_sal_2_40 lag_sal_el_1-lag_sal_el_40 
lag_ind_1-lag_ind_40 lag_ind_2_1-lag_ind_2_40 lag_ind_el_1-lag_ind_el_40
lag_count_sal_1-lag_count_sal_40 lag_count_ind_1-lag_count_ind_40 lag_mono_1-lag_mono_40
car_ind car_sal car_Mono_norref 
sum_rent_aut sum_rent_aut_2 sum_rent_aut_el boss_&lag_long_period.; 
run; 

/*Employers contributions to social security, up until the December 2017 reform, depended on the firm's economic sector. The acquired
		retirement rights are not affected by this discrimination among sectors. Still, we try with the macro below to see what are the 
		respondent boss's employers contributions with the macro decree_814_2001 (this decree regulated employer's contributions up until 
		the December 2017 Law 27430) below. See section 1.1.4. of my PhD thesis for the whole review of social security contributions 
		legislation. */
%macro decree_814_2001(indata); 
options nofmterr; 
data &indata.; 
length incise_814_2001 $30.;
length incise_814_2001_sme $30.;  
set &indata.; 
/* The employers of workers in sectors covered by incise  a) (private firms of the service and trade sectors), of Decree 814/2001
		contribute 27% of their employee's gross wage to social security. Other employers (including the public sector) are covered 
		by incise b) and only contribute 23% of the employee's gross wage.*/
incise_814_2001="a"; 
/*Variables pp04b_cas and pp04b_cod give the economic sector of the firm the respondent works in / owns. See the corresponding pdf files
		we kept in the ZENODO repository to know how to read these variables. */
caes=substr(pp04b_caes,1,2); 
cod=substr(pp04b_cod,1,2); 
if cod="01" | cod="02" | cod="05" | caes="01" | caes="02" | caes="03"
then incise_814_2001="b";/*"Agriculture and fishing"*/ 

if /*Mining and petrol*/ 
cod="10" | cod="11" | cod="12" | cod="13" | cod="14" 
|caes="05" |caes="06" |caes="07" |caes="08"|caes="09"  then incise_814_2001="b"; 

/*Construction*/
if cod="45"|caes="40"
then incise_814_2001="b"; 
if /*Manufacturing sectors (industry)*/
/*Processed foods*/
cod="15" | cod="16" | caes="10" | caes="11" | caes="12" |
/*Textile*/
cod="17" | cod="18" | cod="19" | caes="13" | caes="14" | caes="15"|
/*Wood and paper*/
cod="20" | cod="21"| cod="22" |caes="16" | caes="17" | caes="18" |caes="58"|
		/*Edition and impression are mixed together in the COD classification. In the more recent CAES classification, these are separated and 
		edition is ususally considered as being in the service sector. For the sake of consistency between these two classifications, 
		we opted to keep edition in the manufacturing sector.*/
/*Chemicals and petrochemicals, pharmaceutical industry*/
cod="23"|cod="24"|cod="25"|caes="19"|caes="20"|caes="21"|caes="22"|
/*Iron, steel and glass industry*/
cod="26" |cod="27" | cod="28" | caes="23" | caes="24" | caes="25"|
/*Machinery and electronics*/
cod="29"|cod="30"|cod="31"|cod="32"|cod="33"|caes="26"|caes="27"|caes="28"|
/*Cars and vehicles*/
cod="34"|cod="35"|caes="29"|caes="30"|
/*Other industries*/
cod="36"|cod="37"|caes="31"|caes="32"|caes="33"
then incise_814_2001="b"; 
/*Software development (excluding IT services), TV/Radio/Films, web servers*/ 
if pp04b_cod="7201"|pp04b_cod="9201"|caes="59"|caes="60"|caes="63"|caes="62" then incise_814_2001="b"; 
/*Trade unions run associations*/
if pp04b_cod="9101" |pp04b_caes="9402" then incise_814_2001="b"; 
if pp04a=1 then incise_814_2001="b"; 
/*Theoretically, small and medium enterprises are supposed to be categorised in incise b) regardless of their actual economic sector. 
		In practice, there are nominal turnover restrictions that are not discounted following inflation, so it is likely this provision
		is not de facto available for almost all SMEs. It is only since 2016 that these turnover conditions were at least partially corrected,
		(see Lomero and del Moro 2017). Still, we list in a different variable what would happen with social security
		contributions if all SMEs had access to this reduced employers contributions rates.*/
incise_814_2001_sme="a"; 
if incise_814_2001="b" then incise_814_2001_sme="b";
if pp04c^="9" then incise_814_2001_sme="b"; 
/*Some firms are never considered as SMEs as far as the Decree 814/2001 is concerned: finance/insurance, domestic staff, extra-territorial
		organisations, gambling / casinos.*/
if cod="65" | cod="66" | cod="67" | cod="99"  |cod="95" | caes="64" | caes="65" | caes="66" | caes="97" | caes="98"| caes="99" | caes="92" then incise_814_2001_sme="a"; 
run; 
%mend; 
%decree_814_2001(&library..eph_data_formatted_2003_2015); 
/*We can see here 50% of workers have an employer that pays the high contribution (incise a). If the SME reduction was available to all 
		employers, then only 10% of workers would see their employers pay the high contribution. This is shown by the freq procedures
		in this commentary.
proc freq data=&library..eph_data_formatted_2003_2015; 
weight pondera; 
where labour_market_state=1; 
table incise_814_2001*incise_814_2001_sme; 
table incise_814_2001*pp04a; run; 
proc freq data=&library..eph_data_formatted_2003_2015; 
where labour_market_state=1; 
weight pondera; 
table incise_814_2001*period; run; 
*/
/*Next, we add the information on the contributions paid by the employer in the base for forward microsimulations.*/

options nofmterr; 
data employers_contributions_&year._t&quarter.; 
set &library..eph_data_formatted_2003_2015; 
where ano4=&year. & trimestre=&quarter.; 
keep person incise_814_2001 pp04a labour_Market_state; 
run; 
data employers_contributions_&year._t&quarter.; 
set employers_contributions_&year._t&quarter.; 
rename person=id_long; 
run; 
data id_datasets_&year._t&quarter.; 
set &library..both_id_&year._t&quarter.; 
keep id_long id_short; 
run; 
proc sort data=id_datasets_&year._t&quarter.; 
by id_long; 
run; 
proc sort data=employers_contributions_&year._t&quarter.; 
by id_long; 
run; 
data employers_contributions_&year._t&quarter.; 
merge employers_contributions_&year._t&quarter. id_datasets_&year._t&quarter.; 
by id_long; 
rename id_short=id; 
if labour_market_state^=1 then incise_814_2001="c"; 
if incise_814_2001="a" then contribution=1; 
if incise_814_2001="b" then contribution=2; 
if incise_814_2001="c" then contribution=3; 
run; 
data employers_contributions_&year._t&quarter.; 
set employers_contributions_&year._t&quarter.; 
keep id incise_814_2001 contribution pp04a; 
run; 
proc sort data=employers_contributions_&year._t&quarter.; 
by id; 
run; 
proc sort data=&library..microsim_base_forward_&year._t&quarter.; 
by id; 
run; 
data &library..microsim_base_forward_&year._t&quarter.; 
merge &library..microsim_base_forward_&year._t&quarter. employers_contributions_&year._t&quarter.; 
by id; 
run; 

/*We also need to tell apart workers in the public and private sectors. The Law 27430 reform of December 2017 indeed institutes a lower
		contribution rate for public sector employers. In our simulations with the current legislation, we thus need to identify 
		public sector workers. Variable pp04a denotes working in the private or public sectors (see the PDF depicting the questionnaire
		used in the EPHc survey, available in our digital repository). */
proc freq data=&library..eph_data_formatted_2003_2015; 
weight pondera; 
table pp04a / noprint outpct out=public_sector_proportion; 
where labour_market_state=1 & 15<ch06<70 & ano4=2015 & trimestre=2;
run; 
/*However, only civil servants of the national public sector, that contribute to ANSES, see their employers contributions reduced. 
		In the EPHc, we have all civil servants, so including those of  provinces, such as Buenos Aires, who do not contribute to ANSES 
		but to provincial pension plans. As such, these civil servants' employers are not concerned by this reduced contribution rate 
		(for their employers). If we considered a full 30% of formal wage-earners are civil servants that contribute to ANSES and that have
		thus reduced employers contributions, we would be overestimating this reduction in employers contributions.*/
/*We know from the monthly social security bulletin issued by the AFIP that on February 2015, 18.5% of wage-earners that contributed to the 
		SIPA (and thus to ANSES) were from the public sector. We thus make it so that 18.5% of formal wage-earners are civil servants 
		that contribute to ANSES, and we select them among all public sector workers. */
data public_sector_proportion; 
set public_sector_proportion; 
if pp04a^=1 then delete; 
drop count; 
percentage=18.5/percent; /*This is equal to 0.60544: we need 60% of public sector workers in the EPHc to be national civil servants that
							contribute to ANSES in order to reproduce the data from the monthly social security bulletin.*/ 
run; 
/*We then randomly select 60% of public sector workers as contributing to the SIPA.*/
data &library..microsim_base_forward_&year._t&quarter.;
set &library..microsim_base_forward_&year._t&quarter.; 
call streaminit(&seed.) ;
public_sector_SIPA=0; 
if pp04a=1 & labour_market_state=1 then do; 
x=RAND('BERNOULLI', 0.60544); 
if x=1 then public_sector_SIPA=1; 
end; 
drop x; 
if public_sector_SIPA=1 then contribution=4; 
drop public_sector_SIPA; 
run; 

data discounting_indexes; 
set &library..discounting_indexes; 
merging_variable=1; run; 
data &library..microsim_base_forward_&year._t&quarter.; 
set  &library..microsim_base_forward_&year._t&quarter.; 
merging_variable=1; run; 

data &library..microsim_base_forward_&year._t&quarter.; 
merge &library..microsim_base_forward_&year._t&quarter. discounting_indexes;
by merging_variable; 
/*The gross retirement pension paid by ANSES is the sum of the benefit earned by the pensioner and the compulsory healthcare contribution
		to the PAMI. Following Law 19032 Art. 8 a) Beneficiaries of the National Social Security Administration (ANSES) and of the Integrated
		Retirement Pension System (SIJP) must pay healthcare contributions equal to 3% of the benefit up to the minimum retirement pension, and 
		of 6% for sums above this minimum benefit.
*/
/*Although not entirely clear, we assume moratorium benefits must pay this 3% of contributions to the PAMI, before the temporary 
		deductions (that make a 2014 moratorium pension be equal to 80% of the minimum benefit).*/
if v2_m>=&min_pension. then
v2_m_cost=&min_pension.+(v2_m-&min_pension.*0.97)/0.94; 
if v2_m<&min_pension. then v2_m_cost=v2_m/0.97;
/*We work with constant november 2014 pesos, discounted following the official CPI index and the simple average of the San Luis 
		and City of Buenos Aires indexes for the late 2015 / early 2016 months where no inflation indexes were made public. 
		1002 is the fourth quarter of 2014 period.*/
discounted_v2_m=v2_m*100/IPC_&lag_long_period.; 
disc_cost_v2_m=v2_m_cost*100/IPC_&lag_long_period.; 
discounted_itl=itl*100/IPC_&lag_long_period.; 
disc_sal1=lag_sal_1*100/anses_1_&lag_long_period.;
disc_sal2=lag_sal_2_1*100/anses_2_&lag_long_period.; 
disc_sal3=lag_sal_el_1*100/eliff_&lag_long_period.; 
disc_ind1=lag_ind_1*100/anses_1_&lag_long_period.;
disc_ind2=lag_ind_2_1*100/anses_2_&lag_long_period.; 
disc_ind3=lag_ind_el_1*100/eliff_&lag_long_period.; 
rename boss_&lag_long_period.=boss; 
drop lag_sal_1 lag_sal_2_1 lag_sal_el_1 lag_ind_1 lag_ind_2_1 lag_ind_el_1; 
rename disc_sal1=lag_sal_1; 
rename disc_sal2=lag_sal_2_1;
rename disc_sal3=lag_sal_el_1;
rename disc_ind1=lag_ind_1; 
rename disc_ind2=lag_ind_2_1;
rename disc_ind3=lag_ind_el_1;
run; 


data &library..microsim_base_forward_&year._t&quarter.; 
set &library..microsim_base_forward_&year._t&quarter.; 
keep id ITL discounted_itl student polimodal university_year housewife pondera age labour_market_state marital_status period male formation agegroup id household_id mother_id partner_id father_id age_quarters underage_children little_children v2_m ln_wage retired seniority quarterly_seniority resid 
lag_sal_1-lag_sal_40 lag_sal_2_1-lag_sal_2_40 lag_sal_el_1-lag_sal_el_40
lag_ind_1-lag_ind_40 lag_ind_2_1-lag_ind_2_40 lag_ind_el_1-lag_ind_el_40
lag_count_sal_1-lag_count_sal_40 lag_count_ind_1-lag_count_ind_40 lag_mono_1-lag_mono_40
car_ind car_sal car_mono_norref 
sum_rent_aut sum_rent_aut_2 sum_rent_aut_el
v2_m_cost disc_cost_v2_m discounted_v2_m boss 
contribution;
run;  
/*For an unknown reason, there are some observations that get duplicated during this procedure. We solve the problem by simply deleting 
		these duplicate observations. This step is mandatory, as LIAM2 does not execute the model when it identifies the presence of 
		duplicate observations.*/
/*We finally export the dataset in a csv format, which can be imported by LIAM2. Use the code in the import_files subfolder of the prospective
		simulation folder.*/
proc sort data=&library..microsim_base_forward_&year._t&quarter.; 
	by id; 
run; 

data &library..microsim_base_forward_&year._t&quarter.; 
set &library..microsim_base_forward_&year._t&quarter.; 
	by id; 
		if first.id 
			then apparition=1; 
		else apparition+1; 
run;
data &library..microsim_base_forward_&year._t&quarter.; 
set &library..microsim_base_forward_&year._t&quarter.; 
	if apparition>1 
		then delete; 
run; /*
data &library..microsim_base_forward_&year._t&quarter.; 
set &library..microsim_base_forward_&year._t&quarter.; 
	drop apparition; 
run; */
%mend;/*
proc sort data=leo.microsim_base_forward_2014_t4; 
	by id; 
run; 
data leo.microsim_base_forward_2014_t4; 
set leo.microsim_base_forward_2014_t4; 
	by id; 
		if first.id 
			then apparition=1; 
		else apparition+1; 
run;
data leo.microsim_base_forward_2014_t4; 
set leo.microsim_base_forward_2014_t4; 
	if apparition>1 
		then delete; 
run; 
proc freq data=leo.microsim_base_forward_2014_t4; 
table apparition; 
run; 
data leo.microsim_base_forward_2014_t4; 
set leo.microsim_base_forward_2014_t4; 
	drop apparition; 
run; 
*/
/*It is important to clear the log after each run of the macro, else it gets full and it stops executing. If you want to run only one 
		period however, it is not necessary to delete the log.*/
%prepare_prospective_simulations(leo,2014,4,46,1003,1002,1041,3231.63,17101945);
proc export data=leo.microsim_base_forward_2014_t4 
outfile='H:\LIAM2_commented_code\Prospective_simulations\Import_files\Seed_17101945_start_2014_t4\SAS_input\microsim_base_forward_2014_t4.csv' 
dbms=csv replace; 
run; 

proc export data=leo.microsim_base_2014_t4_hh 
outfile='H:\LIAM2_commented_code\Prospective_simulations\Import_files\Seed_17101945_start_2014_t4\SAS_input\microsim_base_forward_2014_t4_hh.csv' 
dbms=csv replace; 
run; 

dm 'odsresults; clear'; 
dm 'clear log'; 
%prepare_prospective_simulations(leo,2014,2,44,1005,1004,1043,2757.13,17101945);
proc export data=leo.microsim_base_forward_2014_t2 
outfile='H:\LIAM2_commented_code\Prospective_simulations\Import_files\Seed_17101945_start_2014_t2\SAS_input\microsim_base_forward_2014_t2.csv' 
dbms=csv replace; 
run; 
proc export data=leo.microsim_base_2014_t2_hh 
outfile='H:\LIAM2_commented_code\Prospective_simulations\Import_files\Seed_17101945_start_2014_t2\SAS_input\microsim_base_forward_2014_t2_hh.csv' 
dbms=csv replace; 
run; 

dm 'odsresults; clear'; 
dm 'clear log'; 
%prepare_prospective_simulations(leo,2015,2,44,1001,1000,1039,3821.73,17101945);
proc export data=leo.microsim_base_forward_2015_t2 
outfile='H:\LIAM2_commented_code\Prospective_simulations\Import_files\Seed_17101945_start_2015_t2\SAS_input\microsim_base_forward_2015_t2.csv' 
dbms=csv replace; 
run; 

proc export data=leo.microsim_base_2015_t2_hh 
outfile='H:\LIAM2_commented_code\Prospective_simulations\Import_files\Seed_17101945_start_2015_t2\SAS_input\microsim_base_forward_2015_t2_hh.csv' 
dbms=csv replace; 
run; 

proc print data=leo.microsim_base_2014_t4 (obs=10); 
where id=4268; run; 
