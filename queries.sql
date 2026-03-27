select 1
--Base de datos
create database EmpresaDB
use EmpresaDB

--Tabla Ventas
create table Ventas (ID INT PRIMARY KEY,Producto varchar(50),Precio decimal(10,2),Cantidad int,Fecha date)
-- Insertar datos
insert into Ventas (ID, Producto, Precio, Cantidad, Fecha)
values
(1, 'Polo', 50, 2, '2024-01-10'),
(2, 'Camisa', 80, 1, '2024-01-11'),
(3, 'Polo', 50, 3, '2024-01-12'),
(4, 'Casaca', 120, 1, '2024-01-13')

select * from Ventas 


--Tabla Clientes
CREATE TABLE Clientes (
ClienteID int Primary key,
Nombre varchar(50),
Ciudad varchar(50),)
-- Insertar datos
insert into Clientes (ClienteID, Nombre, Ciudad)
values (1,'Juan','Lima'),
(2, 'Maria', 'Arequipa'),
(3, 'Carlos', 'Lima')

select * from Clientes

alter table Ventas add ClienteID int

update Ventas SET ClienteID =1 where ID =1;
update Ventas SET ClienteID =2 where ID =2;
update Ventas SET ClienteID =3 where ID =3;
update Ventas SET ClienteID =1 where ID =4

-- Total de Ventas
select SUM(Precio * Cantidad) as TotalVentas
from Ventas

-- Ventas por Producto
select Producto, sum(Precio * Cantidad) as TotalVentas from Ventas group by Producto


select
c.Nombre,
c.Ciudad,
v.Producto,
v.Precio,
v.Cantidad
from Ventas v
inner join Clientes c
on v.ClienteID = c.ClienteID

-- Ventas por cliente
select 
c.Nombre, sum(v.Precio * v.Cantidad) as TotalComprado from Ventas v inner join Clientes c on v.ClienteID = c.ClienteID group by c.Nombre

-- Ventas por ciudad
select
c.Ciudad, sum(v.Precio * v.Cantidad) as TotalCiudad from Ventas v inner join Clientes c on v.ClienteID = c.ClienteID group by c.Ciudad

-- Resultado por cliente y ciudad orden desendente
select
c.Ciudad,
c.Nombre,
sum(v.Precio * v.Cantidad) as TotalComprado from Ventas v inner join Clientes c on v.ClienteID = c.ClienteID group by c.Ciudad, c.Nombre order by TotalComprado desc

select sum(Precio * Cantidad) as TotalEmpresa
from Ventas

-- Porcentaje por cliente
select c.Nombre,
sum(v.Precio * v.Cantidad) as TotalCliente, sum(v.Precio * v.Cantidad) * 100.0 / (select sum(Precio * Cantidad) from Ventas) as Porcentaje
from Ventas v inner join Clientes c on v.ClienteID = c.ClienteID group by c.Nombre order by TotalCliente desc

