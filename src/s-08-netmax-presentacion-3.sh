#!/bin/bash
#@Autor: Jorge A. Rodríguez C
#@Fecha creación: dd/mm/yyyy
#@Descripción: Copia archivos binarios

#Si ocurre un error, el programa termina.
set -e
set -o pipefail

#En caso de no econtrar el directorio, extrae el contenido del archivo zip
if [ ! -d "/tmp/bdd/proyecto-final/pdfs" ]; then
  echo "Copiando archivos pdf de muestra "
  mkdir -p /tmp/bdd/proyecto-final/pdfs
  unzip carga-inicial/pdfs.zip -d /tmp/bdd/proyecto-final
else
  echo "=> Los archivos PDF de muestra ya fueron copiados"
fi

if [ ! -d "/tmp/bdd/proyecto-final/trailers" ]; then
  echo "Copiando archivos de video de muestra"
  mkdir -p /tmp/bdd/proyecto-final/trailers
  unzip carga-inicial/trailers.zip -d /tmp/bdd/proyecto-final
else
  echo "=> Los archivos de video de muestra ya fuero copiados."
fi
#actualiza permisos
chmod -R 755 /tmp/bdd/proyecto-final
