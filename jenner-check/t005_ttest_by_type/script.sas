/* Adapted from trikona-nagaraj/SAS-Programming-Project                          */
/* Source: "Analysis of GLH per Learner in the UK.sas" (analysis body)          */
/* The two external CSVs (6th-form + FE colleges) the author reads via          */
/* INFILE &Form6_path / &FE_data_path are replaced here by inline DATALINES of   */
/* the same 8-column shape documented in the repo README, so the author's        */
/* DATA-step import, SET merge, missing-value handling and derived variables run  */
/* self-contained. All INPUT statements, formulas and PROC steps are unchanged.   */

/* --- import both institution datasets (author's INFILE/INPUT logic, fed from */
/*     inline datalines in place of the two external CSVs) --- */
data work.sixthform;
    infile datalines dsd dlm=',' firstobs=2 missover;
    informat Institute_Type $18. Region $24.;
    input Institute_Type $ Region $
          Glh_year_1 learners_year_1
          Glh_year_2 learners_year_2
          Glh_year_3 learners_year_3;
    if Region = '' then delete;
    datalines;
Institute_Type,Region,Glh_year_1,learners_year_1,Glh_year_2,learners_year_2,Glh_year_3,learners_year_3
Sixth Form,East Midlands,1000000,880,1060000,925,1120000,970
Sixth Form,East of England,300000,1010,360000,1055,420000,1100
Sixth Form,London,2750000,1140,2810000,1185,2870000,1230
Sixth Form,North East,2050000,1270,,1315,2170000,1360
Sixth Form,North West,1350000,1400,1410000,1445,1470000,1490
Sixth Form,South East,650000,1530,710000,1575,770000,1620
Sixth Form,South West,3100000,1660,3160000,1705,3220000,1750
Sixth Form,West Midlands,2400000,1790,2460000,1835,2520000,1880
Sixth Form,Yorkshire and the Humber,1700000,1920,1760000,1965,1820000,2010
;
run;

data work.fedata;
    infile datalines dsd dlm=',' firstobs=2 missover;
    informat Institute_Type $18. Region $24.;
    input Institute_Type $ Region $
          Glh_year_1 learners_year_1
          Glh_year_2 learners_year_2
          Glh_year_3 learners_year_3;
    if Region = '' then delete;
    datalines;
Institute_Type,Region,Glh_year_1,learners_year_1,Glh_year_2,learners_year_2,Glh_year_3,learners_year_3
Further Education,East Midlands,2050000,1000,2110000,1045,2170000,1090
Further Education,East of England,1350000,1130,1410000,1175,1470000,1220
Further Education,London,650000,1260,710000,1305,770000,1350
Further Education,North East,3100000,1390,3160000,1435,3220000,1480
Further Education,North West,2400000,1520,2460000,1565,2520000,1610
Further Education,South East,1700000,1650,1760000,1695,1820000,1740
Further Education,South West,,1780,1060000,1825,1120000,1870
Further Education,West Midlands,300000,1910,360000,1955,420000,2000
Further Education,Yorkshire and the Humber,2750000,2040,2810000,2085,2870000,2130
;
run;

/* --- merge the two datasets (author's SET + LABEL) --- */
data work.merged;
    set work.sixthform work.fedata;
    label
        Institute_Type  = 'Type of Instiitute'
        Region          = 'Institute Region'
        Glh_year_1      = 'Year 1 Learning hours'
        learners_year_1 = 'Learners count Year 1'
        Glh_year_2      = 'Year 2 Learning hours'
        learners_year_2 = 'Learners count Year 2'
        Glh_year_3      = 'Year 3 Learning hours'
        learners_year_3 = 'Learners count Year 3';
run;

/* --- clean + derive (author's missing-value handling, per-learner ratios, */
/*     and Size classification, unchanged) --- */
data work.cleaned;
    set work.merged;

    if learners_year_1 = . AND learners_year_2 = . then delete;
        else if learners_year_2 = . AND learners_year_3 = . then delete;
        else if learners_year_3 = . AND learners_year_1 = . then delete;
    if learners_year_1 = . then learners_year_1 = ((learners_year_2 + learners_year_3)/2);
        else if learners_year_2 = . then learners_year_2 = ((learners_year_1 + learners_year_3)/2);
        else if learners_year_3 = . then learners_year_3 = ((learners_year_2 + learners_year_1)/2);

    if Glh_year_1 = . AND Glh_year_2 = . then delete;
        else if Glh_year_2 = . AND Glh_year_3 = . then delete;
        else if Glh_year_3 = . AND Glh_year_1 = . then delete;
    if Glh_year_1 = . then Glh_year_1 = ((Glh_year_2 + Glh_year_3)/2);
        else if Glh_year_2 = . then Glh_year_2 = ((Glh_year_1 + Glh_year_3)/2);
        else if Glh_year_3 = . then Glh_year_3 = ((Glh_year_2 + Glh_year_1)/2);

    Average_Glh_Hours = ((Glh_year_1 + Glh_year_2 + Glh_year_3)/3);
    Glh_per_learner_1 = (Glh_year_1 / learners_year_1);
    Glh_per_learner_2 = (Glh_year_2 / learners_year_2);
    Glh_per_learner_3 = (Glh_year_3 / learners_year_3);
    Total_Glh_per_learner = ((Glh_year_1 + Glh_year_2 + Glh_year_3)
                             / (learners_year_1 + learners_year_2 + learners_year_3));

    format Size $15.;
    label
        Average_Glh_Hours     = 'Average Glh Hours'
        Glh_per_learner_1     = 'GLH per Learner year 1'
        Glh_per_learner_2     = 'GLH per Learner year 2'
        Glh_per_learner_3     = 'GLH per Learner year 3'
        Total_Glh_per_learner = 'Overall GLH per Learner'
        Size                  = 'Size Of Institute';

    if Average_Glh_Hours > 3000000 then Size = 'Large';
        else if 2000000 <= Average_Glh_Hours < 3000000 then Size = 'Large-medium';
        else if 1000000 <= Average_Glh_Hours < 2000000 then Size = 'Medium';
        else if 500000  <= Average_Glh_Hours < 1000000 then Size = 'Small-medium';
        else if Average_Glh_Hours < 500000 then Size = 'Small';
run;

/* --- log transform (author's Modified dataset) --- */
data work.modified;
    set work.cleaned;
    log_Glh_per_learner = log(Total_Glh_per_learner);
run;

/* --- author's t-test comparing log GLH-per-learner across institution type --- */
title1 'Examining Effect of Institute_Type on glh/learner Through t-test';
title2 'Looking Into Means in Glh_per_learner variable';
proc means data=work.modified;
    class Institute_Type;
    var log_Glh_per_learner;
run;

title 'Performing t-test';
proc ttest data=work.modified;
    class Institute_Type;
    var log_Glh_per_learner;
run;
