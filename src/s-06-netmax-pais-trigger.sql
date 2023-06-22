--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_pais
  instead of insert or update or delete on pais
declare
  v_count number;
begin
  case
  when inserting then
    v_count := 0;
    --replica local
    insert into pais_r1(pais_id,clave,nombre,continente)
    values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
    v_count := v_count + sql%rowcount;
    --replica 2
    insert into pais_r2(pais_id,clave,nombre,continente)
    values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
    v_count := v_count + sql%rowcount;
    --replica 3
    insert into pais_r3(pais_id,clave,nombre,continente)
    values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
    v_count := v_count + sql%rowcount;
    --replica 4
    insert into pais_r4(pais_id,clave,nombre,continente)
    values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
    v_count := v_count + sql%rowcount;

    if v_count <> 4 then
      raise_application_error(-20040,
        'Número incorrecto de registros insertados en tabla replicada: '
        ||v_count);
    end if;

  when deleting then
    v_count := 0;
    --replica local
    delete from pais_r1 where pais_id = :old.pais_id;
    v_count := v_count + sql%rowcount;
    --replica 2
    delete from pais_r2 where pais_id = :old.pais_id;
    v_count := v_count + sql%rowcount;
    --replica 3
    delete from pais_r3 where pais_id = :old.pais_id;
    v_count := v_count + sql%rowcount;
    --replica 4
    delete from pais_r4 where pais_id = :old.pais_id;
    v_count := v_count + sql%rowcount;
    if v_count <> 4 then
      raise_application_error(-20040,
        'Número incorrecto de registros eliminados en tabla replicada: '
        ||v_count);
    end if;

  when updating then
    --replica local
    v_count := 0;
    update pais_r1 set clave = :new.clave,nombre =:new.nombre,
    continente =:new.continente
    where pais_id = :new.pais_id;
    v_count := v_count + sql%rowcount;
    --replica 2
    update pais_r2 set clave = :new.clave,nombre =:new.nombre,
    continente =:new.continente
    where pais_id = :new.pais_id;
    v_count := v_count + sql%rowcount;
    --replica 3
    update pais_r3 set clave = :new.clave,nombre =:new.nombre,
    continente =:new.continente
    where pais_id = :new.pais_id;
    v_count := v_count + sql%rowcount;
    --replica 4
    update pais_r4 set clave = :new.clave,nombre =:new.nombre,
    continente =:new.continente
    where pais_id = :new.pais_id;
    v_count := v_count + sql%rowcount;
  end case;

  if v_count <> 4 then
    raise_application_error(-20040,
      'Número incorrecto de registros actualizados en tabla replicada: '
      ||v_count);
  end if;
end;
/
show errors
