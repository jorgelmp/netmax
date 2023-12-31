--@Autores:     Jorge Manzanares y Jes�s Salazar
--@Fecha:       21/05/2023
--@Descripci�n: Crea tablas y restricciones para el sitio JSDBD_S2

SET SERVEROUTPUT ON
DECLARE
  CURSOR CUR_TABLES IS 
    SELECT TABLE_NAME FROM USER_TABLES;
BEGIN
  FOR T IN CUR_TABLES LOOP
    DBMS_OUTPUT.PUT_LINE('ELIMINANDO LA TABLA => ' || T.TABLE_NAME);
    EXECUTE IMMEDIATE 'DROP TABLE ' || T.TABLE_NAME || ' CASCADE CONSTRAINTS';
  END LOOP;
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR, EXCEPCI�N INESPERADA => ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('ERROR => ' || SQLERRM);
END;
/

-- 
-- TABLE: PAIS_R_JSD_S2 
--

CREATE TABLE PAIS_R_JSD_S2(
    PAIS_ID       NUMBER(2, 0)    NOT NULL,
    CLAVE         VARCHAR2(4)     NOT NULL,
    NOMBRE        VARCHAR2(50)    NOT NULL,
    CONTINENTE    VARCHAR2(3)     NOT NULL,
    CONSTRAINT PAIS_R_JSD_S2_PK PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: STATUS_PROGRAMA_JSD_S2 
--

CREATE TABLE STATUS_PROGRAMA_JSD_S2(
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    CONSTRAINT STATUS_PROGRAMA_JSD_S2_PK PRIMARY KEY (STATUS_PROGRAMA_ID)
)
;



-- 
-- TABLE: PROGRAMA_F3_JSD_S2 
--

CREATE TABLE PROGRAMA_F3_JSD_S2(
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    FOLIO                 VARCHAR2(13)     NOT NULL,
    NOMBRE                VARCHAR2(100)    NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    FECHA_STATUS          DATE             NOT NULL,
    TIPO                  CHAR(1)          NOT NULL,
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PROGRAMA_F3_JSD_S2_PK                    PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT PROGRAMA_F3_JSD_S2_STATUS_PROGRAMA_FK    FOREIGN KEY (STATUS_PROGRAMA_ID)
      REFERENCES STATUS_PROGRAMA_JSD_S2(STATUS_PROGRAMA_ID)
)
;



-- 
-- TABLE: DOCUMENTAL_F3_JSD_S2 
--

CREATE TABLE DOCUMENTAL_F3_JSD_S2(
    PROGRAMA_ID    NUMBER(10, 0)    NOT NULL,
    TEMATICA       VARCHAR2(100)    NOT NULL,
    DURACION       NUMBER(5, 2)     NOT NULL,
    TRAILER        BLOB             NOT NULL,
    PAIS_ID        NUMBER(2, 0)     NOT NULL,
    CONSTRAINT DOCUMENTAL_F3_JSD_S2_PK          PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT DOCUMENTAL_F3_JSD_S2_PAIS_FK     FOREIGN KEY (PAIS_ID)
      REFERENCES PAIS_R_JSD_S2(PAIS_ID),
    CONSTRAINT DOCUMENTAL_F3_JSD_S2_PROGRAMA_FK FOREIGN KEY (PROGRAMA_ID)
      REFERENCES PROGRAMA_F3_JSD_S2(PROGRAMA_ID)
)
;



-- 
-- TABLE: HISTORICO_STATUS_PROGRAMA_JSD_S2 
--

CREATE TABLE HISTORICO_STATUS_PROGRAMA_JSD_S2(
    HISTORICO_STATUS_PROG_ID    NUMBER(10, 0)    NOT NULL,
    PROGRAMA_ID                  NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                 DATE             NOT NULL,
    STATUS_PROGRAMA_ID           NUMBER(2, 0)     NOT NULL,
    CONSTRAINT HISTORICO_STATUS_PROGRAMA_JSD_S2_PK 
      PRIMARY KEY (HISTORICO_STATUS_PROG_ID), 
    CONSTRAINT HISTORICO_STATUS_PROGRAMA_JSD_S2_STATUS_PROGRAMA_FK
      FOREIGN KEY (STATUS_PROGRAMA_ID)
      REFERENCES STATUS_PROGRAMA_JSD_S2(STATUS_PROGRAMA_ID)
)
;



-- 
-- TABLE: PELICULA_F3_JSD_S2 
--

CREATE TABLE PELICULA_F3_JSD_S2(
    PROGRAMA_ID                NUMBER(10, 0)    NOT NULL,
    PELICULA_ANTECEDENTE_ID    NUMBER(10, 0)    ,
    DURACION                   NUMBER(5, 2)     NOT NULL,
    SINOPSIS                   VARCHAR2(500)    NOT NULL,
    CLASIFICACION              CHAR(1)          NOT NULL,
    CONSTRAINT PELICULA_F3_JSD_S2_PK            PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT PELICULA_F3_JSD_S2_PROGRAMA_FK   FOREIGN KEY (PROGRAMA_ID)
      REFERENCES PROGRAMA_F3_JSD_S2(PROGRAMA_ID)
)
;



-- 
-- TABLE: TIPO_CUENTA_R_JSD_S2 
--

CREATE TABLE TIPO_CUENTA_R_JSD_S2(
    TIPO_CUENTA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE             VARCHAR2(40)     NOT NULL,
    DESCRIPCION       VARCHAR2(500)    NOT NULL,
    COSTO_MENSUAL     NUMBER(10, 2)    NOT NULL,
    CONSTRAINT TIPO_CUENTA_R_JSD_S2_PK PRIMARY KEY (TIPO_CUENTA_ID)
)
;



-- 
-- TABLE: USUARIO_F2_JSD_S2 
--

CREATE TABLE USUARIO_F2_JSD_S2(
    USUARIO_ID          NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(200)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO       DATE,
    FECHA_CUENTA_FIN    DATE,
    VIGENTE             NUMBER(1, 0)     NOT NULL,
    TIPO_CUENTA_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT USUARIO_F2_JSD_S2_PK             PRIMARY KEY (USUARIO_ID), 
    CONSTRAINT USUARIO_F2_JSD_S2_TIPO_CUENTA_FK FOREIGN KEY (TIPO_CUENTA_ID)
      REFERENCES TIPO_CUENTA_R_JSD_S2(TIPO_CUENTA_ID)
)
;



-- 
-- TABLE: PLAYLIST_F1_JSD_S2 
--

CREATE TABLE PLAYLIST_F1_JSD_S2(
    PLAYLIST_ID           NUMBER(10, 0)    NOT NULL,
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    CALIFICACION           NUMBER(1, 0)     NOT NULL,
    INDICE                NUMBER(10, 0)    NOT NULL,
    NUM_REPRODUCCIONES    NUMBER(10, 0)    NOT NULL,
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_F1_JSD_S2_PK            PRIMARY KEY (PLAYLIST_ID), 
    CONSTRAINT PLAYLIST_F1_JSD_S2_USUARIO_FK    FOREIGN KEY (USUARIO_ID)
      REFERENCES USUARIO_F2_JSD_S2(USUARIO_ID)
)
;



-- 
-- TABLE: TIPO_SERIE_R_JSD_S2 
--

CREATE TABLE TIPO_SERIE_R_JSD_S2(
    TIPO_SERIE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE            VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(500)    NOT NULL,
    CONSTRAINT TIPO_SERIE_R_JSD_S2_PK PRIMARY KEY (TIPO_SERIE_ID)
)
;



-- 
-- TABLE: SERIE_F3_JSD_S2 
--

CREATE TABLE SERIE_F3_JSD_S2(
    PROGRAMA_ID          NUMBER(10, 0)    NOT NULL,
    NUM_CAPITULOS        NUMBER(3, 0)     NOT NULL,
    DURACION_CAPITULO    NUMBER(5, 2)     NOT NULL,
    TIPO_SERIE_ID        NUMBER(2, 0)     NOT NULL,
    CONSTRAINT SERIE_F3_JSD_S2_PK               PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT SERIE_F3_JSD_S2_TIPO_SERIE_FK    FOREIGN KEY (TIPO_SERIE_ID)
      REFERENCES TIPO_SERIE_R_JSD_S2(TIPO_SERIE_ID),
    CONSTRAINT SERIE_F3_JSD_S2_PROGRAMA_FK      FOREIGN KEY (PROGRAMA_ID)
      REFERENCES PROGRAMA_F3_JSD_S2(PROGRAMA_ID)
)
;



