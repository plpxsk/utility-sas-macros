/******************************************************************************/
/* PROD PROGRAM:   merge.sas
/* WORK PROGRAM:   merge.sas
/* 
/* PURPOSE:
    macro to do simple data step merge of datasets d1 and d2 by (v)ariable
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  01/13/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* REQUIRED */
/* d1  = dataset 1 */
/* d2  = dataset 2 */
/* by  = by variable(s) */
/* out = output dataset */

/* OPTIONAL */
/* in  = ind1 or ind2 or ind1d2 */
%MACRO merge(d1,d2,by,out,in=0);
    options mprint;

    %sort(&D1, &BY, out=d1);
    %sort(&D2, &BY, out=d2);

    data &OUT;
        merge d1 (in=ind1) d2 (in=ind2);
        by &BY;

        %if &IN = ind1   %then %do;   if ind1;           %end;
        %if &IN = ind2   %then %do;   if ind2;           %end;
        %if &IN = ind1d2 %then %do;   if ind1 and ind2;  %end;
    run;
    
    options nomprint;
%MEND merge ;
