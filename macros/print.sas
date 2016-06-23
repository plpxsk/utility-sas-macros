/******************************************************************************/
/* PROD PROGRAM:   print.sas
/* WORK PROGRAM:   print.sas
/* 
/* PURPOSE:        macro to do simple proc print of DSET
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  12/17/14
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/
   
/* OPTIONAL */
/* n = number of observations */
/* v = print only these variables*/
%MACRO PRINT(dset,v="",n=all);

    proc print data = &DSET
        %if &N^=all %then (obs=&N);
        ;
        %if &v ne "" %then %do; 
            var &v; 
            %end; 
    run;

%MEND ; 
