CREATE OR REPLACE FORCE VIEW "SAGA"."REDUCERI" ("ORDINE", "LUNA", "REDUCERE", "GESTIUNE") AS 
--2007
( select 200701 as ordine, 'Ianuarie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2007 )
group by gestiune )
union
( select 200702 as ordine,'Februarie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2007 )
group by gestiune )
union
( select 200703 as ordine,'Martie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2007 )
group by gestiune )
union
( select 200704 as ordine,'Aprilie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2007 )
group by gestiune )
union
( select 200705 as ordine,'Mai 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2007 )
group by gestiune )
union
( select 200706 as ordine,'Iunie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2007 )
group by gestiune )
union
( select 200707 as ordine,'Iulie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2007 )
group by gestiune )
union
( select 200708 as ordine,'August 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2007 )
group by gestiune )
union
( select 200709 as ordine,'Septembrie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2007 )
group by gestiune )
union
( select 200710 as ordine,'Octombrie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2007 )
group by gestiune )
union
( select 200711 as ordine,'Noiembrie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2007 )
group by gestiune )
union
( select 200712 as ordine,'Decembrie 2007' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2007 )
group by gestiune )
union
--2008
( select 200801 as ordine, 'Ianuarie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2008 )
group by gestiune )
union
( select 200802 as ordine,'Februarie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2008 )
group by gestiune )
union
( select 200803 as ordine,'Martie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2008 )
group by gestiune )
union
( select 200804 as ordine,'Aprilie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2008 )
group by gestiune )
union
( select 200805 as ordine,'Mai 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2008 )
group by gestiune )
union
( select 200806 as ordine,'Iunie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2008 )
group by gestiune )
union
( select 200807 as ordine,'Iulie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2008 )
group by gestiune )
union
( select 200808 as ordine,'August 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2008 )
group by gestiune )
union
( select 200809 as ordine,'Septembrie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2008 )
group by gestiune )
union
( select 200810 as ordine,'Octombrie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2008 )
group by gestiune )
union
( select 200811 as ordine,'Noiembrie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2008 )
group by gestiune )
union
( select 200812 as ordine,'Decembrie 2008' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2008 )
group by gestiune )
--2009
union
( select 200901 as ordine, 'Ianuarie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2009 )
group by gestiune )
union
( select 200902 as ordine,'Februarie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2009 )
group by gestiune )
union
( select 200903 as ordine,'Martie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2009 )
group by gestiune )
union
( select 200904 as ordine,'Aprilie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2009 )
group by gestiune )
union
( select 200905 as ordine,'Mai 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2009 )
group by gestiune )
union
( select 200906 as ordine,'Iunie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2009 )
group by gestiune )
union
( select 200907 as ordine,'Iulie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2009 )
group by gestiune )
union
( select 200908 as ordine,'August 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2009 )
group by gestiune )
union
( select 200909 as ordine,'Septembrie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2009 )
group by gestiune )
union
( select 200910 as ordine,'Octombrie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2009 )
group by gestiune )
union
( select 200911 as ordine,'Noiembrie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2009 )
group by gestiune )
union
( select 200912 as ordine,'Decembrie 2009' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2009 )
group by gestiune )
--2010
union
( select 201001 as ordine, 'Ianuarie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2010 )
group by gestiune )
union
( select 201002 as ordine,'Februarie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2010 )
group by gestiune )
union
( select 201003 as ordine,'Martie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2010 )
group by gestiune )
union
( select 201004 as ordine,'Aprilie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2010 )
group by gestiune )
union
( select 201005 as ordine,'Mai 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2010 )
group by gestiune )
union
( select 201006 as ordine,'Iunie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2010 )
group by gestiune )
union
( select 201007 as ordine,'Iulie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2010 )
group by gestiune )
union
( select 201008 as ordine,'August 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2010 )
group by gestiune )
union
( select 201009 as ordine,'Septembrie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2010 )
group by gestiune )
union
( select 201010 as ordine,'Octombrie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2010 )
group by gestiune )
union
( select 201011 as ordine,'Noiembrie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2010 )
group by gestiune )
union
( select 201012 as ordine,'Decembrie 2010' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2010 )
group by gestiune )
--2011
union
( select 201101 as ordine, 'Ianuarie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2011 )
group by gestiune )
union
( select 201102 as ordine,'Februarie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2011 )
group by gestiune )
union
( select 201103 as ordine,'Martie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2011 )
group by gestiune )
union
( select 201104 as ordine,'Aprilie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2011 )
group by gestiune )
union
( select 201105 as ordine,'Mai 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2011 )
group by gestiune )
union
( select 201106 as ordine,'Iunie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2011 )
group by gestiune )
union
( select 201107 as ordine,'Iulie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2011 )
group by gestiune )
union
( select 201108 as ordine,'August 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2011 )
group by gestiune )
union
( select 201109 as ordine,'Septembrie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2011 )
group by gestiune )
union
( select 201110 as ordine,'Octombrie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2011 )
group by gestiune )
union
( select 201111 as ordine,'Noiembrie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2011 )
group by gestiune )
union
( select 201112 as ordine,'Decembrie 2011' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2011 )
group by gestiune )
--2012
union
( select 201201 as ordine, 'Ianuarie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2012 )
group by gestiune )
union
( select 201202 as ordine,'Februarie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2012 )
group by gestiune )
union
( select 201203 as ordine,'Martie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2012 )
group by gestiune )
union
( select 201204 as ordine,'Aprilie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2012 )
group by gestiune )
union
( select 201205 as ordine,'Mai 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2012 )
group by gestiune )
union
( select 201206 as ordine,'Iunie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2012 )
group by gestiune )
union
( select 201207 as ordine,'Iulie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2012 )
group by gestiune )
union
( select 201208 as ordine,'August 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2012 )
group by gestiune )
union
( select 201209 as ordine,'Septembrie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2012 )
group by gestiune )
union
( select 201210 as ordine,'Octombrie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2012 )
group by gestiune )
union
( select 201211 as ordine,'Noiembrie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2012 )
group by gestiune )
union
( select 201212 as ordine,'Decembrie 2012' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2012 )
group by gestiune )
--2013
union
( select 201301 as ordine, 'Ianuarie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2013 )
group by gestiune )
union
( select 201302 as ordine,'Februarie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2013 )
group by gestiune )
union
( select 201303 as ordine,'Martie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2013 )
group by gestiune )
union
( select 201304 as ordine,'Aprilie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2013 )
group by gestiune )
union
( select 201305 as ordine,'Mai 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2013 )
group by gestiune )
union
( select 201306 as ordine,'Iunie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2013 )
group by gestiune )
union
( select 201307 as ordine,'Iulie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2013 )
group by gestiune )
union
( select 201308 as ordine,'August 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2013 )
group by gestiune )
union
( select 201309 as ordine,'Septembrie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2013 )
group by gestiune )
union
( select 201310 as ordine,'Octombrie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2013 )
group by gestiune )
union
( select 201311 as ordine,'Noiembrie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2013 )
group by gestiune )
union
( select 201312 as ordine,'Decembrie 2013' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2013 )
group by gestiune )
--2014
union
( select 201401 as ordine, 'Ianuarie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2014 )
group by gestiune )
union
( select 201402 as ordine,'Februarie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2014 )
group by gestiune )
union
( select 201403 as ordine,'Martie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2014 )
group by gestiune )
union
( select 201404 as ordine,'Aprilie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2014 )
group by gestiune )
union
( select 201405 as ordine,'Mai 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2014 )
group by gestiune )
union
( select 201406 as ordine,'Iunie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2014 )
group by gestiune )
union
( select 201407 as ordine,'Iulie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2014 )
group by gestiune )
union
( select 201408 as ordine,'August 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2014 )
group by gestiune )
union
( select 201409 as ordine,'Septembrie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2014 )
group by gestiune )
union
( select 201410 as ordine,'Octombrie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2014 )
group by gestiune )
union
( select 201411 as ordine,'Noiembrie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2014 )
group by gestiune )
union
( select 201412 as ordine,'Decembrie 2014' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2014 )
group by gestiune )
--2015
union
( select 201501 as ordine, 'Ianuarie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2015 )
group by gestiune )
union
( select 201502 as ordine,'Februarie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2015 )
group by gestiune )
union
( select 201503 as ordine,'Martie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2015 )
group by gestiune )
union
( select 201504 as ordine,'Aprilie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2015 )
group by gestiune )
union
( select 201505 as ordine,'Mai 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2015 )
group by gestiune )
union
( select 201506 as ordine,'Iunie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2015 )
group by gestiune )
union
( select 201507 as ordine,'Iulie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2015 )
group by gestiune )
union
( select 201508 as ordine,'August 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2015 )
group by gestiune )
union
( select 201509 as ordine,'Septembrie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2015 )
group by gestiune )
union
( select 201510 as ordine,'Octombrie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2015 )
group by gestiune )
union
( select 201511 as ordine,'Noiembrie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2015 )
group by gestiune )
union
( select 201512 as ordine,'Decembrie 2015' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2015 )
group by gestiune )
--2016
union
( select 201601 as ordine, 'Ianuarie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2016 )
group by gestiune )
union
( select 201602 as ordine,'Februarie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2016 )
group by gestiune )
union
( select 201603 as ordine,'Martie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2016 )
group by gestiune )
union
( select 201604 as ordine,'Aprilie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2016 )
group by gestiune )
union
( select 201605 as ordine,'Mai 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2016 )
group by gestiune )
union
( select 201606 as ordine,'Iunie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2016 )
group by gestiune )
union
( select 201607 as ordine,'Iulie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2016 )
group by gestiune )
union
( select 201608 as ordine,'August 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2016 )
group by gestiune )
union
( select 201609 as ordine,'Septembrie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2016 )
group by gestiune )
union
( select 201610 as ordine,'Octombrie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2016 )
group by gestiune )
union
( select 201611 as ordine,'Noiembrie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2016 )
group by gestiune )
union
( select 201612 as ordine,'Decembrie 2016' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2016 )
group by gestiune )
--2017
union
( select 201701 as ordine, 'Ianuarie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2017 )
group by gestiune )
union
( select 201702 as ordine,'Februarie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2017 )
group by gestiune )
union
( select 201703 as ordine,'Martie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2017 )
group by gestiune )
union
( select 201704 as ordine,'Aprilie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2017 )
group by gestiune )
union
( select 201705 as ordine,'Mai 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2017 )
group by gestiune )
union
( select 201706 as ordine,'Iunie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2017 )
group by gestiune )
union
( select 201707 as ordine,'Iulie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2017 )
group by gestiune )
union
( select 201708 as ordine,'August 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2017 )
group by gestiune )
union
( select 201709 as ordine,'Septembrie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2017 )
group by gestiune )
union
( select 201710 as ordine,'Octombrie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2017 )
group by gestiune )
union
( select 201711 as ordine,'Noiembrie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2017 )
group by gestiune )
union
( select 201712 as ordine,'Decembrie 2017' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2017 )
group by gestiune )
--2018
union
( select 201801 as ordine, 'Ianuarie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2018 )
group by gestiune )
union
( select 201802 as ordine,'Februarie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2018 )
group by gestiune )
union
( select 201803 as ordine,'Martie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2018 )
group by gestiune )
union
( select 201804 as ordine,'Aprilie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2018 )
group by gestiune )
union
( select 201805 as ordine,'Mai 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2018 )
group by gestiune )
union
( select 201806 as ordine,'Iunie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2018 )
group by gestiune )
union
( select 201807 as ordine,'Iulie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2018 )
group by gestiune )
union
( select 201808 as ordine,'August 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2018 )
group by gestiune )
union
( select 201809 as ordine,'Septembrie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2018 )
group by gestiune )
union
( select 201810 as ordine,'Octombrie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2018 )
group by gestiune )
union
( select 201811 as ordine,'Noiembrie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2018 )
group by gestiune )
union
( select 201812 as ordine,'Decembrie 2018' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2018 )
group by gestiune )
--2019
union
( select 201901 as ordine, 'Ianuarie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JAN_2019 )
group by gestiune )
union
( select 201902 as ordine,'Februarie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_FEB_2019 )
group by gestiune )
union
( select 201903 as ordine,'Martie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAR_2019 )
group by gestiune )
union
( select 201904 as ordine,'Aprilie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_APR_2019 )
group by gestiune )
union
( select 201905 as ordine,'Mai 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_MAY_2019 )
group by gestiune )
union
( select 201906 as ordine,'Iunie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUN_2019 )
group by gestiune )
union
( select 201907 as ordine,'Iulie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_JUL_2019 )
group by gestiune )
union
( select 201908 as ordine,'August 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_AUG_2019 )
group by gestiune )
union
( select 201909 as ordine,'Septembrie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_SEP_2019 )
group by gestiune )
union
( select 201910 as ordine,'Octombrie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_OCT_2019 )
group by gestiune )
union
( select 201911 as ordine,'Noiembrie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_NOV_2019 )
group by gestiune )
union
( select 201912 as ordine,'Decembrie 2019' as luna, nvl(sum((pret_initial-pret)*cantitate),0) as reducere, gestiune
from vanzare PARTITION ( P_DEC_2019 )
group by gestiune )
;
