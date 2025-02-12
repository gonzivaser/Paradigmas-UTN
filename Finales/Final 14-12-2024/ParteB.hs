-- 1
-- DATA ATLETA
data Atleta = UnAtleta {
    edad :: Int, 
    nacionalidad :: String, 
    equipamiento :: [String]
} 

-- DATA COMPETENCIA
data Competencia = UnaCompetencia {
    requisitos :: [Requisito]
}

type Requisito = Atleta -> Bool


-- FUNCIONES DE REQUISITOS
requisitoPorNacionalidad :: String -> Requisito
requisitoPorNacionalidad unaNacionalidad unAtleta = (==) unaNacionalidad . nacionalidad $ unAtleta

requisitoPorEdad :: Int -> Requisito
requisitoPorEdad unaEdad unAtleta = (==) unaEdad . edad $ unAtleta

requisitoPorEquipamiento :: String -> Requisito
requisitoPorEquipamiento unEquipamiento unAtleta = elem unEquipamiento . equipamiento $ unAtleta


-- 2
futbol :: Competencia
futbol = UnaCompetencia {
    requisitos = [requisitoPorNacionalidad "Argentina", requisitoPorEdad 18, requisitoPorEquipamiento "Botines"]
}


-- 3
controlDeInscripcion :: [Atleta] -> Competencia -> [Atleta]
controlDeInscripcion unosAtletas unaCompetencia = filter (\unAtleta -> puedeParticipar unAtleta unaCompetencia) unosAtletas

puedeParticipar :: Atleta -> Competencia -> Bool
puedeParticipar unAtleta unaCompetencia = cumpleRequisitos unAtleta . requisitos $ unaCompetencia

cumpleRequisitos :: Atleta -> [Requisito] -> Bool
cumpleRequisitos unAtleta unosRequisitos = all (\unRequisito -> unRequisito unAtleta) unosRequisitos


-- 4 
{--
   Composicion: Se utiliza composicion en la funcion puedeParticipar, donde aplico la funcion cumpleRequisitos a unAtleta 
   y los requisitos de una competencia, pero "requisitos" tambien es otra funcion que se esta aplicando a unaCompetencia.
   
   Aplicacion Parcial: Se utiliza por ejemplo en la funcion puedeParticipar, donde cumpleRequisitos se aplica parcialmente
   ya que se le pasa el primer argumento unAtleta, y el segundo argumento se obtiene de la composicion con la funcion
   requisitos aplicado a unaCompetencia.

   Orden Superior: Se utiliza en las funciones controlDeInscripcion y cumpleRequisitos, ya que se estan utilizando 
   las funciones filter y all, que son dos funciones de orden superior.
--}
