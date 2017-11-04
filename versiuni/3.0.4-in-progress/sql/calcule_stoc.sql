CREATE OR REPLACE VIEW calcule_stoc AS
WITH s_intrari AS
(SELECT cod_saga
          ,SUM(decode(retur, 0,cantitate,0)) intrari
          ,SUM(decode(retur, 0,0, abs(cantitate))) retururi
          ,SUM(decode(retur,0,abs(iesiri))) iesiri
          ,SUM(decode(retur, 0,cantitate-iesiri,0)) stoc_actual_gestiune
          ,gestiune
    FROM intrari
     GROUP BY cod_saga,gestiune
),
s_npl AS
(SELECT cod_saga
      ,NVL(sum(cantitate),0) npl_achitat
      ,gestiune
  FROM npl
 WHERE NVL(tip_plata,'ACHITAT') in ('LA VANZARE','VANZARE AVANS','VANZARE TERMEN', 'ACHITAT')
 GROUP BY cod_saga,gestiune
),
s_site AS
(SELECT cod_saga
      ,gestiune
      ,NVL(SUM(cantitate),0) in_tranzit
 FROM comanda 
WHERE stare in 
        ('RCONFIRMATA'
        ,'PCONFIRMATA'
        ,'VCONFIRMATA'
        ,'CCONFIRMATA'
        ,'PTRIMISA'
        ,'RTRIMISA'
        ,'VTRIMISA'
        ,'CTRIMISA'
        ,'RACHITATA'
        ,'VACHITATA'
        ,'PACHITATA'
        ,'CACHITATA'
        )
GROUP BY cod_saga, gestiune
)
SELECT produs.cod_saga
     , produs.denumire
     , s_intrari.intrari
     , s_intrari.retururi
     , s_intrari.iesiri
     , s_intrari.stoc_actual_gestiune
     , s_npl.npl_achitat
     , s_site.in_tranzit
     , produs.stoc stoc_actual_site
     , (s_intrari.intrari - s_intrari.retururi - s_npl.npl_achitat - s_site.in_tranzit) stoc_calculat_site
     , produs.gestiune
  FROM produs
      ,s_intrari
      ,s_npl
      ,s_site
 WHERE produs.isbn is not null
   AND produs.cod_saga=s_intrari.cod_saga
   AND produs.cod_saga=s_npl.cod_saga
   AND produs.cod_saga=s_site.cod_saga
/

COMMENT ON TABLE calcule_stoc IS '3.0.3 03/11/2017 Recalculare stoc mai eleganta'
/