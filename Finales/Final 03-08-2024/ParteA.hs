data Destino = Lugar {
    nombre :: [Char], 
    precio :: Float, 
    atractivos :: [String]
}

tieneBoliches :: Destino -> Bool
tieneBoliches unDestino = ((elem "boliches") . atractivos) unDestino

barato :: Destino -> Bool
barato unDestino = precio unDestino < 50

alguien :: [Destino -> Bool]
alguien = [tieneBoliches, barato]


-- PUNTO 1 
-- a)
tieneAtractivo :: String -> Destino -> Bool
tieneAtractivo unAtractivo unDestino = elem unAtractivo (atractivos unDestino)

-- b) Volver a definir alguien usando tieneAtractivo en vez de tieneBoliches, indicando que concepto del paradigmas se aprovecha en esta solucion que no se usaba en la definicion anterior de alguien
alguienVol2 :: [Destino -> Bool]
alguienVol2 = [tieneAtractivo "boliche", barato] 

-- Estoy aprovechando los conceptos de orden superior y currificacion

-- PUNTO 2
type Requisito = Destino -> Bool

destinosElegidos :: [Requisito] -> [Destino] -> [Destino]
destinosElegidos unosRequisitos unosDestinos = filter (f unosRequisitos) unosDestinos

f :: [Requisito] -> Destino -> Bool
f unosRequisitos unDestino = any unDestino unosRequisitos

-- a) Falso, en la funcion F se recibe un solo destino mientras que en destinosElegidos se recibe una lista de destinos
-- b) Falso, es declarativa la funcion ya que se delega la logicas de los requisitos a la funcion f
-- c) Verdadero, ya que el nombre de la funcion F, no describe el que hace esta
-- d) Falso, gracias a la lazy evaluation, si se encuentra los requisitos frenaria la evaluacion y los devolveria, pero si no esta, no se frenaria nunca la evaluacion