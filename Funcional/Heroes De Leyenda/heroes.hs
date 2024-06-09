{--
    CONSIGNA: 
    https://www.utnianos.com.ar/foro/attachment.php?aid=20203
--}

import Text.Show.Functions

data Heroe = UnHeroe {
    nombre :: String,
    epileto :: String,
    reconocimiento :: Int,
    artefactos :: [Artefacto],
    tareas :: [Tarea]
} deriving (Show)

data Artefacto = UnArtefacto {
    nombreArtefacto :: String,
    reareza :: Int
} deriving (Show)

------------------------------------------------ ACCESORS ---------------------------------------------------------

mapModificarNombre :: (String -> String) -> Heroe -> Heroe
mapModificarNombre f heroe = heroe {nombre = f (nombre heroe)}

mapModificarEpileto :: (String -> String) -> Heroe -> Heroe
mapModificarEpileto f heroe = heroe {epileto = f (epileto heroe)}

mapModificarReconocimiento :: (Int -> Int) -> Heroe -> Heroe
mapModificarReconocimiento f heroe = heroe {reconocimiento = f (reconocimiento heroe)}

mapModificarArtefactos :: ([Artefacto] -> [Artefacto]) -> Heroe -> Heroe
mapModificarArtefactos f heroe = heroe {artefactos = f (artefactos heroe)}

mapModificarNombreArtefacto :: (String -> String) -> Artefacto -> Artefacto
mapModificarNombreArtefacto f artefacto = artefacto {nombreArtefacto = f (nombreArtefacto artefacto)}

mapModificarRareza :: (Int -> Int) -> Artefacto -> Artefacto
mapModificarRareza f artefacto = artefacto {reareza = f (reareza artefacto)}

mapModificarTareas :: ([Tarea] -> [Tarea]) -> Heroe -> Heroe
mapModificarTareas f heroe = heroe {tareas = f (tareas heroe)}

------------------------------------------------ PUNTO 2 ---------------------------------------------------------

paseALaHistoria :: Heroe -> Heroe
paseALaHistoria unHeroe 
  | compararReconocimiento (>) 1000 unHeroe = nuevoEpileto "El Mitico" unHeroe
  | compararReconocimiento (>) 500 unHeroe && compararReconocimiento (<) 1000 unHeroe = nuevoEpileto "El magnifico" . agregarArtefacto "Lanza del olimpo" 100 $ unHeroe
  | compararReconocimiento (>) 100 unHeroe && compararReconocimiento (<) 500 unHeroe  = nuevoEpileto "Hopilita" . agregarArtefacto "Xiphos" 50 $ unHeroe
  | otherwise = unHeroe

compararReconocimiento :: (Int -> Int -> Bool) -> Int -> Heroe -> Bool
compararReconocimiento operador unValor = operador unValor . reconocimiento

nuevoEpileto :: String -> Heroe -> Heroe
nuevoEpileto unEpileto = mapModificarEpileto (const unEpileto)

agregarArtefacto :: String -> Int -> Heroe -> Heroe
agregarArtefacto unNombre unaRareza = mapModificarArtefactos (++ [UnArtefacto unNombre unaRareza])

------------------------------------------------ TAREAS ---------------------------------------------------------

type Tarea = Heroe -> Heroe

-- ENCONTRAR UN ARTEFACTO
encontrarArtefacto :: Artefacto -> Tarea
encontrarArtefacto unArtefacto unHeroe = agregarReconocimiento (reareza unArtefacto) .  agregarArtefactoUnaVezTerminadaLaTarea unArtefacto $ unHeroe

agregarReconocimiento :: Int -> Heroe -> Heroe
agregarReconocimiento unReconocimiento = mapModificarReconocimiento (+ unReconocimiento)

agregarArtefactoUnaVezTerminadaLaTarea :: Artefacto -> Heroe -> Heroe
agregarArtefactoUnaVezTerminadaLaTarea unArtefacto = mapModificarArtefactos (++ [unArtefacto])

-- ESCALAR EL OLIMPO
escalarElOlimpo :: Tarea
escalarElOlimpo unHeroe = agregarReconocimiento 500 . agregarArtefacto "El relámpago de Zeus" 500 . filtrarArtefactos . triplicarRareza $ unHeroe

filtrarArtefactos :: Heroe -> Heroe
filtrarArtefactos = mapModificarArtefactos (filter ((>= 1000) . reareza))

triplicarRareza :: Heroe -> Heroe
triplicarRareza = mapModificarArtefactos (map triplicarRarezaArtefacto)

triplicarRarezaArtefacto :: Artefacto -> Artefacto
triplicarRarezaArtefacto = mapModificarRareza (* 3)

-- AYUDAR A CRUZAR LA CALLE
ayudarACruzarLaCalle :: Int -> Tarea
ayudarACruzarLaCalle cuadras unHeroe = agregarReconocimiento 50 . nuevoEpileto (agregarO cuadras) $ unHeroe

agregarO :: Int -> String
agregarO unNumero = "Groso " ++ take unNumero (repeat 'o')

-- MATAR A UNA BESTIA 
data Bestia = UnaBestia {
    nombreBestia :: String,
    debilidad :: Debilidad
} deriving (Show)

type Debilidad = Heroe -> Bool

matarAUnaBestia :: Bestia -> Tarea
matarAUnaBestia unaBestia unHeroe 
  | debilidad unaBestia unHeroe = nuevoEpileto ("El asesino de " ++ nombreBestia unaBestia) unHeroe
  | otherwise = nuevoEpileto "El cobarde" . mapModificarArtefactos tail $ unHeroe

------------------------------------------------ PUNTO 4 ---------------------------------------------------------

heracles :: Heroe
heracles = UnHeroe {
    nombre = "Heracles",
    epileto = "Guardián del Olimpo",
    reconocimiento = 700,
    artefactos = [UnArtefacto "Pistola" 1000, UnArtefacto "El relámpago de Zeus" 500],
    tareas = [matarAlLeonDeNemea]
}

matarAlLeonDeNemea :: Tarea
matarAlLeonDeNemea = matarAUnaBestia (UnaBestia "León de Nemea" ((>= 20) . cantidadDeLetrasDeEpileto))

cantidadDeLetrasDeEpileto :: Heroe -> Int
cantidadDeLetrasDeEpileto = length . epileto 

------------------------------------------------ PUNTO 7 ---------------------------------------------------------

{--Hacer que dos héroes presuman sus logros ante el otro. Como resultado, queremos conocer la tupla
que en primer lugar al ganador de la contienda, y en segundo al perdedor. Cuando dos héroes
presumen, comparan de la siguiente manera:
a) Si un héroe tiene más reconocimiento que el otro, entonces es el ganador.
b) Si tienen el mismo reconocimiento, pero la sumatoria de las rarezas de los artefactos de un
héroe es mayor al otro, entonces es el ganador.
c) Caso contrario, ambos realizan todas las tareas del otro, y vuelven a hacer la comparación
desde el principio. Llegado a este punto, el intercambio se hace tantas veces sea necesario
hasta que haya un ganador.--}
type Resultado = (Heroe, Heroe)

presumirLogros :: Heroe -> Heroe -> Resultado
presumirLogros unHeroe otroHeroe 
  | reconocimiento unHeroe > reconocimiento otroHeroe = (unHeroe, otroHeroe)
  | reconocimiento unHeroe < reconocimiento otroHeroe = (otroHeroe, unHeroe)
  | reconocimiento unHeroe == reconocimiento otroHeroe && sumatoriaRarezas unHeroe > sumatoriaRarezas otroHeroe = (unHeroe, otroHeroe)
  | reconocimiento unHeroe == reconocimiento otroHeroe && sumatoriaRarezas unHeroe < sumatoriaRarezas otroHeroe = (otroHeroe, unHeroe)
  | otherwise = presumirLogros (realizarTareasDeOtroHeroe unHeroe otroHeroe) (realizarTareasDeOtroHeroe otroHeroe unHeroe)

realizarTareasDeOtroHeroe :: Heroe -> Heroe -> Heroe
realizarTareasDeOtroHeroe unHeroe otroHeroe = foldr ($) unHeroe (juntarTareas otroHeroe)

juntarTareas :: Heroe -> [Tarea]
juntarTareas unHeroe = tareas unHeroe

sumatoriaRarezas :: Heroe -> Int
sumatoriaRarezas = sum . map reareza . artefactos

