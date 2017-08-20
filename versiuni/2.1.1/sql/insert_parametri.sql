DELETE FROM parametri WHERE nume IN ('TVA_CARTE','TVA_PAPETARIE', 'TVA_TRANSPORT','DEBUG')
/

INSERT INTO parametri (nume, valoare) VALUES ( 'TVA_CARTE', 9)
/

INSERT INTO parametri (nume, valoare) VALUES ( 'TVA_PAPETARIE', 24)
/

INSERT INTO parametri (nume, valoare) VALUES ( 'TVA_TRANSPORT', 24)
/

INSERT INTO parametri (nume, valoare) VALUES ( 'DEBUG', 0)
/

COMMIT
/