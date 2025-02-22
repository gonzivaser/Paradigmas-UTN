-- EMPIEZA CODIGO CONSIGNA 

data Producto = UnProducto {
    nombre :: String, 
    marca :: String
}

type Criterio = Producto -> Bool

-- deMarca unaMarca productos = filter (== unaMarca) . marca productos
-- todosSeLlaman unNombre = all((== unNombre) . nombre)
-- primerosQueCumplen criterio = map nombre . take 3 . filter criterio

-- TERMINA CODIGO CONSIGNA 

-- 1
{--
   La funcion que no compila por error de tipos seria la "deMarca". Porque se quieren filtrar los productos de una 
   marca especifica. Entonces se utiliza la funcion filter, que espera una condicion para filtrar y una lista. Entonces
   lo que estaria pasando aca es que no (== unaMarca) y marca unosProductos son dos funciones que no se pueden componer entre si.
   Una forma correcta de resolverlo podria ser usar una funcion lambda. 
--}


-- 2
deMarca :: String -> [Producto] -> [Producto]
deMarca unaMarca unosProductos = filter (\unProducto -> (== unaMarca) . marca $ unProducto) unosProductos

-- Ejemplo de invocacion: deMarca "Nike" ["Botines", "Remeras"]

todosSeLlaman :: String -> [Producto] -> Bool
todosSeLlaman unNombre = all((== unNombre) . nombre)

-- Ejemplo de invocacion: todosSeLlaman "Botin" ["Botin", "Remera"]

primerosQueCumplen :: [Producto -> Bool] -> [Producto] -> [String] 
primerosQueCumplen unCriterio =  map nombre . take 3 . filter unCriterio

-- Ejemplo de invocacion: primerosQueCumplen [esDeMarca "Nike"] ["Botin", "Remera"] 


-- 3
{--
   Las funciones deMarca y todosSeLlaman no terminan de evaluar en una lista infinita, ya que necesitan recorrer 
   toda la lista para completar su tarea (filtrar todos los productos de una marca o verificar que todos los 
   productos cumplen un criterio). En cambio, la función primerosQueCumplen sí puede terminar de evaluar en una 
   lista infinita, gracias a la evaluación perezosa de Haskell, ya que solo necesita encontrar un número finito 
   de elementos (3 en este caso) que cumplan con el criterio.
--}