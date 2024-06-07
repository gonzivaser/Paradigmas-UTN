import Text.Show.Functions

{--
CONSIGNA: 
https://docs.google.com/document/d/12PSO8F15XHRvOn53khcSMqku6qVuo0j2r9g77GCWZHk/edit
--}

----------------------------------------------- DATA ANIMALES -------------------------------------------------------

data Animal = UnAnimal {
    coeficienteIntelectual :: Int,
    especie :: String,
    capacidades :: [String]
} deriving (Show)

type Transformacion = Animal -> Animal

------------------------------------------ EJEMPLOS ANIMALES -------------------------------------------------------

pinky :: Animal
pinky = UnAnimal {
    coeficienteIntelectual = 10,
    especie = "Raton",
    capacidades = ["Hacer preguntas"]
}

cerebro :: Animal
cerebro = UnAnimal {
    coeficienteIntelectual = 100,
    especie = "Raton",
    capacidades = ["Hacer planes"]
}

----------------------------------------------- ACCESORS -------------------------------------------------------

mapModificarCoeficienteIntelectual :: (Int -> Int) -> Animal -> Animal
mapModificarCoeficienteIntelectual f animal = animal {coeficienteIntelectual = f (coeficienteIntelectual animal)}

mapModificarEspecie :: (String -> String) -> Animal -> Animal
mapModificarEspecie f animal = animal {especie = f (especie animal)}

mapModificarCapacidades :: ([String] -> [String]) -> Animal -> Animal
mapModificarCapacidades f animal = animal {capacidades = f (capacidades animal)}

----------------------------------------------- PUNTO 2 -------------------------------------------------------

-- INTELIGENCIA SUPERIOR 
inteligenciaSuperior :: Int -> Transformacion
inteligenciaSuperior unNumero = mapModificarCoeficienteIntelectual (+ unNumero)

-- PINKIFICAR
pinkificar :: Transformacion
pinkificar = mapModificarCapacidades (const [])

-- SUPERPODERES
superPoderes :: Transformacion
superPoderes unAnimal 
  | esAnimal "Elefante" unAnimal = mapModificarCapacidades (++ ["no tenerle miedo a los ratones"]) unAnimal
  | esRatonConCoeficienteMayorA100 unAnimal = mapModificarCapacidades (++ ["hablar"]) unAnimal
  | otherwise = unAnimal

esRatonConCoeficienteMayorA100 :: Animal -> Bool
esRatonConCoeficienteMayorA100 unAnimal = esAnimal "Raton" unAnimal && ((>= 100) . coeficienteIntelectual) unAnimal

esAnimal :: String -> Animal -> Bool 
esAnimal unaEspecie unAnimal = especie unAnimal == unaEspecie

----------------------------------------------- PUNTO 3 -------------------------------------------------------

type Exito = Animal -> Bool

-- ANTROPOMORFICO
antropomorfico :: Exito
antropomorfico unAnimal = elem "hablar" (capacidades unAnimal) && coeficienteIntelectual unAnimal > 60

-- NO TAN CUERDO
noTanCuerdo :: Exito
noTanCuerdo = (> 2) . cantidadDeHabilidadesPinkiescas

cantidadDeHabilidadesPinkiescas :: Animal -> Int
cantidadDeHabilidadesPinkiescas = length . filter pinkiesco . capacidades

pinkiesco :: String -> Bool
pinkiesco unaPalabra = empiezaConHacer unaPalabra && palabraPinkiesca (drop 6 unaPalabra)

empiezaConHacer :: String -> Bool
empiezaConHacer unaPalabra = (== "hacer ") . take 6 $ unaPalabra

palabraPinkiesca :: String -> Bool
palabraPinkiesca unaPalabra = ((<= 4) . length) unaPalabra && tieneVocal unaPalabra

tieneVocal :: String -> Bool
tieneVocal = any esVocal

esVocal :: Char -> Bool
esVocal letra = elem letra "AEIOUaeiou"

----------------------------------------------- PUNTO 4 -------------------------------------------------------

type Experimento = ([Transformacion], Exito)

---------------------------------------------- FUNCIONES -------------------------------------------------------

-- EXPERIMENTO EXITOSO
experimentoExitoso :: Experimento -> Animal -> Bool
experimentoExitoso (unasTransformaciones, unExito) unAnimal = unExito . aplicarTransformaciones unasTransformaciones  $ unAnimal

aplicarTransformaciones :: [Transformacion] -> Animal -> Animal
aplicarTransformaciones unasTransformaciones unAnimal = foldr ($) unAnimal unasTransformaciones

-- EJEMPLO DE CONSULTA
raton :: Animal 
raton = UnAnimal {
    coeficienteIntelectual = 17,
    especie = "Raton",
    capacidades = ["destruenglonir el mundo", "hacer planes desalmados"]
}

{--
    experimentoExitoso ([pinkificar, inteligenciaSuperior 10, superPoderes], antropomorfico) raton
--}

----------------------------------------------- PUNTO 5 -------------------------------------------------------

-- 1
coeficientesIntelectualesConCapacidades :: [Animal] -> [String] -> Experimento -> [Int]
coeficientesIntelectualesConCapacidades unosAnimales unasCapacidades unExperimento = map coeficienteIntelectual . filter (tieneAlgunaDeLasCapacidades unasCapacidades . aplicarTransformaciones (fst unExperimento)) $ unosAnimales

tieneAlgunaDeLasCapacidades :: [String] -> Animal -> Bool
tieneAlgunaDeLasCapacidades unasCapacidades unAnimal = any (`elem` capacidades unAnimal) unasCapacidades



-- 2
listaDeEspecieDeAnimales :: [Animal] -> [String] -> Experimento -> [String]
listaDeEspecieDeAnimales unosAnimales unasCapacidades unExperimento = map especie . filter (tieneAlgunaDeLasCapacidades unasCapacidades . aplicarTransformaciones (fst unExperimento)) $ unosAnimales

----------------------------------------------- PUNTO 6 -------------------------------------------------------

nuevoAnimal :: Animal 
nuevoAnimal = UnAnimal {
    coeficienteIntelectual = 50,
    especie = "Elefante",
    capacidades = listaDeInfinitasCapacidades
}

listaDeInfinitasCapacidades :: [String]
listaDeInfinitasCapacidades = map capacidadesInfinitas [1..]

capacidadesInfinitas :: Int -> String
capacidadesInfinitas unNumero = "Capacidad " ++ show unNumero
