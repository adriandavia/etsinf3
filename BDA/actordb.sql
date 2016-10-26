-- Exercise 7
SELECT COUNT(DISTINCT CS_PELICULA.COD_PELI) CUANTAS_PELIS
FROM CS_PELICULA, CS_CLASIFICACION
WHERE CS_PELICULA.COD_PELI = CS_CLASIFICACION.COD_PELI
AND (
    COD_GEN = 'BB5'
    OR COD_GEN = 'GG4'
    OR COD_GEN = 'JH6'
);

-- Exercise 14
SELECT DISTINCT CS_PAIS.COD_PAIS, CS_PAIS.NOMBRE
FROM CS_PELICULA, CS_PAIS, CS_ACTUA, CS_ACTOR, CS_CLASIFICACION, CS_GENERO
WHERE CS_PELICULA.COD_PELI = CS_ACTUA.COD_PELI
  AND CS_ACTUA.COD_ACT = CS_ACTOR.COD_ACT
  AND CS_ACTOR.COD_PAIS = CS_PAIS.COD_PAIS
  AND CS_PELICULA.COD_PELI = CS_CLASIFICACION.COD_PELI
  AND CS_CLASIFICACION.COD_GEN = CS_GENERO.COD_GEN
  AND CS_GENERO.NOMBRE = 'Comedia'
ORDER BY CS_PAIS.NOMBRE;

-- Exercise 15
SELECT P.COD_PELI, P.TITULO
FROM CS_PELICULA P
WHERE P.COD_PELI IN (SELECT AT.COD_PELI
                     FROM CS_ACTUA AC
                     WHERE AT.COD_ACT IN (SELECT A.COD_ACT
                                          FROM CS_ACTOR A
                                          WHERE A.NOMBRE = P.DIRECTOR));



-- Exercise 22
SELECT p.anyo
FROM cs_pelicula p
WHERE p.anyo <= ALL (
  SELECT p2.anyo
  FROM cs_pelicula p2
  WHERE p2.cod_peli IN (
    SELECT ac.cod_peli
    FROM cs_actua ac
    WHERE ac.papel = 'Principal' 
    AND ac.cod_act = (
      SELECT a.cod_act
      FROM cs_actor a
      WHERE a.nombre = 'Jude Law'
    )
  )
);