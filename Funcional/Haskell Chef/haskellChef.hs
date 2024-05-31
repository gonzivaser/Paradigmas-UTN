-- https://docs.google.com/document/d/13SS-HXVR7z5SOgQCwYh2Maob7QhSh858PTSzc7MymCY/edit

import Text.Show.Functions

-------------------------------------------------- DATA -------------------------------------------------------

data Participante = UnParticipante {
    nombre :: String,
    trucos :: [Truco],
    plato :: Plato
} deriving (Show)

type Truco = Plato -> Plato

data Plato = UnPlato {
    dificultad :: Int, 
    componentes :: [Componente]
} deriving (Show)

type Componente = (Ingrediente, Peso)
type Ingrediente = String 
type Peso = Int

-------------------------------------------------- ACCESORS -------------------------------------------------------

mapModificarNombre :: (String -> String) -> Participante -> Participante
mapModificarNombre unaFuncion unParticipante = unParticipante {nombre = unaFuncion . nombre $ unParticipante}

mapModificarTrucos :: ([Truco] -> [Truco]) -> Participante -> Participante
mapModificarTrucos unaFuncion unParticipante = unParticipante {trucos = unaFuncion . trucos $ unParticipante}

mapModificarPlato :: (Plato -> Plato) -> Participante -> Participante
mapModificarPlato unaFuncion unParticipante = unParticipante {plato = unaFuncion . plato $ unParticipante}

mapModificarDificultad :: (Int -> Int) -> Plato -> Plato
mapModificarDificultad unaFuncion unPlato = unPlato {dificultad = unaFuncion . dificultad $ unPlato}

mapModificarComponentes :: ([Componente] -> [Componente]) -> Plato -> Plato
mapModificarComponentes unaFuncion unPlato = unPlato {componentes = unaFuncion . componentes $ unPlato}

-------------------------------------------------- TRUCOS -------------------------------------------------------

endulzar :: Int -> Truco
endulzar unosGramos unPlato = agregarComponentes "Azucar" unosGramos unPlato

agregarComponentes :: String -> Int -> Plato -> Plato
agregarComponentes unNombre unosGramos = mapModificarComponentes (++ [(unNombre, unosGramos)])

