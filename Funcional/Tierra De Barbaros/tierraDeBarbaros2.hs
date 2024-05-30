import Text.Show.Functions ()
import Data.Char

data Barbaro = UnBarbaro {
    nombre :: String,
    fuerza :: Int,
    habilidades :: [String],
    objetos :: [Objeto]
} deriving Show

type Objeto = Barbaro -> Barbaro

-------------------------------------------------- ACCESORS -------------------------------------------------------

mapModificarNombre :: (String -> String) -> Barbaro -> Barbaro
mapModificarNombre unaFuncion unBarbaro = unBarbaro {nombre = unaFuncion . nombre $ unBarbaro}

mapModificarFuerza :: (Int -> Int) -> Barbaro -> Barbaro    
mapModificarFuerza unaFuncion unBarbaro = unBarbaro {fuerza = unaFuncion . fuerza $ unBarbaro}

mapModificarHabilidades :: ([String] -> [String]) -> Barbaro -> Barbaro
mapModificarHabilidades unaFuncion unBarbaro = unBarbaro {habilidades = unaFuncion . habilidades $ unBarbaro}

mapModificarObjetos :: ([Objeto] -> [Objeto]) -> Barbaro -> Barbaro
mapModificarObjetos unaFuncion unBarbaro = unBarbaro {objetos = unaFuncion . objetos $ unBarbaro}

---------------------------------------------------- PUNTO 1 -------------------------------------------------------

-- Por POINTFREE saco el parametro unBarbaro 
espada :: Int -> Objeto
espada pesoEspada = mapModificarFuerza (+ pesoEspada * 2) 

amuletosMisticos :: String -> Objeto
amuletosMisticos unaHabilidad = mapModificarHabilidades (++ [unaHabilidad])

varitasDefectuosas :: Objeto
varitasDefectuosas unBarbaro = mapModificarHabilidades (++ ["Hacer magia"]) . desaparecerObjetos $ unBarbaro

desaparecerObjetos :: Objeto
desaparecerObjetos unBarbaro = unBarbaro {objetos = [varitasDefectuosas]}

ardilla :: Objeto 
ardilla unBarbaro = unBarbaro

unaCuerda :: Objeto -> Objeto -> Objeto
unaCuerda unObjeto otroObjeto = unObjeto . otroObjeto

--------------------------------------------- DEFINICION DE BARBAROS -------------------------------------------------------

dave :: Barbaro 
dave = UnBarbaro {
    nombre = "Dave",
    fuerza = 100,
    habilidades = ["Tejere", "EscribirPoesia", "EscribirPoesiaAtroz", "Robar"],
    objetos = [espada 10, varitasDefectuosas]
}

gonzi :: Barbaro 
gonzi = UnBarbaro {
    nombre = "Gonzi",
    fuerza = 50,
    habilidades = ["Comer", "Entrenar"],
    objetos = [ardilla, amuletosMisticos "Bulkear", unaCuerda (espada 10) (varitasDefectuosas)]
}

---------------------------------------------------- PUNTO 2 -------------------------------------------------------

megafono :: Objeto 
megafono unBarbaro = unBarbaro {habilidades = concatenarHabilidades . convertirEnMayuscula $ habilidades unBarbaro}

concatenarHabilidades :: [String] -> [String]
concatenarHabilidades unasHabilidades = [concat unasHabilidades]

convertirEnMayuscula :: [String] -> [String]
convertirEnMayuscula unasHabilidades = map (map toUpper) unasHabilidades

megafonoBarbarico :: Objeto
megafonoBarbarico = unaCuerda ardilla megafono

---------------------------------------------------- PUNTO 3 -------------------------------------------------------

type Evento = Barbaro -> Bool
type Aventura = [Evento]

invasionDeSuciosDuendes :: Evento
invasionDeSuciosDuendes unBarbaro =  tieneLaHabilidad "EscribirPoesiaAtroz" unBarbaro

tieneLaHabilidad :: String -> Barbaro -> Bool
tieneLaHabilidad unaHabilidad unBarbaro = elem unaHabilidad (habilidades unBarbaro)

cremalleraDelTiempo :: Evento
cremalleraDelTiempo unBarbaro = not . tienePulgares . nombre $ unBarbaro

tienePulgares :: String -> Bool
tienePulgares "Faffy" = False
tienePulgares "Astro" = False
tienePulgares _ = True

ritualDeFechorias :: [Evento] -> Evento
ritualDeFechorias eventos unBarbaro = any (aplicarEvento unBarbaro $) eventos

aplicarEvento :: Barbaro -> Evento -> Bool 
aplicarEvento unBarbaro unEvento = unEvento unBarbaro

puedeSaquear :: Evento
puedeSaquear unBarbaro = tieneLaHabilidad "Robar" unBarbaro && fuerza unBarbaro > 80

tieneGritoDeGuerra :: Evento
tieneGritoDeGuerra unBarbaro = poderDeGritoDeGuerra unBarbaro > cantidadDeLetrasDeHabilidades unBarbaro

poderDeGritoDeGuerra :: Barbaro -> Int
poderDeGritoDeGuerra unBarbaro = (* 4) (cantidadDeObjetosDeUnBarbaro unBarbaro)

cantidadDeObjetosDeUnBarbaro :: Barbaro -> Int
cantidadDeObjetosDeUnBarbaro unBarbaro = length (objetos unBarbaro)

cantidadDeLetrasDeHabilidades :: Barbaro -> Int
cantidadDeLetrasDeHabilidades unBarbaro = sum (map length (habilidades unBarbaro))

tieneCaligrafia :: Evento
tieneCaligrafia unBarbaro = all (caligrafiaPerfecta) (habilidades unBarbaro)

caligrafiaPerfecta :: String -> Bool
caligrafiaPerfecta unaHabilidad = cantidadVocales unaHabilidad >= 3 && empiezaConMayuscula unaHabilidad

cantidadVocales :: String -> Int
cantidadVocales unaHabilidad = length (filter esVocal unaHabilidad)

esVocal :: Char -> Bool 
esVocal unaLetra = elem unaLetra "aeiouAEIOU"

empiezaConMayuscula :: String -> Bool
empiezaConMayuscula unaHabilidad = isUpper (head unaHabilidad)

sobrevivientes :: [Barbaro] -> Aventura -> [Barbaro]
sobrevivientes unosBarbaros unaAventura = filter (puedeSobrevivir unaAventura) unosBarbaros

puedeSobrevivir :: Aventura -> Barbaro -> Bool 
puedeSobrevivir unaAventura unBarbaro = all ($ unBarbaro) unaAventura

---------------------------------------------------- PUNTO 4 -------------------------------------------------------

-- ["A", "A", "B", "C", "C", "D", "B"]
sinRepetidos :: [String] -> [String]
sinRepetidos [] = []
sinRepetidos (cabeza : cola) 
  | elem cabeza cola = sinRepetidos cola
  | otherwise = (cabeza : sinRepetidos cola)

descendientes :: Barbaro -> [Barbaro]
descendientes unBarbaro = iterate (agregarAsteriscoAlNombre . aplicarObjetosAsiMismo . habilidadesSinRepetidos) unBarbaro

agregarAsteriscoAlNombre :: Barbaro -> Barbaro
agregarAsteriscoAlNombre unBarbaro = mapModificarNombre (++ "*") unBarbaro

aplicarObjetosAsiMismo :: Barbaro -> Barbaro
aplicarObjetosAsiMismo unBarbaro = foldr ($) unBarbaro (objetos unBarbaro)

habilidadesSinRepetidos :: Barbaro -> Barbaro
habilidadesSinRepetidos unBarbaro = mapModificarHabilidades sinRepetidos unBarbaro

