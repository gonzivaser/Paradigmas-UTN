-- EMPIEZA CODIGO CONSIGNA 
data Producto = Prod {
    nombre :: [Char], 
    precio :: Float, 
    precioCantidad :: Float
} 

-- queEmpieceConA = (== 'a) . head . nombre
-- barato = (< 50) . precio 

-- juan = [queEmpieceConA, barato]

-- TERMINA CODIGO CONSIGNA 

-- 1
-- a)
queEmpieceCon :: Char -> Producto -> Bool
queEmpieceCon unaLetra = (== unaLetra) . head . nombre

-- b) 
-- juan = [queEmpieceCon "A", barato]
{- 
  En la representacion de Juan, ahora recibiria un caracter por parametro. Aca se estaria usando el concepto de aplicacion parcial 
  porque se le esta pasando un solo parametro a la funcion queEmpieceCon en vez de los dos que necesita
-}

-- c)
juan :: [Producto -> Bool]
juan = [queEmpieceCon 'a', barato]

barato :: Producto -> Bool
barato = (< 50) . precio


-- 2
productosElegidos :: [Producto] -> [Producto -> Bool] -> [Producto]
productosElegidos unosProductos unosRequisitos = filter (\unProducto -> cumpleRequisitos unProducto unosRequisitos) unosProductos

cumpleRequisitos :: Producto -> [Producto -> Bool] -> Bool
cumpleRequisitos unProducto unosRequisitos = all(\unRequisito -> unRequisito unProducto) unosRequisitos
