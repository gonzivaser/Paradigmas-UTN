{--
CONSIGNA: https://docs.google.com/document/d/1l9UjDqVhLdeiON6rtXf7EwGU5JZvN2TWu5AJQzVmSwE/edit
--}

----------------------------------------------- DATA PAIS -------------------------------------------------------

data Pais = UnPais {
    ingresoPerCapita :: Int,
    poblacionActivaPublico :: Int,
    poblacionActivaPrivado :: Int,
    recursosNaturales :: [String],
    deudaFMI :: Int
} deriving (Show)

----------------------------------------------- EJEMPLOS PAISES -------------------------------------------------------

argentina :: Pais
argentina = UnPais {
    ingresoPerCapita = 10000,
    poblacionActivaPublico = 100,
    poblacionActivaPrivado = 500,
    recursosNaturales = ["Mineria", "Petroleo"],
    deudaFMI = 1000
}

francia :: Pais
francia = UnPais {
    ingresoPerCapita = 20000,
    poblacionActivaPublico = 200,
    poblacionActivaPrivado = 800,
    recursosNaturales = ["Agricultura", "Ganaderia"],
    deudaFMI = 2000
}

----------------------------------------------- ACCESORS -------------------------------------------------------

mapModificarIngresoPerCapita :: (Int -> Int) -> Pais -> Pais
mapModificarIngresoPerCapita f unPais = unPais { ingresoPerCapita = f (ingresoPerCapita unPais) }

mapModificarPoblacionActivaPublico :: (Int -> Int) -> Pais -> Pais
mapModificarPoblacionActivaPublico f unPais = unPais { poblacionActivaPublico = f (poblacionActivaPublico unPais) }

mapModificarPoblacionActivaPrivado :: (Int -> Int) -> Pais -> Pais
mapModificarPoblacionActivaPrivado f unPais = unPais { poblacionActivaPrivado = f (poblacionActivaPrivado unPais) }

mapModificarRecursosNaturales :: ([String] -> [String]) -> Pais -> Pais
mapModificarRecursosNaturales f unPais = unPais { recursosNaturales = f (recursosNaturales unPais) }

mapModificarDeudaFMI :: (Int -> Int) -> Pais -> Pais
mapModificarDeudaFMI f unPais = unPais { deudaFMI = f (deudaFMI unPais) }

----------------------------------------------- RECETAS -------------------------------------------------------

