--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_programa
  instead of insert or update or delete on programa
declare

begin
  case
  when inserting then
    if SUBSTR(:new.folio,1, 2) not BETWEEN 'AA' and 'ZZ' THEN
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'FOLIO = ' ||:new.folio
        ||'STATUS_PROGRAMA_ID = ' ||:new.status_programa_id);
    end if;

    if substr(:new.folio,1,2) between 'AA' and 'MZ' then

      insert into programa_f1(programa_id, folio, nombre, descripcion, fecha_status,
        tipo, status_programa_id)
      values(:new.programa_id, :new.folio, :new.nombre, :new.descripcion, 
        :new.fecha_status, :new.tipo, :new.status_programa_id);

    elsif :new.status_programa_id between 1 and 3 then

      insert into programa_f2(programa_id, folio, nombre, descripcion, fecha_status,
        tipo, status_programa_id)
      values(:new.programa_id, :new.folio, :new.nombre, :new.descripcion, 
        :new.fecha_status, :new.tipo, :new.status_programa_id);

    elsif :new.status_programa_id between 4 and 5 then

      insert into programa_f3(programa_id, folio, nombre, descripcion, fecha_status,
        tipo, status_programa_id)
      values(:new.programa_id, :new.folio, :new.nombre, :new.descripcion, 
        :new.fecha_status, :new.tipo, :new.status_programa_id);

    else
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'FOLIO = ' ||:new.folio
        ||'STATUS_PROGRAMA_ID = ' ||:new.status_programa_id);
    end if;

  when deleting then
    if SUBSTR(:old.folio,1, 2) not BETWEEN 'AA' and 'ZZ' THEN
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'FOLIO = ' ||:old.folio
        ||'STATUS_PROGRAMA_ID = ' ||:old.status_programa_id);
    end if;

    if substr(:old.folio,1,2) between 'AA' and 'MZ' then

      delete from programa_f1
      where programa_id = :old.programa_id;

    elsif :old.status_programa_id between 1 and 3 then

      delete from programa_f2
      where programa_id = :old.programa_id;

    elsif :old.status_programa_id between 4 and 5 then

      delete from programa_f3
      where programa_id = :old.programa_id;

    else
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'FOLIO = ' ||:new.folio
        ||'STATUS_PROGRAMA_ID = ' ||:new.status_programa_id);
    end if;

  when updating then
    raise_application_error(-20030,
        'La operación update para tablas fragmentadas no ha sido implementada. '
    );

  end case;
end;
/
show errors
