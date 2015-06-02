/******************************************************************************/
/* PROD PROGRAM:   sort.sas
/* WORK PROGRAM:   sort.sas
/* 
/* PURPOSE:        macro to do simple proc sort by (v)ariable in a (d)ataset
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

/* d = dataset*/
/* v = variable(s) */
%MACRO SORT(d, v);
    options mprint;
    
    proc sort data = &D;
        by &V;
    run;

    options nomprint;
%MEND;    
