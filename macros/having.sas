/******************************************************************************/
/* PROD PROGRAM:   having.sas
/* WORK PROGRAM:   having.sas
/* 
/* PURPOSE:        select observations HAVING particular CONDITIONS from DSET

/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  06/02/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/


%MACRO HAVING(dset, conditions=, group=patid, out=out_having);
    options mprint;
        
    proc sql noprint; create table &OUT as
        select   *
        from     &DSET
        group by &GROUP                /* must precede <having> */
        having   &CONDITIONS
        order by &GROUP
        ;
    quit;
        
    options nomprint;
%MEND ;     
