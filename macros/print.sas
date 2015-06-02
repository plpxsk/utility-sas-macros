/******************************************************************************/
/* PROD PROGRAM:   print.sas
/* WORK PROGRAM:   print.sas
/* 
/* PURPOSE:
    macro to do simple proc print of a (d)ataset
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  12/17/14
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/
   
/* d = dataset*/

/* OPTIONAL */
/* n = number of observations */
/* v = print only these variables*/
%MACRO PRINT(d,v="",n=all);
    options mprint;

    proc print data = &D
        %if &N^=all %then (obs=&N);
        ;
        %if &v ne "" %then %do; 
            var &v; 
            %end; 
    run;

    options nomprint;
%MEND ; 
