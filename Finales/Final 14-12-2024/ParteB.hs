-- PUTNO 1
data Atleta = UnAtleta {
    edad :: Int, 
    nacionalidad :: String, 
    equipamiento :: [String]
} deriving(Show)

data Competencia = UnaCompetencia {
    requisitos :: [Requisito]
}

type Requisito = Atleta -> Bool

-- PUNTO 2
{-
futbol :: Competencia
futbol = UnaCompetencia {
    requisitos = [requisitoPorNacionalidad "Argentina", requisitoPorEdad 18, requisitoPorEquipamiento ["Botines", "Camiseta"]]
}
-}

-- PUNTO 3
controlDeInscripcion :: [Atleta] -> Competencia -> [Atleta]
controlDeInscripcion unosAtletas unaCompetencia = filter (\unAtleta -> puedeParticipar unAtleta unaCompetencia) unosAtletas

-- FUNCION SI PUEDE PARTICIPAR DE UNA COMPETENCIA 
puedeParticipar :: Atleta -> Competencia -> Bool
puedeParticipar unAtleta unaCompetencia = cumpleRequisitos unAtleta (requisitos unaCompetencia)

-- REQUISITOS
cumpleRequisitos :: Atleta -> [Requisito] -> Bool
cumpleRequisitos unAtleta unosRequisitos = all (\requisito -> requisito unAtleta) unosRequisitos


-- PUNTO 4
{-
Composición: Se utiliza en la creación de funciones combinadas que verifican los requisitos de un atleta de manera secuencial (por ejemplo, utilizando all y aplicando las funciones de requisito una por una).
Aplicación Parcial: Es el proceso de aplicar parcialmente una función, como en la creación de funciones de requisitos (por ejemplo, requisitoEdad).
Orden Superior: Se usa cuando las funciones toman otras funciones como parámetros, como en el caso de filter o all.
-}