--@Autor: Jorge A. Rodríguez C
--@Fecha creación:
--@Descripción: Script principal - creación de triggers

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando triggers para jmpbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jmpbd_s1
@s-06-netmax-usuario-trigger.sql
@s-06-netmax-programa-trigger.sql
@s-06-netmax-jmp-s1-serie-trigger.sql
@s-06-netmax-jmp-s1-pelicula-trigger.sql
@s-06-netmax-jmp-s1-documental-trigger.sql
@s-06-netmax-jmp-s1-archivo-programa-trigger.sql
@s-06-netmax-jmp-s1-playlist-trigger.sql
@s-06-netmax-tipo-cuenta-trigger.sql
@s-06-netmax-tipo-serie-trigger.sql
@s-06-netmax-pais-trigger.sql

prompt =====================================
prompt Creando triggers para jmpbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jmpbd_s2
@s-06-netmax-usuario-trigger.sql
@s-06-netmax-programa-trigger.sql
@s-06-netmax-jmp-s2-serie-trigger.sql
@s-06-netmax-jmp-s2-pelicula-trigger.sql
@s-06-netmax-jmp-s2-documental-trigger.sql
@s-06-netmax-jmp-s2-archivo-programa-trigger.sql
@s-06-netmax-jmp-s2-playlist-trigger.sql
@s-06-netmax-tipo-cuenta-trigger.sql
@s-06-netmax-tipo-serie-trigger.sql
@s-06-netmax-pais-trigger.sql

prompt =====================================
prompt Creando triggers para jsdbd_s1
prompt =====================================
connect netmax_bdd/netmax_bdd@jsdbd_s1
@s-06-netmax-usuario-trigger.sql
@s-06-netmax-programa-trigger.sql
@s-06-netmax-jsd-s1-serie-trigger.sql
@s-06-netmax-jsd-s1-pelicula-trigger.sql
@s-06-netmax-jsd-s1-documental-trigger.sql
@s-06-netmax-jsd-s1-archivo-programa-trigger.sql
@s-06-netmax-jsd-s1-playlist-trigger.sql
@s-06-netmax-tipo-cuenta-trigger.sql
@s-06-netmax-tipo-serie-trigger.sql
@s-06-netmax-pais-trigger.sql

prompt =====================================
prompt Creando triggers para jsdbd_s2
prompt =====================================
connect netmax_bdd/netmax_bdd@jsdbd_s2
@s-06-netmax-usuario-trigger.sql
@s-06-netmax-programa-trigger.sql
@s-06-netmax-jsd-s2-serie-trigger.sql
@s-06-netmax-jsd-s2-pelicula-trigger.sql
@s-06-netmax-jsd-s2-documental-trigger.sql
@s-06-netmax-jsd-s2-archivo-programa-trigger.sql
@s-06-netmax-jsd-s2-playlist-trigger.sql
@s-06-netmax-tipo-cuenta-trigger.sql
@s-06-netmax-tipo-serie-trigger.sql
@s-06-netmax-pais-trigger.sql

prompt Listo!
disconnect
