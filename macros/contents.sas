/******************************************************************************/
/* PROD PROGRAM:   contents.sas
/* WORK PROGRAM:   contents.sas
/* 
/* PURPOSE:        macro to run proc contents on a (d)ataset
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  04/15/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* d = dataset */
%MACRO CONTENTS(d);

    proc contents data = &D ;
    run;

%MEND ;     
