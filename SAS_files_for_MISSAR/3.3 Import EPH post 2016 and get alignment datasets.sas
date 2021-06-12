/*We import the continous EPH datasets released between the second quarter of 2016 and the fourth quarter of 2018, after the (slight) 
		methodological changes introduced in 2016. These datasets are purposefully not compatible with the 2003-2015 waves of the EPH 
		(which the INDEC administration appointed in 2016 claims were fraudulently altered during the peronist 2003-2015 government). 
		They have their problems of their own, mainly a very high No-response for the labour income variable: between the second quarter
		of 2016 and the first quarter of 2017, 25% of working respondents that were not family workers had a null or missing labour income. 
		This figure was equal to 2.7% for the 2003-2015 version of the EPHc.*/
/*The reason for this non-response figure is that since 2016 they stopped inputting labour income for working respondents that did not
		give their income. This is something that was done in the 2003-2015. Instead, the new methodology leaves this information blank,
		but corrects this non-response by proposing various weight variables for different income variables. With these weights, the 
		mean labour income statistics are OK, but this methodological choice is detrimental to our dynamic microsimulation methodology, 
		since we can't use multiple weights in our simulations. As such, a future task will be to assign labour income to working
		respondents that do not give their labour income.*/
/*Therefore, we only use these last waves for the aggregate calibration of our simulations from 2016 onward.*/
dm 'odsresults; clear'; 
dm 'clear log'; 
%macro import_ephc_post_2016 (path,ano4,trimestre,extension); 
PROC IMPORT OUT=leo.ephc_20&ano4._t0&trimestre.
            DATAFILE="&path.usu_individual_t&trimestre.&ano4..&extension."
            DBMS=&extension. REPLACE;
RUN;
/*A major problem with the post-2016 EPHc is that they thought it would be nice to make the data available on an excel (&extension., &extension.x). This 
		introduces serious format issues. This is mainly the case for the second and third quarters of 2016, released in a &extension. format. 
		We thus added some code to make these datasets formatting compatible with that of the fourth base of 2016.

proc contents data=leo.ephc_2016_t02; run; 
proc contents data=leo.ephc_2016_t04; run; */
/*We first run a proc contents on the fourth quarter of 2016 to figure out that sets variables' format. */
/*We then correct the formats on the second quarter of 2016*/

data leo.ephc_20&ano4._t0&trimestre.; 
length codusu $300.; 
length mas_500 $42.; 
length pp09c_esp $42.; 
length pp09a_esp $42.; 
set leo.ephc_20&ano4._t0&trimestre.; 
format AGLOMERADO best.; 
format ano4 best.; 
format cat_inac best.; 
format cat_ocup best.; 
format ch03 best.; 
format ch04 best.; 
format ch05 DDMMYY10.; 
format ch06 best.; 
format ch07 best.; 
format ch08 best.; 
format ch09 best.; 
format ch10 best.; 
format ch11 best.; 
format ch12 best.; 
format ch13 best.; 
CH14_num=input (CH14, best.); drop CH14; rename CH14_num=CH14; 
format ch15 best.; 
format ch16 best.; 
format componente best.; 
format estado best.; 
format h15 best.; 
format imputa best.; 
format intensi best.; 
format ipcf best.; 
format itf best.; 
format nivel_ed best.; 
format nro_hogar best.; 
format p21 best.; 
format p47t best.; 
format pondera best.;
format pondih best.; 
format pondih best.; 
format pondii best.; 
format pondiio best.; 
format PP02C1 best.; 
format PP02C2 best.; 
format PP02C3 best.; 
format PP02C4 best.; 
format PP02C5 best.; 
format PP02C6 best.; 
format PP02C7 best.; 
format PP02C8 best.; 
format PP02E best.; 
format PP02h best.; 
format PP02I best.; 
format PP03C best.; 
format PP03D best.; 
format PP03G best.; 
format PP03H best.; 
format PP03I best.; 
format PP03J best.; 
format PP04A best.; 
format PP04B1 best.; 
format PP04B2 best.; 
format PP04B3_ANO best.; 
format PP04B3_DIA best.; 
format PP04B3_MES best.; 
format PP04B_COD best.; 
format PP04C best.; 
format PP04C99 best.; 
PP04D_COD_num=input (PP04D_COD, best.); drop PP04D_COD; rename PP04D_COD_num=PP04D_COD; 
format PP04G best.; 
format PP05B2_ANO best.;  
format PP05B2_DIA best.;  
format PP05B2_MES best.;  
format PP05C_1 best.;  
format PP05C_2 best.;  
format PP05C_3 best.;  
format PP05E best.;   
format PP05F best.;  
format PP05H best.;   
format PP06A best.;
format PP06C best.;
format PP06D best.;
format PP06E best.;
format PP06H best.;
format PP07A best.;
format PP07C best.;
format PP07D best.;
format PP07E best.;
format PP07F1 best.;
format PP07F2 best.;
format PP07F3 best.;
format PP07F4 best.;
format PP07F5 best.;
format PP07G1 best.;
format PP07G2 best.;
format PP07G3 best.;
format PP07G4 best.;
format PP07G_59 best.;
format PP07H best.;
format PP07I best.;
format PP07J best.;
format PP07K best.;
format PP08D1 best.;
format PP08D4 best.;
format PP08F1 best.;
format PP08F2 best.;
format PP08J1 best.;
format PP08J2 best.;
format PP08J3 best.;
format PP09A best.;
format PP09B best.;
format PP09C best.;
format PP09C_ESP $42.;
format PP10A best.;
format PP10C best.;
format PP10D best.;
format PP10E best.;
format PP11A best.;
format PP11B1 best.;
format PP11B2_ANO best.;
format PP11B2_DIA best.;
format PP11B2_MES best.;
format PP11B_COD best.;
format PP11C best.;
format PP11C99 best.;
PP11D_COD_num=input (PP11D_COD, best.); drop PP11D_COD; rename PP11D_COD_num=PP11D_COD; 
format PP11G_ANO best.;
format PP11G_DIA best.;
format PP11G_MES best.;
format PP11L best.;
format PP11L1 best.;
format PP11M best.;
format PP11N best.;
format PP11O best.;
format PP11P best.;
format PP11Q best.;
format PP11R best.;
format PP11S best.;
format PP11T best.;
format PP3E_TOT best.;
format PP3F_TOT best.;
format REGION best.;
format TOT_P12 best.;
format TRIMESTRE best.;
format T_VI best.;
format V10_M best.;
format V11_M best.;
format V12_M best.;
format V18_M best.;
format V19_AM best.;
format V21_M best.;
format V2_M best.;
format V3_M best.;
format V4_M best.;
format V5_M best.;
format V8_M best.;
format V9_M best.;
ch15_cod_char=input(ch15_cod, $42.); drop ch15_cod; rename ch15_cod_char=ch15_cod; 
ch16_cod_char=input(ch16_cod, $42.); drop ch16_cod; rename ch16_cod_char=ch16_cod; 
/*format ch15_cod $42.; 
format ch16_cod $42.; */
format codusu $42.; 
format mas_500 $42.; 
format pp09c_esp $100.; 
format pp09a_esp $100.; 

decindr_num=input (decindr, best.); drop decindr; rename decindr_num=decindr; 
adecindr_num=input (adecindr, best.); drop adecindr; rename adecindr_num=adecindr; 
rdecindr_num=input (rdecindr, best.); drop rdecindr; rename rdecindr_num=rdecindr; 
idecindr_num=input (idecindr, best.); drop idecindr; rename idecindr_num=idecindr; 
gdecindr_num=input (gdecindr, best.); drop gdecindr; rename gdecindr_num=gdecindr; 
pdecindr_num=input (pdecindr, best.); drop pdecindr; rename pdecindr_num=pdecindr; 

decocur_num=input (decocur, best.); drop decocur; rename decocur_num=decocur; 
adecocur_num=input (adecocur, best.); drop adecocur; rename adecocur_num=adecocur; 
rdecocur_num=input (rdecocur, best.); drop rdecocur; rename rdecocur_num=rdecocur; 
idecocur_num=input (idecocur, best.); drop idecocur; rename idecocur_num=idecocur; 
gdecocur_num=input (gdecocur, best.); drop gdecocur; rename gdecocur_num=gdecocur; 
pdecocur_num=input (pdecocur, best.); drop pdecocur; rename pdecocur_num=pdecocur; 

decifr_num=input (decifr, best.); drop decifr; rename decifr_num=decifr; 
adecifr_num=input (adecifr, best.); drop adecifr; rename adecifr_num=adecifr; 
rdecifr_num=input (rdecifr, best.); drop rdecifr; rename rdecifr_num=rdecifr; 
idecifr_num=input (idecifr, best.); drop idecifr; rename idecifr_num=idecifr; 
gdecifr_num=input (gdecifr, best.); drop gdecifr; rename gdecifr_num=gdecifr; 
pdecifr_num=input (pdecifr, best.); drop pdecifr; rename pdecifr_num=pdecifr; 

deccfr_num=input (deccfr, best.); drop deccfr; rename deccfr_num=deccfr; 
adeccfr_num=input (adeccfr, best.); drop adeccfr; rename adeccfr_num=adeccfr; 
rdeccfr_num=input (rdeccfr, best.); drop rdeccfr; rename rdeccfr_num=rdeccfr; 
ideccfr_num=input (ideccfr, best.); drop ideccfr; rename ideccfr_num=ideccfr; 
gdeccfr_num=input (gdeccfr, best.); drop gdeccfr; rename gdeccfr_num=gdeccfr; 
pdeccfr_num=input (pdeccfr, best.); drop pdeccfr; rename pdeccfr_num=pdeccfr;

/*The CH05 date of birth variable is clearly broken  for the third quarter 2020, both in csv and txt files, so we drop it*/
if ano4=2020 & trimestre=3 then do; 
		drop ch05; 
	end;
run; 

%mend; 

data leo.ephc_2020_t03; 
set leo.ephc_2020_t03; 
CH05_num=ch05*1; drop CH05; rename CH05_num=CH05;
format ch05 DDMMYY10.;
type=vtype(ch05); 
RUN; 
proc print data=leo.ephc_2020_t03 (obs=10); run;  

PROC IMPORT OUT=leo.ephc_2019_t04
            DATAFILE="H:\Leonardo_orléans\EPH_base\EPH_2019\usu_individual_t419.xls"
            DBMS=xls REPLACE;
			mixed=yes; 
RUN;
proc contents data=leo.ephc_2019_t04 ; run; 
PROC PRINT data=leo.ephc_2019_t04 (obs=10);
format ch05 DDMMYY10.; 
run; 
/*A major problem with the post-2016 EPHc is that they thought it would be nice to make the data available on an excel (xls, xlsx). This 
		introduces serious format issues. This is mainly the case for the second and third quarters of 2016, released in a xls format. 
		We thus added some code to make these datasets formatting compatible with that of the fourth base of 2016.

proc contents data=leo.ephc_2016_t02; run; 
proc contents data=leo.ephc_2016_t04; run; */
/*We first run a proc contents on the fourth quarter of 2016 to figure out that sets variables' format. */
/*We then correct the formats on the second quarter of 2016*/

data leo.ephc_2019_t04; 
length codusu $300.; 
length mas_500 $42.; 
length pp09c_esp $42.; 
length pp09a_esp $42.; 
set leo.ephc_2019_t04; 
format AGLOMERADO best.; 
format ano4 best.; 
format cat_inac best.; 
format cat_ocup best.; 
format ch03 best.; 
format ch04 best.; 
format ch05 DDMMYY10.; 
format ch06 best.; 
format ch07 best.; 
format ch08 best.; 
format ch09 best.; 
format ch10 best.; 
format ch11 best.; 
format ch12 best.; 
format ch13 best.; 
CH14_num=input (CH14, best.); drop CH14; rename CH14_num=CH14; 
format ch15 best.; 
format ch16 best.; 
format componente best.; 
format estado best.; 
format h15 best.; 
format imputa best.; 
format intensi best.; 
format ipcf best.; 
format itf best.; 
format nivel_ed best.; 
format nro_hogar best.; 
format p21 best.; 
format p47t best.; 
format pondera best.;
format pondih best.; 
format pondih best.; 
format pondii best.; 
format pondiio best.; 
format PP02C1 best.; 
format PP02C2 best.; 
format PP02C3 best.; 
format PP02C4 best.; 
format PP02C5 best.; 
format PP02C6 best.; 
format PP02C7 best.; 
format PP02C8 best.; 
format PP02E best.; 
format PP02h best.; 
format PP02I best.; 
format PP03C best.; 
format PP03D best.; 
format PP03G best.; 
format PP03H best.; 
format PP03I best.; 
format PP03J best.; 
format PP04A best.; 
format PP04B1 best.; 
format PP04B2 best.; 
format PP04B3_ANO best.; 
format PP04B3_DIA best.; 
format PP04B3_MES best.; 
format PP04B_COD best.; 
format PP04C best.; 
format PP04C99 best.; 
PP04D_COD_num=input (PP04D_COD, best.); drop PP04D_COD; rename PP04D_COD_num=PP04D_COD; 
format PP04G best.; 
format PP05B2_ANO best.;  
format PP05B2_DIA best.;  
format PP05B2_MES best.;  
format PP05C_1 best.;  
format PP05C_2 best.;  
format PP05C_3 best.;  
format PP05E best.;   
format PP05F best.;  
format PP05H best.;   
format PP06A best.;
format PP06C best.;
format PP06D best.;
format PP06E best.;
format PP06H best.;
format PP07A best.;
format PP07C best.;
format PP07D best.;
format PP07E best.;
format PP07F1 best.;
format PP07F2 best.;
format PP07F3 best.;
format PP07F4 best.;
format PP07F5 best.;
format PP07G1 best.;
format PP07G2 best.;
format PP07G3 best.;
format PP07G4 best.;
format PP07G_59 best.;
format PP07H best.;
format PP07I best.;
format PP07J best.;
format PP07K best.;
format PP08D1 best.;
format PP08D4 best.;
format PP08F1 best.;
format PP08F2 best.;
format PP08J1 best.;
format PP08J2 best.;
format PP08J3 best.;
format PP09A best.;
format PP09B best.;
format PP09C best.;
format PP09C_ESP $42.;
format PP10A best.;
format PP10C best.;
format PP10D best.;
format PP10E best.;
format PP11A best.;
format PP11B1 best.;
format PP11B2_ANO best.;
format PP11B2_DIA best.;
format PP11B2_MES best.;
format PP11B_COD best.;
format PP11C best.;
format PP11C99 best.;
PP11D_COD_num=input (PP11D_COD, best.); drop PP11D_COD; rename PP11D_COD_num=PP11D_COD; 
format PP11G_ANO best.;
format PP11G_DIA best.;
format PP11G_MES best.;
format PP11L best.;
format PP11L1 best.;
format PP11M best.;
format PP11N best.;
format PP11O best.;
format PP11P best.;
format PP11Q best.;
format PP11R best.;
format PP11S best.;
format PP11T best.;
format PP3E_TOT best.;
format PP3F_TOT best.;
format REGION best.;
format TOT_P12 best.;
format TRIMESTRE best.;
format T_VI best.;
format V10_M best.;
format V11_M best.;
format V12_M best.;
format V18_M best.;
format V19_AM best.;
format V21_M best.;
format V2_M best.;
format V3_M best.;
format V4_M best.;
format V5_M best.;
format V8_M best.;
format V9_M best.;
ch15_cod_char=input(ch15_cod, $42.); drop ch15_cod; rename ch15_cod_char=ch15_cod; 
ch16_cod_char=input(ch16_cod, $42.); drop ch16_cod; rename ch16_cod_char=ch16_cod; 
/*format ch15_cod $42.; 
format ch16_cod $42.; */
format codusu $42.; 
format mas_500 $42.; 
format pp09c_esp $100.; 
format pp09a_esp $100.; 

decindr_num=input (decindr, best.); drop decindr; rename decindr_num=decindr; 
adecindr_num=input (adecindr, best.); drop adecindr; rename adecindr_num=adecindr; 
rdecindr_num=input (rdecindr, best.); drop rdecindr; rename rdecindr_num=rdecindr; 
idecindr_num=input (idecindr, best.); drop idecindr; rename idecindr_num=idecindr; 
gdecindr_num=input (gdecindr, best.); drop gdecindr; rename gdecindr_num=gdecindr; 
pdecindr_num=input (pdecindr, best.); drop pdecindr; rename pdecindr_num=pdecindr; 

decocur_num=input (decocur, best.); drop decocur; rename decocur_num=decocur; 
adecocur_num=input (adecocur, best.); drop adecocur; rename adecocur_num=adecocur; 
rdecocur_num=input (rdecocur, best.); drop rdecocur; rename rdecocur_num=rdecocur; 
idecocur_num=input (idecocur, best.); drop idecocur; rename idecocur_num=idecocur; 
gdecocur_num=input (gdecocur, best.); drop gdecocur; rename gdecocur_num=gdecocur; 
pdecocur_num=input (pdecocur, best.); drop pdecocur; rename pdecocur_num=pdecocur; 

decifr_num=input (decifr, best.); drop decifr; rename decifr_num=decifr; 
adecifr_num=input (adecifr, best.); drop adecifr; rename adecifr_num=adecifr; 
rdecifr_num=input (rdecifr, best.); drop rdecifr; rename rdecifr_num=rdecifr; 
idecifr_num=input (idecifr, best.); drop idecifr; rename idecifr_num=idecifr; 
gdecifr_num=input (gdecifr, best.); drop gdecifr; rename gdecifr_num=gdecifr; 
pdecifr_num=input (pdecifr, best.); drop pdecifr; rename pdecifr_num=pdecifr; 

deccfr_num=input (deccfr, best.); drop deccfr; rename deccfr_num=deccfr; 
adeccfr_num=input (adeccfr, best.); drop adeccfr; rename adeccfr_num=adeccfr; 
rdeccfr_num=input (rdeccfr, best.); drop rdeccfr; rename rdeccfr_num=rdeccfr; 
ideccfr_num=input (ideccfr, best.); drop ideccfr; rename ideccfr_num=ideccfr; 
gdeccfr_num=input (gdeccfr, best.); drop gdeccfr; rename gdeccfr_num=gdeccfr; 
pdeccfr_num=input (pdeccfr, best.); drop pdeccfr; rename pdeccfr_num=pdeccfr;

run; 
proc print data=leo.ephc_2019_t04 (obs=10); run; 
format ch05 DDMMYYN10.; 

 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2016\,16,2,xls);
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2016\,16,3,xls);
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2016\,16,4,xls);
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2017\,17,1,xls);
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2017\,17,2,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2017\,17,3,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2017\,17,4,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2018\,18,1,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2018\,18,2,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2018\,18,3,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2018\,18,4,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2019\,19,1,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2019\,19,2,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2019\,19,3,xls); 
 /*Beware: due to a formatting error in the original CSV, you must change the format of the CH05 value, in Excel, to DD/MM/YYYY before 
 		importing this fourth quarter of 2019 data file. For an unknown reason, if you fail to do so, you end up with wrong date 
 		variables. */
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2019\,19,4,xls); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2020\,20,1,xlsx); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2020\,20,2,xlsx); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2020\,20,3,xlsx); 
 %import_ephc_post_2016(H:\Leonardo_orléans\EPH_base\EPH_2020\,20,4,xlsx); 
 /*The second quarter of 2018 has format problems with the date of birth variable ch05. We correct them here. Before that, we 
 		corrected the csv file, putting as missing all the entries where the date of birth was 01/01/1900 (roughly 4800).*/
data leo.ephc_2018_t02; 
 set leo.ephc_2018_t02; 
	ch05_date=datepart(ch05);
	format ch05_date DDMMYY10.; 
	drop ch05; 
run; 
data leo.ephc_2018_t02; 
set leo.ephc_2018_t02; 
	rename ch05_date=ch05; 
run; 
/*The first quarter of 2019 also has format problems with the date of birth variable ch05. We correct them here. Before that, we 
 		corrected the csv file, putting as missing all the entries where the date of birth was 01/01/1900.*/
data leo.ephc_2019_t01; 
 set leo.ephc_2019_t01; 
	ch05_date=datepart(ch05);
	format ch05_date DDMMYY10.; 
	drop ch05; 
run; 
data leo.ephc_2019_t01; 
set leo.ephc_2019_t01; 
	rename ch05_date=ch05; 
run; 


DATA leo.new_eph_2016; 
 set leo.ephc_2016_t02- leo.ephc_2016_t04; 
 person=cats(codusu,nro_hogar,componente);
 run; 
DATA leo.new_eph_2017; 
 set leo.ephc_2017_t01- leo.ephc_2017_t04; 
 person=cats(codusu,nro_hogar,componente);
 run; 

DATA leo.new_eph_2018; 
 set leo.ephc_2018_t01- leo.ephc_2018_t04; 
 person=cats(codusu,nro_hogar,componente);
 run; 
 data leo.new_eph_2019; 
 set leo.ephc_2019_t01-leo.ephc_2019_t04; 
 person=cats(codusu,nro_hogar,componente);
 run; 
 data leo.new_eph_2020; 
 set leo.ephc_2020_t01-leo.ephc_2020_t04; 
 person=cats(codusu,nro_hogar,componente); 
 run; 
data leo.new_eph_2016_2020; 
set leo.new_eph_2016-leo.new_eph_2020; 
drop apparition; 
run; 

 /*Here we quickly count how many times an individual appears in the base, as a descriptive statistic.*/
 proc sort data=leo.new_eph_2016_2020; 
 by person; 
 run;
 data leo.new_eph_2016_2020; 
set leo.new_eph_2016_2020; 
by person ;  
if first.person  then apparition=1; 
else apparition+1;
run;
/*Due to the pandemic, the second quarter of 2020 survey had trouble in reaching new households. This is why there are fewer households
		that are first interviewed in the second quarter of 2020 EPHc wave.
		
proc freq data=leo.new_eph_2016_2020; 
table apparition*trimestre;
where ano4=2020; 
run; */
data leo.new_eph_2016_2020;
length contributes_vol $20.; 
length contributes_comp $20.;
length contributes $20.;
 set leo.new_eph_2016_2020;
 if ano4=2016 & trimestre=2 then period=52; 
 if ano4=2016 & trimestre=3 then period=53; 
if ano4=2016 & trimestre=4 then period=54; 
if ano4=2017 & trimestre=1 then period=55; 
if ano4=2017 & trimestre=2 then period=56; 
if ano4=2017 & trimestre=3 then period=57; 
if ano4=2017 & trimestre=4 then period=58; 
if ano4=2018 & trimestre=1 then period=59; 
if ano4=2018 & trimestre=2 then period=60; 
if ano4=2018 & trimestre=3 then period=61; 
if ano4=2018 & trimestre=4 then period=62; 
if ano4=2019 & trimestre=1 then period=63;
if ano4=2019 & trimestre=2 then period=64;
if ano4=2019 & trimestre=3 then period=65;
if ano4=2019 & trimestre=4 then period=66; 
if ano4=2020 & trimestre=1 then period=67; 
if ano4=2020 & trimestre=2 then period=68; 
if ano4=2020 & trimestre=3 then period=69;
if ano4=2020 & trimestre=4 then period=70;  

if nivel_ed=6 then formation="3"; 
if nivel_ed=4 | nivel_ed=5 then formation="2"; 
if nivel_ed=1 | nivel_ed=2 |nivel_ed=3 |nivel_ed=7 |nivel_ed=9 then formation="1";
ageconti=ch06*1;
if ch06=-1 then ageconti=0; 
if pp07h=1 then contributes_comp="True";
if pp07h=2 or pp07h=0  then contributes_comp="False";
if pp07i=1 then contributes_vol="True";
if pp07i=2 or pp07i=0  then contributes_vol="False";
 if contributes_comp= "False"& contributes_vol="False" then contributes="False"; 
 else contributes="True";  
run; 

data leo.new_eph_2016; 
set leo.new_eph_2016_2020; 
	where ano4=2016; 
run; 
data leo.new_eph_2017; 
set leo.new_eph_2016_2020; 
	where ano4=2017; 
run; 
data leo.new_eph_2018; 
set leo.new_eph_2016_2020; 
	where ano4=2018; 
run; 
data leo.new_eph_2019; 
set leo.new_eph_2016_2020; 
	where ano4=2019; 
run; 
data leo.new_eph_2020; 
set leo.new_eph_2016_2020; 
	where ano4=2020; 
run; 


/*Then, we endogenously determine the proportion of independent contributors */
%macro indep_endo_2016(indata,outdata);
data independent_workers; 
length qualif_indep $20.; 
set &indata.; 
where (estado=1)&(cat_ocup=1|cat_ocup=2); 
position_char=put(pp04d_cod,5.); 
 qualification_char=substr(position_char,5);

if qualification_char^=1 & qualification_char^=2 then qualif_indep="Non_qualif"; 
else qualif_indep="Qualif"; 
run; 
data independent_workers; 
length contributes $20.; 
set independent_workers; 
if qualif_indep="Non_qualif" &((pp04a^=1)&(pp04c=1|pp04c=2|pp04c=3|pp04c=4|pp04c=5|pp04c=99))
then contributes="False" ; 
else contributes="True" ; 
drop position_char qualification_char; 
run; 
 

data independent_workers; 
set independent_workers; 
where (estado=1)&(cat_ocup=1|cat_ocup=2);
if pp04a=1 then do; 
contributes="True"; 
qualif_indep="Qualif"; 
end; 
if pp04c=6|pp04c=7|pp04c=8|pp04c=9|pp04c=10|pp04c=11|pp04c=12  then do; 
contributes="True"; 
qualif_indep="Qualif"; 
end;  
if contributes="True" then qualif_indep="Qualif"; 
run; 
proc sort data=&indata. ;
by person period; 
run; 
proc sort data=independent_workers;
by person period; 
run; 
data &outdata.; 
merge &indata. independent_workers; 
by person period; 
/*Reminder for labour_market_state variable: 1, formal wage-earner; 2, formal sector independent worker; 3, informal worker; 4, unemployed;
		5; inactive.*/
if estado=2 then labour_market_state=4;
if estado=1 & cat_ocup=3 & contributes="True"  then labour_market_state=1;
if qualif_indep="Qualif" then labour_market_state=2; 
if qualif_indep="Qualif" then contributes="True"; 
if estado=1 & contributes="False" | cat_ocup=4 then labour_market_state=3;
if estado=3 | estado=4 | estado=0 then labour_market_state=5; 
run; 
/*We get realistic numbers, with employers contributing more often than own-account workers.*/

%mend; 

%indep_endo_2016(leo.new_eph_2016,leo.eph_formatted_2016);
%indep_endo_2016(leo.new_eph_2017,leo.eph_formatted_2017);
%indep_endo_2016(leo.new_eph_2018,leo.eph_formatted_2018);
%indep_endo_2016(leo.new_eph_2019,leo.eph_formatted_2019);
%indep_endo_2016(leo.new_eph_2020,leo.eph_formatted_2020);
%indep_endo_2016(leo.new_eph_2016_2020,leo.eph_formatted_2016_2020);
/*Next, we format other variables, trying to be consistent with what we did for the 2003-2015 period.*/
data leo.eph_formatted_2016; 
set leo.eph_formatted_2016; 
household=cats(codusu,nro_hogar);
 id=cats(codusu,nro_hogar,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
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
if ageconti>94 then agegroup_ext=95;

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
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
run; 

data leo.eph_formatted_2017; 
set leo.eph_formatted_2017; 

household=cats(codusu,nro_hogar);
 id=cats(codusu,nro_hogar,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
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
if ageconti>94 then agegroup_ext=95;


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
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
 run; 

data leo.eph_formatted_2018; 
set leo.eph_formatted_2018; 

household=cats(codusu,nro_hogar);
 id=cats(codusu,nro_hogar,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
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
if ageconti>94 then agegroup_ext=95;


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
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
 run; 

 
data leo.eph_formatted_2019; 
set leo.eph_formatted_2019; 

household=cats(codusu,nro_hogar);
 id=cats(codusu,nro_hogar,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
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
if ageconti>94 then agegroup_ext=95;


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
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
 run; 


data leo.eph_formatted_2020; 
set leo.eph_formatted_2020; 

household=cats(codusu,nro_hogar);
 id=cats(codusu,nro_hogar,componente); 
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
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
if ageconti>94 then agegroup_ext=95;


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
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
 run; 


data leo.eph_formatted_2016_2020; 
set leo.eph_formatted_2016_2020; 

household=cats(codusu,nro_hogar);
 id=cats(codusu,nro_hogar,componente);  
 if ch03=01 then hhstate=1; 
 if ch03=02 then hhstate=2;
 if ch03=03 then hhstate=3; 
 if ch03=04 then hhstate=4; 
 if ch03=05 then hhstate=5; 
 if ch03=06 then hhstate=6; 
 if ch03=07 then hhstate=7; 
 if ch03=08 then hhstate=8; 
 if ch03=09 then hhstate=9; 
 if ch03=10 then hhstate=10;  
 if ch07=1 then marital_status=1; 
 if ch07=2 then marital_status=2; 
 if ch07=3 then marital_status=3; 
 if ch07=4 then marital_status=4; 
 if ch07=5 then marital_status=5;
 if ch06=-1 then ch06=0;
 
if ageconti=-1 then ageconti=0; 
if (ageconti>=-1 and ageconti<16) then agegroup_ext=1;
if (ageconti>15 and ageconti<20) then agegroup_ext=16;
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
if ageconti>94 then agegroup_ext=95;

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
if (ageconti>64 and ageconti<70) then agegroup=65;
if ageconti>69 then agegroup=300;
run; 
/* Temporary computation of labour-market state by period, not for the MISSAR model. Consider deleting in the future.
proc freq data=leo.eph_formatted_2016_2020; 
weight pondera; 
where ageconti>=16 & ageconti<70; 
table labour_market_state*period;
run; 

proc freq data=leo.eph_formatted_2016_2020; 
weight pondera; 
where ageconti>=16 & ageconti<70 & labour_market_state^=5; 
table labour_market_state*period;
run; 

proc freq data=leo.eph_formatted_2016_2020; 
weight pondera; 
where ageconti>=16 & ageconti<70 & labour_market_state^=5 & labour_market_state^=4 & (cat_ocup=3|cat_ocup=4); 
table labour_market_state*period;
run; */


%family_links_and_id(leo,eph_formatted_2016,2,long_id_2016_t2,both_id_2016_t2,short_id_2016_t2,52,53);

dm 'odsresults; clear'; 
dm 'clear log'; 
/*********************************************************************************************************************************/
/***********************************Next, we compute the aggregate alignment variables.*************************/
/*************************************************************************************************************************************/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=52) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_52;
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=53) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=54) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=55) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=56) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=57) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=58) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=59) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=60) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=61) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=62) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=63) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=64) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=65) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=66) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=67) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=68) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=69) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=70) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_70; 
run; 
data lms_52; set lms_52; period=54; percent_col=pct_col/100; run;
data lms_53; set lms_53; period=55; percent_col=pct_col/100; run;
data lms_54; set lms_54; period=56; percent_col=pct_col/100; run;
data lms_55; set lms_55; period=57; percent_col=pct_col/100; run; 
data lms_56; set lms_56; period=58; percent_col=pct_col/100; run; 
data lms_57; set lms_57; period=59; percent_col=pct_col/100; run; 
data lms_58; set lms_58; period=60; percent_col=pct_col/100; run; 
data lms_59; set lms_59; period=61; percent_col=pct_col/100; run; 
data lms_60; set lms_60; period=62; percent_col=pct_col/100; run; 
data lms_61; set lms_61; period=63; percent_col=pct_col/100; run; 
data lms_62; set lms_62; period=64; percent_col=pct_col/100; run; 
data lms_63; set lms_63; period=65; percent_col=pct_col/100; run; 
data lms_64; set lms_64; period=66; percent_col=pct_col/100; run; 
data lms_65; set lms_65; period=67; percent_col=pct_col/100; run; 
data lms_66; set lms_66; period=68; percent_col=pct_col/100; run; 
data lms_67; set lms_67; period=69; percent_col=pct_col/100; run; 
data lms_68; set lms_68; period=70; percent_col=pct_col/100; run; 
data lms_69; set lms_69; period=71; percent_col=pct_col/100; run; 
data lms_70; set lms_70; period=72; percent_col=pct_col/100; run; 


data lms_52; set lms_52; keep percent_col labour_market_state agegroup period; run; 
data lms_53; set lms_53; keep percent_col labour_market_state agegroup period; run; 
data lms_54; set lms_54; keep percent_col labour_market_state agegroup period; run; 
data lms_55; set lms_55; keep percent_col labour_market_state agegroup period; run;
data lms_56; set lms_56; keep percent_col labour_market_state agegroup period; run;
data lms_57; set lms_57; keep percent_col labour_market_state agegroup period; run;
data lms_58; set lms_58; keep percent_col labour_market_state agegroup period; run;
data lms_59; set lms_59; keep percent_col labour_market_state agegroup period; run;
data lms_60; set lms_60; keep percent_col labour_market_state agegroup period; run;
data lms_61; set lms_61; keep percent_col labour_market_state agegroup period; run;
data lms_62; set lms_62; keep percent_col labour_market_state agegroup period; run;
data lms_63; set lms_63; keep percent_col labour_market_state agegroup period; run;
data lms_64; set lms_64; keep percent_col labour_market_state agegroup period; run;
data lms_65; set lms_65; keep percent_col labour_market_state agegroup period; run;
data lms_66; set lms_66; keep percent_col labour_market_state agegroup period; run;
data lms_67; set lms_67; keep percent_col labour_market_state agegroup period; run;
data lms_68; set lms_68; keep percent_col labour_market_state agegroup period; run;
data lms_69; set lms_69; keep percent_col labour_market_state agegroup period; run;
data lms_70; set lms_70; keep percent_col labour_market_state agegroup period; run;
data lms_men_base; 
set lms_52-lms_70; run; 
/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data wage_earners_men;
set lms_men_base (where=(labour_market_state=1));
run; 
proc sort data=wage_earners_men; 
by agegroup; 
run; 
 
proc transpose data=wage_earners_men out=transp_wage_earners_men; 
by agegroup;
id period ;
run;
data transp_wage_earners_men; 
set transp_wage_earners_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_wage_earners_men; 
set transp_wage_earners_men ; 
drop _name_ _label_ ; 
RUN; 
data formal_indep_men;
set lms_men_base (where=(labour_market_state=2));
run; 
proc sort data=formal_indep_men; 
by agegroup; 
run; 
proc transpose data=formal_indep_men out=transp_formal_indep_men; 
by agegroup;
id period ;
run;

data transp_formal_indep_men; 
set transp_formal_indep_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_formal_indep_men; 
set transp_formal_indep_men ; 
drop _name_ _label_ ; 
RUN; 
data informal;
set lms_men_base (where=(labour_market_state=3));
run; 
proc sort data=informal; 
by agegroup; 
run; 
proc transpose data=informal out=transp_informal_men; 
by agegroup;
id period ;
run;
data transp_informal_men; 
set transp_informal_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_informal_men; 
set transp_informal_men ; 
drop _name_ _label_ ; 
RUN; 

data unemployed_men;
set lms_men_base (where=(labour_market_state=4));
run; 
proc sort data=unemployed_men; 
by agegroup; 
run; 
proc transpose data=unemployed_men out=transp_unemployed_men; 
by agegroup;
id period ;
run;

data transp_unemployed_men; 
set transp_unemployed_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_unemployed_men; 
set transp_unemployed_men ; 
drop _name_ _label_ ; 
RUN; 
data inactive_men;
set lms_men_base (where=(labour_market_state=5));
run; 
proc sort data=inactive_men; 
by agegroup; 
run; 
proc transpose data=inactive_men out=transp_inactive_men; 
by agegroup;
id period ;
run;

data transp_inactive_men; 
set transp_inactive_men (where= (_NAME_="percent_col")); 
RUN; 
data transp_inactive_men; 
set transp_inactive_men ; 
drop _name_ _label_ ; 
RUN; 

proc print data=transp_wage_earners_men; run; 
proc print data=transp_formal_indep_men; run; 
proc print data=transp_informal_men; run; 
proc print data=transp_unemployed_men; run; 
proc print data=transp_inactive_men; run; 
data leo.cal_post_2016_wag_men; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_wage_earners_men;
if missing(agegroup) then delete; 
run; 
data leo.cal_post_2016_ind_men; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_formal_indep_men;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_inf_men; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_informal_men;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_une_men; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_unemployed_men;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_ina_men; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_inactive_men;
if missing(agegroup) then delete;
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


%m_zero(leo.cal_post_2016_wag_men); 
%m_zero(leo.cal_post_2016_ind_men); 
%m_zero(leo.cal_post_2016_inf_men); 
%m_zero(leo.cal_post_2016_une_men); 
%m_zero(leo.cal_post_2016_ina_men); 
/*We do the same thing, but among women*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=52) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_52;
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=53) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup / noprint outpct out=lms_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=54) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=55) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_55; 
run; 

proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=56) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=57) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=58) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=59) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=60) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=61) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=62) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=63) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=64) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=65) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=66) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=67) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=68) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=69) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=70) & (65>=agegroup>=16) & (formation^="3" | (formation="3" & agegroup^=16))) ;
table labour_market_state*agegroup /noprint outpct out=lms_70; 
run; 
data lms_52; set lms_52; period=54; percent_col=pct_col/100; run;
data lms_53; set lms_53; period=55; percent_col=pct_col/100; run;
data lms_54; set lms_54; period=56; percent_col=pct_col/100; run;
data lms_55; set lms_55; period=57; percent_col=pct_col/100; run; 
data lms_56; set lms_56; period=58; percent_col=pct_col/100; run; 
data lms_57; set lms_57; period=59; percent_col=pct_col/100; run; 
data lms_58; set lms_58; period=60; percent_col=pct_col/100; run; 
data lms_59; set lms_59; period=61; percent_col=pct_col/100; run; 
data lms_60; set lms_60; period=62; percent_col=pct_col/100; run; 
data lms_61; set lms_61; period=63; percent_col=pct_col/100; run; 
data lms_62; set lms_62; period=64; percent_col=pct_col/100; run;  
data lms_63; set lms_63; period=65; percent_col=pct_col/100; run;
data lms_64; set lms_64; period=66; percent_col=pct_col/100; run;
data lms_65; set lms_65; period=67; percent_col=pct_col/100; run;
data lms_66; set lms_66; period=68; percent_col=pct_col/100; run;
data lms_67; set lms_67; period=69; percent_col=pct_col/100; run;
data lms_68; set lms_68; period=70; percent_col=pct_col/100; run;
data lms_69; set lms_69; period=71; percent_col=pct_col/100; run;
data lms_70; set lms_70; period=72; percent_col=pct_col/100; run;

data lms_52; set lms_52; keep percent_col labour_market_state agegroup period; run; 
data lms_53; set lms_53; keep percent_col labour_market_state agegroup period; run; 
data lms_54; set lms_54; keep percent_col labour_market_state agegroup period; run; 
data lms_55; set lms_55; keep percent_col labour_market_state agegroup period; run; 
data lms_56; set lms_56; keep percent_col labour_market_state agegroup period; run;
data lms_57; set lms_57; keep percent_col labour_market_state agegroup period; run;
data lms_58; set lms_58; keep percent_col labour_market_state agegroup period; run;
data lms_59; set lms_59; keep percent_col labour_market_state agegroup period; run;
data lms_60; set lms_60; keep percent_col labour_market_state agegroup period; run;
data lms_61; set lms_61; keep percent_col labour_market_state agegroup period; run;
data lms_62; set lms_62; keep percent_col labour_market_state agegroup period; run;
data lms_63; set lms_63; keep percent_col labour_market_state agegroup period; run;
data lms_64; set lms_64; keep percent_col labour_market_state agegroup period; run;
data lms_65; set lms_65; keep percent_col labour_market_state agegroup period; run;
data lms_66; set lms_66; keep percent_col labour_market_state agegroup period; run;
data lms_67; set lms_67; keep percent_col labour_market_state agegroup period; run;
data lms_68; set lms_68; keep percent_col labour_market_state agegroup period; run;
data lms_69; set lms_69; keep percent_col labour_market_state agegroup period; run;
data lms_70; set lms_70; keep percent_col labour_market_state agegroup period; run;
data lms_wom_base; 
set lms_52-lms_70; run; 
/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data wage_earners_wom;
set lms_wom_base (where=(labour_market_state=1));
run; 
proc sort data=wage_earners_wom; 
by agegroup; 
run; 
 
proc transpose data=wage_earners_wom out=transp_wage_earners_wom; 
by agegroup;
id period ;
run;
data transp_wage_earners_wom; 
set transp_wage_earners_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_wage_earners_wom; 
set transp_wage_earners_wom ; 
drop _name_ _label_ ; 
RUN; 
data formal_independent_wom;
set lms_wom_base (where=(labour_market_state=2));
run; 
proc sort data=formal_independent_wom; 
by agegroup; 
run; 
proc transpose data=formal_independent_wom out=transp_formal_indep_wom; 
by agegroup;
id period ;
run;

data transp_formal_indep_wom; 
set transp_formal_indep_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_formal_indep_wom; 
set transp_formal_indep_wom ; 
drop _name_ _label_ ; 
RUN; 
data informal;
set lms_wom_base (where=(labour_market_state=3));
run; 
proc sort data=informal; 
by agegroup; 
run; 
proc transpose data=informal out=transp_informal_wom; 
by agegroup;
id period ;
run;
data transp_informal_wom; 
set transp_informal_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_informal_wom; 
set transp_informal_wom ; 
drop _name_ _label_ ; 
RUN; 

data unemployed_wom;
set lms_wom_base (where=(labour_market_state=4));
run; 
proc sort data=unemployed_wom; 
by agegroup; 
run; 
proc transpose data=unemployed_wom out=transp_unemployed_wom; 
by agegroup;
id period ;
run;

data transp_unemployed_wom; 
set transp_unemployed_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_unemployed_wom; 
set transp_unemployed_wom ; 
drop _name_ _label_ ; 
RUN; 
data inactive_wom;
set lms_wom_base (where=(labour_market_state=5));
run; 
proc sort data=inactive_wom; 
by agegroup; 
run; 
proc transpose data=inactive_wom out=transp_inactive_wom; 
by agegroup;
id period ;
run;

data transp_inactive_wom; 
set transp_inactive_wom (where= (_NAME_="percent_col")); 
RUN; 
data transp_inactive_wom; 
set transp_inactive_wom ; 
drop _name_ _label_ ; 
RUN; 
data leo.cal_post_2016_wag_wom; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_wage_earners_wom;
if missing(agegroup) then delete; 
run; 
data leo.cal_post_2016_ind_wom; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_formal_indep_wom;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_inf_wom; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_informal_wom;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_une_wom; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_unemployed_wom;
if missing(agegroup) then delete;
run; 

data leo.cal_post_2016_ina_wom; 
retain agegroup _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_inactive_wom;
if missing(agegroup) then delete;
run; 
%m_zero(leo.cal_post_2016_wag_wom); 
%m_zero(leo.cal_post_2016_ind_wom); 
%m_zero(leo.cal_post_2016_inf_wom); 
%m_zero(leo.cal_post_2016_une_wom); 
%m_zero(leo.cal_post_2016_ina_wom); 

proc print data=leo.cal_post_2016_wag_wom; run; 
proc print data=leo.cal_post_2016_ind_wom; run; 
proc print data=leo.cal_post_2016_inf_wom; run; 
proc print data=leo.cal_post_2016_une_wom; run; 
proc print data=leo.cal_post_2016_ina_wom; run; 

/*Finally, we export these calibration datasets in a csv format. You still need to make minor changes by hand to the csv file to mimic 
		the alignment datasets input in our microsimulation module. As usual, put the path of your liking.*/
proc export data=leo.cal_post_2016_wag_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_wag_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ind_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_inf_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_une_men.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ina_men.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_wag_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_wag_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ind_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_inf_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_une_wom.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_wom 
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_ina_wom.csv' 
dbms=csv replace; 
run; 
/*We format them to help for future backwards microsimulations that would start with surveys carried out post 2016. I do not actually 
		used these in my PhD thesis though.*/
 
%macro cal_post_2016_backward(indata, variable); 



data &indata._b; 
set &indata.; 
Rename _72=x992;
Rename _71=x993;
Rename _70=x994;
Rename _69=x995;
Rename _68=x996;
Rename _67=x997;
Rename _66=x998;
Rename _65=x999;
Rename _64=x1000; 
Rename _63=x1001; 
Rename _62=x1002; 
Rename _61=x1003; 
Rename _60=x1004; 
Rename _59=x1005; 
Rename _58=x1006; 
Rename _57=x1007;
Rename _56=x1008;
Rename _55=x1009;
Rename _54=x1010;
run;
data &indata._b; 
retain &variable. x992 x993 x994 x995 x996 x997 x998 x999 x1000 x1001 x1002 x1003 x1004 x1005 x1006 x1007 x1008 x1009 x1010 ; 
set &indata._b; 
run; 
%mend; 


%cal_post_2016_backward(leo.cal_post_2016_wag_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_ind_men,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_inf_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_une_men,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_ina_men,agegroup);
 
%cal_post_2016_backward(leo.cal_post_2016_wag_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_ind_wom,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_inf_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_une_wom,agegroup);
 %cal_post_2016_backward(leo.cal_post_2016_ina_wom,agegroup);



proc export data=leo.cal_post_2016_wag_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_wag_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ind_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_inf_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_une_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ina_men_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_wag_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_wag_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_ind_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ind_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_inf_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_inf_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_une_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_une_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_ina_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_ina_wom_b.csv' 
dbms=csv replace; 
run; 

/**************We compute now the alignment data for the proportions of students in 2016-2019.*/
options nofmterr; 
data leo.eph_formatted_2016; 
set leo.eph_formatted_2016; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
data leo.eph_formatted_2017; 
set leo.eph_formatted_2017; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
data leo.eph_formatted_2018; 
set leo.eph_formatted_2018; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
data leo.eph_formatted_2019; 
set leo.eph_formatted_2019; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
data leo.eph_formatted_2020; 
set leo.eph_formatted_2020; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run;
data leo.eph_formatted_2016_2020; 
set leo.eph_formatted_2016_2020; 
if cat_inac=3 then is_student=1;
if cat_inac=1 |cat_inac=2|cat_inac=4|cat_inac=5|cat_inac=6|cat_inac=7|missing(cat_inac) then is_student=0; 
if missing(is_student) then student="False"; 
if is_student=1 then student="True"; 
if is_student=0 then student="False"; 
drop is_student; run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table student*ch06 / noprint outpct out=student_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=56)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=57)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=58)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=59)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=60)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=61)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=62)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=63)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=64)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=65)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=66)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=67)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=68)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=69)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=70)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_70; 
run; 
data student_52; set student_52; period=54; percent_col=pct_col/100; run; 
data student_53; set student_53; period=55; percent_col=pct_col/100; run; 
data student_54; set student_54; period=56; percent_col=pct_col/100; run; 
data student_55; set student_55; period=57; percent_col=pct_col/100; run; 
data student_56; set student_56; period=58; percent_col=pct_col/100; run; 
data student_57; set student_57; period=59; percent_col=pct_col/100; run; 
data student_58; set student_58; period=60; percent_col=pct_col/100; run; 
data student_59; set student_59; period=61; percent_col=pct_col/100; run; 
data student_60; set student_60; period=62; percent_col=pct_col/100; run; 
data student_61; set student_61; period=63; percent_col=pct_col/100; run; 
data student_62; set student_62; period=64; percent_col=pct_col/100; run; 
data student_63; set student_63; period=65; percent_col=pct_col/100; run; 
data student_64; set student_64; period=66; percent_col=pct_col/100; run; 
data student_65; set student_65; period=67; percent_col=pct_col/100; run; 
data student_66; set student_66; period=68; percent_col=pct_col/100; run; 
data student_67; set student_67; period=69; percent_col=pct_col/100; run; 
data student_68; set student_68; period=70; percent_col=pct_col/100; run; 
data student_69; set student_69; period=71; percent_col=pct_col/100; run; 
data student_70; set student_70; period=72; percent_col=pct_col/100; run; 

data student_52; set student_52; keep percent_col student ch06 period; run; 
data student_53; set student_53; keep percent_col student ch06 period; run; 
data student_54; set student_54; keep percent_col student ch06 period; run; 
data student_55; set student_55; keep percent_col student ch06 period; run; 
data student_56; set student_56; keep percent_col student ch06 period; run; 
data student_57; set student_57; keep percent_col student ch06 period; run; 
data student_58; set student_58; keep percent_col student ch06 period; run; 
data student_59; set student_59; keep percent_col student ch06 period; run; 
data student_60; set student_60; keep percent_col student ch06 period; run; 
data student_61; set student_61; keep percent_col student ch06 period; run; 
data student_62; set student_62; keep percent_col student ch06 period; run; 
data student_63; set student_63; keep percent_col student ch06 period; run; 
data student_64; set student_64; keep percent_col student ch06 period; run; 
data student_65; set student_65; keep percent_col student ch06 period; run; 
data student_66; set student_66; keep percent_col student ch06 period; run; 
data student_67; set student_67; keep percent_col student ch06 period; run; 
data student_68; set student_68; keep percent_col student ch06 period; run; 
data student_69; set student_69; keep percent_col student ch06 period; run; 
data student_70; set student_70; keep percent_col student ch06 period; run; 
data student_men_base; 
set student_52-student_70; run; 

/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data student_men;
set student_men_base (where=(student="True"));
run; 
proc sort data=student_men; 
by ch06; 
run; 
 
proc transpose data=student_men out=transp_student_men; 
by ch06;
id period ;
run;
data transp_student_men; 
set transp_student_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_student_men; 
set transp_student_men ; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_stu_men; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_student_men;
rename ch06=age; 
run; 
proc print data=leo.cal_post_2016_stu_men; run; 

/*We do the same thing for women.*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table student*ch06 / noprint outpct out=student_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=56)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=57)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=58)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=59)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=60)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=61)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=62)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=63)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=64)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=65)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_65; 
run;  
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=66)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=67)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=68)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=69)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=70)& (agegroup=16|agegroup=20|agegroup=25));
table student*ch06 / noprint outpct out=student_70; 
run; 
data student_52; set student_52; period=54; percent_col=pct_col/100; run; 
data student_53; set student_53; period=55; percent_col=pct_col/100; run; 
data student_54; set student_54; period=56; percent_col=pct_col/100; run; 
data student_55; set student_55; period=57; percent_col=pct_col/100; run; 
data student_56; set student_56; period=58; percent_col=pct_col/100; run; 
data student_57; set student_57; period=59; percent_col=pct_col/100; run; 
data student_58; set student_58; period=60; percent_col=pct_col/100; run; 
data student_59; set student_59; period=61; percent_col=pct_col/100; run; 
data student_60; set student_60; period=62; percent_col=pct_col/100; run; 
data student_61; set student_61; period=63; percent_col=pct_col/100; run; 
data student_62; set student_62; period=64; percent_col=pct_col/100; run; 
data student_63; set student_63; period=65; percent_col=pct_col/100; run; 
data student_64; set student_64; period=66; percent_col=pct_col/100; run; 
data student_65; set student_65; period=67; percent_col=pct_col/100; run; 
data student_66; set student_66; period=68; percent_col=pct_col/100; run;  
data student_67; set student_67; period=69; percent_col=pct_col/100; run; 
data student_68; set student_68; period=70; percent_col=pct_col/100; run; 
data student_69; set student_69; period=71; percent_col=pct_col/100; run; 
data student_70; set student_70; period=72; percent_col=pct_col/100; run; 

data student_52; set student_52; keep percent_col student ch06 period; run; 
data student_53; set student_53; keep percent_col student ch06 period; run; 
data student_54; set student_54; keep percent_col student ch06 period; run; 
data student_55; set student_55; keep percent_col student ch06 period; run; 
data student_56; set student_56; keep percent_col student ch06 period; run; 
data student_57; set student_57; keep percent_col student ch06 period; run; 
data student_58; set student_58; keep percent_col student ch06 period; run; 
data student_59; set student_59; keep percent_col student ch06 period; run; 
data student_60; set student_60; keep percent_col student ch06 period; run; 
data student_61; set student_61; keep percent_col student ch06 period; run; 
data student_62; set student_62; keep percent_col student ch06 period; run; 
data student_63; set student_63; keep percent_col student ch06 period; run; 
data student_64; set student_64; keep percent_col student ch06 period; run; 
data student_65; set student_65; keep percent_col student ch06 period; run; 
data student_66; set student_66; keep percent_col student ch06 period; run; 
data student_67; set student_67; keep percent_col student ch06 period; run; 
data student_68; set student_68; keep percent_col student ch06 period; run; 
data student_69; set student_69; keep percent_col student ch06 period; run; 
data student_70; set student_70; keep percent_col student ch06 period; run;
data student_wom_base; 
set student_52-student_70; run; 

/*We then only take from the base the different labour market states and transpose them, to put the labour-market proportions by gender in
		a format readable by LIAM2.*/
data student_wom;
set student_wom_base (where=(student="True"));
run; 
proc sort data=student_wom; 
by ch06; 
run; 
 
proc transpose data=student_wom out=transp_student_wom; 
by ch06;
id period ;
run;
data transp_student_wom; 
set transp_student_wom (where= (_NAME_="percent_col")); 
RUN; 

data transp_student_wom; 
set transp_student_wom ; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_stu_wom; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_student_wom;
rename ch06=age; 
run; 
proc print data=leo.cal_post_2016_stu_wom; run; 


proc export data=leo.cal_post_2016_stu_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_stu_men.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_stu_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_stu_wom.csv' 
dbms=csv replace; 
run; 

/*Now we compute the alignment values for education levels.*/

proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table formation*ch06 / noprint outpct out=formation_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=1) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=56)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=57)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=1) & (period=58)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=59)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=60)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=61)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=1) & (period=62)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=63)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=64)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=65)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=1) & (period=66)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=67)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=68)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=69)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=1) & (period=70)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_70; 
run; 
data formation_52; set formation_52; period=54; percent_col=pct_col/100; run; 
data formation_53; set formation_53; period=55; percent_col=pct_col/100; run; 
data formation_54; set formation_54; period=56; percent_col=pct_col/100; run; 
data formation_55; set formation_55; period=57; percent_col=pct_col/100; run; 
data formation_56; set formation_56; period=58; percent_col=pct_col/100; run; 
data formation_57; set formation_57; period=59; percent_col=pct_col/100; run; 
data formation_58; set formation_58; period=60; percent_col=pct_col/100; run; 
data formation_59; set formation_59; period=61; percent_col=pct_col/100; run; 
data formation_60; set formation_60; period=62; percent_col=pct_col/100; run; 
data formation_61; set formation_61; period=63; percent_col=pct_col/100; run; 
data formation_62; set formation_62; period=64; percent_col=pct_col/100; run; 
data formation_63; set formation_63; period=65; percent_col=pct_col/100; run; 
data formation_64; set formation_64; period=66; percent_col=pct_col/100; run; 
data formation_65; set formation_65; period=67; percent_col=pct_col/100; run;  
data formation_66; set formation_66; period=68; percent_col=pct_col/100; run; 
data formation_67; set formation_67; period=69; percent_col=pct_col/100; run; 
data formation_68; set formation_68; period=70; percent_col=pct_col/100; run; 
data formation_69; set formation_69; period=71; percent_col=pct_col/100; run; 
data formation_70; set formation_70; period=72; percent_col=pct_col/100; run; 

data formation_52; set formation_52; keep percent_col formation ch06 period; run; 
data formation_53; set formation_53; keep percent_col formation ch06 period; run; 
data formation_54; set formation_54; keep percent_col formation ch06 period; run; 
data formation_55; set formation_55; keep percent_col formation ch06 period; run; 
data formation_56; set formation_56; keep percent_col formation ch06 period; run; 
data formation_57; set formation_57; keep percent_col formation ch06 period; run; 
data formation_58; set formation_58; keep percent_col formation ch06 period; run; 
data formation_59; set formation_59; keep percent_col formation ch06 period; run; 
data formation_60; set formation_60; keep percent_col formation ch06 period; run; 
data formation_61; set formation_61; keep percent_col formation ch06 period; run; 
data formation_62; set formation_62; keep percent_col formation ch06 period; run; 
data formation_63; set formation_63; keep percent_col formation ch06 period; run; 
data formation_64; set formation_64; keep percent_col formation ch06 period; run; 
data formation_65; set formation_65; keep percent_col formation ch06 period; run; 
data formation_66; set formation_66; keep percent_col formation ch06 period; run; 
data formation_67; set formation_67; keep percent_col formation ch06 period; run; 
data formation_68; set formation_68; keep percent_col formation ch06 period; run; 
data formation_69; set formation_69; keep percent_col formation ch06 period; run; 
data formation_70; set formation_70; keep percent_col formation ch06 period; run; 
data formation_men_base; 
set formation_52-formation_70;
run; 

/*proc sort data=leo.cal_wag_f_for3; 
by agegroup; 
run; */
/*On prend ensuite de la base uniquement les différents états dans le marché du travail et on les transpose. 
Le résultat for une série de tableaux en format LIAM2 selon l'état dans le marché du travail*/

data for_1_men;
set formation_men_base (where=(formation="1"));
run; 

data for_2_men;
set formation_men_base (where=(formation="2"));
run; 

data for_3_men;
set formation_men_base (where=(formation="3"));
run; 

proc sort data=for_1_men; 
by ch06; 
run; 
proc sort data=for_2_men; 
by ch06; 
run; 
 
proc sort data=for_3_men; 
by ch06; 
run; 
 
proc transpose data=for_1_men out=transp_for_1_men; 
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

data leo.cal_post_2016_for_1_men; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_for_1_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_1_men); 
proc export data=leo.cal_post_2016_for_1_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_1_men.csv' 
dbms=csv replace; 
run; 
proc transpose data=for_2_men out=transp_for_2_men; 
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

data leo.cal_post_2016_for_2_men; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_for_2_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_2_men);  
proc export data=leo.cal_post_2016_for_2_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_2_men.csv' 
dbms=csv replace; 
run; 

 proc print data=leo.cal_post_2016_for_2_men; 
 run; 
proc transpose data=for_3_men out=transp_for_3_men; 
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

data leo.cal_post_2016_for_3_men; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_for_3_men;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_3_men); 
proc print data=leo.cal_post_2016_for_3_men; run; 
proc export data=leo.cal_post_2016_for_3_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_3_men.csv' 
dbms=csv replace; 
run; 
/*Now, we do the same thing for the formation of women.*/

proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=52) & (agegroup =16|agegroup =20|agegroup=25)) ;
table formation*ch06 / noprint outpct out=formation_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=53)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where ( (ch04=2) & (period=54)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=55)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=56)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=57)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where ( (ch04=2) & (period=58)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=59)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=60)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=61)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where ( (ch04=2) & (period=62)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=63)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=64)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=65)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where ( (ch04=2) & (period=66)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=67)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=68)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=69)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where ( (ch04=2) & (period=70)& (agegroup=16|agegroup=20|agegroup=25));
table formation*ch06 / noprint outpct out=formation_70; 
run; 
data formation_52; set formation_52; period=54; percent_col=pct_col/100; run; 
data formation_53; set formation_53; period=55; percent_col=pct_col/100; run; 
data formation_54; set formation_54; period=56; percent_col=pct_col/100; run; 
data formation_55; set formation_55; period=57; percent_col=pct_col/100; run; 
data formation_56; set formation_56; period=58; percent_col=pct_col/100; run; 
data formation_57; set formation_57; period=59; percent_col=pct_col/100; run; 
data formation_58; set formation_58; period=60; percent_col=pct_col/100; run; 
data formation_59; set formation_59; period=61; percent_col=pct_col/100; run; 
data formation_60; set formation_60; period=62; percent_col=pct_col/100; run; 
data formation_61; set formation_61; period=63; percent_col=pct_col/100; run; 
data formation_62; set formation_62; period=64; percent_col=pct_col/100; run; 
data formation_63; set formation_63; period=65; percent_col=pct_col/100; run; 
data formation_64; set formation_64; period=66; percent_col=pct_col/100; run; 
data formation_65; set formation_65; period=67; percent_col=pct_col/100; run; 
data formation_66; set formation_66; period=68; percent_col=pct_col/100; run; 
data formation_67; set formation_67; period=69; percent_col=pct_col/100; run; 
data formation_68; set formation_68; period=70; percent_col=pct_col/100; run; 
data formation_69; set formation_69; period=71; percent_col=pct_col/100; run;  
data formation_70; set formation_70; period=72; percent_col=pct_col/100; run; 

data formation_52; set formation_52; keep percent_col formation ch06 period; run; 
data formation_53; set formation_53; keep percent_col formation ch06 period; run; 
data formation_54; set formation_54; keep percent_col formation ch06 period; run; 
data formation_55; set formation_55; keep percent_col formation ch06 period; run; 
data formation_56; set formation_56; keep percent_col formation ch06 period; run; 
data formation_57; set formation_57; keep percent_col formation ch06 period; run; 
data formation_58; set formation_58; keep percent_col formation ch06 period; run; 
data formation_59; set formation_59; keep percent_col formation ch06 period; run; 
data formation_60; set formation_60; keep percent_col formation ch06 period; run; 
data formation_61; set formation_61; keep percent_col formation ch06 period; run; 
data formation_62; set formation_62; keep percent_col formation ch06 period; run; 
data formation_63; set formation_63; keep percent_col formation ch06 period; run; 
data formation_64; set formation_64; keep percent_col formation ch06 period; run; 
data formation_65; set formation_65; keep percent_col formation ch06 period; run; 
data formation_66; set formation_66; keep percent_col formation ch06 period; run; 
data formation_67; set formation_67; keep percent_col formation ch06 period; run; 
data formation_68; set formation_68; keep percent_col formation ch06 period; run; 
data formation_69; set formation_69; keep percent_col formation ch06 period; run; 
data formation_70; set formation_70; keep percent_col formation ch06 period; run; 
data formation_wom_base; 
set formation_52-formation_70; 
run; 


data for_1_wom;
set formation_wom_base (where=(formation="1"));
run; 

data for_2_wom;
set formation_wom_base (where=(formation="2"));
run; 

data for_3_wom;
set formation_wom_base (where=(formation="3"));
run; 

proc sort data=for_1_wom; 
by ch06; 
run; 
proc sort data=for_2_wom; 
by ch06; 
run; 
 
proc sort data=for_3_wom; 
by ch06; 
run; 
 
proc transpose data=for_1_wom out=transp_for_1_wom; 
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

data leo.cal_post_2016_for_1_wom; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_for_1_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_1_wom); 
proc export data=leo.cal_post_2016_for_1_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_1_wom.csv' 
dbms=csv replace; 
run; 
proc transpose data=for_2_wom out=transp_for_2_wom; 
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

data leo.cal_post_2016_for_2_wom; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_for_2_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_2_wom);  
proc export data=leo.cal_post_2016_for_2_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_2_wom.csv' 
dbms=csv replace; 
run; 

 proc print data=leo.cal_post_2016_for_2_wom; 
 run; 
proc transpose data=for_3_wom out=transp_for_3_wom; 
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

data leo.cal_post_2016_for_3_wom; 
retain ch06 _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_for_3_wom;
rename ch06=age; 
run; 
%m_zero(leo.cal_post_2016_for_3_wom); 
proc export data=leo.cal_post_2016_for_3_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_for_3_wom.csv' 
dbms=csv replace; 
run; 
proc print data=leo.cal_post_2016_for_3_wom; run; 
/* We then compute the alignment rates for marital status, first among men.*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=1 & (period=52) & (100>agegroup_ext>15)) ;
table ch07*agegroup_ext / noprint outpct out=marital_status_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=1 & (period=53)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=1 & (period=54)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=1 & (period=55)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=1 & (period=56)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=1 & (period=57)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=1 & (period=58)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=1 & (period=59)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=1 & (period=60)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=1 & (period=61)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=1 & (period=62)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=1 & (period=63)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=1 & (period=64)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=1 & (period=65)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=1 & (period=66)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=1 & (period=67)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=1 & (period=68)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=1 & (period=69)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=1 & (period=70)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_70; 
run; 
data marital_status_52; set marital_status_52; period=54; percent_col=pct_col/100; run; 
data marital_status_53; set marital_status_53; period=55; percent_col=pct_col/100; run; 
data marital_status_54; set marital_status_54; period=56; percent_col=pct_col/100; run; 
data marital_status_55; set marital_status_55; period=57; percent_col=pct_col/100; run; 
data marital_status_56; set marital_status_56; period=58; percent_col=pct_col/100; run; 
data marital_status_57; set marital_status_57; period=59; percent_col=pct_col/100; run; 
data marital_status_58; set marital_status_58; period=60; percent_col=pct_col/100; run; 
data marital_status_59; set marital_status_59; period=61; percent_col=pct_col/100; run; 
data marital_status_60; set marital_status_60; period=62; percent_col=pct_col/100; run; 
data marital_status_61; set marital_status_61; period=63; percent_col=pct_col/100; run; 
data marital_status_62; set marital_status_62; period=64; percent_col=pct_col/100; run; 
data marital_status_63; set marital_status_63; period=65; percent_col=pct_col/100; run; 
data marital_status_64; set marital_status_64; period=66; percent_col=pct_col/100; run; 
data marital_status_65; set marital_status_65; period=67; percent_col=pct_col/100; run; 
data marital_status_66; set marital_status_66; period=68; percent_col=pct_col/100; run; 
data marital_status_67; set marital_status_67; period=69; percent_col=pct_col/100; run; 
data marital_status_68; set marital_status_68; period=70; percent_col=pct_col/100; run; 
data marital_status_69; set marital_status_69; period=71; percent_col=pct_col/100; run;
data marital_status_70; set marital_status_70; period=72; percent_col=pct_col/100; run;

data marital_status_52; set marital_status_52; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_53; set marital_status_53; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_54; set marital_status_54; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_55; set marital_status_55; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_56; set marital_status_56; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_57; set marital_status_57; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_58; set marital_status_58; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_59; set marital_status_59; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_60; set marital_status_60; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_61; set marital_status_61; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_62; set marital_status_62; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_63; set marital_status_63; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_64; set marital_status_64; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_65; set marital_status_65; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_66; set marital_status_66; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_67; set marital_status_67; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_68; set marital_status_68; keep percent_col agegroup_ext ch07 period; run;  
data marital_status_69; set marital_status_69; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_70; set marital_status_70; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_base_men; 
set marital_status_52-marital_status_70; 
run; 


data mar_stat_1_men;
set marital_status_base_men (where=(ch07=1));
run; 

data mar_stat_2_men;
set marital_status_base_men (where=(ch07=2));
run; 
data mar_stat_3_men;
set marital_status_base_men (where=(ch07=3));
run; 

data mar_stat_4_men;
set marital_status_base_men (where=(ch07=4));
run; 

data mar_stat_5_men;
set marital_status_base_men (where=(ch07=5));
run; 

proc sort data=mar_stat_1_men; 
by agegroup_ext; 
run; 
proc sort data=mar_stat_2_men; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_3_men; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_4_men; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_5_men; 
by agegroup_ext; 
run; 
 
 
proc transpose data=mar_stat_1_men out=transp_mar_stat_1_men; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_1_men; 
set transp_mar_stat_1_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_1_men; 
set transp_mar_stat_1_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_1_men; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_1_men; 
run; 
%m_zero(leo.cal_post_2016_mar_stat_1_men); 
proc print data=leo.cal_post_2016_mar_stat_1_men; run; 
proc export data=leo.cal_post_2016_mar_stat_1_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_1_men.csv' 
dbms=csv replace; 
run; 


proc sort data=mar_stat_2_men; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_3_men; 
by agegroup_ext; 
run; 
 
 
proc transpose data=mar_stat_2_men out=transp_mar_stat_2_men; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_2_men; 
set transp_mar_stat_2_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_2_men; 
set transp_mar_stat_2_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_2_men; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_2_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_2_men); 
proc export data=leo.cal_post_2016_mar_stat_2_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_2_men.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=mar_stat_3_men out=transp_mar_stat_3_men; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_3_men; 
set transp_mar_stat_3_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_3_men; 
set transp_mar_stat_3_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_3_men; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_3_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_3_men); 
proc export data=leo.cal_post_2016_mar_stat_3_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_3_men.csv' 
dbms=csv replace; 
run; 

proc transpose data=mar_stat_4_men out=transp_mar_stat_4_men; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_4_men; 
set transp_mar_stat_4_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_4_men; 
set transp_mar_stat_4_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_4_men; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_4_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_4_men); 
proc export data=leo.cal_post_2016_mar_stat_4_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_4_men.csv' 
dbms=csv replace; 
run; 
 
proc transpose data=mar_stat_5_men out=transp_mar_stat_5_men; 
by agegroup_ext;
id period ;
run;
data transp_mar_stat_5_men; 
set transp_mar_stat_5_men (where= (_NAME_="percent_col")); 
RUN; 

data transp_mar_stat_5_men; 
set transp_mar_stat_5_men; 
drop _name_ _label_ ; 
RUN; 

data leo.cal_post_2016_mar_stat_5_men; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_5_men;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_5_men); 
proc export data=leo.cal_post_2016_mar_stat_5_men
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_5_men.csv' 
dbms=csv replace; 
run; 
/* Now we compute the marital status alignment ratios among women.*/
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=2 & (period=52) & (100>agegroup_ext>15)) ;
table ch07*agegroup_ext / noprint outpct out=marital_status_52; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=2 & (period=53)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_53; 
run; 
proc freq data=leo.eph_formatted_2016; 
weight pondera; 
where (  ch04=2 & (period=54)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_54; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=2 & (period=55)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_55; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=2 & (period=56)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_56; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=2 & (period=57)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_57; 
run; 
proc freq data=leo.eph_formatted_2017; 
weight pondera; 
where (  ch04=2 & (period=58)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_58; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=2 & (period=59)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_59; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=2 & (period=60)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_60; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=2 & (period=61)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_61; 
run; 
proc freq data=leo.eph_formatted_2018; 
weight pondera; 
where (  ch04=2 & (period=62)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_62; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=2 & (period=63)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_63; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=2 & (period=64)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_64; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=2 & (period=65)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_65; 
run; 
proc freq data=leo.eph_formatted_2019; 
weight pondera; 
where (  ch04=2 & (period=66)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_66; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=2 & (period=67)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_67; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=2 & (period=68)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_68; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=2 & (period=69)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_69; 
run; 
proc freq data=leo.eph_formatted_2020; 
weight pondera; 
where (  ch04=2 & (period=70)& (100>agegroup_ext>15));
table ch07*agegroup_ext / noprint outpct out=marital_status_70; 
run; 
data marital_status_52; set marital_status_52; period=54; percent_col=pct_col/100; run; 
data marital_status_53; set marital_status_53; period=55; percent_col=pct_col/100; run; 
data marital_status_54; set marital_status_54; period=56; percent_col=pct_col/100; run; 
data marital_status_55; set marital_status_55; period=57; percent_col=pct_col/100; run; 
data marital_status_56; set marital_status_56; period=58; percent_col=pct_col/100; run; 
data marital_status_57; set marital_status_57; period=59; percent_col=pct_col/100; run; 
data marital_status_58; set marital_status_58; period=60; percent_col=pct_col/100; run; 
data marital_status_59; set marital_status_59; period=61; percent_col=pct_col/100; run; 
data marital_status_60; set marital_status_60; period=62; percent_col=pct_col/100; run; 
data marital_status_61; set marital_status_61; period=63; percent_col=pct_col/100; run; 
data marital_status_62; set marital_status_62; period=64; percent_col=pct_col/100; run; 
data marital_status_63; set marital_status_63; period=65; percent_col=pct_col/100; run; 
data marital_status_64; set marital_status_64; period=66; percent_col=pct_col/100; run;  
data marital_status_65; set marital_status_65; period=67; percent_col=pct_col/100; run; 
data marital_status_66; set marital_status_66; period=68; percent_col=pct_col/100; run; 
data marital_status_67; set marital_status_67; period=69; percent_col=pct_col/100; run; 
data marital_status_68; set marital_status_68; period=70; percent_col=pct_col/100; run; 
data marital_status_69; set marital_status_69; period=71; percent_col=pct_col/100; run;
data marital_status_70; set marital_status_70; period=72; percent_col=pct_col/100; run;

data marital_status_52; set marital_status_52; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_53; set marital_status_53; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_54; set marital_status_54; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_55; set marital_status_55; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_56; set marital_status_56; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_57; set marital_status_57; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_58; set marital_status_58; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_59; set marital_status_59; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_60; set marital_status_60; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_61; set marital_status_61; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_62; set marital_status_62; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_63; set marital_status_63; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_64; set marital_status_64; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_65; set marital_status_65; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_66; set marital_status_66; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_67; set marital_status_67; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_68; set marital_status_68; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_69; set marital_status_69; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_70; set marital_status_70; keep percent_col agegroup_ext ch07 period; run; 
data marital_status_base_wom; 
set marital_status_52-marital_status_70;
run; 
data mar_stat_1_wom;
set marital_status_base_wom (where=(ch07=1));
run; 
data mar_stat_2_wom;
set marital_status_base_wom (where=(ch07=2));
run; 
data mar_stat_3_wom;
set marital_status_base_wom (where=(ch07=3));
run; 

data mar_stat_4_wom;
set marital_status_base_wom (where=(ch07=4));
run; 

data mar_stat_5_wom;
set marital_status_base_wom (where=(ch07=5));
run; 

proc sort data=mar_stat_1_wom; 
by agegroup_ext; 
run; 
proc sort data=mar_stat_2_wom; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_3_wom; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_4_wom; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_5_wom; 
by agegroup_ext; 
run; 
 
 
proc transpose data=mar_stat_1_wom out=transp_mar_stat_1_wom; 
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

data leo.cal_post_2016_mar_stat_1_wom; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_1_wom; 
run; 
%m_zero(leo.cal_post_2016_mar_stat_1_wom); 
proc export data=leo.cal_post_2016_mar_stat_1_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_1_wom.csv' 
dbms=csv replace; 
run; 


proc sort data=mar_stat_2_wom; 
by agegroup_ext; 
run; 
 
proc sort data=mar_stat_3_wom; 
by agegroup_ext; 
run; 
 
 
proc transpose data=mar_stat_2_wom out=transp_mar_stat_2_wom; 
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

data leo.cal_post_2016_mar_stat_2_wom; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_2_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_2_wom); 
proc export data=leo.cal_post_2016_mar_stat_2_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_2_wom.csv' 
dbms=csv replace; 
run; 

 
proc transpose data=mar_stat_3_wom out=transp_mar_stat_3_wom; 
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

data leo.cal_post_2016_mar_stat_3_wom; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_3_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_3_wom); 
proc export data=leo.cal_post_2016_mar_stat_3_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_3_wom.csv' 
dbms=csv replace; 
run; 
proc transpose data=mar_stat_4_wom out=transp_mar_stat_4_wom; 
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

data leo.cal_post_2016_mar_stat_4_wom; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_4_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_4_wom); 
proc export data=leo.cal_post_2016_mar_stat_4_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_4_wom.csv' 
dbms=csv replace; 
run; 
proc transpose data=mar_stat_5_wom out=transp_mar_stat_5_wom; 
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

data leo.cal_post_2016_mar_stat_5_wom; 
retain agegroup_ext _54 _55 _56 _57 _58 _59 _60 _61 _62 _63 _64 _65 _66 _67 _68 _69 _70 _71 _72;
set transp_mar_stat_5_wom;
 
run; 
%m_zero(leo.cal_post_2016_mar_stat_5_wom); 
proc export data=leo.cal_post_2016_mar_stat_5_wom
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases align liam2\cal_post_2016_mar_stat_5_wom.csv' 
dbms=csv replace; 
run; 
/*Finally, we format these alignment datasets so as to get them ready for backward simulations. We did not actually use post-2016 datasets
		as the starting point of backward simulations, but it is possible to do so with our model (after slight adjustments, the 
		formatting of pre and post-2016 datasets being slightly different as seen earlier in this file).*/

%cal_post_2016_backward(leo.cal_post_2016_stu_men,age);
%cal_post_2016_backward(leo.cal_post_2016_stu_wom,age);

%cal_post_2016_backward(leo.cal_post_2016_for_1_men,age);
%cal_post_2016_backward(leo.cal_post_2016_for_2_men,age);
%cal_post_2016_backward(leo.cal_post_2016_for_3_men,age);
%cal_post_2016_backward(leo.cal_post_2016_for_1_wom,age);
%cal_post_2016_backward(leo.cal_post_2016_for_2_wom,age);
%cal_post_2016_backward(leo.cal_post_2016_for_3_wom,age);


%cal_post_2016_backward(leo.cal_post_2016_mar_stat_1_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_2_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_3_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_4_men,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_5_men,agegroup);
 
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_1_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_2_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_3_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_4_wom,agegroup);
%cal_post_2016_backward(leo.cal_post_2016_mar_stat_5_wom,agegroup);



proc export data=leo.cal_post_2016_mar_stat_1_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_1_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_2_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_2_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_3_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_3_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_4_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_4_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_5_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_5_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_mar_stat_1_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_1_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_2_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_2_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_3_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_3_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_mar_stat_4_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_4_wom_b.csv' 
dbms=csv replace; 
run; 
proc export data=leo.cal_post_2016_mar_stat_5_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_mar_stat_5_wom_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_for_1_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_1_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_2_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_2_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_3_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_3_men_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_for_1_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_1_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_2_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_2_wom_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_for_3_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_for_3_wom_b.csv' 
dbms=csv replace; 
run; 


proc export data=leo.cal_post_2016_stu_men_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_stu_men_b.csv' 
dbms=csv replace; 
run; 

proc export data=leo.cal_post_2016_stu_wom_b
outfile='H:\Tout_LIAM2\bases_calage_liam2\bases backward align liam2\cal_post_2016_stu_wom_b.csv' 
dbms=csv replace; 
run; 

/****A last element we need is the structure coefficient to correct the RIPTE index by gender for the periods since the second quarter
		of 2016******/



%macro ITL_centiles_post_2016(indata,tvar,t);
data &indata.; 
set &indata.; 	
		ITL=p21+tot_p12;
run; 
proc univariate data=&indata. noprint;
where labour_market_state=1 & &tvar.=&t.;
   var ITL;
   output out=leo.formal_we_&t. pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
where labour_market_state=2 & &tvar.=&t.;
   var ITL;
   output out=leo.formal_ind_&t. pctlpts=2 98 pctlpre=cent; 
run;
proc univariate data=&indata. noprint;
where labour_market_state=3 & &tvar.=&t.;
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
where &tvar.=&t.; 
run; 
data &indata._&t.; 
merge &indata._&t. income_centiles_&t.; 
by labour_market_state; 
run; 
%mend; 
%macro mean_var_post_2016(indata,varname,lmsvar,periodname,period,gender); 
options nofmterr;

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
%ITL_centiles_post_2016(leo.eph_formatted_2016,period,52);
%mean_var_post_2016(leo.eph_formatted_2016_52,ITL,labour_market_state,period,52,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2016,period,53);
%mean_var_post_2016(leo.eph_formatted_2016_53,ITL,labour_market_state,period,53,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2016,period,54);
%mean_var_post_2016(leo.eph_formatted_2016_54,ITL,labour_market_state,period,54,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2017,period,55);
%mean_var_post_2016(leo.eph_formatted_2017_55,ITL,labour_market_state,period,55,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2017,period,56);
%mean_var_post_2016(leo.eph_formatted_2017_56,ITL,labour_market_state,period,56,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2017,period,57);
%mean_var_post_2016(leo.eph_formatted_2017_57,ITL,labour_market_state,period,57,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2017,period,58);
%mean_var_post_2016(leo.eph_formatted_2017_58,ITL,labour_market_state,period,58,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2018,period,59);
%mean_var_post_2016(leo.eph_formatted_2018_59,ITL,labour_market_state,period,59,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2018,period,60);
%mean_var_post_2016(leo.eph_formatted_2018_60,ITL,labour_market_state,period,60,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2018,period,61);
%mean_var_post_2016(leo.eph_formatted_2018_61,ITL,labour_market_state,period,61,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2018,period,62);
%mean_var_post_2016(leo.eph_formatted_2018_62,ITL,labour_market_state,period,62,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2019,period,63);
%mean_var_post_2016(leo.eph_formatted_2019_63,ITL,labour_market_state,period,63,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2019,period,64);
%mean_var_post_2016(leo.eph_formatted_2019_64,ITL,labour_market_state,period,64,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2019,period,65);
%mean_var_post_2016(leo.eph_formatted_2019_65,ITL,labour_market_state,period,65,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2019,period,66);
%mean_var_post_2016(leo.eph_formatted_2019_66,ITL,labour_market_state,period,66,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2020,period,67);
%mean_var_post_2016(leo.eph_formatted_2020_67,ITL,labour_market_state,period,67,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2020,period,68);
%mean_var_post_2016(leo.eph_formatted_2020_68,ITL,labour_market_state,period,68,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2020,period,69);
%mean_var_post_2016(leo.eph_formatted_2020_69,ITL,labour_market_state,period,69,ch04); 
%ITL_centiles_post_2016(leo.eph_formatted_2020,period,70);
%mean_var_post_2016(leo.eph_formatted_2020_70,ITL,labour_market_state,period,70,ch04); 
proc print data=leo.itl_mean_52; run; 
proc print data=leo.itl_mean_53; run; 
proc print data=leo.itl_mean_54; run; 
proc print data=leo.itl_mean_55; run; 
proc print data=leo.itl_mean_56; run; 
proc print data=leo.itl_mean_57; run; 
proc print data=leo.itl_mean_58; run; 
proc print data=leo.itl_mean_59; run; 
proc print data=leo.itl_mean_60; run; 
proc print data=leo.itl_mean_61; run; 
proc print data=leo.itl_mean_62; run; 
proc print data=leo.itl_mean_63; run; 
proc print data=leo.itl_mean_64; run; 
proc print data=leo.itl_mean_65; run; 
proc print data=leo.itl_mean_66; run;  
proc print data=leo.itl_mean_67; run; 
proc print data=leo.itl_mean_68; run; 
proc print data=leo.itl_mean_69; run; 
proc print data=leo.itl_mean_70; run; 
data leo.itl_mean_post_2016; 
set leo.itl_mean_52 - leo.itl_mean_70; 
		coefficient_men=mean_ITL_men/mean_ITL_all; 
		coefficient_women=mean_ITL_women/mean_ITL_all; 
run; 
data leo.coeffs_ripte_post_2016; 
set leo.itl_mean_post_2016; 
keep coefficient_men coefficient_women period; 
run;
proc export data=leo.coeffs_ripte_post_2016
outfile='C:\Users\Leonardo\Documents\MISSAR_private\LIAM2_commented_code\globals\Structure_coefficients\structure_coefficients_post_2016.csv' 
dbms=csv replace; 
run; 
/****************Here, we export the proportions of active age men and women that are in a given labour-market state after 2016. This is to update 
		our labour-market state prospective scenarios. These values are then added to the excel files with historical proportions of men and women
		by labour-market state.*/
dm 'odsresults; clear'; 
dm 'clear log'; 
proc freq data=leo.eph_formatted_2020; table labour_market_state*ch04 /noprint outpct out=leo.lms_992; weight pondera; where 70>ageconti>15 & period=70; run; data leo.lms_992; set leo.lms_992; period2="2020_4"; run;
proc freq data=leo.eph_formatted_2020; table labour_market_state*ch04 /noprint outpct out=leo.lms_993; weight pondera; where 70>ageconti>15 & period=69; run; data leo.lms_993; set leo.lms_993; period2="2020_3"; run;
proc freq data=leo.eph_formatted_2020; table labour_market_state*ch04 /noprint outpct out=leo.lms_994; weight pondera; where 70>ageconti>15 & period=68; run; data leo.lms_994; set leo.lms_994; period2="2020_2"; run;
proc freq data=leo.eph_formatted_2020; table labour_market_state*ch04 /noprint outpct out=leo.lms_995; weight pondera; where 70>ageconti>15 & period=67; run; data leo.lms_995; set leo.lms_995; period2="2020_1"; run;
proc freq data=leo.eph_formatted_2019; table labour_market_state*ch04 /noprint outpct out=leo.lms_996; weight pondera; where 70>ageconti>15 & period=66; run; data leo.lms_996; set leo.lms_996; period2="2019_4"; run;
proc freq data=leo.eph_formatted_2019; table labour_market_state*ch04 /noprint outpct out=leo.lms_997; weight pondera; where 70>ageconti>15 & period=65; run; data leo.lms_997; set leo.lms_997; period2="2019_3"; run;
proc freq data=leo.eph_formatted_2019; table labour_market_state*ch04 /noprint outpct out=leo.lms_998; weight pondera; where 70>ageconti>15 & period=64; run; data leo.lms_998; set leo.lms_998; period2="2019_2"; run;
proc freq data=leo.eph_formatted_2019; table labour_market_state*ch04 /noprint outpct out=leo.lms_999; weight pondera; where 70>ageconti>15 & period=63; run; data leo.lms_999; set leo.lms_999; period2="2019_1"; run;
proc freq data=leo.eph_formatted_2018; table labour_market_state*ch04 /noprint outpct out=leo.lms_1000; weight pondera; where 70>ageconti>15 & period=62; run; data leo.lms_1000; set leo.lms_1000; period2="2018_4"; run;
proc freq data=leo.eph_formatted_2018; table labour_market_state*ch04 /noprint outpct out=leo.lms_1001; weight pondera; where 70>ageconti>15 & period=61; run; data leo.lms_1001; set leo.lms_1001; period2="2018_3"; run;
proc freq data=leo.eph_formatted_2018; table labour_market_state*ch04 /noprint outpct out=leo.lms_1002; weight pondera; where 70>ageconti>15 & period=60; run; data leo.lms_1002; set leo.lms_1002; period2="2018_2"; run;
proc freq data=leo.eph_formatted_2018; table labour_market_state*ch04 /noprint outpct out=leo.lms_1003; weight pondera; where 70>ageconti>15 & period=59; run; data leo.lms_1003; set leo.lms_1003; period2="2018_1"; run;
proc freq data=leo.eph_formatted_2017; table labour_market_state*ch04 /noprint outpct out=leo.lms_1004; weight pondera; where 70>ageconti>15 & period=58; run; data leo.lms_1004; set leo.lms_1004; period2="2017_4"; run;
proc freq data=leo.eph_formatted_2017; table labour_market_state*ch04 /noprint outpct out=leo.lms_1005; weight pondera; where 70>ageconti>15 & period=57; run; data leo.lms_1005; set leo.lms_1005; period2="2017_3"; run;
proc freq data=leo.eph_formatted_2017; table labour_market_state*ch04 /noprint outpct out=leo.lms_1006; weight pondera; where 70>ageconti>15 & period=56; run; data leo.lms_1006; set leo.lms_1006; period2="2017_2"; run;
proc freq data=leo.eph_formatted_2017; table labour_market_state*ch04 /noprint outpct out=leo.lms_1007; weight pondera; where 70>ageconti>15 & period=55; run; data leo.lms_1007; set leo.lms_1007; period2="2017_1"; run;
proc freq data=leo.eph_formatted_2016; table labour_market_state*ch04 /noprint outpct out=leo.lms_1008; weight pondera; where 70>ageconti>15 & period=54; run; data leo.lms_1008; set leo.lms_1008; period2="2016_4"; run;
proc freq data=leo.eph_formatted_2016; table labour_market_state*ch04 /noprint outpct out=leo.lms_1009; weight pondera; where 70>ageconti>15 & period=53; run; data leo.lms_1009; set leo.lms_1009; period2="2016_3"; run;
proc freq data=leo.eph_formatted_2016; table labour_market_state*ch04 /noprint outpct out=leo.lms_1010; weight pondera; where 70>ageconti>15 & period=52; run; data leo.lms_1010; set leo.lms_1010; period2="2016_2"; run;

data leo.hist_lms_post_2016; 
set leo.lms_992-leo.lms_1010; 
run; 

proc sort data=leo.hist_lms_post_2016; 
by period2; 
run; 

data wag_men; 
set leo.hist_lms_post_2016; 
where labour_market_state=1 & ch04=1;
rename pct_col=_1a; 
run; 
data ind_men; 
set leo.hist_lms_post_2016;
where labour_market_state=2 & ch04=1;
rename pct_col=_2a; 
run; 

data inf_men; 
set leo.hist_lms_post_2016;
where labour_market_state=3 & ch04=1;
rename pct_col=_3a; 
run; 

data une_men; 
set leo.hist_lms_post_2016;
where labour_market_state=4 & ch04=1;
rename pct_col=_4a; 
run; 

data ina_men; 
set leo.hist_lms_post_2016;
where labour_market_state=5 & ch04=1;
rename pct_col=_5a; 
run; 
proc sort data=wag_men; 
by period2; run; 
proc sort data=ind_men; 
by period2; run; 
proc sort data=inf_men; 
by period2; run; 
proc sort data=une_men; 
by period2; run; 
proc sort data=ina_men; 
by period2; run; 



data wag_wom; 
set leo.hist_lms_post_2016; 
where labour_market_state=1 & ch04=2;
rename pct_col=_1b; 
run; 
data ind_wom; 
set leo.hist_lms_post_2016;
where labour_market_state=2 & ch04=2;
rename pct_col=_2b; 
run; 

data inf_wom; 
set leo.hist_lms_post_2016;
where labour_market_state=3 & ch04=2;
rename pct_col=_3b; 
run; 

data une_wom; 
set leo.hist_lms_post_2016;
where labour_market_state=4 & ch04=2;
rename pct_col=_4b; 
run; 

data ina_wom; 
set leo.hist_lms_post_2016;
where labour_market_state=5 & ch04=2;
rename pct_col=_5b; 
run; 
proc sort data=wag_wom; 
by period2; run; 
proc sort data=ind_wom; 
by period2; run; 
proc sort data=inf_wom; 
by period2; run; 
proc sort data=une_wom; 
by period2; run; 
proc sort data=ina_wom; 
by period2; run; 

proc freq data=leo.eph_formatted_2016_2020; table labour_market_state*period /noprint outpct out=leo.lms_both_genders_post_2016; weight pondera; where 70>ageconti>15; run;
data leo.lms_both_genders_post_2016; 
set leo.lms_both_genders_post_2016; 
if period=70 then period2="2020_4"; 
if period=69 then period2="2020_3"; 
if period=68 then period2="2020_2"; 
if period=67 then period2="2020_1"; 
if period=66 then period2="2019_4"; 
if period=65 then period2="2019_3"; 
if period=64 then period2="2019_2"; 
if period=63 then period2="2019_1"; 
if period=62 then period2="2018_4"; 
if period=61 then period2="2018_3"; 
if period=60 then period2="2018_2"; 
if period=59 then period2="2018_1"; 
if period=58 then period2="2017_4"; 
if period=57 then period2="2017_3"; 
if period=56 then period2="2017_2"; 
if period=55 then period2="2017_1"; 
if period=54 then period2="2016_4"; 
if period=53 then period2="2016_3"; 
if period=52 then period2="2016_2"; 
run; 
proc sort data=leo.lms_both_genders_post_2016; 
by period2; 
run; 

data wag; 
set leo.lms_both_genders_post_2016; 
where labour_market_state=1;
rename pct_col=_1e; 
run; 
data ind; 
set leo.lms_both_genders_post_2016;
where labour_market_state=2;
rename pct_col=_2e; 
run; 

data inf; 
set leo.lms_both_genders_post_2016;
where labour_market_state=3;
rename pct_col=_3e; 
run; 

data une; 
set leo.lms_both_genders_post_2016;
where labour_market_state=4;
rename pct_col=_4e; 
run; 

data ina; 
set leo.lms_both_genders_post_2016;
where labour_market_state=5;
rename pct_col=_5e; 
run; 
proc sort data=wag; 
by period2; run; 
proc sort data=ind; 
by period2; run; 
proc sort data=inf; 
by period2; run; 
proc sort data=une; 
by period2; run; 
proc sort data=ina; 
by period2; run; 


data leo.post_2016_lms; 
merge wag_men ind_men inf_men une_men ina_men
 wag_wom ind_wom inf_wom une_wom ina_wom
wag ind inf une ina; 
by period2; 
rename period2=period; 
run; 

data leo.post_2016_lms; 
set leo.post_2016_lms; 
_1c=_1a/100; 
_2c=_2a/100; 
_3c=_3a/100; 
_4c=_4a/100; 
_5c=_5a/100; 
_1d=_1b/100; 
_2d=_2b/100; 
_3d=_3b/100; 
_4d=_4b/100; 
_5d=_5b/100; 
_1_all=_1e/100; 
_2_all=_2e/100; 
_3_all=_3e/100; 
_4_all=_4e/100; 
_5_all=_5e/100; 
if period="2020_4" then period2=184; 
if period="2020_3" then period2=183; 
if period="2020_2" then period2=182; 
if period="2020_1" then period2=181; 
if period="2019_4" then period2=180; 
if period="2019_3" then period2=179; 
if period="2019_2" then period2=178; 
if period="2019_1" then period2=177; 
if period="2018_4" then period2=176; 
if period="2018_3" then period2=175; 
if period="2018_2" then period2=174; 
if period="2018_1" then period2=173; 
if period="2017_4" then period2=172; 
if period="2017_3" then period2=171; 
if period="2017_2" then period2=170; 
if period="2017_1" then period2=169; 
if period="2016_4" then period2=168; 
if period="2016_3" then period2=167; 
if period="2016_2" then period2=166; 
if period="2016_1" then period2=165; 
if period="2015_4" then period2=164; 
if period="2015_3" then period2=163; 

if period="2015_2" then period2=162; 
if period="2015_1" then period2=161; 
if period="2014_4" then period2=160; 
if period="2014_3" then period2=159; 
if period="2014_2" then period2=158; 
if period="2014_1" then period2=157; 
if period="2013_4" then period2=156; 
if period="2013_3" then period2=155; 
if period="2013_2" then period2=154; 
if period="2013_1" then period2=153; 
if period="2012_4" then period2=152; 
if period="2012_3" then period2=151; 
if period="2012_2" then period2=150; 
if period="2012_1" then period2=149; 
if period="2011_4" then period2=148; 
if period="2011_3" then period2=147; 
if period="2011_2" then period2=146; 
if period="2011_1" then period2=145; 
if period="2010_4" then period2=144; 
if period="2010_3" then period2=143; 
if period="2010_2" then period2=142; 
if period="2010_1" then period2=141; 
if period="2009_4" then period2=140; 
if period="2009_3" then period2=139; 
if period="2009_2" then period2=138; 
if period="2009_1" then period2=137; 
if period="2008_4" then period2=136; 
if period="2008_3" then period2=135; 
if period="2008_2" then period2=134; 
if period="2008_1" then period2=133; 
if period="2007_4" then period2=132; 
if period="2007_3" then period2=131; 
if period="2007_2" then period2=130; 
if period="2007_1" then period2=129; 
if period="2006_4" then period2=128; 
if period="2006_3" then period2=127; 
if period="2006_2" then period2=126; 
if period="2006_1" then period2=125; 
if period="2005_4" then period2=124; 
if period="2005_3" then period2=123; 
if period="2005_2" then period2=122; 
if period="2005_1" then period2=121; 
if period="2004_4" then period2=120; 
if period="2004_3" then period2=119; 
if period="2004_2" then period2=118; 
if period="2004_1" then period2=117; 
if period="2003_4" then period2=116; 
if period="2003_3" then period2=115; 
if period="2003_2" then period2=114; 
if period="2003_1" then period2=113; 
if period="2002_4" then period2=112; 
if period="2002_3" then period2=111; 
if period="2002_2" then period2=110; 
if period="2002_1" then period2=109; 
if period="2001_4" then period2=108; 
if period="2001_3" then period2=107; 
if period="2001_2" then period2=106; 
if period="2001_1" then period2=105; 
if period="2000_4" then period2=104; 
if period="2000_3" then period2=103; 
if period="2000_2" then period2=102; 
if period="2000_1" then period2=101; 
if period="1999_4" then period2=100; 
if period="1999_3" then period2=99; 
if period="1999_2" then period2=98; 
if period="1999_1" then period2=97; 
if period="1998_4" then period2=96; 
if period="1998_3" then period2=95; 
if period="1998_2" then period2=94; 
if period="1998_1" then period2=93; 
if period="1997_4" then period2=92; 
if period="1997_3" then period2=91; 
if period="1997_2" then period2=90; 
if period="1997_1" then period2=89; 
if period="1996_4" then period2=88; 
if period="1996_3" then period2=87; 
if period="1996_2" then period2=86; 
if period="1996_1" then period2=85; 
if period="1995_4" then period2=84; 
if period="1995_3" then period2=83; 
if period="1995_2" then period2=82; 
if period="1995_1" then period2=81; 
if period="1994_4" then period2=80; 
if period="1994_3" then period2=79; 
if period="1994_2" then period2=78; 
if period="1994_1" then period2=77; 
if period="1993_4" then period2=76; 
if period="1993_3" then period2=75; 
if period="1993_2" then period2=74; 
if period="1993_1" then period2=73; 
if period="1992_4" then period2=72; 
if period="1992_3" then period2=71; 
if period="1992_2" then period2=70; 
if period="1992_1" then period2=69; 
if period="1991_4" then period2=68; 
if period="1991_3" then period2=67; 
if period="1991_2" then period2=66; 
if period="1991_1" then period2=65; 
if period="1990_4" then period2=64; 
if period="1990_3" then period2=63; 
if period="1990_2" then period2=62; 
if period="1990_1" then period2=61; 
if period="1989_4" then period2=60; 
if period="1989_3" then period2=59; 
if period="1989_2" then period2=58; 
if period="1989_1" then period2=57; 
if period="1988_4" then period2=56; 
if period="1988_3" then period2=55; 
if period="1988_2" then period2=54; 
if period="1988_1" then period2=53; 
if period="1987_4" then period2=52; 
if period="1987_3" then period2=51; 
if period="1987_2" then period2=50; 
if period="1987_1" then period2=49; 
if period="1986_4" then period2=48; 
if period="1986_3" then period2=47; 
if period="1986_2" then period2=46; 
if period="1986_1" then period2=45; 
if period="1985_4" then period2=44; 
if period="1985_3" then period2=43; 
if period="1985_2" then period2=42; 
if period="1985_1" then period2=41; 
if period="1984_4" then period2=40; 
if period="1984_3" then period2=39; 
if period="1984_2" then period2=38; 
if period="1984_1" then period2=37; 
if period="1983_4" then period2=36; 
if period="1983_3" then period2=35; 
if period="1983_2" then period2=34; 
if period="1983_1" then period2=33; 
if period="1982_4" then period2=32; 
if period="1982_3" then period2=31; 
if period="1982_2" then period2=30; 
if period="1982_1" then period2=29; 
if period="1981_4" then period2=28; 
if period="1981_3" then period2=27; 
if period="1981_2" then period2=26; 
if period="1981_1" then period2=25; 
if period="1980_4" then period2=24; 
if period="1980_3" then period2=23; 
if period="1980_2" then period2=22; 
if period="1980_1" then period2=21; 
if period="1979_4" then period2=20; 
if period="1979_3" then period2=19; 
if period="1979_2" then period2=18; 
if period="1979_1" then period2=17; 
if period="1978_4" then period2=16; 
if period="1978_3" then period2=15; 
if period="1978_2" then period2=14; 
if period="1978_1" then period2=13; 
if period="1977_4" then period2=12; 
if period="1977_3" then period2=11; 
if period="1977_2" then period2=10; 
if period="1977_1" then period2=9; 
if period="1976_4" then period2=8; 
if period="1976_3" then period2=7; 
if period="1976_2" then period2=6; 
if period="1976_1" then period2=5; 
if period="1975_4" then period2=4; 
if period="1975_3" then period2=3; 
if period="1975_2" then period2=2; 
if period="1975_1" then period2=1; 
if period="1974_4" then period2=0; 
run; 
data leo.post_2016_lms; 
set leo.post_2016_lms; 
drop ch04 labour_market_state pct_row pct_col count percent _1a _2a _3a _4a _5a  _1b _2b _3b _4b _5b _1e _2e _3e _4e _5e; run; 

data leo.post_2016_lms_men; 
retain period period2 _1c _2c _3c _4c _5c;
set leo.post_2016_lms; 
keep period period2 _1c _2c _3c _4c _5c;
run; 

data leo.post_2016_lms_wom; 
retain period period2 _1d _2d _3d _4d _5d;
set leo.post_2016_lms; 
keep period period2 _1d _2d _3d _4d _5d;
run; 

data leo.post_2016_lms_men_wom; 
retain period period2 _1_all _2_all _3_all _4_all _5_all;
set leo.post_2016_lms; 
keep period period2 _1_all _2_all _3_all _4_all _5_all;
run; 

proc export data=leo.post_2016_lms_men
outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\Excel_files_for_MISSAR\Prospective_scenarios\2014_q4_start\Historical_graphs_ages_16_69\Post_2016_men.csv' 
dbms=csv replace; 
run; 
proc export data=leo.post_2016_lms_wom
outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\Excel_files_for_MISSAR\Prospective_scenarios\2014_q4_start\Historical_graphs_ages_16_69\Post_2016_wom.csv' 
dbms=csv replace; 
run; 

proc export data=leo.post_2016_lms_men_wom
outfile='C:\Users\Leonardo\Documents\Git_MISSAR_model\MISSAR\Excel_files_for_MISSAR\Prospective_scenarios\2014_q4_start\Historical_graphs_ages_16_69\Post_2016_men_wom.csv' 
dbms=csv replace; 
run; 
