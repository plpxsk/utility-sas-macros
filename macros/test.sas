/******************************************************************************/
/* PROD PROGRAM:   test.sas
/* WORK PROGRAM:   test.sas
/* 
/* PURPOSE:        macro that runs [condition] when [v]ariable is equal to 1
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
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
/* var       = test variable for which VAR = 1 is a go-ahead to run condition */
/* condition = evaluted when VAR = 1. enclose in %str() as needed */
%macro test(var, condition);

    %if &VAR = 1 %then %do ;
        &CONDITION;
        %end;

%mend test ;
