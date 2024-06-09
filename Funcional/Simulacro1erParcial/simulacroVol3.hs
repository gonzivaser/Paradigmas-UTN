import Text.Show.Functions

-------------------------------------------------- DATA -------------------------------------------------------

data Ninja = UnNinja {
    nombre :: String, 
    herramientas :: [Herramienta],
    jutsus :: [Jutsu],
    rango :: Int
} deriving (Show)

type Herramienta = (Nombre, Cantidad)
type Nombre = String
type Cantidad = Int

type Jutsu = Mision -> Mision

----------------------------------------- EJEMPLOS DE HERRAMIENTAS -------------------------------------------------------

bombasDeHumo :: Herramienta
bombasDeHumo = ("Bombas de Humo", 3)

kunais :: Herramienta
kunais = ("Kunais", 5)

shurikens :: Herramienta
shurikens = ("Shurikens", 10)

sellosExplosivos :: Herramienta
sellosExplosivos = ("Sellos Explosivos", 2)

--------------------------------------------- EJEMPLOS DE NINJAS -------------------------------------------------------

gonzi :: Ninja 
gonzi = UnNinja {
    nombre = "Gonzi",
    herramientas = [bombasDeHumo, kunais, shurikens],
    jutsus = [],
    rango = 3
}

esteban :: Ninja 
esteban = UnNinja {
    nombre = "Esteban",
    herramientas = [bombasDeHumo,  sellosExplosivos],
    jutsus = [],
    rango = 4
}

------------------------------------------------- ACCESORS -------------------------------------------------------

mapModificarNombre :: (String -> String) -> Ninja -> Ninja
mapModificarNombre f ninja = ninja {nombre = f (nombre ninja)}

mapModificarHerramientas :: ([Herramienta] -> [Herramienta]) -> Ninja -> Ninja
mapModificarHerramientas f ninja = ninja {herramientas = f (herramientas ninja)}

mapModificarJutsus :: ([Jutsu] -> [Jutsu]) -> Ninja -> Ninja
mapModificarJutsus f ninja = ninja {jutsus = f (jutsus ninja)}

mapModificarRango :: (Int -> Int) -> Ninja -> Ninja
mapModificarRango f ninja = ninja {rango = f (rango ninja)}

nombreHerramienta :: Herramienta -> Nombre
nombreHerramienta = fst

cantidadDeUnaHerramienta :: Herramienta -> Cantidad
cantidadDeUnaHerramienta = snd

------------------------------------------------- PARTE A -------------------------------------------------------

-- OBTENER HERRAMIENTA
obtenerHerramienta :: Ninja -> Herramienta -> Ninja
obtenerHerramienta unNinja unaHerramienta
  | (<= 100) . sumaDeHerramientasMasCantidadAObtener unNinja $ unaHerramienta = mapModificarHerramientas (++ [unaHerramienta]) unNinja
  | otherwise = mapModificarHerramientas (++ [(nombreHerramienta unaHerramienta, 100 - cantidadHerramientas unNinja)]) unNinja

sumaDeHerramientasMasCantidadAObtener :: Ninja -> Herramienta -> Cantidad
sumaDeHerramientasMasCantidadAObtener unNinja unaHerramienta = cantidadDeUnaHerramienta unaHerramienta + cantidadHerramientas unNinja

cantidadHerramientas :: Ninja -> Cantidad
cantidadHerramientas = sum . map cantidadDeUnaHerramienta . herramientas


-- USAR HERRAMIENTA
usarHerramienta :: Ninja -> Herramienta-> Ninja
usarHerramienta unNinja unaHerramienta = mapModificarHerramientas (filtrarHerramientasUsadas unaHerramienta) unNinja

filtrarHerramientasUsadas :: Herramienta -> [Herramienta] -> [Herramienta]
filtrarHerramientasUsadas unaHerramienta listaDeHerramientas = filter (not . esHerramienta (nombreHerramienta unaHerramienta)) listaDeHerramientas

esHerramienta :: String -> Herramienta -> Bool
esHerramienta unNombreDeHerramientaASacar (nombreDeHerramienta, _) = unNombreDeHerramientaASacar == nombreDeHerramienta

------------------------------------------------- PARTE B -------------------------------------------------------

data Mision = UnaMision {
    cantidadDeNinjas :: Int, 
    rangoRecomendable :: Int,
    ninjasEnemigos :: [Ninja],
    herramientaDeRecompensa :: Herramienta
}

type EquipoDeNinjas = [Ninja]

mapModificarCantidadDeNinjas :: (Int -> Int) -> Mision -> Mision
mapModificarCantidadDeNinjas f mision = mision {cantidadDeNinjas = f (cantidadDeNinjas mision)}

mapModificarNinjasEnemigos :: ([Ninja] -> [Ninja]) -> Mision -> Mision
mapModificarNinjasEnemigos f mision = mision {ninjasEnemigos = f (ninjasEnemigos mision)}

----------------------------------------- EJEMPLOS DE MISIONES -------------------------------------------------------

misionRescate :: Mision
misionRescate = UnaMision {
    cantidadDeNinjas = 3,
    rangoRecomendable = 3,
    ninjasEnemigos = [gonzi, esteban],
    herramientaDeRecompensa = shurikens
}

misionCombate :: Mision
misionCombate = UnaMision {
    cantidadDeNinjas = 2,
    rangoRecomendable = 4,
    ninjasEnemigos = [gonzi],
    herramientaDeRecompensa = bombasDeHumo
}

------------------------------------------------ PARTE B -------------------------------------------------------

-- ES DESAFIANTE
esDesafiante :: EquipoDeNinjas -> Mision -> Bool
esDesafiante unEquipoDeNinjas unaMision = algunoTieneMenorRangoQueElRecomendado unEquipoDeNinjas unaMision && cantidadDeNinjasEnemigos unaMision >= 2

cantidadDeNinjasEnemigos :: Mision -> Int
cantidadDeNinjasEnemigos = length . ninjasEnemigos

algunoTieneMenorRangoQueElRecomendado :: EquipoDeNinjas -> Mision -> Bool
algunoTieneMenorRangoQueElRecomendado unEquipoDeNinjas unaMision = any (tieneMenorRangoQueElRecomendado unaMision) unEquipoDeNinjas

tieneMenorRangoQueElRecomendado :: Mision -> Ninja -> Bool 
tieneMenorRangoQueElRecomendado unaMision unNinja = rango unNinja < rangoRecomendable unaMision


-- ES COPADA 
esCopada :: Mision -> Bool
esCopada (UnaMision _ _ _ ("Bombas de Humo", 3)) = True
esCopada (UnaMision _ _ _ ("Shurikens", 5)) = True
esCopada (UnaMision _ _ _ ("Kunais", 14)) = True
esCopada _ = False


-- ES FACTIBLE 
esFactible :: EquipoDeNinjas -> Mision -> Bool
esFactible unEquipoDeNinjas unaMision = noEsDesafiante unEquipoDeNinjas unaMision && cantidadNecesariaOSumaSuperiorA500 unEquipoDeNinjas unaMision

cantidadNecesariaOSumaSuperiorA500 :: EquipoDeNinjas -> Mision -> Bool
cantidadNecesariaOSumaSuperiorA500 unEquipoDeNinjas unaMision = cantidadDeNinjasNecesaria unEquipoDeNinjas unaMision || sumaSuperiorA500 unEquipoDeNinjas

sumaSuperiorA500 :: EquipoDeNinjas -> Bool
sumaSuperiorA500 = (> 500) . sumaTotalDeHerramientas

sumaTotalDeHerramientas :: EquipoDeNinjas -> Int
sumaTotalDeHerramientas = sum . map cantidadHerramientas

cantidadDeNinjasNecesaria :: EquipoDeNinjas -> Mision -> Bool
cantidadDeNinjasNecesaria unEquipoDeNinjas unaMision = length unEquipoDeNinjas == cantidadDeNinjas unaMision

noEsDesafiante :: EquipoDeNinjas -> Mision -> Bool
noEsDesafiante unEquipoDeNinjas unaMision = not . esDesafiante unEquipoDeNinjas $ unaMision


-- FALLAR MISION 
fallarMision :: EquipoDeNinjas -> Mision -> EquipoDeNinjas
fallarMision unEquipoDeNinjas = map disminuirRango . quienesQuedan unEquipoDeNinjas 

quienesQuedan :: EquipoDeNinjas -> Mision -> EquipoDeNinjas
quienesQuedan unEquipoDeNinjas unaMision = filter (tieneRangoRecomendadoOsuperior unaMision) unEquipoDeNinjas

tieneRangoRecomendadoOsuperior :: Mision -> Ninja -> Bool
tieneRangoRecomendadoOsuperior unaMision unNinja = rango unNinja >= rangoRecomendable unaMision

disminuirRango :: Ninja -> Ninja
disminuirRango = mapModificarRango (subtract 2)


-- CUMPLIR MISION
cumplirMision :: EquipoDeNinjas -> Mision -> EquipoDeNinjas
cumplirMision unEquipoDeNinjas unaMision = promocionarRango . obtenerHerramientaDeRecompensaParaTodoElEquipo unaMision $ unEquipoDeNinjas

obtenerHerramientaDeRecompensaParaTodoElEquipo :: Mision -> EquipoDeNinjas -> EquipoDeNinjas
obtenerHerramientaDeRecompensaParaTodoElEquipo unaMision = map (obtenerHerramientaDeRecompensaPorNinja unaMision)

obtenerHerramientaDeRecompensaPorNinja :: Mision -> Ninja -> Ninja
obtenerHerramientaDeRecompensaPorNinja unaMision unNinja = obtenerHerramienta unNinja (herramientaDeRecompensa unaMision)

promocionarRango :: EquipoDeNinjas -> EquipoDeNinjas
promocionarRango = map aumentarRango

aumentarRango :: Ninja -> Ninja
aumentarRango = mapModificarRango (+ 1)


-- CLONES DE SOMBRA 
clonesDeSombra :: Int -> Jutsu
clonesDeSombra cantidadDeClones = mapModificarCantidadDeNinjas (max 0 . subtract cantidadDeClones) 


-- FUERZA DE UN CENTENAR
fuerzaDeUnCentenar :: Jutsu
fuerzaDeUnCentenar = mapModificarNinjasEnemigos (filter ((>= 500) . rango))


-- EJECUTAR MISION 
aplicarJutsus :: EquipoDeNinjas -> Mision -> Mision
aplicarJutsus unEquipoDeNinjas unaMision = foldr ($) unaMision . concatMap jutsus $ unEquipoDeNinjas


------------------------------------------------ PARTE C -------------------------------------------------------

granGuerraNinja :: Mision
granGuerraNinja = UnaMision {
    cantidadDeNinjas = 100000,
    rangoRecomendable = 100,
    ninjasEnemigos = listaDeInfinitosZetsus, 
    herramientaDeRecompensa = ("Abanico de Madara Uchiha", 1)
}

listaDeInfinitosZetsus :: [Ninja]
listaDeInfinitosZetsus = map zetsu [1..]

zetsu :: Int -> Ninja 
zetsu unNumero = UnNinja {
    nombre = "Zetsu " ++ show unNumero,
    herramientas = [],
    jutsus = [],
    rango = 600
}




