-- PUNTO 1

type Persona = String
type Habilidad = String

sirve :: Problema -> Habilidad -> Bool
habilidades :: Persona -> [Habilidad]

podrianAyudar :: String -> [Persona] -> [Persona]
podrianAyudar unProblema unasPersonas = filter (any sirve unProblema) . habilidades $ unasPersonas


-- PUNTO 2
-- Orden Superior: Porque se utilizan funcion como filter y any que estas son funciones de orden superior 
-- Composicion: Ya que se esta combinando dos funciones en una, filter (any sirve unProblema) se compone con habilidades. Primero se aplica habilidades a la lista de personas y luego se aplica el filter a esta
-- Aplicacion Parcial: sirve es parcialmente aplicadoo a unProblema y any es parcialmente aplicado a la funcion sirve unProblema

-- PUNTO 3
-- Por la lazyEvaluation, si esta funcion se aplica a una lista infinita, no se va a evaluar toda la lista, sino que se va a ir evaluando de a uno hasta que se encuentre el primer elemento que cumpla con la condicion. En este caso, se va a ir evaluando de a uno hasta que se encuentre una persona que pueda ayudar con el problema


