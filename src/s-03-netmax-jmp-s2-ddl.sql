--@Autores:     Jorge Manzanares y Jes�s Salazar
--@Fecha:       21/05/2023
--@Descripci�n: Crea tablas y restricciones para el sitio JMPBD_S2

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
-- TABLE: ARCHIVO_PROGRAMA_F1_JMP_S2 
--

CREATE TABLE ARCHIVO_PROGRAMA_F1_JMP_S2(
    NUM_ARCHIVO    NUMBER(5, 0)     NOT NULL,
    PROGRAMA_ID    NUMBER(10, 0)    NOT NULL,
    ARCHIVO        BLOB             NOT NULL,
    TAMANIO        NUMBER(10, 2)    NOT NULL,
    CONSTRAINT ARCHIVO_PROGRAMA_F1_JMP_S2_PK PRIMARY KEY (NUM_ARCHIVO, PROGRAMA_ID)
)
;



-- 
-- TABLE: PAIS_R_JMP_S2 
--

CREATE TABLE PAIS_R_JMP_S2(
    PAIS_ID       NUMBER(2, 0)    NOT NULL,
    CLAVE         VARCHAR2(4)     NOT NULL,
    NOMBRE        VARCHAR2(50)    NOT NULL,
    CONTINENTE    VARCHAR2(3)     NOT NULL,
    CONSTRAINT PAIS_R_JMP_S2_PK PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: TIPO_CUENTA_R_JMP_2 
--

CREATE TABLE TIPO_CUENTA_R_JMP_S2(
    TIPO_CUENTA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE             VARCHAR2(40)     NOT NULL,
    DESCRIPCION       VARCHAR2(500)    NOT NULL,
    COSTO_MENSUAL     NUMBER(10, 2)    NOT NULL,
    CONSTRAINT TIPO_CUENTA_R_JMP_S2_PK PRIMARY KEY (TIPO_CUENTA_ID)
)
;



-- 
-- TABLE: USUARIO_F5_JMP_S2 
--

CREATE TABLE USUARIO_F5_JMP_S2(
    USUARIO_ID          NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(200)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO       DATE,
    FECHA_CUENTA_FIN    DATE,
    VIGENTE             NUMBER(1, 0)     NOT NULL,
    TIPO_CUENTA_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT USUARIO_F5_JMP_S2_PK             PRIMARY KEY (USUARIO_ID), 
    CONSTRAINT USUARIO_F5_JMP_S2_TIPO_CUENTA_FK FOREIGN KEY (TIPO_CUENTA_ID)
      REFERENCES TIPO_CUENTA_R_JMP_S2(TIPO_CUENTA_ID)
)
;



-- 
-- TABLE: PLAYLIST_F4_JMP_S2 
--

CREATE TABLE PLAYLIST_F4_JMP_S2(
    PLAYLIST_ID           NUMBER(10, 0)    NOT NULL,
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    CALIFICACION           NUMBER(1, 0)     NOT NULL,
    INDICE                NUMBER(10, 0)    NOT NULL,
    NUM_REPRODUCCIONES    NUMBER(10, 0)    NOT NULL,
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_F4_JMP_S2_PK         PRIMARY KEY (PLAYLIST_ID), 
    CONSTRAINT PLAYLIST_F4_JMP_S2_USUARIO_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES USUARIO_F5_JMP_S2(USUARIO_ID)
)
;



-- 
-- TABLE: STATUS_PROGRAMA_JMP_S2 
--

CREATE TABLE STATUS_PROGRAMA_JMP_S2(
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    CONSTRAINT STATUS_PROGRAMA_JMP_S2_PK PRIMARY KEY (STATUS_PROGRAMA_ID)
)
;



-- 
-- TABLE: TIPO_SERIE_R_JMP_S2 
--

CREATE TABLE TIPO_SERIE_R_JMP_S2(
    TIPO_SERIE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE            VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(500)    NOT NULL,
    CONSTRAINT TIPO_SERIE_R_JMP_S2_PK PRIMARY KEY (TIPO_SERIE_ID)
)
;



