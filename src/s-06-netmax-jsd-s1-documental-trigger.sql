--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_documental
  instead of insert or update or delete on documental
declare
  v_count number;
begin
  case
  when inserting then
    select count(*) into v_count
    from programa_f2
    where programa_id = :new.programa_id;

    if v_count > 0 then
      insert into documental_f2(programa_id, tematica, duracion, pais_id, trailer)
      values(:new.programa_id, :new.tematica, :new.duracion, :new.pais_id, :new.trailer);
    else
      select count(*) into v_count
      from programa_f1
      where programa_id = :new.programa_id;

      if v_count > 0 then
        insert into ti_documental_1(programa_id, tematica, duracion, pais_id, trailer)
        values(:new.programa_id, :new.tematica, :new.duracion,:new.pais_id,:new.trailer);

        insert into documental_f1
          select * from ti_documental_1 where programa_id = :new.programa_id;

        delete from ti_documental_1 where programa_id = :new.programa_id;
        
      else
        select count(*) into v_count
        from programa_f3
        where programa_id = :new.programa_id;

        if v_count > 0 then
          insert into ti_documental_3(programa_id, tematica, duracion, pais_id, trailer)
          values(:new.programa_id,:new.tematica,:new.duracion,:new.pais_id,:new.trailer);

          insert into documental_f3
            select * from ti_documental_3 where programa_id = :new.programa_id;

          delete from ti_documental_3 where programa_id = :new.programa_id;
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
    from programa_f1
    where programa_id = :new.programa_id;

    if v_count > 0 then
      delete from serie_f1 where programa_id = :old.programa_id;
    else
      select count(*) into v_count
      from programa_f2
      where programa_id = :new.programa_id;

      if v_count > 0 then
        delete from serie_f2 where programa_id = :old.programa_id;
      else
        select count(*) into v_count
        from programa_f3
        where programa_id = :new.programa_id;

        if v_count > 0 then
          delete from serie_f3 where programa_id = :old.programa_id;
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
