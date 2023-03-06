/*Crearemos la base de datos Hospital*/
DROP DATABASE IF EXISTS `hospital`;
CREATE DATABASE IF NOT EXISTS `hospital`;
use hospital;

DROP TABLE IF EXISTS consultorio;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS obra_Social;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS tipo_matricula;
DROP TABLE IF EXISTS especialidad;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS recepcionista;
DROP TABLE IF EXISTS tipo_Reserva;
DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS ambulancia;
DROP TABLE IF EXISTS hospital;

create table consultorio(
Id_Consultorio int auto_increment not null primary key,
Nombre_Consultorio varchar(100),
Domicilio_Consultorio varchar(100),
Telefono_Consultorio int,
Mail_Consultorio varchar(100)
);

create table tipo_Factura(
Id_Tipo_Factura int auto_increment not null primary key,
Tipo_Factura varchar(100)
);

create table factura(
Id_Factura int auto_increment not null primary key,
Id_Tipo_Factura int,
Sucursal varchar(100),
Detalle_Factura varchar(100),
Importe_Factura decimal,
Fecha_Factura date,
foreign key (Id_Tipo_Factura) references tipo_Factura(Id_Tipo_Factura)
);

create table proveedor(
Id_Proveedor int auto_increment not null primary key,
Id_Factura int,
Cuit_Proveedor int,
Nombre_Proveedor varchar(100),
Telefono_Proveedor int,
foreign key (Id_Factura) references factura(Id_Factura)
);

create table obra_Social (
Id_Obra_Social int auto_increment not null primary key,
Tipo_Obra_Social varchar (100)
);

create table paciente (
Id_Paciente int auto_increment not null primary key,
Nombre_Paciente varchar(100),
Apellido_Paciente varchar(100),
Telefono_Paciente int,
Id_Obra_Social int,
Mail_Paciente varchar(100),
Fecha_Nacimiento_Paciente date,
foreign key  (Id_Obra_Social) references obra_Social(Id_Obra_Social)
);

create table personal (
Legajo 	int not null primary key,
Nombre_Personal varchar(100),
Apellido_Personal varchar(100),
Telefono_Personal int,
Domicilio_Personal varchar(100),
Mail_Personal varchar(100)
);

create table tipo_matricula (
Id_Tipo_Matricula int auto_increment not null primary key,
Tipo_Matricula varchar (100)
);

create table especialidad (
Id_Especialidad int auto_increment not null primary key,
Especialidad varchar (100)
);

create table doctor(
Id_Doctor int  auto_increment not null primary key,
Legajo int ,
Id_Tipo_Matricula int,
Matricula int,
Id_Especialidad int,
foreign key (Legajo) references personal (Legajo),
foreign key (Id_Tipo_Matricula) references tipo_matricula (Id_Tipo_Matricula),
foreign key (Id_Especialidad) references especialidad (Id_Especialidad)
);

create table recepcionista (
Id_Recepcionista int auto_increment not null primary key,
Legajo int,
Rol_Designado varchar(100),
foreign key (Legajo) references personal(Legajo)
);

create table tipo_Reserva(
Id_Tipo_Reserva int auto_increment not null primary key,
Descripcion_Reserva varchar(100)
);

create table reserva (
Id_Reserva int auto_increment not null primary key,
Id_Tipo_Reserva int,
Id_Recepcionista int,
Hora_Reserva datetime,
Pago_Reserva decimal,
foreign key (Id_Recepcionista) references recepcionista (Id_Recepcionista),
foreign key (Id_Tipo_Reserva) references Tipo_Reserva(Id_Tipo_Reserva)
);

create table ambulancia (
    Id_Ambulancia INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Modelo VARCHAR(100),
    Patente VARCHAR(100)
);







create table hospital(
Id_Hospital int auto_increment not null primary key,
Id_Consultorio int,
Id_Proveedor int,
Id_Paciente int,
Id_Doctor int,
Id_Recepcionista int,
Id_Ambulancia int,
foreign key (Id_Consultorio) references consultorio(Id_Consultorio),
foreign key (Id_Proveedor) references proveedor(Id_Proveedor),
foreign key (Id_Paciente) references paciente(Id_Paciente),
foreign key (Id_Doctor) references doctor(Id_Doctor),
foreign key (Id_Recepcionista) references recepcionista(Id_Recepcionista),
foreign key (Id_Ambulancia) references ambulancia(Id_Ambulancia)
);



/*VAMOS A INSERTAR DATOS DE LOS CONSULTORIOS*/
insert into consultorio(Nombre_Consultorio, Domicilio_Consultorio, Telefono_consultorio, Mail_Consultorio) values
("Hospital Roca", "Avenida Montevideo 168",1122556688,"hospRoca@Outlook.com"),
("Hospital Flores", "Avenida Los Pasos 115",35489967,"hospFlores@Outlook.com"),
("Hospital Cuidados Graves", "Avenida Hidalgo 487",1145779368,"hospCuidadosGraves@Outlook.com"),
("Hospital Jose San Martin", "Triunbirato 500",1144751986,"hospJoseSanMartin@Outlook.com"),
("Hospital Duran", "Vera 100",1144778844,"hospDuran@Outlook.com");


/*VAMOS A INSERTAR DATOS DEL TIPO DE FACTURA*/
insert into tipo_Factura (Tipo_Factura)values
("Factura C"),
("Factura A"),
("Factura B");

/*VAMOS A INGRESAR LOS DATOS DE LA FACTURA*/
insert into  factura (Id_Tipo_Factura,Sucursal, Detalle_Factura, Importe_Factura, Fecha_Factura) values
(1,"Lomas", "Atencion Kinesiologo", 10000, "2023-02-06"),
(2,"Paternal", "Atencion Odontologia", 30000, "2023-03-22"),
(3,"Avellaneda", "Traslado Ambulancia", 50000, "2023-04-30"),
(1,"Puerto Madero", "Traslado Ambulancia", 50000, "2023-11-22"),
(2,"Avellaneda", "Atencion Odontologica ", 80000, "2023-07-11");


/*VAMOS A INSERTAR LOS DATOS DEL PROVEEDOR*/
insert into proveedor (Id_Factura, Cuit_Proveedor,Nombre_Proveedor, Telefono_Proveedor) values 
(1,20-33445566-2 ,"Adrian Gonzales", 1135684711),
(2,22-33551578-2 ,"Alan Varela", 1544661100),
(3,28-33554477-2, "Nicolas Orsini", 1589898966),
(4,30-33464492-2, "Oscar Romero", 1122337788),
(5,30-54666656-1, "Dario Benedetto", 1165889925);


/*VAMOS A INSERTAR DATOS DE LA OBRA SOCIAL*/
insert into obra_Social (Tipo_Obra_Social) values
("PARTICULAR"),
("OSDE"),
("PAMI"),
("GALENO"),
("DOSUBA");



/* VAMOS A INSERTAR PACIENTES*/

insert into paciente (Nombre_Paciente, Apellido_Paciente, Telefono_Paciente, Id_Obra_Social, Mail_Paciente, Fecha_Nacimiento_Paciente) values 
("Sebastian", "Meister", 1144668899, 1, "Sebastian@hotmail.com", "1989-05-01"),
("Fabian", "De la Madrid", 115512345,2, "Fabian@hotmail.com", "1870-06-02"),
("German", "Garmendia", 1165887700,3, "Sebastian@hotmail.com", "1877-07-03"),
("Natalia", "Corro", 1100002211,4, "Fernanda@hotmail.com", "1866-08-04"),
("Lucas", "Vasconi", 1545779012,5, "Lucas@hotmail.com", "1997-11-20");

/*VAMOS A INSERTAR DATOS PERSONALES*/
insert into personal (Legajo, Nombre_Personal, Apellido_Personal, Telefono_Personal, Domicilio_Personal, Mail_Personal) values 
(210211, "Agustin", "Lopez", 1164656465, "Av Corrientes 1154", "Agustin@gmail.com"),
(16554, "Fermin", "Alonso", 1165489688, "Combatientes 11", "Fermin@gmail.com"),
(211123, "Ignacio", "Liz", 1534887799, "Av Cordoba 1654", "Ignacio@gmail.com"),
(225546, "Alberto", "Osman", 1155554326, "Los toros 1144", "Alberto@gmail.com"),
(245689, "Jose", "Lito", 1133665566, "Anchorena 66", "Jose@gmail.com"),
(154689, "Lucas", "Perez", 1145889672, "Berutti 10", "LucaS@gmail.com"),
(249865, "Ramiro", "Fernandez", 1133102546, "Uriburu 1110", "Ramiro@gmail.com"),
(215546, "Natalia", "Franchini", 1156874963, "Cordoba 110", "Natalia@gmail.com"),
(265893, "Alejandra", "Franco", 1187956482, "Honduras 100", "Alejandra@gmail.com"),
(214589, "Karina", "Gil", 1177589685, "Pasteur 200", "Karina@gmail.com")
;

/*VAMOS A INSERTAR DATOS DE TIPO MATRICULA  */
insert into tipo_matricula (Tipo_Matricula) values
("Nacional"),
("Provincial");

/*VAMOS A INSERTAR DATOS DE LA ESPECIALIDAD*/
insert into especialidad (especialidad) values 
("Traumatologia"),
("Kinesiologia"),
("Odontologia"),
("Oftalmologia"),
("Urologia");



/*VAMOS A INSERTAR DATOS DEL DOCTOR*/
insert into doctor (Legajo, Id_Tipo_Matricula, Matricula, Id_Especialidad) values 
(210211, 1, 4568,1),
(16554, 2, 5544,2),
(211123, 1, 4896,3),
(225546,2, 4892,4),
(245689,  1, 4875,5);


/*VAMOS A INSERTAR DATOS DE LOS/AS RECEPCIONISTAS*/

insert into recepcionista (Legajo,Rol_Designado) values
(154689,"Atencion al publico"),
(249865,"Archivo"),
(215546 ,"Calendario Medico"),
(265893, "Liempieza"),
(214589, "Jefa de personal");


/*VAMOS A INSERTAR DATOS DEL TIPO RESERVA*/
insert into tipo_reserva (Descripcion_Reserva) values 
("Turno programado para Operacion"),
("Turno programado por urgencia"),
("Turno programado por ingreso a un nuevo trabajo"),
("Turno programado por examen medico"),
("Turno programado por control")
;


/*VAMOS A INSERTAR DATOS DE LA RESERVA*/
insert into reserva (Id_Tipo_Reserva, Id_Recepcionista, Hora_Reserva, Pago_Reserva) values 
(1,1,"2023-01-20 11:00", 1564.00),
(2,2,"2023-02-20 12:00", 1100.00),
(3,3,"2023-03-20 15:00", 00.00),
(4,4,"2023-04-20 17:00", 1500.00),
(5,5,"2023-05-20 10:00", 2000.00)
;


 
/*VAMOS A INSERTAR LOS DATOS DE LA TABLA AMBULANCIA*/
insert into ambulancia (Modelo, Patente) values 
("PEUGEOT","ACD546"),
("MERCEDES","JFW879"),
("RANGER","ASD578"),
("FORD","KOL134"),
("PALIO","ACK551")
;


/*VAMOS A INGRESAR LOS VALORES DE LA TABLA HOSPITAL*/
insert into hospital(Id_Consultorio, Id_Proveedor,Id_Paciente, Id_Doctor,Id_Recepcionista, Id_Ambulancia) values 
(1,1,1,1,1,1),
(2,2,2,2,2,2),
(3,3,3,3,3,3),
(4,4,4,4,4,4),
(5,5,5,5,5,5);



/*/////////////////////////////////////////////////////////////////////////*/
/*CREAMOS LAS TABLAS VISTA*/

/*TABLA CON LOS DATOS DE LAS AMBULANCIAS DISPONIBLES*/
create or replace view ambulancia_vista  as
select Modelo, Patente
from ambulancia
order by Patente desc;



/*TABLA CON LA LISTA DEL PERSONAL DISPONIBLE*/
create or replace view personal_vista as
select Legajo, Apellido_Personal, Nombre_Personal
from personal
order by Legajo asc;


/*TABLA CON LA LISTA DE PROVEEDORES*/
create or replace view proveedor_vista as
select Id_Proveedor, Nombre_Proveedor, Cuit_Proveedor
from proveedor
order by Nombre_Proveedor asc;


/*TABLA DE LAS OBRAS SOCIALES CARGADAS*/
create or replace view obra_social_cargadas as
select Id_Obra_Social, Tipo_Obra_Social 
from obra_social
order by Id_Obra_Social;



/*TABLA DE LE LAS ACTIVIDAD DE LOS RECEPCIONSITAS*/
create or replace view recepcionista_vista as
select Legajo, Rol_Designado
from recepcionista
order by Legajo asc;



/*TABLA DE LAS LISTAS DE LOS RECEPCIONISTAS*/
create or replace view datos_recepcionistas as
(select p.Legajo, p.Nombre_Personal, p.Apellido_Personal, r.Rol_Designado
from personal as p inner join recepcionista as r
on p.Legajo = r.Legajo
);


/*TABLA DE LOS DATOS DEL DOCTOR*/
create or replace view datos_doctor as
(select d.Id_Doctor, d.Legajo, d.Matricula, e.Tipo_Matricula
from doctor as d  inner join tipo_matricula as e
on d.Id_Tipo_Matricula = e.Id_Tipo_Matricula
);


/****************************************************************************************************/
/*CREAMOS LAS FUNCIONES*/


/*FUNCION DONDE JUNTA LOS NOMBRES COMPLETOS DE LOS EMEPLEADOS*/

delimiter //
CREATE DEFINER=`root`@`localhost` FUNCTION `Juntar_Nombres`(Nombre_Personal VARCHAR(100), Apellido_Personal VARCHAR(100)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    declare Nombre_Completo VARCHAR(100);
    set Nombre_Completo = Concat(Nombre_Personal, " ", Apellido_Personal);
    return Nombre_Completo ;
END
//
SELECT Juntar_Nombres(Nombre_Personal, Apellido_Personal) AS Nombre_Completo FROM personal;

/*FUNCION DONDE DAMOS UNA BIENVENIDA A LOS PACIENTES */
delimiter //
CREATE DEFINER=`root`@`localhost` FUNCTION `Bienvenida`(Nombre_Paciente varchar(100), Apellido_Paciente varchar(100), Mail_Paciente varchar(100)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
		DECLARE Nombre_Completo varchar (100);
        set Nombre_Completo = concat(Nombre_Paciente, " ", Apellido_Paciente);
        if Mail_Paciente is NOT NULL then
        Return concat ("FUE AGENDADO CON EXITO SEÑOR/A: ", Nombre_Completo);
        ELSE
        Return "Usted no tiene registrado el coreo";
        end if;
END
//

select Bienvenida(Nombre_Paciente, Apellido_Paciente,Mail_Paciente) as Bienvenida FROM paciente;




/***************************************************************************************************/

/*STORED PROCEDURES para ordenar columnas
Agarramos la tabla domicilio y/o nombre y lo pasamos como paramentro
despues ponemos Ascendente o Descendente dependiendo lo que queramos y lo damos como parametro*/
DELIMITER //
CREATE PROCEDURE `ordenar_columnas`(in campo varchar(100), orden varchar(100))
BEGIN

			if (campo = "nombre") then
				 if (orden = "Ascendente") then
					select Nombre_Consultorio from hospital.consultorio order by Nombre_Consultorio asc;
					else
					select Nombre_Consultorio from hospital.consultorio order by Nombre_Consultorio desc;
				
                end if;
			end if;
			if (campo = "domicilio") then 
				 if (orden="Ascendente") then
					select Domicilio_Consultorio from hospital.consultorio  order by Domicilio_Consultorio asc;
				else 
					select Domicilio_Consultorio from hospital.consultorio order by Domicilio_Consultorio desc;
					
                end if;
			end if;
END
//

/*Aca llamamos a la columna nombre con orden Ascendente*/
CALL ordenar_columnas("nombre", "Ascendente");
/*Aca llamamos a la columna nombre con orden Descendente*/
CALL ordenar_columnas("nombre", "Descendente");
/*Aca llamamos a la columna domicilio con orden Ascendente*/
CALL ordenar_columnas("domicilio", "Ascendente");
/*Aca llamamos a la columna domicilio con orden Descendente*/
call ordenar_columnas("domicilio", "Descendente");



/*Stored Procedures Para ingresar datos en la  tabla ambulancia*/
DELIMITER //
CREATE PROCEDURE `Ingresar_Ambulancia`(
in modelo varchar(100), 
in patente varchar(100))
BEGIN

        insert into ambulancia (Modelo, Patente) value (modelo, patente);
        
END
//
/*En este caso vamos a colocar los datos que queremos ingresar*/
call Ingresar_Ambulancia("CLIO","LKO879");


/***********************************************************************************/

/*TRIGGERS TABLA 1*/

/*En caso que nosotros ya creamos los trigger, vamos a ejecutar esta eliminacion de datos, tablas y trigger, sino no se ejecuta*/
drop table if exists trigger_personal;
drop trigger if exists Personal_Insert;
drop trigger if exists Personal_Eliminacion;
delete from personal where Legajo= 111222;

/*TRIGGERS DE PERSONAL*/
/*CREAMOS UNA TABLA PARA GUARDAR MIS TRIGGERS*/
create table trigger_personal (
Id_Trigger int auto_increment not null primary key,
Nombre_Personal varchar (100),
Apellido_Personal varchar (100),
accion varchar (100),
Legajo int,
fecha datetime,
usuario varchar (100)
);

/*Ahora vamos a hacer un trigger para la INSERCION de datos Nuevos*/
delimiter //
create trigger Personal_Insert
after insert on personal
for each row 
begin 
	insert into trigger_personal (Nombre_Personal, Apellido_Personal,accion,Legajo, fecha,usuario) values (new.Nombre_Personal, New.Apellido_Personal,"insert",new.Legajo, now(), system_user());
end
//

/*Realizamos la Insercion de datos del usuario nuevo*/
insert into personal (Legajo, Nombre_Personal, Apellido_Personal, Telefono_Personal, Domicilio_Personal, Mail_Personal) values 
(111222, "German","Lewis",1144446666 , "SanBlas 2279", "GLewis@Gmail.com");


/*Ahora si creamos un trigger pero para una ELIMINACION*/
delimiter //
create trigger Personal_Eliminacion
before delete on personal
for each row
begin
		insert into trigger_personal (Nombre_Personal, Apellido_Personal, accion, Legajo, fecha,usuario) values (null, null, "delete", null, now(), system_user());
end
//

/*Procedemos a eliminar el registro anteriormente creado*/
delete from personal where Legajo= 111222;





/*TRIGGERS TABLA 2*/
/*En caso que nosotros ya creamos los trigger, vamos a ejecutar esta eliminacion de datos, tablas y trigger, sino no se ejecuta*/
drop table if exists trigger_paciente;
drop trigger if exists Paciente_Insert;
drop trigger if exists Paciente_Eliminacion;
delete from paciente where Id_Paciente= 6;

/*TIGGERS DE PACIENTES*/
/*CREAMOS UNA TABLA SECUNDARIA DE PACIENTES*/
create table trigger_paciente (
Id_TP int auto_increment not null primary key,
Nombre_Paciente varchar (100),
Apellido_Paciente varchar (100),
accion varchar (100),
Id_Paciente int,
fecha datetime,
usuario varchar (100)
);

/*Ahora vamos a hacer un trigger para la INSERCION de datos Nuevos*/
delimiter //
create trigger Paciente_Insert
after insert on paciente
for each row 
begin 
	insert into trigger_paciente (Nombre_Paciente, Apellido_Paciente,accion,Id_Paciente, fecha,usuario) values (new.Nombre_Paciente, New.Apellido_Paciente,"insert",new.Id_Paciente, now(), system_user());
end
//

/*Realizamos la Insercion de datos del usuario nuevo*/
insert into paciente (Nombre_Paciente, Apellido_Paciente, Telefono_Paciente, Id_Obra_Social, Mail_Paciente,Fecha_Nacimiento_Paciente) values 
("Martin","Palermo",1111111111,1,"Palermo@gmail.com", "1911-01-01");



/*Ahora si creamos un trigger pero para una ELIMINACION*/
delimiter //
create trigger Paciente_Eliminacion
before delete on paciente
for each row
begin
		insert into trigger_paciente(Nombre_Paciente, Apellido_Paciente,accion,Id_Paciente, fecha,usuario) values (null, null,"delete",null, now(), system_user());
end
//

/*Procedemos a eliminar el registro anteriormente creado*/
delete from paciente where Id_Paciente = 6;

/*//////////////////////////////////////////////////////////////////////*/


/*VAMOS A CREAR 2 USUARIOS NUEVOS */
/*Primero eliminamos a estos nuevos usuarios para corroborar que no tenemos otros usuarios creados con el mismo nombre*/
drop user if exists "Lectura";
Drop user if exists "Modificacion";
/*Ahora si, creamos nuestros nuevos dos usuarios*/
create user if not exists "Lectura" identified by "lectura";
create user if not exists "Modificacion" identified by "modificacion";

/*El primero tendra permisos de LECTURA*/
grant select on * to "Lectura";

/*El segundo tendra permisos de LECTURA, INSERCION Y MODIFICACION*/
grant select, insert, update on * to "Modificacion";

/*Ninguno va a poder ELIMINAR*/






/*//////////////////////////////////////////////////////////////////////////*/
/*VAMOS A HACER SUBLENGUAJE TCL*/

/*TABLA 1*/
select @@autocommit;
set autocommit= 0;

/*VAMOS A ELIMINAR LOS ULTIMOS REGISTROS DE LA TABLA CONSULTORIO*/
start transaction;
/* Deshabilitar verificación de llaves foráneas*/
SET FOREIGN_KEY_CHECKS = 0;
delete from consultorio where Id_Consultorio = 5;
delete from consultorio where Id_Consultorio = 3;
delete from consultorio where Id_Consultorio = 4;
/*Rehabilitar verificación de llaves foráneas*/
SET FOREIGN_KEY_CHECKS = 1;
/*Ahora usamos el Rollback para revertir las eliminaciones que se hicieron anteriormente*/
rollback;
/*Ahora vamos a guardar los cambios de forma permanente, nuestra tabla va a quedar como en el comienzo*/
commit;
/*El tema de la des habilitación de la verificación de llaves foráneas lo tuve que hacer porque me aparecía el error:
Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`hospital`.`hospital`, CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`Id_Consultorio`) REFERENCES `consultorio` (`Id_Consultorio`))	0.000 sec
y sin este paso no podía eliminar registros*/


/*En caso que este mal lo anterior, realice una inserción de registros la cual se me permitía hacer sin ningún tipo de problema*/
start transaction;
/*Insertamos datos nuevos*/
insert  into consultorio (Nombre_Consultorio, Domicilio_Consultorio, Telefono_Consultorio, Mail_Consultorio) values 
("Hospital Prueba 1", "Siempreviva  100", "11111111", "prueba1@gmail.com");
insert  into consultorio (Nombre_Consultorio, Domicilio_Consultorio, Telefono_Consultorio, Mail_Consultorio) values 
("Hospital Infectados", "Bolivar 200", "1132222222", "Infectados@gmail.com");
insert  into consultorio (Nombre_Consultorio, Domicilio_Consultorio, Telefono_Consultorio, Mail_Consultorio) values 
("Hospital Santa Barbara", "Chile 1000", "1124558888", "SantaBarbara@gmail.com");
/*Ahora hacemos un Rollback para revertir estas inserciones*/
rollback;
/*Y ahora hacemos un Commit para guardar los cambios, quedaría como en el comienzo*/
commit;




/*TABLA 2*/
start transaction;
insert into ambulancia (Modelo, Patente) values 
("FORD","ACV111");
insert into ambulancia (Modelo, Patente) values 
("NISSAN","BCV114");
insert into ambulancia (Modelo, Patente) values 
("TOYOTA","AND129");
insert into ambulancia (Modelo, Patente) values 
("BMW","ADD111");
savepoint lote_1;
insert into ambulancia (Modelo, Patente) values 
("KIA","ADA181");
insert into ambulancia (Modelo, Patente) values 
("MERCEDES","CJK455");
insert into ambulancia (Modelo, Patente) values 
("HYUNDAI","CVD456");
insert into ambulancia (Modelo, Patente) values 
("CITROEN","ABC123");
savepoint lote_2;

/*Ahora con esto vamos a eliminar el savepoint del lote 1*/
release savepoint lote_1; 


/*Ahora en caso de que queramos que no se impacte lo anterior, vamos a realizar un rollback*/
rollback;
/*Y UN COMMIT para que no guarde*/
commit;
