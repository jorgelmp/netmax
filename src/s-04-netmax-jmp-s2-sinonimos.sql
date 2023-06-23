--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

whenever sqlerror exit rollback;
prompt JMPBD_S2: Creando sinónimos

Prompt Creando sinónimos para ARCHIVO_PROGRAMA 
create or replace synonym archivo_programa_f1 for archivo_programa_f1_jmp_s2;
create or replace synonym archivo_programa_f2 for archivo_programa_f2_jsd_s1@jsdbd_s1.fi.unam;

Prompt Creando sinónimos para DOCUMENTAL 
create or replace synonym documental_f1 for documental_f1_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym documental_f2 for documental_f2_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym documental_f3 for documental_f3_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para HISTORICO_STATUS_PROGRAMA
create or replace synonym historico_status_programa_f1
for historico_status_programa_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para PAIS
create or replace synonym pais_r2 for pais_r_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym pais_r1 for pais_r_jmp_s2;
create or replace synonym pais_r3 for pais_r_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym pais_r4 for pais_r_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para PELICULA
create or replace synonym pelicula_f1 for pelicula_f1_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym pelicula_f2 for pelicula_f2_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym pelicula_f3 for pelicula_f3_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para PLAYLIST
create or replace synonym playlist_f1 for playlist_f1_jsd_s2@jsdbd_s2.fi.unam;
create or replace synonym playlist_f2 for playlist_f2_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym playlist_f3 for playlist_f3_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym playlist_f4 for playlist_f4_jmp_s2;

Prompt Creando sinónimos para PROGRAMA
create or replace synonym programa_f1 for programa_f1_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym programa_f2 for programa_f2_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym programa_f3 for programa_f3_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para SERIE
create or replace synonym serie_f1 for serie_f1_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym serie_f2 for serie_f2_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym serie_f3 for serie_f3_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para STATUS_PROGRAMA
create or replace synonym status_programa for status_programa_jmp_s2;

Prompt Creando sinónimos para TIPO_CUENTA
create or replace synonym tipo_cuenta_r2 for tipo_cuenta_r_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym tipo_cuenta_r1 for tipo_cuenta_r_jmp_s2;
create or replace synonym tipo_cuenta_r3 for tipo_cuenta_r_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym tipo_cuenta_r4 for tipo_cuenta_r_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para TIPO_SERIE
create or replace synonym tipo_serie_r2 for tipo_serie_r_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym tipo_serie_r1 for tipo_serie_r_jmp_s2;
create or replace synonym tipo_serie_r3 for tipo_serie_r_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym tipo_serie_r4 for tipo_serie_r_jsd_s2@jsdbd_s2.fi.unam;

Prompt Creando sinónimos para USUARIO
create or replace synonym usuario_f1 for usuario_f1_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym usuario_f2 for usuario_f2_jsd_s2@jsdbd_s2.fi.unam;
create or replace synonym usuario_f3 for usuario_f3_jmp_s1@jmpbd_s1.fi.unam;
create or replace synonym usuario_f4 for usuario_f4_jsd_s1@jsdbd_s1.fi.unam;
create or replace synonym usuario_f5 for usuario_f5_jmp_s2;

Prompt JMPBD_S2: Sinónimos creados existosamente
