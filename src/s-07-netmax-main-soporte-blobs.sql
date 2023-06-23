--@Autor: Jorge A. Rodríguez C
--@Fecha creación:
--@Descripción: Script principal empleado para configurar el soporte
-- de datos BLOB en los 4 nodos.

Prompt configurando directorios y otorgando registros.
--jmpbd_s1
Prompt configurando soporte BLOB para jmpbd_s1
connect netmax_bdd/netmax_bdd@jmpbd_s1
@s-07-netmax-configuracion-soporte-blobs.sql

--jmpbd_s2
Prompt configurando soporte BLOB para jmpbd_s2
connect netmax_bdd/netmax_bdd@jmpbd_s2
@s-07-netmax-configuracion-soporte-blobs.sql

--jsdbd_s1
Prompt configurando soporte BLOB para jsdbd_s1
connect netmax_bdd/netmax_bdd@jsdbd_s1
@s-07-netmax-configuracion-soporte-blobs.sql

--jsdbd_s2
Prompt configurando soporte BLOB para jsdbd_s2
connect netmax_bdd/netmax_bdd@jsdbd_s2
@s-07-netmax-configuracion-soporte-blobs.sql
Prompt Listo !
