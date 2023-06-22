--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

Prompt validando sinonimos para ARCHIVO_PROGRAMA
select
  (select count(*) from archivo_programa_f1) as archivo_programa_f1,
  (select count(*) from archivo_programa_f2) as archivo_programa_f2
from dual;

Prompt validando sinonimos para DOCUMENTAL
select
  (select count(*) from documental_f1) as documental_f1,
  (select count(*) from documental_f2) as documental_f2,
  (select count(*) from documental_f3) as documental_f1
from dual;

Prompt validando sinonimos para PAIS
select
  (select count(*) from pais_r1) as pais_r1,
  (select count(*) from pais_r2) as pais_r2,
  (select count(*) from pais_r3) as pais_r1,
  (select count(*) from pais_r3) as pais_r1
from dual;

Prompt validando sinonimos para PELICULA
select
  (select count(*) from pelicula_f1) as pelicula_f1,
  (select count(*) from pelicula_f2) as pelicula_f2,
  (select count(*) from pelicula_f3) as pelicula_f1
from dual;

Prompt validando sinonimos para PLAYLIST
select
  (select count(*) from playlist_f1) as playlist_f1,
  (select count(*) from playlist_f2) as playlist_f2,
  (select count(*) from playlist_f3) as playlist_f3,
  (select count(*) from playlist_f4) as playlist_f4
from dual;

Prompt validando sinonimos para PROGRAMA
select
  (select count(*) from programa_f1) as programa_f1,
  (select count(*) from programa_f2) as programa_f2,
  (select count(*) from programa_f3) as programa_f1
from dual;

Prompt validando sinonimos para SERIE
select
  (select count(*) from serie_f1) as serie_f1,
  (select count(*) from serie_f2) as serie_f2,
  (select count(*) from serie_f3) as serie_f1
from dual;

Prompt validando sinonimos para TIPO_CUENTA
select
  (select count(*) from tipo_cuenta_r1) as tipo_cuenta_r1,
  (select count(*) from tipo_cuenta_r2) as tipo_cuenta_r2,
  (select count(*) from tipo_cuenta_r3) as tipo_cuenta_r1,
  (select count(*) from tipo_cuenta_r3) as tipo_cuenta_r1
from dual;

Prompt validando sinonimos para TIPO_SERIE
select
  (select count(*) from tipo_serie_r1) as tipo_serie_r1,
  (select count(*) from tipo_serie_r2) as tipo_serie_r2,
  (select count(*) from tipo_serie_r3) as tipo_serie_r1,
  (select count(*) from tipo_serie_r3) as tipo_serie_r1
from dual;

Prompt validando sinonimos para USUARIO
select
  (select count(*) from usuario_f1) as usuario_f1,
  (select count(*) from usuario_f2) as usuario_f2,
  (select count(*) from usuario_f3) as usuario_f3,
  (select count(*) from usuario_f4) as usuario_f4,
  (select count(*) from usuario_f5) as usuario_f5
from dual;
