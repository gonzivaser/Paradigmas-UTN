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

-------------------------------------------------- PLATOS -------------------------------------------------------

ensalada :: Plato
ensalada = UnPlato {
    dificultad = 1,
    componentes = [("Lechuga", 100), ("Tomate", 50), ("Zanahoria", 50)]
}

pollo :: Plato 
pollo = UnPlato {
    dificultad = 9,
    componentes = [("Pollo", 200), ("Papas", 100), ("Batata", 100), ("Zanahoria", 50), ("Cebolla", 50)]
}

tarta :: Plato
tarta = UnPlato {
    dificultad = 3,
    componentes = [("Masa", 200), ("Cebolla", 50), ("Queso", 100)]
}

-------------------------------------------------- TRUCOS -------------------------------------------------------

endulzar :: Int -> Truco
endulzar unosGramos unPlato = agregarComponentes "Azucar" unosGramos unPlato

salar :: Int -> Truco
salar unosGramos unPlato = agregarComponentes "Sal" unosGramos unPlato

agregarComponentes :: String -> Int -> Plato -> Plato
agregarComponentes unNombre unosGramos = mapModificarComponentes (++ [(unNombre, unosGramos)])

darSabor :: Int -> Int -> Truco
darSabor unosGramosDeSal unosGramosDeAzucar unPlato = (endulzar unosGramosDeAzucar) . (salar unosGramosDeSal) $ unPlato

duplicarPorcion :: Truco 
duplicarPorcion unPlato = mapModificarComponentes (map duplicarCantidad) unPlato

duplicarCantidad :: Componente -> Componente
duplicarCantidad (unIngrediente, unPeso) = (unIngrediente, unPeso * 2)

simplificar :: Truco 
simplificar unPlato 
  | esUnBardo unPlato = seSimplifica unPlato
  | otherwise = unPlato

esUnBardo :: Plato -> Bool
esUnBardo unPlato = cantidadComponentes unPlato >= 5 && (dificultad unPlato) > 7

cantidadComponentes :: Plato -> Int
cantidadComponentes unPlato = length . componentes $ unPlato

seSimplifica :: Plato -> Plato
seSimplifica unPlato = mapModificarComponentes (filter hayMuchaCantidad) $ unPlato {dificultad = 5}

hayMuchaCantidad :: Componente -> Bool
hayMuchaCantidad unComponente = snd unComponente >= 10

-------------------------------------------------- INTERESA SABER -------------------------------------------------------

esVegano :: Plato -> Bool
esVegano unPlato = not . any esProductoAnimal . componentes $ unPlato

esProductoAnimal :: Componente -> Bool 
esProductoAnimal (ingrediente, _) = elem ingrediente ["Leche", "Carne", "Huevo", "Manteca"]

esSinTacc :: Plato -> Bool
esSinTacc unPlato = not . any tieneHarina . componentes $ unPlato

tieneHarina :: Componente -> Bool
tieneHarina (ingrediente, _) = elem ingrediente ["Harina", "Trigo", "Avena"]

esComplejo :: Plato -> Bool
esComplejo unPlato = esUnBardo unPlato

--noAptoHipertension :: Plato -> Bool
--noAptoHipertension unPlato = any tieneSal (componentes unPlato) &&  cantidadSal >= 2

--tieneSal :: Componente -> Bool
--tieneSal (ingrediente, _) = elem ingrediente ["Sal"]

-------------------------------------------------- PARTE B -------------------------------------------------------

pepe :: Participante
pepe = UnParticipante {
    nombre = "Pepe",
    trucos = [darSabor 2 5, simplificar, duplicarPorcion],
    plato = platoPepe
}

platoPepe :: Plato
platoPepe = UnPlato {
    dificultad = 10,
    componentes = [("Sal", 100), ("Sal", 100), ("Sal", 100), ("Sal", 100), ("Sal", 100), ("Sal", 100)]
}

-------------------------------------------------- PARTE C -------------------------------------------------------

cocinar :: [Truco] -> Plato -> Plato
cocinar unosTrucos unPlato = foldr ($) unPlato unosTrucos

esMejorQue :: Plato -> Plato -> Bool 
esMejorQue unPlato otroPlato = dificultad unPlato < dificultad otroPlato && cantidadComponentes unPlato < cantidadComponentes otroPlato

--participanteEstrella :: [Participante] -> Plato -> Participante

-------------------------------------------------- PARTE D -------------------------------------------------------

platinum :: Plato 
platinum = UnPlato {
    dificultad = 10,
    componentes = unaListaDeComponentes
}

unaListaDeComponentes :: [Componente]
unaListaDeComponentes = map ("Ingrediente " ++) (map show [1..]) [1..]

