--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para jmpbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jmpbd_s1
@s-03-netmax-jmp-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para jmpbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jmpbd_s2
@s-03-netmax-jmp-s2-ddl.sql

prompt =====================================
prompt Creando fragmentos para jsdbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jsdbd_s1
@s-03-netmax-jsd-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para jsdbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jsdbd_s2
@s-03-netmax-jsd-s2-ddl.sql

Prompt Listo!
disconnect
