--@Autores:     Jorge Manzanares y Jesús Salazar
--@Fecha:       21/05/2023 
--@Descripción: Creación de fragmentos en los 4 nodos

create or replace trigger t_dml_usuario
  instead of insert or update or delete on usuario
declare

begin
  case
  when inserting then

    insert into usuario_f1(usuario_id, num_tarjeta, password)
    values(:new.usuario_id, :new.num_tarjeta, :new.password);
    
    if :new.vigente not in(0,1) then
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'VIGENTE = ' ||:new.vigente
        ||'TIPO_CUENTA_ID = ' ||:new.tipo_cuenta_id);
    end if;

    if :new.vigente = 0 then

      insert into usuario_f2(usuario_id, email, nombre, ap_paterno, ap_materno,
        fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
      values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno,
        :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);

    elsif :new.tipo_cuenta_id = 1 then 

      insert into usuario_f3(usuario_id, email, nombre, ap_paterno, ap_materno,
        fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
      values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno,
        :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);

    elsif :new.tipo_cuenta_id = 2 then 

      insert into usuario_f4(usuario_id, email, nombre, ap_paterno, ap_materno,
        fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
      values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno,
        :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);

    elsif :new.tipo_cuenta_id = 3 then 

      insert into usuario_f5(usuario_id, email, nombre, ap_paterno, ap_materno,
        fecha_ingreso, fecha_cuenta_fin, vigente, tipo_cuenta_id)
      values(:new.usuario_id, :new.email, :new.nombre, :new.ap_paterno, :new.ap_materno,
        :new.fecha_ingreso, :new.fecha_cuenta_fin, :new.vigente, :new.tipo_cuenta_id);

    else
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'VIGENTE = ' ||:new.vigente
        ||'TIPO_CUENTA_ID = ' ||:new.tipo_cuenta_id);

    end if;

  when deleting then

    delete from usuario_f1
    where usuario_id = :old.usuario_id;

    if :old.vigente = 0 then

      delete from usuario_f2
      where usuario_id = :old.usuario_id;

    elsif :old.tipo_cuenta_id = 1 then

      delete from usuario_f3
      where usuario_id = :old.usuario_id;

    elsif :old.tipo_cuenta_id = 2 then

      delete from usuario_f4
      where usuario_id = :old.usuario_id;

    elsif :old.tipo_cuenta_id = 3 then

      delete from usuario_f5
      where usuario_id = :old.usuario_id;

    else
      raise_application_error(-20010,
        'El registro que se intenta insertar o eliminar no cumple con el esquema de '
        ||'fragmentación horizontal primaria.'
        ||'VIGENTE = ' ||:new.vigente
        ||'TIPO_CUENTA_ID = ' ||:new.tipo_cuenta_id);
    end if;

  when updating then
    raise_application_error(-20030,
        'La operación update para tablas fragmentadas no ha sido implementada. '
    );
  end case;
end;
/
show errors
