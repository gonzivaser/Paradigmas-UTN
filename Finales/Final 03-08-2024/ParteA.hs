-- EMPIEZA CODIGO CONSIGNA 
data Destino = Lugar {
    nombre :: [Char], 
    precio :: Float, 
    atractivos :: [String]
}

-- tieneBoliches destino = ((elem 'boliches') . atractivos) destino
-- barato destino = precio destino < 50
-- alguien = [tieneBoliches, barato]

-- TERMINA CODIGO CONSIGNA 

-- 1
-- a)
{-- 
   El tipo de la funcion "tieneAtractivo", recibe un String que seria el atractivo, y un destino, devolviendo un booleano. }
   True en caso de que el atractivo recibido se encuentre en la lista de atractivos del destino recibido, False en 
   caso contrario.
--}

tieneAtractivo :: String -> Destino -> Bool
tieneAtractivo unAtractivo unDestino = ((elem unAtractivo) . atractivos) unDestino


-- b)
barato :: Destino -> Bool
barato unDestino = precio unDestino < 50

alguien :: [Destino -> Bool]
alguien = [tieneAtractivo "Montaña Rusa", barato]

{--
   El concepto del paradigma que se aprovecha en esta solucion en comparacion a la otra, es la aplicacion parcial. Ya que 
   se esta aplicando parcialmente la funcion "tieneAtractivo" pasandole un solo parametro de los dos que necesita
--}

-- 2
-- destinosElegidos requisitos destinos = filter (f requisitos) destinos 
-- f requisitos destino = any destino requisitos
{--
   a) Falso, no funciona correctamente porque en la funcion "f", no se estan aplicando todos los requisitos a los destinos
   b) Falso, la solucion es declarativa porque hay delegacion de logica
   c) Verdadero, la solucion es poco expresiva porque no se entiende que es lo que hace la funcion "f"
   d) Falso, por lazy evaluation, se va a evaluar hasta encontrar algun destino cumpla con los requisitos de la persona
--}

destinosElegidos :: [Destino -> Bool] -> [Destino] -> [Destino]
destinosElegidos unosRequisitos unosDestinos = filter (cumpleRequisitos unosRequisitos) unosDestinos

cumpleRequisitos :: [Destino -> Bool] -> Destino -> Bool
cumpleRequisitos unosRequisitos unDestino = all(\unRequisito -> unRequisito unDestino) unosRequisitos