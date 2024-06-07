import Text.Show.Functions

{--
CONSIGNA: 
https://drive.google.com/file/d/18c1VXjtvMaJeIIHE-gMtTOWycW4r62Ig/view
--}

----------------------------------------------- DATA CHICO -------------------------------------------------------

data Chico = UnChico {
    nombre :: String,
    edad :: Int,
    habilidades :: [String],
    deseos :: [Deseo]
} deriving (Show)

type Deseo = Chico -> Chico 

----------------------------------------------- ACCESORS -------------------------------------------------------

mapModificarNombre :: (String -> String) -> Chico -> Chico
mapModificarNombre f chico = chico {nombre = f (nombre chico)}

mapModificarEdad :: (Int -> Int) -> Chico -> Chico
mapModificarEdad f chico = chico {edad = f (edad chico)}

mapModificarHabilidades :: ([String] -> [String]) -> Chico -> Chico
mapModificarHabilidades f chico = chico {habilidades = f (habilidades chico)}

mapModificarDeseos :: ([Deseo] -> [Deseo]) -> Chico -> Chico
mapModificarDeseos f chico = chico {deseos = f (deseos chico)}

--------------------------------------------- EJEMPLOS DE PRUEBA -------------------------------------------------------

gonzi :: Chico
gonzi = UnChico {
    nombre = "Gonzi",
    edad = 10,
    habilidades = ["Jugar al futbol", "Estudiar"],
    deseos = [aprenderHabilidades ["Programador"]]
}

esteban :: Chico
esteban = UnChico {
    nombre = "Esteban",
    edad = 8,
    habilidades = ["Programador"],
    deseos = [serGrosoEnNeedForSpeed]
}

carry :: Chico 
carry = UnChico {
    nombre = "Carry",
    edad = 12,
    habilidades = ["Saber linux"],
    deseos = [serMayor]
}

--------------------------------------------- PARTE A -------------------------------------------------------

--------------------------------------------- DESEOS -------------------------------------------------------
-- APRENDER HABILIDADES
aprenderHabilidades :: [String] -> Deseo
aprenderHabilidades habilidadesNuevas unChico = mapModificarHabilidades (++ habilidadesNuevas) unChico

-- SER GROSO EN NEEDFORSPEED
serGrosoEnNeedForSpeed :: Deseo
serGrosoEnNeedForSpeed unChico = mapModificarHabilidades (++ infinitasVersionesNeedForSpeed) unChico

infinitasVersionesNeedForSpeed :: [String]
infinitasVersionesNeedForSpeed = map needForSpeedVersion [1..]

needForSpeedVersion :: Int -> String
needForSpeedVersion unNumero = "jugar need for speed " ++ show unNumero

-- SER MAYOR
serMayor :: Deseo
serMayor unChico = mapModificarEdad (const 18) unChico

--------------------------------------------- PADRINOS -------------------------------------------------------

type Padrino = Chico -> Chico

wanda :: Padrino
wanda unChico = (madurar . cumplirPrimerDeseo unChico) unChico

madurar :: Chico -> Chico
madurar unChico = mapModificarEdad (+1) unChico 

cumplirPrimerDeseo :: Chico -> Deseo
cumplirPrimerDeseo unChico = head . deseos $ unChico

cosmo :: Padrino
cosmo unChico = mapModificarEdad (`div` 2) unChico

muffinMagico :: Padrino
muffinMagico unChico = foldr ($) unChico (deseos unChico)

--------------------------------------------- PARTE B -------------------------------------------------------

type Pareja = Chico -> Bool 

--------------------------------------------- PARTE 1 -------------------------------------------------------

-- TIENE HABILIDAD 
tieneHabilidad :: String -> Pareja
tieneHabilidad unaHabilidad unChico = poseeHabilidad unaHabilidad unChico

poseeHabilidad :: String -> Chico -> Bool
poseeHabilidad unaHabilidad unChico = elem unaHabilidad . habilidades $ unChico

-- ES SUPER MADURO
esSuperMaduro :: Pareja
esSuperMaduro unChico = esMayorDeEdad unChico && sabeManejar unChico

esMayorDeEdad :: Chico -> Bool
esMayorDeEdad unChico = edad unChico > 18

sabeManejar :: Chico -> Bool
sabeManejar unChico = elem "Manejar" (habilidades unChico)

--------------------------------------------- PARTE 2 -------------------------------------------------------

data Chica = UnaChica {
    nombreChica :: String,
    condicion :: Pareja
} deriving (Show)

trixie :: Chica
trixie = UnaChica {
    nombreChica = "Trixie Tang",
    condicion = noEsTimmy
}

vicky :: Chica
vicky = UnaChica {
    nombreChica = "Vicky",
    condicion = tieneHabilidad "ser un supermodelo noruego"
}

noEsTimmy :: Pareja
noEsTimmy (UnChico "Timmy" _ _ _) = False
noEsTimmy _ = True

-- QUIEN CONQUISTA A
-- SIN RECURSIVIDAD
quienConquistaA :: Chica -> [Chico] -> Chico
quienConquistaA unaChica unosChicos 
  | null (filtrarChicosQueCumplanCondicionDeChica unaChica unosChicos) = last unosChicos
  | otherwise = head (filtrarChicosQueCumplanCondicionDeChica unaChica unosChicos)

filtrarChicosQueCumplanCondicionDeChica :: Chica -> [Chico] -> [Chico]
filtrarChicosQueCumplanCondicionDeChica unaChica unosChicos = filter (condicion unaChica) unosChicos

-- CON RECURSIVIDAD
quienConquistaARecu :: Chica -> [Chico] -> Chico
quienConquistaARecu unaChica (cabeza : cola) 
  | condicion unaChica cabeza = cabeza
  | null cola = cabeza
  | otherwise = quienConquistaARecu unaChica cola

-- EJEMPLO DE CONSULTA
-- quienConquistaA vicky [gonzi, esteban, carry]

--------------------------------------------- PARTE C -------------------------------------------------------

infractoresDeDaRules :: [Chico] -> [String]
infractoresDeDaRules unosChicos = map nombre (filter (tieneHabilidadProhibida . tomar5Habilidades . aplicarDeseo) unosChicos)

aplicarDeseo :: Chico -> Chico
aplicarDeseo unChico = muffinMagico unChico

tomar5Habilidades :: Chico -> [String]
tomar5Habilidades unChico = take 5 . habilidades $ unChico

tieneHabilidadProhibida :: [String] -> Bool
tieneHabilidadProhibida unasHabilidades = any (`elem` habilidadesProhibidas) unasHabilidades

habilidadesProhibidas :: [String]
habilidadesProhibidas = ["Enamorar", "Matar", "Dominar el mundo"]
