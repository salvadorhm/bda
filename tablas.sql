CREATE TABLE clientes (
    id_cliente integer PRIMARY KEY AUTOINCREMENT,
    nombre varchar(50),
    email varchar(50)
);

CREATE TABLE productos (
    id_producto integer PRIMARY KEY AUTOINCREMENT,
    producto  varchar(50),
    categoria varchar(50) check(categoria='blancos' or categoria='vinos y licores' or categoria='congelados'),
    precio_unitario float check(precio_unitario>=10 and precio_unitario<=1000),
    existencias integer check (existencias>=0 and existencias<=100),
    unidad varchar(10) check (unidad in ('pieza','caja'))
);

CREATE TABLE ventas(
    id_venta integer PRIMARY KEY AUTOINCREMENT,
    fecha text,
    id_cliente integer REFERENCES clientes(id_cliente)
);

CREATE TABLE detalle_ventas(
    id_detalle_venta integer PRIMARY KEY AUTOINCREMENT,
    id_venta integer REFERENCES ventas(id_venta),
    id_producto integer REFERENCES productos(id_producto),
    cantidad_producto integer,
    precio_unitario float,
    total_x_producto float
);

.mode csv

.import clientes.csv clientes
.import productos.csv productos
.import ventas.csv ventas
.import detalle_ventas.csv detalle_ventas

.mode column
.headers on

SELECT * FROM clientes limit 5;
SELECT * FROM productos limit 5;
SELECT * FROM ventas limit 5;
SELECT * FROM detalle_ventas limit 5;


Select clientes.nombre, productos.producto, detalle_ventas.cantidad_producto, detalle_ventas.precio_unitario, detalle_ventas.total_x_producto
from clientes, productos, detalle_ventas
where clientes.id_cliente = ventas.id_cliente and detalle_ventas.id_venta = ventas.id_venta and productos.id_producto = detalle_ventas.id_producto;