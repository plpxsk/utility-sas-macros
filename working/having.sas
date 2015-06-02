/* USAGE */


/* WORK: */
/* %print(status); */
/* %print(status, v=patid); */

/* does NOT WORK: */
/* %print(status, patid); */


/* d = dataset   */
%MACRO HAVING(d, conditions=, g= patid, out=outx);
    options mprint;

    /* SELECT the good; those with exactly 3 good vaccines*/
    /* GROUP by patid, select conditions by patid */
    /* p. 5 of http://support.sas.com/resources/papers/proceedings12/252-2012.pdf */
    %let CONDITIONS = %str(sum(vacc1good) = 1 AND sum(vacc2good) = 1 AND sum(vacc3good) = 1);
    
    proc sql noprint; create table &OUT as
        select * from vacc1
        group by &G
        having &CONDITIONS
        order by &G
        ;
    quit;
        
    options nomprint;
%MEND ;     
