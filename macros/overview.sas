/******************************************************************************/
/* PROD PROGRAM:   overview.sas
/* WORK PROGRAM:   overview.sas
/* 
/* PURPOSE:
    runs all of the following on a (d)ataset:
    %contents,
    %freqmeans[CBAR]
    %count
    %print(n=40)
        separated by %blank

/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  05/06/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/
   
/* d = dataset */

/* OPTIONAL*/
/* n = number of observations (default = 40)*/
/* c = which variable to pass to %count()*/
/* printobs = instead of print, do printobs? 0 = no, 1 = yes*/
%MACRO overview(d,n=40,printobs=0,c=patid);
    options mprint;
    
    title "";
    title2 "";
    title5 "XX##### #######   (1/3) CONTENTS      ####### ####### ####### #######";
    %blank();
    
    %contents(&D);

    title "";
    title2 "";
    title5 "XX##### #######   (2/3) FREQMEANS      ####### ####### ####### #######";
    %blank();
    
    %freqmeans(&D);

    title "";
    title2 "";
    title5 "XX##### #######   (3/3) COUNT + PRINT(OBS)      ####### ####### ####### #######";
    %blank();
    
    %count(&D,v=&C);
    %if &PRINTOBS=0 %then %do;
        %print(&D, n=&N) ;
        %end;
    %if &PRINTOBS=1 %then %do;
        %printobs(&D,n=&N);
        %end;

    options nomprint;
%MEND ;    
