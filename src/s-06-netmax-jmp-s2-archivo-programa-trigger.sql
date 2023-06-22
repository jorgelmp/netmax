--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_archivo_programa
  instead of insert or update or delete on archivo_programa
declare

begin
  case
  when inserting then
    if :new.tamanio > 10 then

      insert into ti_archivo_programa_1(programa_id, num_archivo, archivo, tamanio)
      values(:new.programa_id, :new.num_archivo, :new.archivo, :new.tamanio);

      insert into archivo_programa_f1
        select * from ti_archivo_programa_1
        where programa_id = :new.programa_id and num_archivo = :new.num_archivo;

      delete from ti_archivo_programa_1
      where programa_id = :new.programa_id and num_archivo = :new.num_archivo;

    elsif :new.tamanio <= 10 then

      insert into ti_archivo_programa_2(programa_id, num_archivo, archivo, tamanio)
      values(:new.programa_id, :new.num_archivo, :new.archivo, :new.tamanio);

      insert into archivo_programa_f2
        select * from ti_archivo_programa_2
        where programa_id = :new.programa_id and num_archivo = :new.num_archivo;

      delete from ti_archivo_programa_2
      where programa_id = :new.programa_id and num_archivo = :new.num_archivo;

    else

      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'TAMANIO = ' ||:new.tamanio);

    end if;

  when deleting then
    if :old.tamanio > 10 then

      delete from archivo_programa_f1
      where programa_id = :new.programa_id and num_archivo = :new.num_archivo;

    elsif :old.tamanio <= 10 then

      delete from archivo_programa_f2
      where programa_id = :new.programa_id and num_archivo = :new.num_archivo;

    else

      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'TAMANIO = ' ||:new.tamanio);

    end if;

  when updating then

    raise_application_error(-20030,
        'La operación update para tablas fragmentadas no ha sido implementada. '
    );

  end case;
end;
/
show errors
