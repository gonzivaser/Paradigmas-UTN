data Producto = Prod {
    nombre :: [Char],
    precio :: Float,
    precioCantidad :: Float
}

-- PUNTO 1 
-- a) 
queEmpieceConA :: Char -> Producto -> Bool
queEmpieceConA unaLetra unProducto = (== unaLetra) . head . nombre $ unProducto

barato :: Producto -> Bool
barato unProducto = (< 50) . precio $ unProducto


-- b)
-- YO MODELARIA A JUAN ASI
data Persona = UnaPersona {
    nombrePersona :: [Char],
    criterios :: [Producto -> Bool]
}

-- c) 
-- LOS TIPOS DE JUAN SERIA
juan :: [Producto -> Bool]
juan = [ queEmpieceConA, barato ]

-- PUNTO 2
productosElegidos :: [Producto] -> Persona -> [Producto]
productosElegidos unosProductos unaPersona = filter (cumpleCriterios unaPersona) unosProductos

cumpleCriterios :: Persona -> Producto -> Bool
cumpleCriterios unaPersona unProducto = all ($ unProducto) . criterios $ unaPersona