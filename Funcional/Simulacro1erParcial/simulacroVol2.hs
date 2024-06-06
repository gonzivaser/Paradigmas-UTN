module Parcial where
import Text.Show.Functions()

------------------------------------------------- DATA ------------------------------------------------------------

data Ninja = UnNinja {
    nombre :: String,
    herramientas :: [Herramienta],
    jutsus :: [Jutsu],
    rango :: Int
} deriving (Show)

type Herramienta = (Nombre, Cantidad)
type Nombre = String 
type Cantidad = Int

----------------------------------------------- ACCESORS ------------------------------------------------------------

mapModificarNombre :: (String -> String) -> Ninja -> Ninja
mapModificarNombre f unNinja = unNinja {nombre = f (nombre unNinja)}

mapModificarHerramientas :: ([Herramienta] -> [Herramienta]) -> Ninja -> Ninja
mapModificarHerramientas f unNinja = unNinja {herramientas = f (herramientas unNinja)}

mapModificarJutsus :: ([Jutsu] -> [Jutsu]) -> Ninja -> Ninja
mapModificarJutsus f unNinja = unNinja {jutsus = f (jutsus unNinja)}

mapModificarRango :: (Int -> Int) -> Ninja -> Ninja
mapModificarRango f unNinja = unNinja {rango = f (rango unNinja)}

accesorNombreDeHerramienta :: Herramienta -> String
accesorNombreDeHerramienta (nombre, _) = nombre

accesorCantidadDeHerramienta :: Herramienta -> Int
accesorCantidadDeHerramienta (_, cantidad) = cantidad

----------------------------------------------- EJEMPLOS ------------------------------------------------------------

ninjaGonzi :: Ninja
ninjaGonzi = UnNinja {
    nombre = "Gonzi",
    herramientas = [("Shuriken", 90), ("Kunai", 5)],
    jutsus = [clonesDeSombra 2, fuerzaDeUnCentenar],
    rango = 5
}

ninjaEsteban :: Ninja
ninjaEsteban = UnNinja {
    nombre = "Esteban",
    herramientas = [("Katana", 3), ("Kunai", 83)],
    jutsus = [clonesDeSombra 3],
    rango = 3
}

ninjaFede :: Ninja
ninjaFede = UnNinja {
    nombre = "Fede",
    herramientas = [("Shuriken", 29), ("Kunai", 7)],
    jutsus = [fuerzaDeUnCentenar],
    rango = 3
}

herramientaShuriken :: Herramienta
herramientaShuriken = ("Shuriken", 10)

herramientaKunai :: Herramienta 
herramientaKunai = ("Kunai", 5)

herramientaKatana :: Herramienta
herramientaKatana = ("Katana", 3)

----------------------------------------------- PARTE A ------------------------------------------------------------

-- OBTENER HERRAMIENTA
obtenerHerramienta :: Ninja -> Herramienta -> Ninja
obtenerHerramienta unNinja unaHerramienta 
  | sumaDeSusHerramientasMenorA100 unNinja unaHerramienta = mapModificarHerramientas (++ [unaHerramienta]) unNinja
  | otherwise = agregarCantidadDeHerramientaSinExcederse unNinja unaHerramienta

cantidadDeHerramientasTotales :: Ninja -> Int
cantidadDeHerramientasTotales unNinja = sum (map accesorCantidadDeHerramienta (herramientas unNinja))

sumaDeSusHerramientasMenorA100 :: Ninja -> Herramienta -> Bool 
sumaDeSusHerramientasMenorA100 unNinja unaHerramienta = (cantidadDeHerramientasTotales unNinja + accesorCantidadDeHerramienta unaHerramienta) <= 100

agregarCantidadDeHerramientaSinExcederse :: Ninja -> Herramienta -> Ninja
agregarCantidadDeHerramientaSinExcederse unNinja unaHerramienta = mapModificarHerramientas (++ [(accesorNombreDeHerramienta unaHerramienta, max 0 (100 - cantidadDeHerramientasTotales unNinja))]) unNinja


-- USAR HERRAMIENTA
usarHerramienta :: Ninja -> String -> Ninja
usarHerramienta unNinja  unNombreDeHerramienta = sacarHerramientasUsada unNinja unNombreDeHerramienta

sacarHerramientasUsada :: Ninja -> String -> Ninja
sacarHerramientasUsada unNinja unNombreDeHerramienta = mapModificarHerramientas (filter (not . esHerramienta unNombreDeHerramienta)) unNinja

esHerramienta :: String -> Herramienta -> Bool
esHerramienta unNombreDeHerramientaASacar (nombreHerramienta, _) = unNombreDeHerramientaASacar == nombreHerramienta

----------------------------------------------- PARTE B ------------------------------------------------------------

data Mision = UnaMision {
    cantidadDeNinjasRequeridos :: Int,
    rangoRecomendable :: Int,
    ninjasEnemigosADerrotar :: [Ninja],
    herramientaRecompensa :: Herramienta
} deriving (Show)

type EquipoDeNinjas = [Ninja]

----------------------------------------------- ACCESORS ------------------------------------------------------------

mapModificarCantidadDeNinjasRequeridos :: (Int -> Int) -> Mision -> Mision
mapModificarCantidadDeNinjasRequeridos f unaMision = unaMision {cantidadDeNinjasRequeridos = f (cantidadDeNinjasRequeridos unaMision)}

mapModificarRangoRecomendable :: (Int -> Int) -> Mision -> Mision
mapModificarRangoRecomendable f unaMision = unaMision {rangoRecomendable = f (rangoRecomendable unaMision)}

mapModificarNinjasEnemigosADerrotar :: ([Ninja] -> [Ninja]) -> Mision -> Mision
mapModificarNinjasEnemigosADerrotar f unaMision = unaMision {ninjasEnemigosADerrotar = f (ninjasEnemigosADerrotar unaMision)}

mapModificarHerramientaDeRecompensa :: (Herramienta -> Herramienta) -> Mision -> Mision
mapModificarHerramientaDeRecompensa f unaMision = unaMision {herramientaRecompensa = f (herramientaRecompensa unaMision)}

----------------------------------------------- EJEMPLOS ------------------------------------------------------------

misionRescate :: Mision
misionRescate = UnaMision {
    cantidadDeNinjasRequeridos = 3,
    rangoRecomendable = 5,
    ninjasEnemigosADerrotar = [ninjaGonzi, ninjaEsteban],
    herramientaRecompensa = ("Shuriken", 5)
}

misionCombate :: Mision
misionCombate = UnaMision {
    cantidadDeNinjasRequeridos = 2,
    rangoRecomendable = 3,
    ninjasEnemigosADerrotar = [ninjaFede, ninjaGonzi],
    herramientaRecompensa = herramientaKunai
}

-------------------------------------------- PARTE B FUNCIONES ------------------------------------------------------------

-- ES DESAFIANTE
esDesafiante :: EquipoDeNinjas -> Mision -> Bool
esDesafiante unEquipoDeNinjas unaMision = tieneMenorRangoQueRecomendado unEquipoDeNinjas unaMision && cantidadDeNinjasEnemigosADerrotar unaMision >= 2

tieneMenorRangoQueRecomendado :: EquipoDeNinjas -> Mision -> Bool
tieneMenorRangoQueRecomendado unEquipoDeNinjas unaMision = any (noEstaCalificado unaMision) unEquipoDeNinjas

noEstaCalificado :: Mision -> Ninja -> Bool
noEstaCalificado unaMision unNinja = rango unNinja < rangoRecomendable unaMision

cantidadDeNinjasEnemigosADerrotar :: Mision -> Int
cantidadDeNinjasEnemigosADerrotar unaMision = length (ninjasEnemigosADerrotar unaMision)

-- ES COPADA 
esCopada :: Mision -> Bool 
esCopada (UnaMision _ _ _ ("Bomba de humo", 3)) = True
esCopada (UnaMision _ _ _ ("Shuriken", 5)) = True
esCopada (UnaMision _ _ _ ("Kunai", 14)) = True
esCopada _ = False

-- ES FACTIBLE 
esFactible :: EquipoDeNinjas -> Mision -> Bool
esFactible unEquipoDeNinjas unaMision = noEsDesafiante unEquipoDeNinjas unaMision && tieneCantidadDeNinjasNecesaria unEquipoDeNinjas unaMision || (> 500) (sumaDeHerramientasDelEquipo unEquipoDeNinjas)

noEsDesafiante :: EquipoDeNinjas -> Mision -> Bool
noEsDesafiante unEquipoDeNinjas unaMision = (not . esDesafiante unEquipoDeNinjas) unaMision

tieneCantidadDeNinjasNecesaria :: EquipoDeNinjas -> Mision -> Bool
tieneCantidadDeNinjasNecesaria unEquipoDeNinjas unaMision = length unEquipoDeNinjas >= cantidadDeNinjasRequeridos unaMision

sumaDeHerramientasDelEquipo :: EquipoDeNinjas -> Int
sumaDeHerramientasDelEquipo unEquipoDeNinjas = sum (map cantidadDeHerramientasTotales unEquipoDeNinjas)

-- FALLAR MISION 
fallarMision :: Mision -> EquipoDeNinjas -> EquipoDeNinjas
fallarMision unaMision = map disminuirRango . ninjasQueSufriranVerguenza unaMision

disminuirRango :: Ninja -> Ninja
disminuirRango = mapModificarRango (subtract 2)

ninjasQueSufriranVerguenza :: Mision -> EquipoDeNinjas -> EquipoDeNinjas
ninjasQueSufriranVerguenza unaMision unEquipoDeNinjas = filter (not . tieneRangoRecomendadoOsuperior unaMision) unEquipoDeNinjas

tieneRangoRecomendadoOsuperior :: Mision -> Ninja -> Bool
tieneRangoRecomendadoOsuperior unaMision unNinja = rango unNinja >= rangoRecomendable unaMision

-- CUMPLIR MISION
cumplirMision :: Mision -> EquipoDeNinjas -> EquipoDeNinjas
cumplirMision unaMision unEquipoDeNinjas = map (promocionarRango . obtenerHerramientaRecomepensa unaMision) unEquipoDeNinjas

promocionarRango :: Ninja -> Ninja
promocionarRango = mapModificarRango (+1)

obtenerHerramientaRecomepensa :: Mision -> Ninja -> Ninja
obtenerHerramientaRecomepensa unaMision unNinja = obtenerHerramienta unNinja (herramientaRecompensa unaMision)

-- JUSTUS
type Jutsu = Mision -> Mision 

-- CLONES DE SOMBRA
clonesDeSombra :: Int -> Jutsu
clonesDeSombra clonesCreados unaMision = mapModificarCantidadDeNinjasRequeridos (subtract clonesCreados) unaMision

-- FUERZA DE UN CENTENAR 
fuerzaDeUnCentenar :: Jutsu
fuerzaDeUnCentenar unaMision = mapModificarNinjasEnemigosADerrotar (filter ((>= 500) . rango)) unaMision

-- EJECUTAR MISION 
ejecutarMision :: EquipoDeNinjas -> Mision -> EquipoDeNinjas
ejecutarMision unEquipoDeNinjas unaMision = (tipoDeMision unEquipoDeNinjas . aplicarJutsus unEquipoDeNinjas) unaMision

aplicarJutsus :: EquipoDeNinjas -> Mision -> Mision
aplicarJutsus unEquipoDeNinjas unaMision = foldr ($) unaMision . concatMap jutsus $ unEquipoDeNinjas

tipoDeMision :: EquipoDeNinjas -> Mision -> EquipoDeNinjas
tipoDeMision unEquipoDeNinjas unaMision 
  | esFactibleOCopada unEquipoDeNinjas unaMision = cumplirMision unaMision unEquipoDeNinjas
  | otherwise = fallarMision unaMision unEquipoDeNinjas

esFactibleOCopada :: EquipoDeNinjas -> Mision -> Bool
esFactibleOCopada unEquipoDeNinjas unaMision = esFactible unEquipoDeNinjas unaMision || esCopada unaMision

-------------------------------------------- PARTE C ------------------------------------------------------------

granGuerraNinja :: Mision 
granGuerraNinja = UnaMision {
    cantidadDeNinjasRequeridos = 100000,
    rangoRecomendable = 100,
    ninjasEnemigosADerrotar = infinitosZetsus,
    herramientaRecompensa = ("Abanico de Madara Uchiha", 1)
}

infinitosZetsus :: [Ninja]
infinitosZetsus = map zetsu [1..]

zetsu :: Int -> Ninja
zetsu unNumero = UnNinja {
    nombre = "Zetsu " ++ show unNumero,
    herramientas = [],
    jutsus = [],
    rango = 600
}

{--
  a) esDesafiante, y tiene algun miembro que no esta calificado, puede ejecutar sin problemas. Pero si tendria todos los miembros
     calificados, no podria devolver nada ya que la lista de ninjas enemigos es infinita y no podria terminar de analizarla nunca
  
  b) esCopada, podria ejecutar sin problemas 
  
  c) fuerzaDeUnCentenar, no podria devolver nada ya que la lista de enemigos es infinita y no podria terminar de analizarla nunca (se quedaria trabado)
--}