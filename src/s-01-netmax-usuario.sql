--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       20/05/2023
--@Descripción: Crea usuario netmax_bdd en la base de datos actualmente conectada y
--              le otorga los permisos necesarios.

declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where lower(username) = 'netmax_bdd';
  if v_count > 0 then
    execute immediate 'drop user netmax_bdd cascade';
  else
    dbms_output.put_line('El usuario netmax_bdd no existe');
  end if;
end;
/

Prompt Creando al usuario netmax_bdd
create user netmax_bdd identified by netmax_bdd quota unlimited on users; 

Prompt Otorgando permisos al usuario netmax_bdd
grant create session, create table, create procedure, create sequence, create view,
  create synonym, create database link, create trigger, create any directory to netmax_bdd;

Prompt Listo!
