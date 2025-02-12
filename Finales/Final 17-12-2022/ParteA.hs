-- EMPIEZA CODIGO CONSIGNA 
data Producto = UnProducto {
    nombre :: String, 
    precio :: Int
}

-- queEmpieceConA = (== 'a') . head . nombre
-- barato = (< 50) . precio

-- restriccionesDeCompra = [queEmpieceConA, barato]
-- TERMINA CODIGO CONSIGNA 

-- 1
-- [Producto -> Bool]


-- 2
queEmpieceCon :: Char -> Producto -> Bool
queEmpieceCon unaLetra = (== unaLetra) . head . nombre

restriccionesDeCompra :: [Producto -> Bool]
restriccionesDeCompra = [queEmpieceCon 'a']

{--
   El concepto que se esta aplicando aca es la aplicacion parcial, ya que a la funcion queEmpieceCon se le esta 
   pasando uno de los dos parametros que esta necesita.
--}

-- 3
prroductosElegidos :: [Producto] -> [Producto -> Bool] -> [Producto]
prroductosElegidos unosProductos unasRestricciones = filter (\unProducto -> cumpleRestricciones unProducto unasRestricciones) unosProductos

cumpleRestricciones :: Producto -> [Producto -> Bool] -> Bool
cumpleRestricciones unProducto unasRestricciones = any (\unaRestriccion -> unaRestriccion unProducto) unasRestricciones

{--
   Los conceptos que se destacan en la solucion planteada, serian los de aplicacion parcial y orden superior. 
--}