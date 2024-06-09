import Text.Show.Functions
import Data.Char

-------------------------------------------------- DATA ---------------------------------------------------------------
data Barbaro = UnBarbaro {
    nombre :: String, 
    fuerza :: Int,
    habilidades :: [String], 
    objetos :: [Objeto]
} deriving (Show)

type Objeto = Barbaro -> Barbaro

-------------------------------------------- EJEMPLOS DE PRUEBA ---------------------------------------------------------------

dave :: Barbaro
dave = UnBarbaro {
    nombre = "Dave",
    fuerza = 100,
    habilidades = ["tejer", "escrbirPoesia"],
    objetos = []
}

gonzi :: Barbaro
gonzi = UnBarbaro {
    nombre = "Gonzi",
    fuerza = 50,
    habilidades = ["futbol", "netfilx"],
    objetos = []
}

-------------------------------------------- ACCESORS ---------------------------------------------------------------

mapModificarNombre :: (String -> String) -> Barbaro -> Barbaro
mapModificarNombre f unBarbaro = unBarbaro {nombre = f.nombre $ unBarbaro}

mapModificarFuerza :: (Int -> Int) -> Barbaro -> Barbaro
mapModificarFuerza f unBarbaro = unBarbaro {fuerza = f.fuerza $ unBarbaro}

mapModificarHabilidades :: ([String] -> [String]) -> Barbaro -> Barbaro
mapModificarHabilidades f unBarbaro = unBarbaro {habilidades = f.habilidades $ unBarbaro}

mapModificarObjetos :: ([Objeto] -> [Objeto]) -> Barbaro -> Barbaro
mapModificarObjetos f unBarbaro = unBarbaro {objetos = f.objetos $ unBarbaro}

--------------------------------------------- OBJETOS ---------------------------------------------------------------

-- ESPADAS
espadas :: Int -> Objeto
espadas pesoEspada = mapModificarFuerza (+ (pesoEspada * 2))

-- AMULETOS MISTICOS
amuletosMisticos :: String -> Objeto
amuletosMisticos unaHabilidad = mapModificarHabilidades (++ [unaHabilidad])

-- VARITAS DEFECTUOSAS
{--Las varitasDefectuosas, añaden la habilidad de hacer magia, pero desaparecen todos los demás objetos del bárbaro.--}
varitasDefectuosas :: Objeto 
varitasDefectuosas = mapModificarHabilidades (++ ["hacerMagia"]) . desaparecerObjetos 

desaparecerObjetos :: Barbaro -> Barbaro
desaparecerObjetos unBarbaro = unBarbaro {objetos = [varitasDefectuosas]}

-- ARDILLA 
unaArdilla :: Objeto
unaArdilla = id

-- UNA CUERDA
unaCuerda :: Objeto -> Objeto -> Objeto
unaCuerda unObjeto otroObjeto = unObjeto . otroObjeto

--------------------------------------------- PUNTO 2 ---------------------------------------------------------------

-- MEGAFONO
megafono :: Objeto 
megafono unBarbaro = unBarbaro { habilidades = convertirEnMayuscula . concatenarHabilidades $ habilidades unBarbaro}

concatenarHabilidades :: [String] -> [String]
concatenarHabilidades habilidades = [concat habilidades]

convertirEnMayuscula :: [String] -> [String]
convertirEnMayuscula = map (map toUpper)

-- MEGAFONO BARBARICO
megafonoBarbarico :: Objeto
megafonoBarbarico = unaCuerda unaArdilla megafono

--------------------------------------------- PUNTO 3 ---------------------------------------------------------------

--------------------------------------------- PUNTO 4 ---------------------------------------------------------------

-- SIN REPETIDOS 
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos [] = []
sinRepetidos (cabeza : cola) 
  | elem cabeza cola = sinRepetidos cola
  | otherwise = (cabeza : sinRepetidos cola)

-- DESCENDIENTES
descendientes :: Barbaro -> [Barbaro]
descendientes = iterate (agregarAsteriscoAlNombre . habilidadesSinRepetidos . aplicarObjetosAsiMismo)

agregarAsteriscoAlNombre :: Barbaro -> Barbaro
agregarAsteriscoAlNombre = mapModificarNombre (++ "*")

habilidadesSinRepetidos :: Barbaro -> Barbaro
habilidadesSinRepetidos = mapModificarHabilidades sinRepetidos

aplicarObjetosAsiMismo :: Barbaro -> Barbaro
aplicarObjetosAsiMismo unBarbaro = foldr ($) unBarbaro (objetos unBarbaro)

