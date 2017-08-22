CREATE TABLE bck_comanda_euro AS
SELECT ceu.* 
FROM comanda_euro ceu
    ,total_comanda teu
WHERE ceu.id = teu.id (+)
  AND teu.id IS NULL
;

COMMENT ON TABLE bck_comanda_euro IS 'Istoric valutar pentru comenzi inexistente';


DELETE FROM comanda_euro 
 WHERE id in (SELECT id FROM bck_comanda_euro);
 
COMMIT;


CREATE TABLE bck_comanda_euro2 AS
SELECT ceu.* 
FROM comanda_euro ceu
    ,total_comanda teu
WHERE ceu.id = teu.id
  AND teu.payment IN (1,2) --ramburs, vriament
;

COMMENT ON TABLE bck_comanda_euro2 IS 'Istoric valutar pentru comenzi ramburs si virament; sunt comenzi in LEI';

DELETE FROM comanda_euro 
 WHERE id in (SELECT id FROM bck_comanda_euro2);
 
COMMIT;
