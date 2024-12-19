data Producto = Prod {
    nombre :: String, 
    precio :: Int
}

queEmpieceConA :: Producto -> Bool
queEmpieceConA = (== 'a') . head . nombre

barato :: Producto -> Bool
barato = (< 50) . precio


-- PUNTO 1
type Restriccion = Producto -> Bool
restriccionesDeCompra :: [Restriccion]
restriccionesDeCompra = [queEmpieceConA, barato]


-- PUNTO 2
queEmpieceConUnaLetra :: Char -> Producto -> Bool
queEmpieceConUnaLetra unaLetra = (== unaLetra) . head . nombre

restriccionesDeCompraVol2 :: [Restriccion]
restriccionesDeCompraVol2 = [queEmpieceConUnaLetra 'a', barato]

-- El concepto que esta relacionado es aplicacion parcial, ya que estamos aplicando parcialmente la funcion queEmpieceConUnaLetra


-- PUNTO 3
cumpleConCriterios :: [Producto] -> [Restriccion] -> [Producto]
cumpleConCriterios unosProductos unasRestricciones = filter (\unProducto -> cumpleConRestriccion unProducto unasRestricciones) unosProductos

cumpleConRestriccion :: Producto -> [Restriccion] -> Bool
cumpleConRestriccion unProducto unasRestricciones = all (\unaRestriccion -> unaRestriccion unProducto) unasRestricciones

-- Lo que destaca en la solucion es la expresividad en los nombres de las funciones, la declaratividad por la derivacion de logica, el uso de 
-- funciones de orden superior y el uso de funciones lambda para la aplicacion de criterios
