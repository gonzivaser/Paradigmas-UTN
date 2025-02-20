-- 1
{--
    medicamento :: Sintoma -> [Sintoma]
    curaTodosLos :: [Sintoma] -> Medicamento -> Bool
--}

-- 2
{--
    En mejorMedicamentoPara se puede ver el concepto de aplicacion parcial ya que a curaTodosLos se le pasa uno de los
    dos parametros que necesita. Y despues se puede ver el concepto de orden superior, ya que, se utiliza la funcion 
    find, que esta es de este orden.
--}

-- 3
{--
    Devolveria "bicarbonato" ya que esta es la que cura la picazon, y por lazyEvaluation, va a buscar hasta que encuentre
    uno que cumpla con la condicion.
--}