-- EMPIEZA CODIGO DE CONSIGNA
data Alimento = UnaComida {
    nombre :: [Char], 
    calorias :: Float, 
    nutrientes :: [String]
}

esBajoEnCalorias :: Alimento -> Bool 
esBajoEnCalorias unaComida = calorias unaComida < 100

tieneProteinas :: Alimento -> Bool
tieneProteinas = elem "Proteinas" . nutrientes
-- TERMINA CODIGO DE CONSIGNA


-- 1 DEFINIR EL TIPO DE ANA 
ana :: [Alimento -> Bool] 
ana = [esBajoEnCalorias, tieneProteinas]

-- 2
-- a)
tieneNutriente :: String -> Alimento -> Bool 
tieneNutriente unNutriente = elem unNutriente . nutrientes 

{-El tipo de la funcion "tieneNutriente" recibe una comida y un nutriente, entonces lo que hace es evaluar si el nutriente recibido esta
  en la lista de nutrientes de la comida recibida, devolviendo un booleano. True en caso de que este, false en 
  caso de que no
-}

-- b)
anaVol2 :: [Alimento -> Bool] 
anaVol2 = [esBajoEnCalorias, tieneNutriente "Grasas"]

{- En este caso se esta aprovechando el concepto de aplicacion parcial del paradigma funcional, ya que se esta aplicando
   parcialmente la funcion tieneNutriente pasandole solo un parametro de los dos que la funcion necesita
-}

-- 3
alimentosElegidos :: [Alimento -> Bool] -> [Alimento] -> [Alimento]
alimentosElegidos unosRequisitos unosAlimentos = filter (f unosRequisitos) unosAlimentos

f :: [Alimento -> Bool] -> Alimento -> Bool
f unosRequisitos unosAlimentos = any (\unRequisito -> unRequisito unosAlimentos) unosRequisitos

{-
  a) Verdadero, la funcion funciona correctamente porque filtra la lista de alimentos segun la lista de requisitos que hay
  b) Falso, la funcion es declarativa ya que hay delegacion de logica 
  c) Verdadero, la funcion es poco expresiva ya que el nombre de la funcion "f" no describe lo que hace
  d) Falso, por lazyEvaluation se evaluara la lista hasta que se consiga lo necesario, entonces si daria respuesta alguna
-}

-- CORRECCION QUE YO HARIA A LAS DOS FUNCIONES
alimentosElegidosVol2 :: [Alimento -> Bool] -> [Alimento] -> [Alimento]
alimentosElegidosVol2 unosRequisitos = filter (aplicar unosRequisitos) 

aplicar :: [Alimento -> Bool] -> Alimento -> Bool
aplicar unosRequisitos unosAlimentos = any (\unRequisito -> unRequisito unosAlimentos) unosRequisitos
