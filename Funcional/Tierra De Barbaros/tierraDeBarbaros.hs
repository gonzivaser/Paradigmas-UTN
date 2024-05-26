-- https://docs.google.com/document/d/1mBwfHLXmcZKLHSy22exTxibwny9x2a81hKW000tOFMQ/edit
import Text.Show.Functions ()
import Data.Char

data Barbaro = UnBarbaro {
    nombre :: String,
    fuerza :: Int,
    habilidades :: [String],
    objetos :: [Objeto]
} deriving Show

type Objeto = Barbaro -> Barbaro

-- -------------------------------------------- PUNTO 1 -------------------------------------------------------
espadas :: Int -> Objeto
espadas pesoEspada unBarbaro = unBarbaro {fuerza = pesoEspada * 2 + fuerza unBarbaro}

amuletosMisticos :: String -> Objeto 
amuletosMisticos unaHabilidad unBarbaro = unBarbaro {habilidades = habilidades unBarbaro ++ [unaHabilidad]}

varitasDefectuosas :: Objeto 
varitasDefectuosas unBarbaro = unBarbaro {
    habilidades = habilidades unBarbaro ++ ["Hacer magia"],
    objetos = [varitasDefectuosas]
}

ardilla :: Objeto 
ardilla unBarbaro = unBarbaro

{-cuerda :: Objeto -> Objeto -> Objeto
cuerda unObjeto otroObjeto = -}

-- -------------------------------------------- PERSONAJES -------------------------------------------------------

dave :: Barbaro 
dave = UnBarbaro {
    nombre = "Dave",
    fuerza = 100,
    habilidades = ["Tejer", "EscribirPoesia"],
    objetos = [ardilla, varitasDefectuosas]
}

gonzi :: Barbaro 
gonzi = UnBarbaro {
    nombre = "Gonzi",
    fuerza = 50,
    habilidades = ["Comer", "Entrenar"],
    objetos = [espadas 10, amuletosMisticos "Hacer magia"]
}

-- -------------------------------------------- PUNTO 2 -------------------------------------------------------

megafono :: Objeto 
megafono unBarbaro = unBarbaro {habilidades = convertirEnMayuscula concatenarHabilidades $ habilidades unBarbaro}

concatenarHabilidades :: [String] -> String
concatenarHabilidades unasHabilidades = concat unasHabilidades

convertirEnMayuscula :: String -> String
convertirEnMayuscula unasHabilidades = map toUpper unasHabilidades

--megafonoBarbarico :: Objeto 

-- -------------------------------------------- PUNTO 3 -------------------------------------------------------

type Aventura = [Evento]
type Evento = Barbaro -> Bool 

invasionDeSuciosDuendes :: Evento 
invasionDeSuciosDuendes unBarbaro = (elem "EscribirPoesiaAtroz" . habilidades) unBarbaro

