/******************************************************************************/
/* PROD PROGRAM:   printobs.sas
/* WORK PROGRAM:   printobs.sas
/* 
/* PURPOSE:        macro to run proc print with <by patid; id patid;> on DSET
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
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* OPTIONAL */
/* var = print only these variables*/
/* n = number obs outputted*/
/* ETC = additional statement, eg to format a variable  */
%MACRO PRINTOBS(dset,var="", n=100, etc="");

    proc print data = &DSET (obs = &N);
        by patid;   id patid;
        
        %if &VAR ne "" %then %do; 
            var &VAR; 
            %end;

        %if &ETC ne "" %then %do;
            &ETC. ;
            %end;
    run;

%MEND ;      

