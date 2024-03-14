* Encoding: UTF-8.
*MICS 2006.
**Get household file for household head informations.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\hh.sav".
sort cases by HH1 HH2.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\hh.sav".

**Get household members file for women religion.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\hl.sav".
COMPUTE LN=HL1.
EXECUTE.
sort cases by HH1 HH2 LN.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\hl.sav".

**Get women file for women HIV knowlwdge information.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\wm.sav".
sort cases by HH1 HH2 LN.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\wm.sav".

**Merge women file with household file. 
MATCH FILES /FILE=*
  /FILE='F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\hh.sav'
  /RENAME (HC15 HC10D HC10B HC10F HC10E HC10C HC10H HC10G HC10A HH6 HH12 HH5D HH7A HH7 HC2 HH10 HH9 
    HC8 HC9C HC9F HC9E HC7A HC9B HC9A HC9D HH3 HH15 HH14 WS3 HC6 HC4 HC5 WS8 WS1 WS2 HH5M HH16 HC3 WS5 
    HC1A HH4 WS7 WS4 WS9 HH5Y = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 
    d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 
    d44) 
  /BY HH1 HH2
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 
    d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44.
EXECUTE.

**Remove unmatch observations.
filter off.
use all.
select if(not missing(WM1)).
execute.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\wm.sav".

**Merge women file with household members file.
MATCH FILES /FILE=*
  /FILE='F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\hl.sav'
  /RENAME (HC9J HC11BCB HC11BCG HC11BGB HC11BGG WS6B WS6G HC10D HC11BDB HC11BDG HH6 HC10B WS6_2A 
    HC10F WS6A HC11BBB HC11BBG HC10E HC15CA HH15 HC9H HC8 HC15IA HH16 HH5D HC11A HC11CCB HC11CCG HH7A 
    HH7 WS6Z HC15F HC15D HC15B HC15A HC7A HC11BFB HC11BFG HC15 helevel HC9G HC9A HC1C HC11BAB HC11BAG 
    HC15HB HC7 HC15HE WS6_2B WS9A HC15G WS6_1 hhweight WS9 HC15IE HC15HF HC15EA HC15IF HH3 WS7 HC15HA 
    WS6_2C WS6F WS6_2D HC3 HC4 HC5 WS1 WS2 HC9D HH5M melevel2 melevel HC10C HC15IB HC9E HC15HY HC15IY 
    HC15JY HC15CY HC15EY WS6_2Z WS6_3Z HH11 HC2 HC15EC HC15ED HC15CX HC15EX WS6X HC11BXB HC11BXG WS6_2X 
    WS6_3X WS4 HC15CB HC9B HC15HG HC11BEB HC11BEG HC11CAB HC11CAG HC9F HC1A HH10 HH9 HC10H HC15HC HC10G 
    WS6_2E HC15IG HC15HD HC11CBB HC11CBG WS6C Stratum HH7B HH4 HC9C WS3 WS8 HC15JB HH14 HH12 WS5 WS6_4 
    HC6 WS6D WS6_3B WS6_3D WS6_3C WS6_3E WS6_3A HC15CC HC15EB HC15JA HC15ID HC11D HC9I HC10A wlthind5 
    wlthscor HC15IC HH13 HH5Y = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 
    d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 
    d45 d46 d47 d48 d49 d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 d64 d65 d66 d67 d68 d69 
    d70 d71 d72 d73 d74 d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 
    d95 d96 d97 d98 d99 d100 d101 d102 d103 d104 d105 d106 d107 d108 d109 d110 d111 d112 d113 d114 d115 
    d116 d117 d118 d119 d120 d121 d122 d123 d124 d125 d126 d127 d128 d129 d130 d131 d132 d133 d134 d135 
    d136 d137 d138 d139 d140 d141 d142 d143 d144) 
  /BY HH1 HH2 LN
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 
    d25 d26 d27 d28 d29 d30 d31 d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 d48 d49 
    d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 d64 d65 d66 d67 d68 d69 d70 d71 d72 d73 d74 
    d75 d76 d77 d78 d79 d80 d81 d82 d83 d84 d85 d86 d87 d88 d89 d90 d91 d92 d93 d94 d95 d96 d97 d98 d99 
    d100 d101 d102 d103 d104 d105 d106 d107 d108 d109 d110 d111 d112 d113 d114 d115 d116 d117 d118 d119 
    d120 d121 d122 d123 d124 d125 d126 d127 d128 d129 d130 d131 d132 d133 d134 d135 d136 d137 d138 d139 
    d140 d141 d142 d143 d144.
EXECUTE.

**Remove unmatch observations.
filter off.
use all.
select if(not missing(WM2)).
execute.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh 2006 MICS_Datasets\wm.sav".

**Women Sample weight.
WEIGHT BY wmweight.

**Checking information with report Table TM.9.1:(page 147).

*Percentage who have heard of AIDS.
FREQUENCIES VARIABLES=HA1 
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE heard_HIV = 2.
EXECUTE.

IF  (HA1 = 1) heard_HIV=1. 
IF  (HA1 = 2) heard_HIV=2. 
IF  (HA1 = 9) heard_HIV=2. 
value label heard_HIV  1 "Yes" 2 "No".    
EXECUTE.

FREQUENCIES VARIABLES=heard_HIV
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Residence.
FREQUENCIES VARIABLES=HH6
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Area = 0.
EXECUTE.

IF  (HH6 = 1) Area=1. 
IF  (HH6 = 2) Area=2. 
IF  (HH6 = 3) Area=2. 
IF  (HH6 = 4) Area=2. 
IF  (HH6 = 5) Area=3. 
value label Area  1 "Rural" 2 "Urban" 3 "Tribal".    
EXECUTE.

CROSSTABS
  /TABLES=Area BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Division.
FREQUENCIES VARIABLES=HH7
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=HH7 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Age 10 years.
FREQUENCIES VARIABLES=WAGE
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=WAGE BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

COMPUTE women_age= 4.
EXECUTE.

IF  (WAGE = 1) women_age=1.
IF  (WAGE = 2) women_age=1. 
IF  (WAGE = 3) women_age=2. 
IF  (WAGE = 4) women_age=2. 
IF  (WAGE = 5) women_age=3. 
IF  (WAGE = 6) women_age=3. 
IF  (WAGE = 7) women_age=4. 
value label women_age 1 "15-24" 2 "25-34" 3 "35-44" 4 "44+".    
EXECUTE.

CROSSTABS
  /TABLES=women_age BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Education.
IF  (melevel= 9) melevel=1.
FREQUENCIES VARIABLES=melevel
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=melevel BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Current Marital STATUS.
FREQUENCIES VARIABLES=MA1
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (MA1 = 3) MA1=2.
value label MA1 1 "Married" 2 "Unmarried".
CROSSTABS
  /TABLES=MA1 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Weakth Status.
FREQUENCIES VARIABLES=wlthind5
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= wlthind5 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Religion.
FREQUENCIES VARIABLES=HC1A
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Religion = 2.
EXECUTE.

IF  (HC1A = 1) Religion=1. 
IF  (HC1A = 2) Religion=2. 
IF  (HC1A = 3) Religion=2. 
IF  (HC1A = 4) Religion=2. 
IF  (HC1A = 6) Religion=2. 
IF  (HC1A = 7) Religion=2. 
IF  (HC1A = 9) Religion=2. 
value label Religion 1 "Islam" 2 "Others".    
EXECUTE.

FREQUENCIES VARIABLES=Religion
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= Religion BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household education level.
FREQUENCIES VARIABLES=helevel2
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (helevel2= 0) helevel2=1. 
IF  (helevel2= 9) helevel2=1. 
CROSSTABS
  /TABLES= helevel2 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household sex.
FREQUENCIES VARIABLES=HHSEX
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= HHSEX BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*ethnicity.
FREQUENCIES VARIABLES=HC1C
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (HC1C= 1) ethnicity=1. 
IF  (HC1C= 2) ethnicity=2. 
IF  (HC1C= 3) ethnicity=2. 
IF  (HC1C= 4) ethnicity=2. 
IF  (HC1C= 5) ethnicity=2. 
IF  (HC1C= 6) ethnicity=2. 
IF  (HC1C= 7) ethnicity=2. 
IF  (HC1C= 9) ethnicity=2. 
value label ethnicity 1 "Bengali" 2 "Others".    

CROSSTABS
  /TABLES= ethnicity BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


**Checking information with report Table HA.1:(page 114).
***Knowledge about HIV transmission, misconceptions about HIV, and comprehensive knowledge about HIV transmission (women).


*Yes = Correct response.
*Can avoid HIV by having one uninfected partner.
FREQUENCIES VARIABLES=HA2
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE uninfected_partner = 0.
EXECUTE.

IF  (HA2 = 1) uninfected_partner=1. 
IF  (HA2 = 2) uninfected_partner=0. 
IF  (HA2 = 8) uninfected_partner=0. 
IF  (HA2 = 9) uninfected_partner=0. 
value label uninfected_partner  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=uninfected_partner
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV from mosquito bites.
FREQUENCIES VARIABLES=HA5
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE mosquito_bites = 0.
EXECUTE.

IF  (HA5 = 1) mosquito_bites =0. 
IF  (HA5 = 2) mosquito_bites =1. 
IF  (HA5 = 8) mosquito_bites =0. 
IF  (HA5 = 9) mosquito_bites =0. 
value label mosquito_bites  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=mosquito_bites 
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can avoid HIV by using a condom correctly every time.
FREQUENCIES VARIABLES=HA4
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE condom_correctly = 0.
EXECUTE.

IF  (HA4 = 1) condom_correctly =1. 
IF  (HA4 = 2) condom_correctly =0. 
IF  (HA4 = 8) condom_correctly =0. 
IF  (HA4 = 9) condom_correctly =0. 
value label condom_correctly 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=condom_correctly
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV by sharing food with a person who has HIV.
FREQUENCIES VARIABLES=HA7
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE sharing_food = 1.
EXECUTE.

IF  (HA7 = 1) sharing_food =1. 
IF  (HA7 = 2) sharing_food =0. 
IF  (HA7 = 8) sharing_food =1. 
IF  (HA7 = 9) sharing_food =1. 
value label sharing_food 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=sharing_food
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV through supernatural means.
FREQUENCIES VARIABLES=HA3
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE supernatural_means = 0.
EXECUTE.

IF  (HA3 = 1) supernatural_means =0. 
IF  (HA3 = 2) supernatural_means =1. 
IF  (HA3 = 8) supernatural_means =0. 
IF  (HA3 = 9) supernatural_means =0. 
value label supernatural_means 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=supernatural_means
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Healthy-looking person may have HIV.
FREQUENCIES VARIABLES=HA8
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Healthy_looking = 0.
EXECUTE.

IF  (HA8 = 1) Healthy_looking =1. 
IF  (HA8 = 2) Healthy_looking =0. 
IF  (HA8 = 8) Healthy_looking =0. 
IF  (HA8 = 9) Healthy_looking =0. 
value label Healthy_looking 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Healthy_looking
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

**Table HA.4: Knowledge of mother-to-child HIV transmission (women).
*HIV from mother to child during pregnancy.
FREQUENCIES VARIABLES=HA9A
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE pregnancy = 0.
EXECUTE.

IF  (HA9A = 1) pregnancy =1. 
IF  (HA9A = 2) pregnancy =0. 
IF  (HA9A = 8) pregnancy =0. 
IF  (HA9A = 9) pregnancy =0. 
value label pregnancy 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=pregnancy
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*HIV from mother to child during delivery.
FREQUENCIES VARIABLES=HA9B
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE delivery = 0.
EXECUTE.

IF  (HA9B = 1) delivery =1. 
IF  (HA9B = 2) delivery=0. 
IF  (HA9B = 8) delivery =0. 
IF  (HA9B = 9) delivery =0. 
value label delivery 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=delivery
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*HIV from mother to child through breastfeeding.
FREQUENCIES VARIABLES=HA9C
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE breastfeeding = 0.
EXECUTE.

IF  (HA9C = 1) breastfeeding =1. 
IF  (HA9C = 2) breastfeeding=0. 
IF  (HA9C = 8) breastfeeding =0. 
IF  (HA9C = 9) breastfeeding =0. 
value label breastfeeding 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=breastfeeding
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Can get AIDS by injection with needle already used by someon.
FREQUENCIES VARIABLES=HA7A
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE needle = 0.
EXECUTE.

IF  (HA7A = 1) needle =1. 
IF  (HA7A = 2) needle =0. 
IF  (HA7A = 8) needle =0. 
IF  (HA7A= 9) needle=0. 
value label needle 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=needle
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


**Filter out Unmarried women.
FILTER OFF. 
USE ALL. 
SELECT IF (MA1 =1). 
EXECUTE.

**Filter out who haven't heared HIV.
FILTER OFF. 
USE ALL. 
SELECT IF (heard_HIV = 1). 
EXECUTE.

FREQUENCIES VARIABLES=heard_HIV
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*sum correct response.
COMPUTE correct_response = uninfected_partner  + mosquito_bites + condom_correctly + sharing_food + supernatural_means + 
Healthy_looking + pregnancy + delivery + breastfeeding + needle.
EXECUTE.

FREQUENCIES VARIABLES=correct_response
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE Median
  /ORDER=ANALYSIS.

**Scoring by median split.
COMPUTE score = 2.
EXECUTE.

IF  (correct_response < 8) score = 1. 
IF  (correct_response >= 8) score =2. 
value label score 1 "Low" 2 "High".    
EXECUTE.

FREQUENCIES VARIABLES=score
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE Median
  /ORDER=ANALYSIS.


*Residence.
CROSSTABS
  /TABLES=Area BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Division.
CROSSTABS
  /TABLES=HH7 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Age 10 years.
CROSSTABS
  /TABLES= women_age BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Education.
CROSSTABS
  /TABLES=melevel BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Weakth Status.
CROSSTABS
  /TABLES= wlthind5 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Religion.
CROSSTABS
  /TABLES= Religion BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household education level.
CROSSTABS
  /TABLES= helevel2 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household sex.
CROSSTABS
  /TABLES= HHSEX BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*ethnicity.
CROSSTABS
  /TABLES= ethnicity BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*HH6 (2= RURAL) Division (8= Sylhet) women_age (4 = 45+) (welevel 0 = No).
*MA5 (2= No) windex5 (1= Poorest) MMA (0 = No).
*helevel) (3= Higher+) HHSEX (2= Female) ethnicity (2 = other) Religion (1 = Islam).

****Stepwise.
LOGISTIC REGRESSION VARIABLES score
  /METHOD=BSTEP(LR)  Area HH7 women_age melevel MA1 wlthind5 helevel2 HHSEX ethnicity Religion
   /SAVE=PRED
  /CONTRAST (Area)=Indicator (3)
    /CONTRAST (HH7)=Indicator (6)
      /CONTRAST (women_age)=Indicator (4)
        /CONTRAST (melevel)=Indicator (1)
          /CONTRAST (MA1)=Indicator (2)
            /CONTRAST (wlthind5)=Indicator (1)
                    /CONTRAST (helevel2)=Indicator (1)
                       /CONTRAST (HHSEX)=Indicator (2)
                         /CONTRAST (ethnicity)=Indicator (2)
                            /CONTRAST (Religion)=Indicator (2)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

WEIGHT OFF.
ROC PRE_1 BY score (2)
  /PLOT=CURVE(REFERENCE)
  /PRINT=SE COORDINATES
  /CRITERIA=CUTOFF(INCLUDE) TESTPOS(LARGE) DISTRIBUTION(FREE) CI(95)
  /MISSING=EXCLUDE.

* Encoding: UTF-8.
*MICS 2012.
**Get household file for household head informations.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\hh.sav".
sort cases by HH1 HH2.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\hh.sav".

**Get household members file for women religion.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\hl.sav".
COMPUTE LN=HL1.
EXECUTE.
sort cases by HH1 HH2 LN.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\hl.sav".

**Get women file for women HIV knowlwdge information.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\wm.sav".
sort cases by HH1 HH2 LN.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\wm.sav".

**Merge women file with household file. 
MATCH FILES /FILE=* 
  /FILE='F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\hh.sav' 
  /RENAME (HH6 wscore HH7A HH7 windex5r wscorer windex5u wscoreu windex5 = d0 d1 d2 d3 d4 d5 d6 d7 
    d8) 
  /BY HH1 HH2 
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8. 
EXECUTE.

**Remove unmatch observations.
filter off.
use all.
select if(not missing(WM1)).
execute.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\wm.sav".

**Merge women file with household members file.
MATCH FILES /FILE=* 
  /FILE='F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\hl.sav' 
  /RENAME (HH6 wscore HH5D HH7A HH7 helevel hhweight HH5M religion windex5r wscorer windex5u 
    wscoreu windex5 HH5Y = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14) 
  /BY HH1 HH2 LN 
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14. 
EXECUTE.

**Remove unmatch observations.
filter off.
use all.
select if(not missing(WM2)).
execute.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS 2012-13 SPSS Datasets\wm.sav".

**Women Sample weight.
WEIGHT BY wmweight.

**Checking information with report Table TM.9.1:(page 147).

*Percentage who have heard of AIDS.
FREQUENCIES VARIABLES=HA1 
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE heard_HIV = 2.
EXECUTE.

IF  (HA1 = 1) heard_HIV=1. 
IF  (HA1 = 2) heard_HIV=2. 
IF  (HA1 = 9) heard_HIV=2. 
value label heard_HIV  1 "Yes" 2 "No".    
EXECUTE.

FREQUENCIES VARIABLES=heard_HIV
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Residence.
FREQUENCIES VARIABLES=HH6
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=HH6 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Division.
FREQUENCIES VARIABLES=HH7
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Division= 0.
EXECUTE.

IF  (HH7 = 10) Division=1.
IF  (HH7 = 20) Division=2.
IF  (HH7 = 30) Division=3.
IF  (HH7 = 40) Division=4.
IF  (HH7 = 45) Division=5.
IF  (HH7 = 50) Division=6.
IF  (HH7 = 55) Division=7.
IF  (HH7 = 60) Division=8.
value label Division 1 "Barishal" 2 "Chattogram" 3 "Dhaka" 4 "Khulna" 5 "Mymenshing" 6 "Rajshahi" 7 "Rangpur" 8 "Sylhet".    
EXECUTE.


CROSSTABS
  /TABLES=Division BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Age 10 years.
FREQUENCIES VARIABLES=WAGE
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=WAGE BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

COMPUTE women_age= 4.
EXECUTE.

IF  (WAGE = 1) women_age=1.
IF  (WAGE = 2) women_age=1. 
IF  (WAGE = 3) women_age=2. 
IF  (WAGE = 4) women_age=2. 
IF  (WAGE = 5) women_age=3. 
IF  (WAGE = 6) women_age=3. 
IF  (WAGE = 7) women_age=4. 
value label women_age 1 "15-24" 2 "25-34" 3 "35-44" 4 "44+".    
EXECUTE.

CROSSTABS
  /TABLES=women_age BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Education.
IF  (welevel= 9) welevel=1.
FREQUENCIES VARIABLES=welevel
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=welevel BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Current Marital STATUS.
FREQUENCIES VARIABLES=MA1
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (MA1 = 3) MA1=2.
value label MA1 1 "Married" 2 "Unmarried".
CROSSTABS
  /TABLES=MA1 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Weakth Status.
FREQUENCIES VARIABLES=windex5
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= windex5 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Religion.
FREQUENCIES VARIABLES=religion
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (religion = 1) religion_cat=1. 
IF  (religion= 2) religion_cat=2. 
IF  (religion= 3) religion_cat=2. 
IF  (religion = 4) religion_cat=2. 
IF  (religion= 6) religion_cat=2. 
IF  (religion = 7) religion_cat=2. 
IF  (religion = 9) religion_cat=2. 
value label religion_cat 1 "Islam" 2 "Others".    
EXECUTE.

CROSSTABS
  /TABLES= religion_cat BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household education level.
FREQUENCIES VARIABLES=helevel
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (helevel= 9) helevel=0. 
CROSSTABS
  /TABLES= helevel BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household sex.
FREQUENCIES VARIABLES=HHSEX
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= HHSEX BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*ethnicity.
FREQUENCIES VARIABLES=ethnicity
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= ethnicity BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Mass Media access.

*Newspaper.
FREQUENCIES VARIABLES=MT2
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Newspaper = 0.
EXECUTE.

IF  (MT2 = 0) Newspaper=0. 
IF  (MT2 = 1) Newspaper=1. 
IF  (MT2 = 2) Newspaper=1. 
IF  (MT2 = 3) Newspaper=1. 
IF  (MT2 = 9) Newspaper=0. 
value label Newspaper  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Newspaper
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Radio.
FREQUENCIES VARIABLES=MT3
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Radio = 0.
EXECUTE.

IF  (MT3 = 0) Radio=0. 
IF  (MT3 = 1) Radio=1. 
IF  (MT3 = 2) Radio=1. 
IF  (MT3 = 3) Radio=1. 
IF  (MT3 = 9) Radio=0. 
value label Radio  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Radio
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*TV.
FREQUENCIES VARIABLES=MT4
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE TV = 0.
EXECUTE.

IF  (MT4 = 0) TV=0. 
IF  (MT4 = 1) TV=1. 
IF  (MT4 = 2) TV=1. 
IF  (MT4 = 3) TV=1. 
IF  (MT4 = 9) TV=0. 
value label TV  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=TV
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Mass Media.
COMPUTE MassMedia = Newspaper + Radio + TV.
EXECUTE.

FREQUENCIES VARIABLES=MassMedia
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE MMA = 0.
EXECUTE.

IF  (MassMedia = 0) MMA=0. 
IF  (MassMedia = 1) MMA=1. 
IF  (MassMedia = 2) MMA=1. 
IF  (MassMedia = 3) MMA=1. 
value label MMA  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=MMA
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= MMA BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.



**Checking information with report Table TM.9.1:(page 147).
***Knowledge about HIV transmission, misconceptions about HIV, and comprehensive knowledge about HIV transmission (women).


*Yes = Correct response.
*Can avoid HIV by having one uninfected partner.
FREQUENCIES VARIABLES=HA2
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE uninfected_partner = 0.
EXECUTE.

IF  (HA2 = 1) uninfected_partner=1. 
IF  (HA2 = 2) uninfected_partner=0. 
IF  (HA2 = 8) uninfected_partner=0. 
IF  (HA2 = 9) uninfected_partner=0. 
value label uninfected_partner  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=uninfected_partner
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV from mosquito bites.
FREQUENCIES VARIABLES=HA5
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE mosquito_bites = 0.
EXECUTE.

IF  (HA5 = 1) mosquito_bites =0. 
IF  (HA5 = 2) mosquito_bites =1. 
IF  (HA5 = 8) mosquito_bites =0. 
IF  (HA5 = 9) mosquito_bites =0. 
value label mosquito_bites  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=mosquito_bites 
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can avoid HIV by using a condom correctly every time.
FREQUENCIES VARIABLES=HA4
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE condom_correctly = 0.
EXECUTE.

IF  (HA4 = 1) condom_correctly =1. 
IF  (HA4 = 2) condom_correctly =0. 
IF  (HA4 = 8) condom_correctly =0. 
IF  (HA4 = 9) condom_correctly =0. 
value label condom_correctly 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=condom_correctly
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV by sharing food with a person who has HIV.
FREQUENCIES VARIABLES=HA6
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE sharing_food = 0.
EXECUTE.

IF  (HA6 = 1) sharing_food =0. 
IF  (HA6 = 2) sharing_food =1. 
IF  (HA6 = 8) sharing_food =0. 
IF  (HA6 = 9) sharing_food =0. 
value label sharing_food 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=sharing_food
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV through supernatural means.
FREQUENCIES VARIABLES=HA3
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE supernatural_means = 0.
EXECUTE.

IF  (HA3 = 1) supernatural_means =0. 
IF  (HA3 = 2) supernatural_means =1. 
IF  (HA3 = 8) supernatural_means =0. 
IF  (HA3 = 9) supernatural_means =0. 
value label supernatural_means 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=supernatural_means
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Healthy-looking person may have HIV.
FREQUENCIES VARIABLES=HA7
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Healthy_looking = 0.
EXECUTE.

IF  (HA7 = 1) Healthy_looking =1. 
IF  (HA7 = 2) Healthy_looking =0. 
IF  (HA7 = 8) Healthy_looking =0. 
IF  (HA7 = 9) Healthy_looking =0. 
value label Healthy_looking 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Healthy_looking
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

**Table TM.9.2: Knowledge of mother-to-child HIV transmission (women).
*HIV from mother to child during pregnancy.
FREQUENCIES VARIABLES=HA8A
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE pregnancy = 0.
EXECUTE.

IF  (HA8A = 1) pregnancy =1. 
IF  (HA8A = 2) pregnancy =0. 
IF  (HA8A = 8) pregnancy =0. 
IF  (HA8A = 9) pregnancy =0. 
value label pregnancy 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=pregnancy
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*HIV from mother to child during delivery.
FREQUENCIES VARIABLES=HA8B
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE delivery = 0.
EXECUTE.

IF  (HA8B = 1) delivery =1. 
IF  (HA8B = 2) delivery=0. 
IF  (HA8B = 8) delivery =0. 
IF  (HA8B = 9) delivery =0. 
value label delivery 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=delivery
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*HIV from mother to child through breastfeeding.
FREQUENCIES VARIABLES=HA8C
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE breastfeeding = 0.
EXECUTE.

IF  (HA8C = 1) breastfeeding =1. 
IF  (HA8C = 2) breastfeeding=0. 
IF  (HA8C = 8) breastfeeding =0. 
IF  (HA8C = 9) breastfeeding =0. 
value label breastfeeding 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=breastfeeding
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


**Filter out Unmarried women.
FILTER OFF. 
USE ALL. 
SELECT IF (MA1 =1). 
EXECUTE.

**Filter out who haven't heared HIV.
FILTER OFF. 
USE ALL. 
SELECT IF (heard_HIV = 1). 
EXECUTE.


*sum correct response.
COMPUTE correct_response = uninfected_partner  + mosquito_bites + condom_correctly + sharing_food + supernatural_means + 
Healthy_looking + pregnancy + delivery + breastfeeding.
EXECUTE.

FREQUENCIES VARIABLES=correct_response
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE Median
  /ORDER=ANALYSIS.

**Scoring by median split.
COMPUTE score = 2.
EXECUTE.

IF  (correct_response < 5) score = 1. 
IF  (correct_response >= 5) score =2. 
value label score 1 "Low" 2 "High".    
EXECUTE.

FREQUENCIES VARIABLES=score
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE Median
  /ORDER=ANALYSIS.


*Residence.
CROSSTABS
  /TABLES=HH6 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Division.
CROSSTABS
  /TABLES=Division BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Age 10 years.
CROSSTABS
  /TABLES= women_age BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Education.
CROSSTABS
  /TABLES=welevel BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Weakth Status.
CROSSTABS
  /TABLES= windex5 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Religion.
CROSSTABS
  /TABLES= religion_cat BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household education level.
CROSSTABS
  /TABLES= helevel BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household sex.
CROSSTABS
  /TABLES= HHSEX BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*ethnicity.
CROSSTABS
  /TABLES= ethnicity BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Mass Media.
CROSSTABS
  /TABLES= MMA BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*HH6 (2= RURAL) Division (8= Sylhet) women_age (4 = 45+) (welevel 0 = No).
*MA5 (2= No) windex5 (1= Poorest) MMA (0 = No).
*helevel) (3= Higher+) HHSEX (2= Female) ethnicity (2 = other) Religion (1 = Islam).

****Stepwise.
LOGISTIC REGRESSION VARIABLES score
  /METHOD=BSTEP(LR)  HH6 Division women_age welevel windex5 helevel HHSEX ethnicity religion_cat MMA
   /SAVE=PRED
  /CONTRAST (HH6)=Indicator (2)
    /CONTRAST (Division)=Indicator
      /CONTRAST (women_age)=Indicator (4)
        /CONTRAST (welevel)=Indicator (1)
            /CONTRAST (windex5)=Indicator (1)
                    /CONTRAST (helevel)=Indicator (1)
                       /CONTRAST (HHSEX)=Indicator (2)
                         /CONTRAST (ethnicity)=Indicator (2)
                            /CONTRAST (religion_cat)=Indicator (2)
                             /CONTRAST (MMA)=Indicator (0)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).

WEIGHT OFF.
ROC PRE_1 BY score (2)
  /PLOT=CURVE(REFERENCE)
  /PRINT=SE COORDINATES
  /CRITERIA=CUTOFF(INCLUDE) TESTPOS(LARGE) DISTRIBUTION(FREE) CI(95)
  /MISSING=EXCLUDE.




* Encoding: UTF-8.
*MICS 2019.
**Get household file for household head informations.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\hh.sav".
sort cases by HH1 HH2.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\hh.sav".

**Get household members file for women religion.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\hl.sav".
COMPUTE LN=HL1.
EXECUTE.
sort cases by HH1 HH2 LN.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\hl.sav".

**Get women file for women HIV knowlwdge information.
get file ="F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\wm.sav".
sort cases by HH1 HH2 LN.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\wm.sav".

**Merge women file with household file. 
MATCH FILES /FILE=* 
  /FILE='F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\hh.sav' 
  /RENAME (HH6 wscore HH7A HH7 ethnicity windex10 windex10r windex10u PSU windex5r wscorer stratum 
    HH4 windex5u wscoreu windex5 = d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15) 
  /BY HH1 HH2 
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15. 
EXECUTE.

**Remove unmatch observations.
filter off.
use all.
select if(not missing(WM1)).
execute.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasetswm.sav".

**Merge women file with household members file.
MATCH FILES /FILE=* 
  /FILE='F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\hl.sav' 
  /RENAME (HH6 wscore HH5D HH7A HH7 helevel ethnicity HINT hhweight HH5M windex10 windex10r 
    windex10u PSU windex5r wscorer stratum HH4 windex5u wscoreu windex5 HH5Y = d0 d1 d2 d3 d4 d5 d6 d7 
    d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21) 
  /BY HH1 HH2 LN 
  /DROP= d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21. 
EXECUTE.

**Remove unmatch observations.
filter off.
use all.
select if(not missing(WM2)).
execute.
save outfile = "F:\ResearchProject\Jamal Sir\Shumi\Bangladesh MICS6 SPSS Datasets\wm.sav".

**Women Sample weight.
WEIGHT BY wmweight.

**Checking information with report Table TM.9.1:(page 147).

*Percentage who have heard of AIDS.
FREQUENCIES VARIABLES=HA1 
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE heard_HIV = 2.
EXECUTE.

IF  (HA1 = 1) heard_HIV=1. 
IF  (HA1 = 2) heard_HIV=2. 
IF  (HA1 = 9) heard_HIV=2. 
value label heard_HIV  1 "Yes" 2 "No".    
EXECUTE.

FREQUENCIES VARIABLES=heard_HIV
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Residence.
FREQUENCIES VARIABLES=HH6
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=HH6 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Division.
FREQUENCIES VARIABLES=HH7
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Division= 0.
EXECUTE.

IF  (HH7 = 10) Division=1.
IF  (HH7 = 20) Division=2.
IF  (HH7 = 30) Division=3.
IF  (HH7 = 40) Division=4.
IF  (HH7 = 45) Division=5.
IF  (HH7 = 50) Division=6.
IF  (HH7 = 55) Division=7.
IF  (HH7 = 60) Division=8.
value label Division 1 "Barishal" 2 "Chattogram" 3 "Dhaka" 4 "Khulna" 5 "Mymenshing" 6 "Rajshahi" 7 "Rangpur" 8 "Sylhet".    
EXECUTE.

CROSSTABS
  /TABLES=Division BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Age 10 years.
FREQUENCIES VARIABLES=WAGE
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=WAGE BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

COMPUTE women_age= 4.
EXECUTE.

IF  (WAGE = 1) women_age=1.
IF  (WAGE = 2) women_age=1. 
IF  (WAGE = 3) women_age=2. 
IF  (WAGE = 4) women_age=2. 
IF  (WAGE = 5) women_age=3. 
IF  (WAGE = 6) women_age=3. 
IF  (WAGE = 7) women_age=4. 
value label women_age 1 "15-24" 2 "25-34" 3 "35-44" 4 "44+".    
EXECUTE.

CROSSTABS
  /TABLES=women_age BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Education.
FREQUENCIES VARIABLES=welevel
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES=welevel BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Current Marital STATUS.
FREQUENCIES VARIABLES=MA1
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (MA1 = 3) MA1=2.
value label MA1 1 "Married" 2 "Unmarried".
CROSSTABS
  /TABLES=MA1 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Weakth Status.
FREQUENCIES VARIABLES=windex5
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= windex5 BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Religion.
FREQUENCIES VARIABLES=HC1A
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= HC1A BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

COMPUTE Religion = 2.
EXECUTE.

IF  (HC1A = 1) Religion=1. 
IF  (HC1A = 2) Religion=2. 
IF  (HC1A = 3) Religion=2. 
IF  (HC1A = 4) Religion=2. 
IF  (HC1A = 6) Religion=2. 
IF  (HC1A = 7) Religion=2. 
IF  (HC1A = 9) Religion=2. 
value label Religion 1 "Islam" 2 "Others".    
EXECUTE.

FREQUENCIES VARIABLES=Religion
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= Religion BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Mass Media access.

*Newspaper.
FREQUENCIES VARIABLES=MT1
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Newspaper = 0.
EXECUTE.

IF  (MT1 = 0) Newspaper=0. 
IF  (MT1 = 1) Newspaper=1. 
IF  (MT1 = 2) Newspaper=1. 
IF  (MT1 = 3) Newspaper=1. 
IF  (MT1 = 9) Newspaper=0. 
value label Newspaper  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Newspaper
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Radio.
FREQUENCIES VARIABLES=MT2
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Radio = 0.
EXECUTE.

IF  (MT2 = 0) Radio=0. 
IF  (MT2 = 1) Radio=1. 
IF  (MT2 = 2) Radio=1. 
IF  (MT2 = 3) Radio=1. 
IF  (MT2 = 9) Radio=0. 
value label Radio  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Radio
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*TV.
FREQUENCIES VARIABLES=MT3
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE TV = 0.
EXECUTE.

IF  (MT3 = 0) TV=0. 
IF  (MT3 = 1) TV=1. 
IF  (MT3 = 2) TV=1. 
IF  (MT3 = 3) TV=1. 
IF  (MT3 = 9) TV=0. 
value label TV  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=TV
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Mass Media.
COMPUTE MassMedia = Newspaper + Radio + TV.
EXECUTE.

FREQUENCIES VARIABLES=MassMedia
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE MMA = 0.
EXECUTE.

IF  (MassMedia = 0) MMA=0. 
IF  (MassMedia = 1) MMA=1. 
IF  (MassMedia = 2) MMA=1. 
IF  (MassMedia = 3) MMA=1. 
value label MMA  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=MMA
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= MMA BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household education level.
FREQUENCIES VARIABLES=helevel
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

IF  (helevel= 9) helevel=0. 
CROSSTABS
  /TABLES= helevel BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household sex.
FREQUENCIES VARIABLES=HHSEX
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= HHSEX BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*ethnicity.
FREQUENCIES VARIABLES=ethnicity
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

CROSSTABS
  /TABLES= ethnicity BY heard_HIV
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

**Checking information with report Table TM.9.1:(page 147).
***Knowledge about HIV transmission, misconceptions about HIV, and comprehensive knowledge about HIV transmission (women).


*Yes = Correct response.
*Can avoid HIV by having one uninfected partner.
FREQUENCIES VARIABLES=HA2
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE uninfected_partner = 0.
EXECUTE.

IF  (HA2 = 1) uninfected_partner=1. 
IF  (HA2 = 2) uninfected_partner=0. 
IF  (HA2 = 8) uninfected_partner=0. 
IF  (HA2 = 9) uninfected_partner=0. 
value label uninfected_partner  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=uninfected_partner
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV from mosquito bites.
FREQUENCIES VARIABLES=HA3
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE mosquito_bites = 0.
EXECUTE.

IF  (HA3 = 1) mosquito_bites =0. 
IF  (HA3 = 2) mosquito_bites =1. 
IF  (HA3 = 8) mosquito_bites =0. 
IF  (HA3 = 9) mosquito_bites =0. 
value label mosquito_bites  1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=mosquito_bites 
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can avoid HIV by using a condom correctly every time.
FREQUENCIES VARIABLES=HA4
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE condom_correctly = 0.
EXECUTE.

IF  (HA4 = 1) condom_correctly =1. 
IF  (HA4 = 2) condom_correctly =0. 
IF  (HA4 = 8) condom_correctly =0. 
IF  (HA4 = 9) condom_correctly =0. 
value label condom_correctly 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=condom_correctly
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV by sharing food with a person who has HIV.
FREQUENCIES VARIABLES=HA5
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE sharing_food = 0.
EXECUTE.

IF  (HA5 = 1) sharing_food =0. 
IF  (HA5 = 2) sharing_food =1. 
IF  (HA5 = 8) sharing_food =0. 
IF  (HA5 = 9) sharing_food =0. 
value label sharing_food 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=sharing_food
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


*Can get HIV through supernatural means.
FREQUENCIES VARIABLES=HA6
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE supernatural_means = 0.
EXECUTE.

IF  (HA6 = 1) supernatural_means =0. 
IF  (HA6 = 2) supernatural_means =1. 
IF  (HA6 = 8) supernatural_means =0. 
IF  (HA6 = 9) supernatural_means =0. 
value label supernatural_means 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=supernatural_means
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Can get HIV through supernatural means.
FREQUENCIES VARIABLES=HA6
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE supernatural_means = 0.
EXECUTE.

IF  (HA6 = 1) supernatural_means =0. 
IF  (HA6 = 2) supernatural_means =1. 
IF  (HA6 = 8) supernatural_means =0. 
IF  (HA6 = 9) supernatural_means =0. 
value label supernatural_means 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=supernatural_means
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Healthy-looking person may have HIV.
FREQUENCIES VARIABLES=HA7
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE Healthy_looking = 0.
EXECUTE.

IF  (HA7 = 1) Healthy_looking =1. 
IF  (HA7 = 2) Healthy_looking =0. 
IF  (HA7 = 8) Healthy_looking =0. 
IF  (HA7 = 9) Healthy_looking =0. 
value label Healthy_looking 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=Healthy_looking
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

**Table TM.9.2: Knowledge of mother-to-child HIV transmission (women).
*HIV from mother to child during pregnancy.
FREQUENCIES VARIABLES=HA8A
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE pregnancy = 0.
EXECUTE.

IF  (HA8A = 1) pregnancy =1. 
IF  (HA8A = 2) pregnancy =0. 
IF  (HA8A = 8) pregnancy =0. 
IF  (HA8A = 9) pregnancy =0. 
value label pregnancy 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=pregnancy
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*HIV from mother to child during delivery.
FREQUENCIES VARIABLES=HA8B
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE delivery = 0.
EXECUTE.

IF  (HA8B = 1) delivery =1. 
IF  (HA8B = 2) delivery=0. 
IF  (HA8B = 8) delivery =0. 
IF  (HA8B = 9) delivery =0. 
value label delivery 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=delivery
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*HIV from mother to child through breastfeeding.
FREQUENCIES VARIABLES=HA8C
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE breastfeeding = 0.
EXECUTE.

IF  (HA8C = 1) breastfeeding =1. 
IF  (HA8C = 2) breastfeeding=0. 
IF  (HA8C = 8) breastfeeding =0. 
IF  (HA8C = 9) breastfeeding =0. 
value label breastfeeding 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=breastfeeding
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Aware of drugs used to reduce the risk of transmission to the baby.
FREQUENCIES VARIABLES=HA10
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

COMPUTE drugs = 0.
EXECUTE.

IF  (HA10 = 1) drugs =1. 
IF  (HA10 = 2) drugs =0. 
IF  (HA10 = 8) drugs =0. 
IF  (HA10 = 9) drugs =0. 
value label drugs 1 "Yes" 0 "No".    
EXECUTE.

FREQUENCIES VARIABLES=drugs
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.


**Filter out Unmarried women.
FILTER OFF. 
USE ALL. 
SELECT IF (MA1 =1). 
EXECUTE.

**Filter out who haven't heared HIV.
FILTER OFF. 
USE ALL. 
SELECT IF (heard_HIV = 1). 
EXECUTE.


*sum correct response.
COMPUTE correct_response = uninfected_partner  + mosquito_bites + condom_correctly + sharing_food + supernatural_means + 
Healthy_looking + pregnancy + delivery + breastfeeding + drugs.
EXECUTE.

FREQUENCIES VARIABLES=correct_response
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE Median
  /ORDER=ANALYSIS.

**Scoring by median split.
COMPUTE score = 2.
EXECUTE.

IF  (correct_response < 6) score = 1. 
IF  (correct_response >= 6) score =2. 
value label score 1 "Low" 2 "High".    
EXECUTE.


FREQUENCIES VARIABLES=score
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE Median
  /ORDER=ANALYSIS.


*Residence.
CROSSTABS
  /TABLES=HH6 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Division.
CROSSTABS
  /TABLES=Division BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Age 10 years.
CROSSTABS
  /TABLES= women_age BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Education.
CROSSTABS
  /TABLES=welevel BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*Ever Education. 
CROSSTABS
  /TABLES=ED4 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Weakth Status.
CROSSTABS
  /TABLES= windex5 BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Religion.
CROSSTABS
  /TABLES= Religion BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*Mass Media access.
CROSSTABS
  /TABLES= MMA BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*household education level.
CROSSTABS
  /TABLES= helevel BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*household sex.
CROSSTABS
  /TABLES= HHSEX BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.

*ethnicity.
CROSSTABS
  /TABLES= ethnicity BY score
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT ROW 
  /COUNT ROUND CELL.


*HH6 (2= RURAL) Division (8= Sylhet) women_age (4 = 45+) (welevel 0 = No).
*MA5 (2= No) windex5 (1= Poorest) MMA (0 = No).
*helevel) (3= Higher+) HHSEX (2= Female) ethnicity (2 = other) Religion (1 = Islam).

****Stepwise.
LOGISTIC REGRESSION VARIABLES score
  /METHOD=BSTEP(LR)  HH6 Division women_age welevel windex5 MMA helevel HHSEX ethnicity Religion
   /SAVE=PRED
  /CONTRAST (HH6)=Indicator (2)
    /CONTRAST (Division)=Indicator
      /CONTRAST (women_age)=Indicator (4)
        /CONTRAST (welevel)=Indicator (1)
            /CONTRAST (windex5)=Indicator (1)
                 /CONTRAST (MMA)=Indicator (0)
                    /CONTRAST (helevel)=Indicator (1)
                       /CONTRAST (HHSEX)=Indicator (2)
                         /CONTRAST (ethnicity)=Indicator (2)
                            /CONTRAST (Religion)=Indicator (1)
  /PRINT=GOODFIT CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


WEIGHT OFF.
ROC PRE_1 BY score (2)
  /PLOT=CURVE(REFERENCE)
  /PRINT=SE COORDINATES
  /CRITERIA=CUTOFF(INCLUDE) TESTPOS(LARGE) DISTRIBUTION(FREE) CI(95)
  /MISSING=EXCLUDE.













