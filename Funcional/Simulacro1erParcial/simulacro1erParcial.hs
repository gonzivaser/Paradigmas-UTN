module Parcial where
import Text.Show.Functions()

------------------------------------------------- DATA ------------------------------------------------------------

data Ninja = UnNinja {
    nombre :: String,
    herramientas :: [Herramienta],
    jutsus :: [String],
    rango :: Int
} deriving (Show)

type Herramienta = (Nombre, Cantidad)
type Nombre = String 
type Cantidad = Int

----------------------------------------------- ACCESORS ------------------------------------------------------------

accessorCantidadDeHerramienta :: Herramienta -> Int  
accessorCantidadDeHerramienta (_, cantidad) = cantidad

accesorNombreDeHerramienta :: Herramienta -> String
accesorNombreDeHerramienta (nombre, _) = nombre

mapModificarHerramientas :: ([Herramienta] -> [Herramienta]) -> Ninja -> Ninja
mapModificarHerramientas f unNinja = unNinja {herramientas = f (herramientas unNinja)}

mapModificarRango :: (Int -> Int) -> Ninja -> Ninja
mapModificarRango f unNinja = unNinja {rango = f (rango unNinja)}

----------------------------------------------- EJEMPLOS ------------------------------------------------------------

ninjaGonzi :: Ninja
ninjaGonzi = UnNinja {
    nombre = "Gonzi",
    herramientas = [("Shuriken", 90), ("Kunai", 5)],
    jutsus = ["Jutsu de la sombra", "Jutsu de la bola de fuego"],
    rango = 5
}

ninjaEsteban :: Ninja
ninjaEsteban = UnNinja {
    nombre = "Esteban",
    herramientas = [("Katana", 3), ("Kunai", 83)],
    jutsus = ["Jutsu de la sombra", "Jutsu de la bola de fuego"],
    rango = 3
}

ninjaFede :: Ninja
ninjaFede = UnNinja {
    nombre = "Fede",
    herramientas = [("Shuriken", 29), ("Kunai", 7)],
    jutsus = ["Jutsu de la sombra", "Jutsu de la bola de fuego"],
    rango = 3
}

herramientaShuriken :: Herramienta
herramientaShuriken = ("Shuriken", 10)

herramientaKunai :: Herramienta 
herramientaKunai = ("Kunai", 5)

herramientaKatana :: Herramienta
herramientaKatana = ("Katana", 3)

----------------------------------------------- PARTE A ------------------------------------------------------------

obtenerHerramienta :: Ninja -> Herramienta -> Ninja
obtenerHerramienta unNinja unaHerramienta 
  | (cantidadHerramientasTotales unNinja + accessorCantidadDeHerramienta unaHerramienta) <= 100 = mapModificarHerramientas (++ [unaHerramienta]) unNinja
  | otherwise = mapModificarHerramientas (++ [(accesorNombreDeHerramienta unaHerramienta, max 0 (100 - cantidadHerramientasTotales unNinja))]) unNinja

cantidadHerramientasTotales :: Ninja -> Int
cantidadHerramientasTotales unNinja = sum (map accessorCantidadDeHerramienta (herramientas unNinja))

--usarHerramienta :: Ninja -> Nombre -> Ninja
--usarHerramienta unNinja nombreHerramienta = mapModificarHerramientas (sacarHerramientasUsadas unNinja nombreHerramienta) unNinja

--sacarHerramientasUsadas :: Ninja -> Nombre -> [Herramienta]
--sacarHerramientasUsadas unNinja nombreHerramienta = filter !!

----------------------------------------------- PARTE B ------------------------------------------------------------

data Mision = UnaMision {
    cantidadNinjas :: Int,
    rangoRecomendable :: Int,
    ninjasEnemigos :: [Ninja],
    herramientaRecompensa :: Herramienta
} deriving (Show)

mapModificarCantidadNinjas :: (Int -> Int) -> Mision -> Mision
mapModificarCantidadNinjas f unaMision = unaMision {cantidadNinjas = f (cantidadNinjas unaMision)}

mapModificarNinjasEnemigos :: ([Ninja] -> [Ninja]) -> Mision -> Mision
mapModificarNinjasEnemigos f unaMision = unaMision {ninjasEnemigos = f (ninjasEnemigos unaMision)}

----------------------------------------------- EJEMPLOS ------------------------------------------------------------
misionRescate :: Mision
misionRescate = UnaMision {
    cantidadNinjas = 3,
    rangoRecomendable = 5,
    ninjasEnemigos = [ninjaGonzi, ninjaEsteban],
    herramientaRecompensa = ("Shuriken", 5)
}

misionCombate :: Mision
misionCombate = UnaMision {
    cantidadNinjas = 2,
    rangoRecomendable = 3,
    ninjasEnemigos = [ninjaFede, ninjaGonzi],
    herramientaRecompensa = herramientaKunai
}
----------------------------------------------- FUNCIONES ------------------------------------------------------------
-- ES DESAFIANTE
esDesafiante :: [Ninja] -> Mision -> Bool
esDesafiante equipoNinjas unaMision = any (tieneMenorRangoQueRecomendado unaMision) equipoNinjas && cantidadNinjasEnemigos unaMision >= 2

tieneMenorRangoQueRecomendado :: Mision -> Ninja -> Bool
tieneMenorRangoQueRecomendado unaMision unNinja = rango unNinja < rangoRecomendable unaMision

cantidadNinjasEnemigos :: Mision -> Int
cantidadNinjasEnemigos unaMision = length (ninjasEnemigos unaMision)

-- ES COPADA
esCopada :: Mision -> Bool
esCopada (UnaMision _ _ _ ("Bomba de humo", 3)) = True
esCopada (UnaMision _ _ _ ("Shuriken", 5)) = True
esCopada (UnaMision _ _ _ ("Kunai", 14)) = True
esCopada _ = False

-- ES FACTIBLE
esFactible :: [Ninja] -> Mision -> Bool
esFactible equipoNinjas unaMision = noEsDesafiante equipoNinjas unaMision && (cantidadNinjasNecesaria equipoNinjas unaMision || sumaTotalDeHerramientasDelEquipo equipoNinjas > 500)

noEsDesafiante :: [Ninja] -> Mision -> Bool
noEsDesafiante equipoNinjas unaMision = not . esDesafiante equipoNinjas $ unaMision

cantidadNinjasNecesaria :: [Ninja] -> Mision -> Bool
cantidadNinjasNecesaria equipoNinjas unaMision = cantidadNinjasDeUnaMision equipoNinjas >= cantidadNinjas unaMision

cantidadNinjasDeUnaMision :: [Ninja] -> Int
cantidadNinjasDeUnaMision equipoNinjas = length equipoNinjas

sumaTotalDeHerramientasDelEquipo :: [Ninja] -> Int
sumaTotalDeHerramientasDelEquipo equipoNinjas = sum (map cantidadHerramientasTotales equipoNinjas)

-- FALLAR MISION
fallarMision :: [Ninja] -> Mision -> [Ninja]
fallarMision equipoNinjas unaMision = map disminuirRango (filtrarNinjasConRangoAceptado unaMision equipoNinjas)

filtrarNinjasConRangoAceptado :: Mision -> [Ninja] -> [Ninja]
filtrarNinjasConRangoAceptado unaMision equipoNinjas = filter (tieneRangoAceptado unaMision) equipoNinjas

disminuirRango :: Ninja -> Ninja
disminuirRango unNinja = mapModificarRango (subtract 2) unNinja

tieneRangoAceptado :: Mision -> Ninja -> Bool
tieneRangoAceptado unaMision unNinja = rango unNinja >= rangoRecomendable unaMision

-- CUMPLIR MISION
--cumplirMision: si todo sale bien, se promociona de rango a cada miembro del
--equipo. Además obtendrán la recompensa teniendo en cuenta la restricción del
--máximo de herramientas.
cumplirMision :: Mision -> [Ninja] -> [Ninja]
cumplirMision equipoNinjas unaMision = map (obtenerHerramienta (herramientaRecompensa unaMision)) . mapModificarRango (+1) $ equipoNinjas




-- CLONES DE SOMBRA
clonesDeSombra :: Int -> Mision -> Mision
clonesDeSombra cantidadClones unaMision = mapModificarCantidadNinjas (max 1 . (subtract cantidadClones)) unaMision


-- FUERZA DE UN CENTENAR 
fuerzaDeUnCentenar :: Mision -> Mision
fuerzaDeUnCentenar unaMision = mapModificarNinjasEnemigos (filter (not . tieneRangoMenorA500)) unaMision

tieneRangoMenorA500 :: Ninja -> Bool
tieneRangoMenorA500 unNinjaEnemigo = rango unNinjaEnemigo < 500


-- EJECUTAR MISION
{--¡Hora de la acción! Se pide modelar ejecutarMision. Cuando se ejecuta una misión, todos
los ninjas del grupo usan todos sus jutsus en la misión. Luego, si la misión es copada o
factible, se cumple. Caso contrario la misión se falla.--}
ejecutarMision :: Mision -> [Ninja] -> [Ninja]
ejecutarMision unaMision equipoNinjas = resultadoDeMision equipoNinjas . aplicarJutsusDelEquipoDeNinjas equipoNinjas $ unaMision

resultadoDeMision :: [Ninja] -> Mision -> [Ninja]
resultadoDeMision equipoNinjas unaMision 
  | esCopada unaMision || esFactible equipoNinjas unaMision = cumplirMision equipoNinjas unaMision
  | otherwise = fallarMision equipoNinjas unaMision

aplicarJutsusDelEquipoDeNinjas :: [Ninja] -> Mision -> Mision 
aplicarJutsusDelEquipoDeNinjas equipoNinjas unaMision = foldr ($) unaMision (map aplicarJutsus equipoNinjas)

aplicarJutsus :: Ninja -> Mision -> Mision 
aplicarJutsus unNinja unaMision = foldr ($) unaMision (jutsus unNinja)
