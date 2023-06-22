--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinonimos para jmpbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jmpbd_s1
@s-04-netmax-jmp-s1-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para jmpbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jmpbd_s2
@s-04-netmax-jmp-s2-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para jsdbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jsdbd_s1
@s-04-netmax-jsd-s1-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para jsdbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jsdbd_s2
@s-04-netmax-jsd-s2-sinonimos.sql
@s-04-netmax-valida-sinonimos.sql

prompt Listo!
disconnect
