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

/* d1  = dataset 1 */
/* d2  = dataset 2 */
/* by  = by variable(s) */
/* out = output dataset */
%MACRO merge(d1,d2,by,out);
    options mprint;

    %sort(&D1, &BY, out=d1);
    %sort(&D2, &BY, out=d2);

    data &OUT;
        merge d1 d2;
        by &BY;
    run;

    options nomprint;
%MEND merge ;
