/*
-de facut un query pe baza caruia sa gasesti usor comenzi facute cu PAYPAL
-si de gasit linkul acestora cu mandatele
-de gasit ce valori sunt puse in mandate si ce valori in comanda si ce valori in comanda_euro
-care e relatia lor? e ea corecta?
-pe baza asta, se poate construi ecranul de corectare a istoricului valutar (vezi si statutul mandatelor...)
*/

select ceu.*, teu.data_introducerii, teu.stare, teu.payment
from comanda_euro ceu, total_comanda teu 
where ceu.id = teu.id
and teu.payment=3
and ceu.cod_valuta = 1
order by teu.data_introducerii desc;

select * from total_comanda where stare='PISTORIC' order by data_introducerii desc;

select trim(to_char(taxe,'99990.00')) from comanda_euro where id=1500297835;

select chr(39) from dual;

update total_comanda set payment=4 where id=1470065818;

commit;

select m.* from mandat m, total_comanda t
where m.id_comanda = t.id
and t.payment=3
order by data desc;