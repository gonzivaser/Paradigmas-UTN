-- EMPIEZA CODIGO CONSIGNA 
data VideoJuego = UnVideoJuego {
    titulo :: String,
    desarrolladora :: String,
    generos :: [String], 
    lanzamiento :: Int
}

esDesarrolladoPor :: String -> VideoJuego -> Bool
esDesarrolladoPor dev = (== dev) . desarrolladora

perteneceAGenero :: String -> VideoJuego -> Bool
perteneceAGenero genero videoJuego = elem genero (generos videoJuego)

esReciente :: VideoJuego -> Bool
esReciente videoJuego = lanzamiento videoJuego > 2015

-- TERMINA CODIGO CONSIGNA 

-- 1
-- a) 
type Preferencia = VideoJuego -> Bool

data Persona = UnaPersona {
    nombre :: String, 
    preferencias :: [Preferencia]
}

juan :: Persona
juan = UnaPersona {
    nombre = "Juan", 
    preferencias = [esDesarrolladoPor "Nintendo", perteneceAGenero "Plataformas"]
}

maria :: Persona 
maria = UnaPersona {
    nombre = "Maria", 
    preferencias = [esReciente]
}

pedro :: Persona 
pedro = UnaPersona {
    nombre = "Pedro", 
    preferencias = [esDesarrolladoPor "Rockstar Games", perteneceAGenero "Mundo Abierto"]
}

-- b) 
preferidosDelComite :: [Persona] -> [VideoJuego] -> [VideoJuego]
preferidosDelComite unasPersonas unosVideoJuegos = filter (\unVideoJuego -> cumplePreferencias unasPersonas unVideoJuego) unosVideoJuegos

cumplePreferencias :: [Persona] -> VideoJuego -> Bool
cumplePreferencias unasPersonas unVideoJuego = all (\unaPersona -> any ($ unVideoJuego) . preferencias $ unaPersona) unasPersonas


-- 2
{--
   El uso de orden superior en la solucion planteada se puede observar en el uso de las funciones filter, all, y any.
   Ya que estas tres funciones son de orden superior.
--}