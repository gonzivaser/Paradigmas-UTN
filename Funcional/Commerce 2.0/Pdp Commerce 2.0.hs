-- FUNCION APLICAR DESCUENTO
aplicarDescuento :: Float -> Float -> Float
aplicarDescuento precioUnitario descuento = precioUnitario - (precioUnitario * (descuento / 100))


-- FUNCION APLICAR COSTO DE ENVIO 
aplicarCostoDeEnvio :: Float -> Float -> Float 
aplicarCostoDeEnvio unPrecio costoDeEnvio = unPrecio + costoDeEnvio


-- FUNCION ES PRODUCTO DE LUJO
esProductoDeLujo :: String -> Bool 
esProductoDeLujo unProducto = elem 'x' unProducto || elem 'z' unProducto


-- FUNCION ES PRODUCTO CODICIADO 
esProductoCodiciado :: String -> Bool 
esProductoCodiciado nombreDeProducto = length nombreDeProducto > 10


-- FUNCION ES PRODUCTO CORRIENTE
esProductoCorriente :: String -> Bool 
esProductoCorriente nombreDeProducto = head nombreDeProducto == 'A' || head nombreDeProducto == 'E' || head nombreDeProducto == 'I' || head nombreDeProducto == 'O' || head nombreDeProducto == 'U' 


-- FUNCION ENTREGA SENCILLA 
cantidadDeLetras :: String -> Int
cantidadDeLetras palabra = length palabra 
 
entregaSencilla :: String -> Bool 
entregaSencilla unaFecha = (even.cantidadDeLetras) unaFecha 


-- FUNCION ES PRODOCUTO DE ELITE 
esProductoDeElite :: String -> Bool 
esProductoDeElite unProducto = esProductoDeLujo unProducto && esProductoCodiciado unProducto && esProductoCorriente unProducto


-- FUNCION ES PRODUCTO XL 
esProductoXL :: String -> String
esProductoXL unProducto = unProducto ++ "XL"


-- FUNCION PRECIO TOTAL
precioTotal :: Float -> Float -> Float -> Float -> Float 
precioTotal unPrecioUnitario unaCantidad unDescuento unCostoDeEnvio = 
    (aplicarCostoDeEnvio unCostoDeEnvio . aplicarDescuento unDescuento) (unPrecioUnitario * unaCantidad)

-- aplicarDescuento unPrecioUnitario unDescuento 
-- aplicarCostoDeEnvio una vez que tenga el precio con descuento --> unPrecioUnitario unCostoDeEnvio
-- Cantidad: unPrecioUnitario * unaCantidad 
-- QUE HICIMOS ACA? APLICO EL COSTO DE ENVIO CON "UN COSTO DE ENVIO" + MI OTRO PARAMETRO QUE SERIA EL PRECIO
-- PERO PARA EL PRECIO TENGO DOS PARAMETRO, QUE SON "DESCUENTO" Y EL PRECIO, PERO TAMBIEN TENGO UNA CANTIDAD
-- ENTONCES MI PARAMETRO DE APLICAR DESCUENTO SERIA EL "DESCUENTO" Y EL "PRECIO * CANTIDAD" Y TODO ESO VA A 
-- PASAR A SER MI SEGUNDO PARAMETRO DE APLICAR COSTO DE ENVIO 