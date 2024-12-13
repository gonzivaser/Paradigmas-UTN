-- PUNTO 1
habilidades :: Persona -> [Habilidad]
sirve :: Problema -> Habilidad -> Bool

podrianAyudar :: Problema -> [Persona] -> [Persona] 
podrianAyudar problema unasPersonas = filter (any (sirve problema) . habilidades) unasPersonas


-- PUNTO 2
-- Se utiliza orden superior porque funciones filter y any son de orden superior
-- Se utilzia composicion ; aplicando primero habilidades a unas personas y despues any a sirve y esa lista de habilidades
-- Se utiliza aplicacion parcial ; Porque Al escribir sirve problema, se fija el primer argumento (problema) y queda pendiente el segundo argumento (Habilidad).

-- PUNTO 3
-- Por lazy evaluation, si habria alguna habilidad que sirva, la evaluacion se detiene en ese punto, pero si no hay ninguna habilidad que le sirva la evaluacion no se detendria 