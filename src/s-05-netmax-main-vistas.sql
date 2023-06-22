--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para jmpbd_s1
prompt ===========================================
connect netmax_bdd/netmax_bdd@jmpbd_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-jmp-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para jmpbd_s2
prompt ===========================================
prompt Creando vistas para jmpbd_s2
connect netmax_bdd/netmax_bdd@jmpbd_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-jmp-s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para jsdbd_s1
prompt ===========================================
prompt Creando vistas para jsdbd_s1
connect netmax_bdd/netmax_bdd@jsdbd_s1
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-jsd-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para jsdbd_s2
prompt ===========================================
prompt Creando vistas para jsdbd_s2
connect netmax_bdd/netmax_bdd@jsdbd_s2
@s-05-netmax-vistas.sql
@s-05-netmax-tablas-temporales.sql
@s-05-netmax-funciones-blob.sql
@s-05-netmax-jsd-s2-vistas-blob.sql
prompt Listo!
