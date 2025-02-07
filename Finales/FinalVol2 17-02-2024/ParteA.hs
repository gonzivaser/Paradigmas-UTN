-- 1
-- podrianAyudar :: Problema -> [Persona] -> [Persona]
-- podrianAyudar unProblema unasPersonas = filter (tieneHabilidadUtil unProblema) unasPersonas 

-- tieneHabilidadUtil :: Problema -> Persona -> Bool
-- tieneHabilidadUtil unProblema unaPersona = any (\unaHabilidad -> sirve unProblema unaHabilidad) . habilidades $ unaPersona



-- 2
{--
   Orden Superior: Se utiliza en las funciones como filter, ya que esta es de orden superior
   Composicion: Se utiliza en la funcion "tieneHabilidadUtil" donde se compone la lista de habilidades con el any
   Aplicacion Parcial: 
   Pattern Mathching: No se usa
--}

-- 3
{--
   Por lazy evaluation, va a buscar hasta encontrar una habilidad que sirva.
--}