--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_serie
  instead of insert or update or delete on serie
declare
  v_count number;
begin
  case
  when inserting then
    select count(*) into v_count
    from programa_f3
    where programa_id = :new.programa_id;

    if v_count > 0 then
      insert into serie_f3(programa_id, num_capitulos, duracion_capitulo, 
        tipo_serie_id)
      values(:new.programa_id, :new.num_capitulos, :new.duracion_capitulo,
        :new.tipo_serie_id);
    else
      select count(*) into v_count
      from programa_f2
      where programa_id = :new.programa_id;

      if v_count > 0 then
        insert into serie_f2(programa_id, num_capitulos, duracion_capitulo, 
          tipo_serie_id)
        values(:new.programa_id, :new.num_capitulos, :new.duracion_capitulo,
          :new.tipo_serie_id);
      else
        select count(*) into v_count
        from programa_f1
        where programa_id = :new.programa_id;

        if v_count > 0 then
          insert into serie_f1(programa_id, num_capitulos, duracion_capitulo, 
            tipo_serie_id)
          values(:new.programa_id, :new.num_capitulos, :new.duracion_capitulo, 
            :new.tipo_serie_id);
        else
          raise_application_error(-20020,
            'Error de integridad para el campo revista_id : '
            || :new.programa_id
            || ' No se encontró el registro padre en fragmentos');
        end if;
      end if;
    end if;

  when deleting then
    select count(*) into v_count
    from programa_f3
    where programa_id = :new.programa_id;

    if v_count > 0 then
      delete from serie_f3 where programa_id = :old.programa_id;
    else
      select count(*) into v_count
      from programa_f2
      where programa_id = :new.programa_id;

      if v_count > 0 then
        delete from serie_f2 where programa_id = :old.programa_id;
      else
        select count(*) into v_count
        from programa_f1
        where programa_id = :new.programa_id;

        if v_count > 0 then
          delete from serie_f1 where programa_id = :old.programa_id;
        else
          raise_application_error(-20020,
            'Error de integridad para el campo revista_id : '
            || :new.programa_id
            || ' No se encontró el registro padre en fragmentos');
        end if;
      end if;
    end if;



  when updating then
    raise_application_error(-20030,
        'La operación update para tablas fragmentadas no ha sido implementada. '
    );

  end case;
end;
/
show errors
