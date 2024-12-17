data VideoJuego = UnVideoJuego {
    titulo :: String, 
    desarrolladora :: String,
    generos :: [String], 
    añoDeLanzamiento :: Int
}

esDesarrolladoPor :: String -> VideoJuego -> Bool
esDesarrolladoPor unDesarrollador = (== unDesarrollador) . desarrolladora

perteneceAGenero :: String -> VideoJuego -> Bool
perteneceAGenero unGenero unVideoJuego = elem unGenero . generos $ unVideoJuego

esReciente :: VideoJuego -> Bool
esReciente unVideoJuego = añoDeLanzamiento unVideoJuego > 2015


-- PUNTO 1
-- a) 
data Jugador = UnJugador {
    nombre :: String,
    preferencias :: [VideoJuego -> Bool]
}

juan :: Jugador
juan = UnJugador {
    nombre = "Juan",
    preferencias = [esDesarrolladoPor "nintendo", perteneceAGenero "Plataformas"]
}

maria :: Jugador
maria = UnJugador {
    nombre = "Maria",
    preferencias = [esReciente]
}

pedro :: Jugador
pedro = UnJugador {
    nombre = "Pedro",
    preferencias = [esDesarrolladoPor "rockstar games", perteneceAGenero "Mundo Abierto"]
}


-- b) 
preferidosDelComite :: [Jugador] -> [VideoJuego] -> [VideoJuego]
preferidosDelComite unosJugadores unosVideoJuegos = filter (esPreferidoPorTodos unosJugadores) unosVideoJuegos

esPreferidoPorTodos :: [Jugador] -> VideoJuego -> Bool
esPreferidoPorTodos unosJugadores unVideoJuego = all (\unJugador -> any ($ unVideoJuego) . preferencias $ unJugador) unosJugadores


-- PUNTO 2: 
-- La utilidad del concepto superior se ve en las funciones any, filter, all, etc. Ya que estas son funciones de orden superior

-- PUNTO 3: 
-- Tipos de dato ya definidos previamente