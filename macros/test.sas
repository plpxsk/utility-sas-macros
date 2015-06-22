/******************************************************************************/
/* PROD PROGRAM:   test.sas
/* WORK PROGRAM:   test.sas
/* 
/* PURPOSE:
    macro that runs [condition] when [v]ariable is equal to 1
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  06/11/2015
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* REQUIRED */
/* v         = test variable for which &v = 1 is a go-ahead to run condition */
/* condition = evaluted when &v = 1. enclose in %str() as needed */
%macro test(v, condition);

    %if &V = 1 %then %do ;
        &CONDITION;
        %end;

%mend test ;
