/******************************************************************************/
/* PROD PROGRAM:   overview.sas
/* WORK PROGRAM:   overview.sas
/* 
/* PURPOSE:        runs all of the following on &DSET
                    %count
                    %contents,
                    %freqmeans[CBAR]
                    %print(n=40)
                        all of these separated by %blank

/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  05/06/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/
   
/* dset = dataset */

/* OPTIONAL*/
/* n = number of observations (default = 40)*/
/* c = which variable to pass to %count()*/
/* printobs = instead of print, do printobs? 0 = no, 1 = yes*/
%MACRO overview(d,n=40,printobs=0,c=patid);
    
    title "";
    title2 "";
    title5 "XX##### #######   (1/3) COUNT + CONTENTS      ####### ####### ####### #######";
    %blank();
    
    %count(&DSET,v=&C);
    %contents(&DSET);

    title "";
    title2 "";
    title5 "XX##### #######   (2/3) FREQMEANS      ####### ####### ####### #######";
    %blank();
    
    %freqmeans(&DSET);

    title "";
    title2 "";
    title5 "XX##### #######   (3/3) PRINT(OBS)      ####### ####### ####### #######";
    %blank();
    
    %if &PRINTOBS=0 %then %do;
        %print(&DSET, n=&N) ;
        %end;
    %if &PRINTOBS=1 %then %do;
        %printobs(&DSET,n=&N);
        %end;

%MEND ;    
