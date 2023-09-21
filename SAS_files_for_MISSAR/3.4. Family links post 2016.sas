/*The Macro 1.2.b computes family links among all household members, but also shrinks the individual ids. Indeed, LIAM2 cannot handle
		ids that are too long, so we give respondents in each quarter that start at 0. This macro thus gives each individual's
		partner, mother and father id in its long (the concatenation of EPHc variables CODUSU, NRO_HOGAR and COMPONENTE) and short 
		versions. The datasets both_id are the conversion key that lets us shift from one format to the other. */
/*For the post-2016 EPH datasets, the macro is the same, only we work with character variables for individual ids. This is why 
		the macro is different. It still works the same as Macro 1.2.*/
 proc freq data=leo.eph_formatted_2021; 
 table period; 
 run; 
%family_links_and_id_post_2016(leo,eph_formatted_2016,2,long_id_2016_t2,both_id_2016_t2,short_id_2016_t2,52,53);
%family_links_and_id_post_2016(leo,eph_formatted_2016,3,long_id_2016_t3,both_id_2016_t3,short_id_2016_t3,53,54);
%family_links_and_id_post_2016(leo,eph_formatted_2016,4,long_id_2016_t4,both_id_2016_t4,short_id_2016_t4,54,55);
%family_links_and_id_post_2016(leo,eph_formatted_2017,1,long_id_2017_t1,both_id_2017_t1,short_id_2017_t1,55,56);
%family_links_and_id_post_2016(leo,eph_formatted_2017,2,long_id_2017_t2,both_id_2017_t2,short_id_2017_t2,56,57);
%family_links_and_id_post_2016(leo,eph_formatted_2017,3,long_id_2017_t3,both_id_2017_t3,short_id_2017_t3,57,58);
%family_links_and_id_post_2016(leo,eph_formatted_2017,4,long_id_2017_t4,both_id_2017_t4,short_id_2017_t4,58,59);
%family_links_and_id_post_2016(leo,eph_formatted_2018,1,long_id_2018_t1,both_id_2018_t1,short_id_2018_t1,59,60);
%family_links_and_id_post_2016(leo,eph_formatted_2018,2,long_id_2018_t2,both_id_2018_t2,short_id_2018_t2,60,61);
%family_links_and_id_post_2016(leo,eph_formatted_2018,3,long_id_2018_t3,both_id_2018_t3,short_id_2018_t3,61,62);
%family_links_and_id_post_2016(leo,eph_formatted_2018,4,long_id_2018_t4,both_id_2018_t4,short_id_2018_t4,62,63);
%family_links_and_id_post_2016(leo,eph_formatted_2019,1,long_id_2019_t1,both_id_2019_t1,short_id_2019_t1,63,64);
%family_links_and_id_post_2016(leo,eph_formatted_2019,2,long_id_2019_t2,both_id_2019_t2,short_id_2019_t2,64,65);
%family_links_and_id_post_2016(leo,eph_formatted_2019,3,long_id_2019_t3,both_id_2019_t3,short_id_2019_t3,65,66);
%family_links_and_id_post_2016(leo,eph_formatted_2019,4,long_id_2019_t4,both_id_2019_t4,short_id_2019_t4,66,67);
%family_links_and_id_post_2016(leo,eph_formatted_2020,1,long_id_2020_t1,both_id_2020_t1,short_id_2020_t1,67,68);
%family_links_and_id_post_2016(leo,eph_formatted_2020,2,long_id_2020_t2,both_id_2020_t2,short_id_2020_t2,68,69);
%family_links_and_id_post_2016(leo,eph_formatted_2020,3,long_id_2020_t3,both_id_2020_t3,short_id_2020_t3,69,70);
%family_links_and_id_post_2016(leo,eph_formatted_2020,4,long_id_2020_t4,both_id_2020_t4,short_id_2020_t4,70,71);
%family_links_and_id_post_2016(leo,eph_formatted_2021,1,long_id_2021_t1,both_id_2021_t1,short_id_2021_t1,71,72);
