-- https://docs.google.com/document/d/15VME8b-t_jXznNpPaTevLM3ETlRUAX1cI79tg6TikXY/edit?usp=sharing

-- 1
esMultiploDeTres :: Int -> Bool
esMultiploDeTres unNumero = unNumero `mod` 3 == 0 

-- 2
esMultiploDe :: Int -> Int -> Bool
esMultiploDe unNumero otroNumero = otroNumero `mod` unNumero == 0

-- 3
cubo :: Int -> Int 
cubo unNumero = unNumero * unNumero * unNumero

-- 4
areaRectangulo :: Int -> Int -> Int 
areaRectangulo base altura = base * altura

-- 5 
esBisiesto :: Int -> Bool 
esBisiesto unAño = esMultiploDe 400 unAño || esMultiploDe 4 unAño 

-- 6
celsiusToFahr :: Float -> Float 
celsiusToFahr gradosCelsius = (gradosCelsius * 1.8) + 32

-- 7
fahrToCelsius :: Float -> Float 
fahrToCelsius gradosFahr = (gradosFahr - 32) * 0.555

-- 8
haceFrio :: Float -> Bool 
haceFrio unaTemperaturaEnFahr = fahrToCelsius unaTemperaturaEnFahr <= 8

-- 9
-- FORMULA: (a * b) / M.C.D (a;b)
mcm :: Int -> Int -> Int 
mcm unNumero otroNumero = (unNumero * otroNumero) `div` gcd unNumero otroNumero

-- 10
-- A
-- DIA 1: 322 cm / DIA 2: 283 cm / DIA 3: 294 cm
-- PRIMERO SACO MAXIMO Y MINIMO, Y DESPUES HAGO DIFERENCIA 
dispersion :: Int -> Int -> Int -> Int 
dispersion medicionDia1 medicionDia2 medicionDia3 = 
    max (max medicionDia1 medicionDia2) medicionDia3 - min (min medicionDia1 medicionDia2) medicionDia3

-- B
diasNormales :: Int -> Int -> Int -> String 
diasNormales medicionDia1 medicionDia2 medicionDia3  
  | diasParejos medicionDia1 medicionDia2 medicionDia3 = "Parejos"
  | diasLocos medicionDia1 medicionDia2 medicionDia3 = "Loco"
  | otherwise = "Normales"

diasParejos :: Int -> Int -> Int -> Bool 
diasParejos medicionDia1 medicionDia2 medicionDia3 = dispersion medicionDia1 medicionDia2 medicionDia3 < 30

diasLocos :: Int -> Int -> Int -> Bool
diasLocos medicionDia1 medicionDia2 medicionDia3 = dispersion medicionDia1 medicionDia2 medicionDia3 > (1 * 100)

-- 11
pesoPino :: Int -> Int 
pesoPino unaAltura 
  | unaAltura <= 300 = unaAltura * 3
  | otherwise = unaAltura * 2 

esPesoUtil :: Int -> Bool 
esPesoUtil unPeso = pesoPino unPeso >= 400 && pesoPino unPeso <= 1000 

sirvePino :: Int -> Bool 
sirvePino unaAltura = (esPesoUtil . pesoPino) unaAltura