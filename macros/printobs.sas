/******************************************************************************/
/* PROD PROGRAM:   printobs.sas
/* WORK PROGRAM:   printobs.sas
/* 
/* PURPOSE:        
    macro to run proc print with <by patid; id patid;> on a (d)ataset
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


/* d = dataset*/

/* OPTIONAL */
/* v = print only these variables*/
/* n = number obs outputted*/
/* ETC = additional statement, eg to format a variable  */
%MACRO PRINTOBS(d,v="", n=100, etc="");

    proc print data = &D (obs = &N);
        by patid;   id patid;
        
        %if &v ne "" %then %do; 
            var &v; 
            %end;

        %if &etc ne "" %then %do;
            &etc. ;
            %end;
    run;

%MEND ;      

