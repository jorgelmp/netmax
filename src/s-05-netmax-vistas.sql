--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

Prompt creando vista PAIS
create or replace view pais as
  select pais_id, clave, nombre, continente
  from pais_r1;

Prompt creando vista PELICULA
create or replace view pelicula as
  select programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id
  from pelicula_f1
  union all
  select programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id
  from pelicula_f2
  union all
  select programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id
  from pelicula_f3;

Prompt creando vista PROGRAMA
create or replace view programa as
  select programa_id, folio, nombre, descripcion, fecha_status, tipo, status_programa_id
  from programa_f1
  union all
  select programa_id, folio, nombre, descripcion, fecha_status, tipo, status_programa_id
  from programa_f2
  union all
  select programa_id, folio, nombre, descripcion, fecha_status, tipo, status_programa_id
  from programa_f3;

Prompt creando vista SERIE
create or replace view serie as
  select programa_id, num_capitulos, duracion_capitulo, tipo_serie_id
  from serie_f1
  union all
  select programa_id, num_capitulos, duracion_capitulo, tipo_serie_id
  from serie_f2
  union all
  select programa_id, num_capitulos, duracion_capitulo, tipo_serie_id
  from serie_f3;

Prompt creando vista TIPO_CUENTA
create or replace view tipo_cuenta as
  select tipo_cuenta_id, clave, descripcion, costo_mensual
  from tipo_cuenta_r1;

Prompt creando vista TIPO_SERIE
create or replace view tipo_serie as
  select tipo_serie_id, clave, descripcion
  from tipo_serie_r1;

Prompt creando vista PLAYLIST
create or replace view playlist as
  select playlist_id,calificacion,indice,num_reproducciones,programa_id,
    usuario_id
  from playlist_f1
  union all
  select playlist_id,calificacion,indice,num_reproducciones,programa_id,
    usuario_id
  from playlist_f2
  union all
  select playlist_id,calificacion,indice,num_reproducciones,programa_id,
    usuario_id
  from playlist_f3
  union all
  select playlist_id,calificacion,indice,num_reproducciones,programa_id,
    usuario_id 
  from playlist_f4;

Prompt creando vista USUARIO
create or replace view usuario as
  select q.usuario_id, q.email, q.nombre, q.ap_paterno, q.ap_materno, q.fecha_ingreso, 
    q.fecha_cuenta_fin, q.vigente, q.tipo_cuenta_id, u.num_tarjeta, u.password
  from (
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f2
    union all
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f3
    union all
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f4
    union all
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f5
  ) q
  join usuario_f1 u on q.usuario_id = u.usuario_id;
