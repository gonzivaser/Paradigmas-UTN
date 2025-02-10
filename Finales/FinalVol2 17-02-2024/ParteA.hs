-- 1
{--
   podrianAyudar :: Problema -> [Persona] -> [Persona]
   podrianAyudar unProblema unasPersonas = filter (tieneHabilidadBuscada unProblema) . habilidades $ unasPersonas

   tieneHabilidadBuscada :: Probelma -> [Habilidad] -> Bool
   tieneHabilidadBuscada unProblema unasHabilidades = any (\unaHabilidad -> sirve unProblema unaHabilidad) unasHabilidades
--}

-- 2
{--
   Orden Superior: Se esta utilizando ya que se estan usando las funciones filter y any, que estas son de orden superior.
   Filter se esta utilizando para filtrar las personas que cuenten con la habilidad buscada, y any para ver si alguna de las habilidades
   sirve para el problema recibido. 

   Composicion: Se esta utilizando, para componer la funcion habilidades con la funcion filter. 

   Aplicacion Parcial: Se esta utilizando, porque a tieneHabilidadBuscada se le esta pasando uno de los dos parametros
   que esta necesita.
--}

-- 3
{--
   Por lazy evaluation, evaluaria hasta encontrar una persona que cuente con la habilidad requerida que sirve para el 
   problema recibido.
--}