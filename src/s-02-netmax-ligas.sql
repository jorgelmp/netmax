--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       20/05/2023
--@Descripción: Crea ligas en cada nodo de la BDD.

clear screen
whenever sqlerror exit rollback;

Prompt Creando ligas en jmpbd_s1
connect netmax_bdd/netmax_bdd@jmpbd_s1
create database link jmpbd_s2.fi.unam using 'JMPBD_S2';
create database link jsdbd_s1.fi.unam using 'JSDBD_S1';
Create database link jsdbd_s2.fi.unam using 'JSDBD_S2';

Prompt Creando ligas en jmpbd_s2
connect netmax_bdd/netmax_bdd@jmpbd_s2
create database link jmpbd_s1.fi.unam using 'JMPBD_S1';
create database link jsdbd_s1.fi.unam using 'JSDBD_S1';
create database link jsdbd_s2.fi.unam using 'JSDBD_S2';

Prompt Creando ligas en jmpbd_s2
connect netmax_bdd/netmax_bdd@jsdbd_s1
create database link jmpbd_s1.fi.unam using 'JMPBD_S1';
create database link jmpbd_s2.fi.unam using 'JMPBD_S2';
create database link jsdbd_s2.fi.unam using 'JSDBD_S2';

Prompt Creando ligas en jmpbd_s2
connect netmax_bdd/netmax_bdd@jsdbd_s2
create database link jmpbd_s1.fi.unam using 'JMPBD_S1';
create database link jmpbd_s2.fi.unam using 'JMPBD_S2';
create database link jsdbd_s1.fi.unam using 'JSDBD_S1';

Prompt Listo!
disconnect


