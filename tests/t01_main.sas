/******************************************************************************/
/* PROD PROGRAM:   /home/actg/A5298/sasmacros/_tests.sas
/* WORK PROGRAM:   /home/actg/A5298/sasmacros/_tests.sas
/* 
/* PURPOSE:        testing program for the short macros
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  01/09/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: tests the following macros (programs)
    count.sas
    print.sas
    printobs.sas
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/
data off;
    set frozen.f1601;
run;



title1 ""; 
title4 "================================================================================"; 
title5 "#########################   COUNTER  ####################"; 
title6 "================================================================================"; 
%count(off);

title1 ""; 
title4 "================================================================================"; 
title5 "#########################   PRINT  ####################"; 
title6 "================================================================================"; 
%print(off, v=patid offstdt crfdt);

title1 ""; 
title4 "================================================================================"; 
title5 "#########################   PRINTOBS  ####################"; 
title6 "================================================================================"; 
%printobs(off, v=offstdt);
