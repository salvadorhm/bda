.mode column
.headers on

CREATE VIEW vista_ventas AS
Select ventas.id_venta, clientes.nombre, ventas.fecha, productos.producto, detalle_ventas.cantidad_producto, detalle_ventas.precio_unitario, detalle_ventas.total_x_producto
from clientes, productos, detalle_ventas, ventas
where clientes.id_cliente = ventas.id_cliente and detalle_ventas.id_venta = ventas.id_venta and productos.id_producto = detalle_ventas.id_producto
order by ventas.id_venta;