-- EMPIEZA CODIGO CONSIGNA 

data VideoJuego = UnVideoJuego {
    titulo :: String, 
    desarrolladora :: String,
    generos :: [String], 
    lanzamiento :: Int
}

-- esDesarrolladoPor dev = (== dev) . desarrolladora
-- perteneceAGenero genero videoJuego = elem genero (generos videoJuego)
-- esReciente videoJuego = lanzamiento videoJuego > 2015

-- TERMINA CODIGO CONSIGNA 
esDesarrolladoPor :: String -> VideoJuego -> Bool
esDesarrolladoPor dev = (== dev) . desarrolladora

perteneceAGenero :: String -> VideoJuego -> Bool
perteneceAGenero genero videoJuego = elem genero (generos videoJuego)

esReciente :: VideoJuego -> Bool
esReciente videoJuego = lanzamiento videoJuego > 2015

-- 1
-- a)
data Jugador = UnJugador {
    nombre :: String,
    preferencias :: [Preferencia]
}

type Preferencia = VideoJuego -> Bool

juan :: Jugador
juan = UnJugador {
    nombre = "Juan", 
    preferencias = [esDesarrolladoPor "Nintendo", perteneceAGenero "Plataformas"]
}

maria :: Jugador
maria = UnJugador {
    nombre = "Maria", 
    preferencias = [esReciente]
}

pedro :: Jugador
pedro = UnJugador {
    nombre = "Pedro", 
    preferencias = [esDesarrolladoPor "RockstarGames", perteneceAGenero "MundoAbierto"]
}


-- b)
preferidosDelComite :: [Jugador] -> [VideoJuego] -> [VideoJuego]
preferidosDelComite unosJugadores unosVideoJuegos = filter (\unVideoJuego -> cumplePreferencias unosJugadores unVideoJuego) unosVideoJuegos

cumplePreferencias :: [Jugador] -> VideoJuego -> Bool
cumplePreferencias unosJugadores unVideoJuego = all (\unJugador -> any ($ unVideoJuego) . preferencias $ unJugador) unosJugadores