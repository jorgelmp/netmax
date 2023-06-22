--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_pelicula
  instead of insert or update or delete on pelicula
declare
  v_count number;
begin
  case
  when inserting then
    select count(*) into v_count
    from programa_f3
    where programa_id = :new.programa_id;

    if v_count > 0 then
      insert into pelicula_f3(programa_id, pelicula_antecedente_id, duracion, 
        sinopsis, clasificacion)
      values(:new.programa_id, :new.pelicula_antecedente_id, :new.duracion,
        :new.sinopsis, :new.clasificacion);
    else
      select count(*) into v_count
      from programa_f2
      where programa_id = :new.programa_id;

      if v_count > 0 then
        insert into pelicula_f2(programa_id, pelicula_antecedente_id, duracion, 
          sinopsis, clasificacion)
        values(:new.programa_id, :new.pelicula_antecedente_id, :new.duracion,
          :new.sinopsis, :new.clasificacion);
      else
        select count(*) into v_count
        from programa_f1
        where programa_id = :new.programa_id;

        if v_count > 0 then
          insert into pelicula_f1(programa_id, pelicula_antecedente_id, duracion, 
            sinopsis, clasificacion)
          values(:new.programa_id, :new.pelicula_antecedente_id, :new.duracion, 
            :new.sinopsis, :new.clasificacion);
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
      delete from pelicula_f3 where programa_id = :old.programa_id;
    else
      select count(*) into v_count
      from programa_f2
      where programa_id = :new.programa_id;

      if v_count > 0 then
        delete from pelicula_f2 where programa_id = :old.programa_id;
      else
        select count(*) into v_count
        from programa_f1
        where programa_id = :new.programa_id;

        if v_count > 0 then
          delete from pelicula_f1 where programa_id = :old.programa_id;
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
