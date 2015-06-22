/******************************************************************************/
/* PROD PROGRAM:   count.sas
/* WORK PROGRAM:   count.sas
/* 
/* PURPOSE:
    macro to count unique and total observations (default: v=patid) in
    a (d)ataset
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
/* NOTES:          
/* MODIFICATIONS:
/******************************************************************************/


/* d = dataset */

/* OPTIONAL */
/* v = variable to count */
%MACRO COUNT(d, v=patid);

    proc sql; select
        count(unique(&V)) as N_unique_&V, count(&V) as N_total_&V
        from &D
        ;
    quit;

%MEND ; 



