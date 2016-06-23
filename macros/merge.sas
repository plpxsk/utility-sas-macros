/******************************************************************************/
/* PROD PROGRAM:   merge.sas
/* WORK PROGRAM:   merge.sas
/* 
/* PURPOSE:        macro to do simple data step merge of DSET1 and DSET2 
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

/* REQUIRED */
/* DSET1  = dataset 1 */
/* DSET2  = dataset 2 */
/* BY     = by variable(s) */
/* OUT    = output dataset */

/* OPTIONAL */
/* in  = in1 or in2 or inboth */
%MACRO merge(DSET1, DSET2, by, out, in=0);

    %sort(&DSET1, &BY, out=DSET1);
    %sort(&DSET2, &BY, out=DSET2);

    data &OUT;
        merge DSET1 (in=ind1) DSET2 (in=ind2);
        by &BY;

        %if &IN = in1    %then %do;   if ind1;           %end;
        %if &IN = in2    %then %do;   if ind2;           %end;
        %if &IN = inboth %then %do;   if ind1 and ind2;  %end;
    run;

%MEND merge ;
