--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       20/05/2023
--@Descripción: Crea usuario netmax_bdd y le otoroga permisos en cada nodo de la BDD.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

Prompt Inciando creacion/eliminacion de usuarios.
accept syspass prompt 'Proporcione el password de sys: ' hide

prompt =====================================
prompt Creando usuario en jmpbd_s1
prompt =====================================
connect sys/&&syspass@jmpbd_s1 as sysdba
@s-01-netmax-usuario.sql

prompt =====================================
prompt Creando usuario en jmpbd_s2
prompt =====================================
connect sys/&&syspass@jmpbd_s2 as sysdba
@s-01-netmax-usuario.sql

prompt =====================================
prompt Creando usuario en jsdbd_s1
prompt =====================================
connect sys/&&syspass@jsdbd_s1 as sysdba
@s-01-netmax-usuario.sql

prompt =====================================
prompt Creando usuario en jsdbd_s2
prompt =====================================
connect sys/&&syspass@jsdbd_s2 as sysdba
@s-01-netmax-usuario.sql

Prompt Listo!
disconnect
