--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       20/05/2023
--@Descripción: Crea ligas en cada nodo de la BDD.

clear screen
whenever sqlerror exit rollback;

Prompt Creando ligas en jmpbd_s1
connect netmax_bdd/netmax_bdd@jmpbd_s1

declare
  cursor cur_db_links is
    select db_link from user_db_links;
begin 
  for d in cur_db_links loop
    dbms_output.put_line('Eliminando DB Link => '||d.db_link);
    execute immediate 'drop database link '||d.db_link;
  end loop;
exception
  when others then
    dbms_output.put_line('Error, excepción inesperada => '|| to_char(sqlcode));
    dbms_output.put_line('Error => '|| sqlerrm);
end;
/
create database link jmpbd_s2.fi.unam using 'JMPBD_S2';
create database link jsdbd_s1.fi.unam using 'JSDBD_S1';
create database link jsdbd_s2.fi.unam using 'JSDBD_S2';

Prompt Creando ligas en jmpbd_s2
connect netmax_bdd/netmax_bdd@jmpbd_s2

declare
  cursor cur_db_links is
    select db_link from user_db_links;
begin 
  for d in cur_db_links loop
    dbms_output.put_line('Eliminando DB Link => '||d.db_link);
    execute immediate 'drop database link '||d.db_link;
  end loop;
exception
  when others then
    dbms_output.put_line('Error, excepción inesperada => '|| to_char(sqlcode));
    dbms_output.put_line('Error => '|| sqlerrm);
end;
/
create database link jmpbd_s1.fi.unam using 'JMPBD_S1';
create database link jsdbd_s1.fi.unam using 'JSDBD_S1';
create database link jsdbd_s2.fi.unam using 'JSDBD_S2';

Prompt Creando ligas en jmpbd_s2
connect netmax_bdd/netmax_bdd@jsdbd_s1
declare
  cursor cur_db_links is
    select db_link from user_db_links;
begin 
  for d in cur_db_links loop
    dbms_output.put_line('Eliminando DB Link => '||d.db_link);
    execute immediate 'drop database link '||d.db_link;
  end loop;
exception
  when others then
    dbms_output.put_line('Error, excepción inesperada => '|| to_char(sqlcode));
    dbms_output.put_line('Error => '|| sqlerrm);
end;
/
create database link jmpbd_s1.fi.unam using 'JMPBD_S1';
create database link jmpbd_s2.fi.unam using 'JMPBD_S2';
create database link jsdbd_s2.fi.unam using 'JSDBD_S2';

Prompt Creando ligas en jmpbd_s2
connect netmax_bdd/netmax_bdd@jsdbd_s2
declare
  cursor cur_db_links is
    select db_link from user_db_links;
begin 
  for d in cur_db_links loop
    dbms_output.put_line('Eliminando DB Link => '||d.db_link);
    execute immediate 'drop database link '||d.db_link;
  end loop;
exception
  when others then
    dbms_output.put_line('Error, excepción inesperada => '|| to_char(sqlcode));
    dbms_output.put_line('Error => '|| sqlerrm);
end;
/
create database link jmpbd_s1.fi.unam using 'JMPBD_S1';
create database link jmpbd_s2.fi.unam using 'JMPBD_S2';
create database link jsdbd_s1.fi.unam using 'JSDBD_S1';

Prompt Listo!
disconnect


