{--
    CONSIGNA: 
    https://www.utnianos.com.ar/foro/attachment.php?aid=20203
--}

data Heroe = UnHeroe {
    nombre :: String,
    epileto :: String,
    reconocimiento :: Int,
    artefactos :: [Artefacto]
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

