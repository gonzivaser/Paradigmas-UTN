import Text.Show.Functions

data Personaje = UnPersonaje {
    nombre :: String, 
    poderBasico :: PoderBasico,
    superPoder :: SuperPoder,
    superPoderActivo :: Bool,
    cantidadDeVida :: Int
} deriving Show

type PoderBasico = Personaje -> Personaje 
type SuperPoder = String

modificarVida :: (Int -> Int) -> Personaje -> Personaje
modificarVida unaFuncion unPersonaje = unPersonaje {cantidadDeVida = (unaFuncion . cantidadDeVida) unPersonaje}


bolaEspinosa :: PoderBasico
-- bolaEspinosa unPersonaje = unPersonaje {cantidadDeVida = max 0 (cantidadDeVida unPersonaje - 1000)}
bolaEspinosa unPersonaje = modificarVida (max 0 . subtract 1000) unPersonaje
-- USO MAXIMO ENTRE 0 Y UN NUMERO PARA QUE NO SEA NEGATIVO, EJEMPLO: CUAL ES EL MAXIMO ENTRE 0 y -3, VA A DAR CERO


-- ENTRE ESTAS DOS, SE UTILIZA LA SEGUNDA SIEMPRE
--lluviaDeTuercas :: String -> Personaje -> Personaje 
--lluviaDeTuercas tipoDeTuerca unPersonaje 
--  | tipoDeTuerca == "Sanadora" = unPersonaje {cantidadDeVida = cantidadDeVida unPersonaje + 800}
--  | tipoDeTuerca == "Dañina" = unPersonaje {cantidadDeVida = div (cantidadDeVida unPersonaje) 2}
--  | otherwise = unPersonaje

lluviaDeTuercas :: String -> PoderBasico
-- lluviaDeTuercas "Sanadora" unPersonaje = unPersonaje {cantidadDeVida = cantidadDeVida unPersonaje + 800}
-- lluviaDeTuercas "Dañina" unPersonaje = unPersonaje {cantidadDeVida = div (cantidadDeVida unPersonaje) 2}
lluviaDeTuercas "Sanadora" unPersonaje = modificarVida (+800) unPersonaje
lluviaDeTuercas "Dañina" unPersonaje = modificarVida (`div` 2) unPersonaje
lluviaDeTuercas _ unPersonaje = unPersonaje


espina :: Personaje 
espina = UnPersonaje {
    nombre = "Espina",
    poderBasico = bolaEspinosa, 
    superPoder = "granada de espinas", 
    superPoderActivo = True,
    cantidadDeVida = 4800
}

pamela :: Personaje 
pamela = UnPersonaje {
    nombre = "Pamela",
    poderBasico = lluviaDeTuercas "Sanadora", 
    superPoder = "Torrecurativa", 
    superPoderActivo = False,
    cantidadDeVida = 9600
}