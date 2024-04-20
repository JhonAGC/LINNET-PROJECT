# Proyecto: Optimización de Base de Datos en Oracle con PL/SQL

---

## Descripción del Proyecto

Este proyecto se centra en la optimización de una base de datos Oracle utilizando PL/SQL. Se han utilizado procedimientos almacenados, triggers y paquetes para mejorar el rendimiento, la eficiencia y la integridad de los datos.

## Objetivos

- Optimizar el rendimiento de la base de datos.
- Mejorar la eficiencia de las consultas.
- Garantizar la integridad de los datos.

## Tecnologías Utilizadas

- Oracle Database
- PL/SQL
- Procedimientos Almacenados
- Triggers
- Paquetes

## Funcionalidades Implementadas

1. **Procedimientos Almacenados:**
   - Se han creado procedimientos almacenados para realizar operaciones específicas en la base de datos, como inserciones, actualizaciones y eliminaciones, de manera eficiente.

2. **Triggers:**
   - Se han implementado triggers para automatizar acciones en la base de datos, como validaciones de datos, actualizaciones de campos y auditoría de cambios.

3. **Paquetes:**
   - Se ha utilizado la funcionalidad de paquetes para agrupar y organizar lógicamente los objetos PL/SQL relacionados, facilitando su mantenimiento y reutilización.

## Estructura del Proyecto

El proyecto está estructurado de la siguiente manera:


- **sql_scripts/procedimientos.sql:** Contiene los procedimientos almacenados implementados en el proyecto.
- **sql_scripts/triggers.sql:** Contiene los triggers implementados en el proyecto.
- **sql_scripts/paquetes.sql:** Contiene los paquetes implementados en el proyecto.

## Procedimientos Almacenados

### Procedimiento 1: `datos_cliente`

Este procedimiento devuelve los datos de un cliente.

```sql
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
           
END datos_cliente;
