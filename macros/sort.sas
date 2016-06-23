/******************************************************************************/
/* PROD PROGRAM:   sort.sas
/* WORK PROGRAM:   sort.sas
/* 
/* PURPOSE:        macro to do simple proc sort on DSET
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  01/13/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

%MACRO SORT(dset, by, out=0);
    
    proc sort data = &DSET
        %if &OUT ne 0 %then %do;
        out=&OUT;
        %end;
        ;

        by &BY;
    run;

%MEND;    
