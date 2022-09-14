-- Generado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   en:        2022-06-11 09:53:03 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tb_boleta (
    num_boleta VARCHAR2(5 BYTE) NOT NULL,
    fecha      DATE,
    cod_empl   VARCHAR2(5 BYTE),
    cod_cli    VARCHAR2(5 BYTE),
    subtotal   VARCHAR2(5 BYTE),
    descuento  VARCHAR2(5 BYTE)
);

ALTER TABLE tb_boleta ADD CONSTRAINT tb_boleta_pk PRIMARY KEY ( num_boleta );

CREATE TABLE tb_categoria (
    cod_cate VARCHAR2(5 BYTE) NOT NULL,
    nom_cate VARCHAR2(30 BYTE)
);

ALTER TABLE tb_categoria ADD CONSTRAINT tb_categoria_pk PRIMARY KEY ( cod_cate );

CREATE TABLE tb_clientes (
    cod_cli         VARCHAR2(5 BYTE) NOT NULL,
    nom_cli         VARCHAR2(30 BYTE),
    dir_cli         VARCHAR2(5 BYTE),
    sexo            VARCHAR2(20 BYTE),
    dni             VARCHAR2(8 BYTE),
    ruc             VARCHAR2(20 BYTE),
    telefono        VARCHAR2(9 BYTE),
    num_ordenpedido VARCHAR2(5 BYTE) NOT NULL
);

ALTER TABLE tb_clientes ADD CONSTRAINT tb_clientes_pk PRIMARY KEY ( cod_cli );

CREATE TABLE tb_detalleorden (
    cod_pro      VARCHAR2(5 BYTE),
    nom_pro      VARCHAR2(30 BYTE),
    cantidad     VARCHAR2(10 BYTE),
    precio_venta VARCHAR2(5 BYTE),
    importe      VARCHAR2(5 BYTE),
    tbdetord_id  VARCHAR2(5 BYTE) NOT NULL
);

ALTER TABLE tb_detalleorden ADD CONSTRAINT tbdetord_pk PRIMARY KEY ( tbdetord_id );

CREATE TABLE tb_empleado (
    cod_emp         VARCHAR2(5 BYTE) NOT NULL,
    nom_emp         VARCHAR2(5 BYTE),
    dir_emp         VARCHAR2(50 BYTE),
    cargo           VARCHAR2(20 BYTE),
    edad            VARCHAR2(3 BYTE),
    tel             VARCHAR2(9 BYTE),
    num_ordenpedido VARCHAR2(5 BYTE) NOT NULL
);

ALTER TABLE tb_empleado ADD CONSTRAINT tb_empleado_pk PRIMARY KEY ( cod_emp );

CREATE TABLE tb_orden_pedido (
    num_ordenpedido VARCHAR2(5 BYTE) NOT NULL,
    fecha           DATE,
    cod_cli         VARCHAR2(5 BYTE),
    nom_cli         VARCHAR2(30 BYTE),
    cod_emp         VARCHAR2(5 BYTE),
    total           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    num_boleta      VARCHAR2(5 BYTE) NOT NULL
);

ALTER TABLE tb_orden_pedido ADD CONSTRAINT tb_orden_pedido_pk PRIMARY KEY ( num_ordenpedido );

CREATE TABLE tb_producto (
    cod_pro     VARCHAR2(5 BYTE) NOT NULL,
    nom_pro     VARCHAR2(30 BYTE),
    pre_venta   VARCHAR2(5 BYTE),
    pre_compra  VARCHAR2(5 BYTE),
    fecha_venc  DATE,
    stock       VARCHAR2(20 BYTE),
    cod_cate    VARCHAR2(5 BYTE) NOT NULL,
    cod_prov    VARCHAR2(5 BYTE) NOT NULL,
    tbdetord_id VARCHAR2(5 BYTE) NOT NULL
);

ALTER TABLE tb_producto ADD CONSTRAINT tb_producto_pk PRIMARY KEY ( cod_pro );

CREATE TABLE tb_proveedor (
    cod_prov VARCHAR2(5 BYTE) NOT NULL,
    nom_prov VARCHAR2(30 BYTE),
    dir_prov VARCHAR2(50 BYTE),
    telefono VARCHAR2(9 BYTE)
);

ALTER TABLE tb_proveedor ADD CONSTRAINT tb_proveedor_pk PRIMARY KEY ( cod_prov );

CREATE TABLE tb_usuario (
    cod_usu    VARCHAR2(5 BYTE) NOT NULL,
    cod_emp    VARCHAR2(5 BYTE),
    nivel_usu  VARCHAR2(20 BYTE),
    contraseña VARCHAR2(20 BYTE),
    activo     VARCHAR2(20 BYTE),
    cod_emp_2  VARCHAR2(5 BYTE) NOT NULL
);

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario_pk PRIMARY KEY ( cod_usu );

ALTER TABLE tb_clientes
    ADD CONSTRAINT tb_clientes_tb_orden_pedido_fk FOREIGN KEY ( num_ordenpedido )
        REFERENCES tb_orden_pedido ( num_ordenpedido );

ALTER TABLE tb_empleado
    ADD CONSTRAINT tb_empleado_tb_orden_pedido_fk FOREIGN KEY ( num_ordenpedido )
        REFERENCES tb_orden_pedido ( num_ordenpedido );

ALTER TABLE tb_orden_pedido
    ADD CONSTRAINT tb_orden_pedido_tb_boleta_fk FOREIGN KEY ( num_boleta )
        REFERENCES tb_boleta ( num_boleta );

ALTER TABLE tb_producto
    ADD CONSTRAINT tb_producto_tb_categoria_fk FOREIGN KEY ( cod_cate )
        REFERENCES tb_categoria ( cod_cate );

ALTER TABLE tb_producto
    ADD CONSTRAINT tb_producto_tb_detalleorden_fk FOREIGN KEY ( tbdetord_id )
        REFERENCES tb_detalleorden ( tbdetord_id );

ALTER TABLE tb_producto
    ADD CONSTRAINT tb_producto_tb_proveedor_fk FOREIGN KEY ( cod_prov )
        REFERENCES tb_proveedor ( cod_prov );

ALTER TABLE tb_usuario
    ADD CONSTRAINT tb_usuario_tb_empleado_fk FOREIGN KEY ( cod_emp_2 )
        REFERENCES tb_empleado ( cod_emp );

CREATE SEQUENCE TBDETORD_TBDETORD_ID_SEQ 
START WITH 1
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TBDETORD_TBDETORD_ID_TRG 
BEFORE INSERT ON TB_DETALLEORDEN 
FOR EACH ROW 
WHEN (NEW.TBDETORD_ID IS NULL) 
BEGIN
:new.tbdetord_id := tbdetord_tbdetord_id_seq.nextval;

end;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0


-- -------------------------------------------------------------FUNCION 01-----------------------------------------------------------------------------------

SELECT * FROM tb_programacion;

CREATE OR REPLACE FUNCTION BONO_SOPORTE( VALOR VARCHAR)
    RETURN VARCHAR
IS
    BONO VARCHAR(50);
BEGIN
    BONO := ' ';
    IF VALOR ='1' THEN
        BONO:=' 15.00 Soles';
    ELSIF VALOR ='2' THEN
       BONO:=' 5.00 Soles'; 
    ELSIF VALOR ='3' THEN
        BONO:=' 5.00 Soles';
    ELSIF VALOR != BONO THEN
    BONO:='Ingresar codigo valido';
    END IF;
   
        RETURN BONO;
               
END BONO_SOPORTE;

-------- APLICACION 01---------

SELECT COD_SOPORTE,OBS,bono_soporte(COD_TIP_SOPORTE) as BONO FROM TB_SOPORTE;


--------- APLICACION 02-------
    
SELECT COD_TIP_SOPORTE,TIPO_SOPORTE, BONO_SOPORTE(TIPO_SOPORTE) AS BONO FROM tb_tipo_soporte;--- PRUEBA_ERROR-------



----------APLICACION 03 ------

SELECT P.COD_CLIENTE,C.NOMBRE_CLI, C.DNI_CLIENTE, S.COD_TIP_SOPORTE,S.OBS,BONO_SOPORTE(COD_TIP_SOPORTE) AS BONO
FROM tb_programacion P, tb_cliente C, tb_soporte S
WHERE C.COD_CLIENTE = p.cod_cliente AND p.cod_soporte = S.COD_SOPORTE;


----------APLICACION 04 -------

SELECT P.COD_CLIENTE,C.NOMBRE_CLI AS CLIENTE, C.DNI_CLIENTE, S.COD_TIP_SOPORTE,T.NOMBRE_TEC AS TECNICO,S.OBS AS OBSERVACION,BONO_SOPORTE(COD_TIP_SOPORTE) AS BONO
FROM tb_programacion P, tb_cliente C, tb_soporte S,tb_tecnico T
WHERE C.COD_CLIENTE = p.cod_cliente AND p.cod_soporte = S.COD_SOPORTE AND p.cod_tecnico=t.cod_tecnico;


-- -------------------------------------------------------------FUNCION 02-----------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION EDAD_PERSONA( VALOR date)
RETURN VARCHAR
    
IS
    FECHA date;
    EDAD1 NUMBER(10);
BEGIN
    
    
    SELECT FECH_NACIMIENTO_CLI INTO FECHA FROM TB_CLIENTE  WHERE  FECH_NACIMIENTO_CLI=VALOR;
    
        IF  VALOR = FECHA THEN
            EDAD1:= TRUNC( ( TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD')) -  TO_NUMBER(TO_CHAR(FECHA,'YYYYMMDD') ) ) / 10000);
            
        ELSE 
            EDAD1:= 'ERROR';
        END IF;
        RETURN EDAD1;
        
EXCEPTION

WHEN OTHERS THEN

RETURN 0;

END;

-------APLICACION-------
SELECT NOMBRE_CLI,FECH_NACIMIENTO_CLI,EDAD_PERSONA(FECH_NACIMIENTO_CLI) as EDAD FROM TB_CLIENTE;


-- -------------------------------------------------------------FUNCION 03-----------------------------------------------------------------------------------
create or replace function tiempo_soporte(cod varchar,fecha1  date,fecha2   date)
return number
is

dato1 tb_programacion.fech_prog_inicio%type;
dato2 tb_programacion.fech_prog_final%type;
dato3 number(4.2);
dato4 varchar(10):=cod;
begin
     select FECH_PROG_INICIO ,FECH_PROG_FINAL into dato1, dato2 from tb_programacion where   cod_programacion=dato4;
    if dato1= fecha1 then
    dato3:=to_number (24 * (dato2 - dato1));
    else 
    dato3:=0;
    end if;
return dato3;
end  tiempo_soporte;

------APLICACION----
SELECT P.cod_programacion,T.nombre_tec as tecnico ,P.FECH_PROG_INICIO,P.FECH_PROG_FINAL,tiempo_soporte( cod_programacion,FECH_PROG_INICIO,FECH_PROG_FINAL)as horas
FROM tb_programacion P, tb_tecnico T
WHERE P.cod_tecnico = T.cod_tecnico;



---------------------------------------------------------------- PROCEDIMIENTO ALMACENADO---------------------------------------------------------
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE datos_cliente(codigo in varchar2)

AS
    
    v_codigo varchar2(10):=codigo;
    v_cod_cliente       tb_cliente.cod_cliente%TYPE;
    v_nombre             tb_cliente.nombre_cli%TYPE;
    v_apellido_p         tb_cliente.ap_pat_cli%TYPE;
    v_apellido_m        tb_cliente.ap_mat_cli%TYPE;
    v_cod_direccion  tb_cliente.cod_direccion%TYPE;
    
    v_distrito           tb_direccion.distrito%TYPE;
    v_tipo_via          tb_direccion.tipo_via%TYPE;
    v_nom_via        tb_direccion.nom_via%TYPE;
    v_num_via        tb_direccion.num_via%TYPE;
    v_referencia    tb_direccion.referencia%TYPE;
    
BEGIN

            SELECT cod_cliente INTO v_cod_cliente FROM tb_cliente WHERE cod_cliente=v_codigo; 
            
            IF v_codigo = v_cod_cliente THEN
            
                SELECT  nombre_cli, ap_pat_cli, ap_mat_cli,cod_direccion INTO v_nombre, v_apellido_p,v_apellido_m,v_cod_direccion FROM
                tb_cliente WHERE cod_cliente=v_codigo;
            
                SELECT   distrito, tipo_via,nom_via,num_via,referencia INTO v_distrito, v_tipo_via,v_nom_via,v_num_via,v_referencia FROM
                tb_direccion where cod_direccion=v_cod_direccion;
            
                DBMS_OUTPUT.PUT_LINE('LOS DATOS DEL CLIENTE  ' || v_cod_cliente || ' SON: ');
                DBMS_OUTPUT.PUT_LINE( 'nombre: '||v_nombre|| ' ' || v_apellido_p|| ' ' ||v_apellido_m  );
                DBMS_OUTPUT.PUT_LINE(' ');
                DBMS_OUTPUT.PUT_LINE( 'DIRECCION : ');
                DBMS_OUTPUT.PUT_LINE('Distrito: '|| v_distrito);
                DBMS_OUTPUT.PUT_LINE(  v_tipo_via||'.  ' || v_nom_via|| ' N° '||v_num_via);
                DBMS_OUTPUT.PUT_LINE('REFERENCIA:   ');
                DBMS_OUTPUT.PUT_LINE(v_referencia);
       ELSE
            DBMS_OUTPUT.PUT_LINE( 'El codigo de cliente no existe 02');
        END IF;
EXCEPTION

    WHEN OTHERS THEN

DBMS_OUTPUT.PUT_LINE( 'El codigo de cliente no existe 02');
           
END DATOS_CLIENTE;

-----ELEMPLO DE APLICACION-----

execute datos_cliente('C1002');



------------------------------------------ PAQUETE MANTENIMIENTO DE TABLAS -------------------------------------------------


create or replace package   mantenimiento_tablas  as
procedure mantenimiento_tb_dir(valor in varchar2,codigo in varchar2,tipo_v in varchar2,nombre_v in varchar2,numero_v in varchar2, distr in varchar2,referen in varchar2, longi in varchar2, lati in varchar2);

procedure mantenimiento_tb_tip_soporte(valor in varchar2,codigo in varchar2,tip_soporte in varchar2);

procedure mant_tb_tecnico(valor in varchar, codigo in varchar, v_nombre_tec in varchar, v_ap_pat_tec in varchar, v_ap_mat_tec in varchar, v_dni_tecnico in varchar, v_celular_tec in varchar);

procedure mant_tb_soporte(valor in varchar,codigo in varchar, v_cod_tipo_soporte in varchar, v_obs in varchar);

procedure mant_tb_telefono_cli(valor in varchar, codigo in varchar, v_cod_cliente in varchar, v_telefono in varchar);

procedure mant_tb_cliente(valor in varchar, codigo in varchar, v_nombre_cli in varchar, v_ap_pat_cli in varchar, v_ap_mat_cli in varchar, v_dni in varchar , v_cod_direccion  in varchar, v_fech_naci in varchar);

procedure mant_tb_programacion(valor in varchar, codigo in varchar, v_cod_soporte in varchar, v_cod_tecnico in varchar, v_cod_cliente in varchar, v_fech_prog_inicio in varchar, v_fech_prog_final in varchar); 
end  mantenimiento_tablas;


--------------------------------------------------------------------BODY--------------------------------------------------------
create or replace package body  mantenimiento_tablas  as
    procedure mantenimiento_tb_dir(valor in varchar2,codigo in varchar2,tipo_v in varchar2,nombre_v in varchar2,numero_v in varchar2, distr in varchar2,referen in varchar2, longi in varchar2, lati in varchar2)
is
     insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
     
begin    

             if   insert_tabla= valor then --tb_direccion_insert 
         
            INSERT INTO tb_direccion VALUES (codigo,tipo_v,nombre_v,numero_v,distr, referen,longi,lati);

    elsif update_tabla=valor then  --tb_diereccion_update
    

                update tb_direccion set TIPO_VIA =  tipo_v where cod_direccion=codigo ;
        update tb_direccion set  NOM_VIA= nombre_v where cod_direccion=codigo ;
        update tb_direccion set NUM_VIA=numero_v where cod_direccion=codigo ;
        update tb_direccion set DISTRITO=distr where cod_direccion=codigo ;
        update tb_direccion set REFERENCIA=referen where cod_direccion=codigo ;
        update tb_direccion set LONGITUD=longi where cod_direccion=codigo ;
        update tb_direccion set LATITUD=lati where cod_direccion= codigo ;
        
    elsif delete_tabla= valor then --tb_diereccion_delete
    
        delete from tb_direccion where cod_direccion=codigo;
    else
        dbms_output.put_line('erroooorrr');
        end if;
end mantenimiento_tb_dir;


----------------------------------------------------TABLA TIPO SOPORTE
procedure  mantenimiento_tb_tip_soporte(valor in varchar2,codigo in varchar2,tip_soporte in varchar2)
is
     insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
     
begin
                 if   insert_tabla= valor then --tb_tipo_soporte =>insert 
         
            INSERT INTO TB_TIPO_SOPORTE VALUES (codigo,tip_soporte);

    elsif update_tabla=valor then  --tb_tipo_soporte =>update
    

        update TB_TIPO_SOPORTE set TIPO_SOPORTE=  tip_soporte where COD_TIP_SOPORTE=codigo ;


        
    elsif delete_tabla= valor then --tb_tipo_soporte =>delete
    
        delete from TB_TIPO_SOPORTE where COD_TIP_SOPORTE=codigo;
    else
        dbms_output.put_line('erroooorrr');
        end if;

end mantenimiento_tb_tip_soporte;
-------------------------------------------------------------- TB_TECNICO
     procedure mant_tb_tecnico(valor in varchar, codigo in varchar, v_nombre_tec in varchar, v_ap_pat_tec in varchar, v_ap_mat_tec in varchar, v_dni_tecnico in varchar, v_celular_tec in varchar)
     is
     
      insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
     
     begin
     
      if   insert_tabla= valor then --tb_tecnico =>insert 
         
            INSERT INTO TB_TECNICO VALUES (codigo,v_nombre_tec, v_ap_pat_tec, v_ap_mat_tec, v_dni_tecnico, v_celular_tec);

    elsif update_tabla=valor then  --tb_tecnico =>update
    
            update tb_tecnico set nombre_tec = v_nombre_tec   where cod_tecnico=codigo ;
            update tb_tecnico set  ap_pat_tec= v_ap_pat_tec where cod_tecnico=codigo ;
            update tb_tecnico set ap_mat_tec= v_ap_mat_tec where cod_tecnico=codigo ;
            update tb_tecnico set dni_tecnico= v_dni_tecnico where cod_tecnico=codigo ;
            update tb_tecnico set celular_tec= v_celular_tec where cod_tecnico=codigo ;

        


        
    elsif delete_tabla= valor then --tb_tecnico =>delete
    
        delete from tb_tecnico where cod_tecnico=codigo;
    else
        dbms_output.put_line('error');
        end if;
     
     end mant_tb_tecnico;
     
----------------------------------------------------------------TB_SOPORTE

procedure mant_tb_soporte(valor in varchar,codigo in varchar, v_cod_tipo_soporte in varchar, v_obs in varchar)
is
     insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
begin

     if   insert_tabla= valor then --tb_soporte =>insert 
         
            INSERT INTO TB_SOPORTE VALUES (codigo, v_cod_tipo_soporte, v_obs);

    elsif update_tabla=valor then  --tb_soporte =>update
    
            update tb_soporte set cod_tip_soporte = v_cod_tipo_soporte   where cod_soporte=codigo ;
            update tb_soporte set  obs= v_obs where cod_soporte=codigo ;


        


        
    elsif delete_tabla= valor then --tb_soporte => delete
    
        delete from tb_soporte where cod_soporte=codigo;
    else
        dbms_output.put_line('error');
        end if;
        
    
end mant_tb_soporte;
-----------------------------------------------------------------------TB_TELEFONO CLI


procedure mant_tb_telefono_cli(valor in varchar, codigo in varchar, v_cod_cliente in varchar,   v_telefono in varchar)
is
     insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
begin
    
    if   insert_tabla= valor then --tb_telefono_cli => insert 
         
            insert into tb_telefono_cli values (codigo,v_cod_cliente,v_telefono);

    elsif update_tabla=valor then  --tb_telefono_cli =>update
    
            update tb_telefono_cli set cod_cliente = v_cod_cliente   where cod_telefono=codigo ;
            update tb_telefono_cli set  telefono = v_telefono where cod_telefono=codigo ;


    elsif delete_tabla= valor then --tb_telefono_cli =>delete
    
        delete from tb_telefono_cli where cod_telefono=codigo;
    else
        dbms_output.put_line('error');
        end if;
    
end mant_tb_telefono_cli;

--------------------------------------------------------------------------- TB_CLIENTE


procedure mant_tb_cliente(valor in varchar, codigo in varchar, v_nombre_cli in varchar, v_ap_pat_cli in varchar, v_ap_mat_cli in varchar, v_dni in varchar , v_cod_direccion  in varchar, v_fech_naci in varchar)
is

     insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
begin   

        if   insert_tabla= valor then --tb_cliente => insert 
         
            insert into tb_cliente values (codigo,v_nombre_cli, v_ap_pat_cli, v_ap_mat_cli, v_dni,  v_cod_direccion, to_date( v_fech_naci,'DD/MM/YYYY'));

    elsif update_tabla=valor then  --tb_cliente =>update
    
            update tb_cliente set nombre_cli = v_nombre_cli   where cod_cliente=codigo ;
            update tb_cliente set  ap_pat_cli = v_ap_pat_cli where cod_cliente=codigo ;
            update tb_cliente set ap_mat_cli = v_ap_mat_cli where cod_cliente = codigo;
            update tb_cliente set dni_cliente = v_dni where cod_cliente = codigo;
            update tb_cliente set cod_direccion = v_cod_direccion where cod_cliente = codigo;
            update tb_cliente set fech_nacimiento_cli = to_date(v_fech_naci,'dd/mm/yyyy') where cod_cliente = codigo;
            
    elsif delete_tabla= valor then --tb_cliente =>delete
    
        delete from tb_cliente where cod_cliente=codigo;
    else
        dbms_output.put_line('error');
        end if;
    
    
end mant_tb_cliente;
---------------------------------------------------------------------TB_PROGRAMACION

procedure mant_tb_programacion(valor in varchar, codigo in varchar, v_cod_soporte in varchar, v_cod_tecnico in varchar, v_cod_cliente in varchar, v_fech_prog_inicio in varchar, v_fech_prog_final in varchar)
is
    insert_tabla varchar(2):='1';
     update_tabla varchar(2):='2';
     delete_tabla varchar(2):='3';
begin

            if   insert_tabla= valor then --tb_cliente => insert 
         
            insert into tb_programacion values (codigo,v_cod_soporte,v_cod_tecnico, v_cod_cliente,   to_date( v_fech_prog_inicio,'DD/MM/YYYY HH24:MI:SS'), to_date( v_fech_prog_final,'DD/MM/YYYY HH24:MI:SS') );

    elsif update_tabla=valor then  --tb_cliente =>update
    
            update tb_programacion set cod_soporte =v_cod_soporte, cod_tecnico=v_cod_tecnico,  cod_cliente= v_cod_cliente,
            fech_prog_inicio= to_date(v_fech_prog_inicio,'DD/MM/YYYY HH24:MI:SS'),  fech_prog_final=to_date(v_fech_prog_final,'DD/MM/YYYY HH24:MI:SS') where cod_programacion=codigo ;

            
    elsif delete_tabla= valor then --tb_cliente =>delete
    
        delete from tb_programacion where cod_programacion=codigo;
    else
        dbms_output.put_line('error');
        end if;

end mant_tb_programacion;
end mantenimiento_tablas;


----EJEMPLO DE APLICACION------

begin
  mantenimiento_tablas.mantenimiento_tb_dir('3','D006','Av','Grau','111','Ica',' Mediacuadra de la Plaza de Armas','14000','75000');
end;

commit;

