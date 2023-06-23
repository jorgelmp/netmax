--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Archivo de carga inicial.

clear screen
whenever sqlerror exit rollback;

Prompt ======================================
Prompt Cargando catalogos replicados en jmpbd_s1
Prompt ======================================
connect netmax_bdd/netmax_bdd@jmpbd_s1
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt ======================================
Prompt Cargando catalogos replicados en jmpbd_s2
Prompt ======================================
connect netmax_bdd/netmax_bdd@jmpbd_s2
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt ======================================
Prompt Cargando catalogos replicados en jsdbd_s1
Prompt ======================================
connect netmax_bdd/netmax_bdd@jsdbd_s1
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt ======================================
Prompt Cargando catalogos replicados en jsdbd_s2
Prompt ======================================
connect netmax_bdd/netmax_bdd@jsdbd_s2
delete from status_programa;
@carga-inicial/netmax-carga-inicial-status-programa.sql
commit;

Prompt Carga de datos replicados exitosa!.
exit
