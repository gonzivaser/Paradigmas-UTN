data Libro = UnLibro {
    titulo :: String, 
    autor :: String, 
    paginas :: Int
} deriving Show

type Biblioteca = [Libro]
unaBiblioteca :: Biblioteca
unaBiblioteca = [elVisitante, shingeiNoKyojinCapitulo1, shingeiNoKyojinCapitulo2, shingeiNoKyojinCapitulo3, sandmanCapitulo5, sandmanCapitulo10, sandmanCapitulo12, eragon, eldest, brisignr, legado]

------------------------------------------ INFORMACION LIBROS -------------------------------------------------

elVisitante :: Libro 
elVisitante = UnLibro {
    titulo = "El Visitante", 
    autor = "Stephen King", 
    paginas = 592
}
shingeiNoKyojinCapitulo1 :: Libro
shingeiNoKyojinCapitulo1 = UnLibro {
    titulo = "Shingei No Kyojin Capitulo 1",
    autor = "Hajime Isayama",
    paginas = 40
}
shingeiNoKyojinCapitulo2 :: Libro
shingeiNoKyojinCapitulo2 = UnLibro {
    titulo = "Shingei No Kyojin Capitulo 2",
    autor = "Hajime Isayama",
    paginas = 40
}
shingeiNoKyojinCapitulo3 :: Libro
shingeiNoKyojinCapitulo3 = UnLibro {
    titulo = "Shingei No Kyojin Capitulo 3",
    autor = "Hajime Isayama",
    paginas = 40
}
fundacion :: Libro
fundacion = UnLibro {
    titulo = "Fundacion",
    autor = "Isaac Asimov",
    paginas = 230
}
sandmanCapitulo5 :: Libro
sandmanCapitulo5 = UnLibro {
    titulo = "Sandman Capitulo 5",
    autor = "Neil Gaiman",
    paginas = 35
}
sandmanCapitulo10 :: Libro
sandmanCapitulo10 = UnLibro {
    titulo = "Sandman Capitulo 10",
    autor = "Neil Gaiman",
    paginas = 35
}
sandmanCapitulo12 :: Libro
sandmanCapitulo12 = UnLibro {
    titulo = "Sandman Capitulo 12",
    autor = "Neil Gaiman",
    paginas = 35
}
eragon :: Libro
eragon = UnLibro {
    titulo = "Eragon",
    autor = "Christopher Paolini",
    paginas = 544
}
eldest :: Libro
eldest = UnLibro {
    titulo = "Eldest",
    autor = "Christopher Paolini",
    paginas = 704
}
brisignr :: Libro
brisignr = UnLibro {
    titulo = "Brisignr",
    autor = "Christopher Paolini",
    paginas = 700
}
legado :: Libro
legado = UnLibro {
    titulo = "Legado",
    autor = "Christopher Paolini",
    paginas = 811
}

------------------------------------------ FUNCION PROMEDIO DE HOJAS -------------------------------------------------

promedioDeHojas :: Biblioteca -> Int 
promedioDeHojas unaBiblioteca = cantidadTotalDeHojas unaBiblioteca `div` cantidadTotalDeLibros unaBiblioteca

cantidadTotalDeLibros :: Biblioteca -> Int
cantidadTotalDeLibros unaBiblioteca = length unaBiblioteca

cantidadTotalDeHojas :: Biblioteca -> Int
cantidadTotalDeHojas unaBiblioteca = (sumarPaginas . cantidadDePaginasDeCadaLibro) unaBiblioteca

cantidadDePaginasDeCadaLibro :: Biblioteca -> [Int]
cantidadDePaginasDeCadaLibro unaBiblioteca = map paginas unaBiblioteca

sumarPaginas :: [Int] -> Int 
sumarPaginas paginasDeCadaLibro = sum paginasDeCadaLibro

------------------------------------------ FUNCION LECTURA OBLIGATORIA -------------------------------------------------

lecturaObligatoria :: Libro -> String
lecturaObligatoria unLibro 
  | esLibroDe "Stephen King" unLibro == True = "Es lectura obligatoria"
  | esLibroDe "Christopher Paolini" unLibro == True = "Es lectura obligatoria"
  | esLibroDe "Isaac Asimov" unLibro == True = "Es lectura obligatoria"
  | otherwise = "No es lectura obligatoria"

esLibroDe :: String -> Libro -> Bool 
esLibroDe unAutor unLibro = autor unLibro == unAutor

------------------------------------------ FUNCION ES FANTASIOSA -------------------------------------------------

esFantasiosa :: Biblioteca -> Bool
esFantasiosa unaBiblioteca = any esLibroFantasioso unaBiblioteca


esLibroFantasioso :: Libro -> Bool 
esLibroFantasioso unLibro = esLibroDe "Christopher Paolini" unLibro || esLibroDe "Neil Gaiman" unLibro

------------------------------------------ FUNCION NOMBRE DE LA BIBLIOTECA -------------------------------------------------
-- nombreDeLaBiblioteca nombre de todos los titulos sacando vocales
-- deberiamos tener una funcion que detecte vocales 
-- una que saque las vocales del string 
-- otra que concatene todos los titulos 
-- y luego la principal para agrupar todo

nombreDeLaBiblioteca :: Biblioteca -> String 
nombreDeLaBiblioteca unaBiblioteca = (sacarVocal . concatenarTitulos) unaBiblioteca

concatenarTitulos :: Biblioteca -> String
concatenarTitulos unaBiblioteca = (concat . nombresTitulos) unaBiblioteca

nombresTitulos :: Biblioteca -> [String]
nombresTitulos unaBiblioteca = map titulo unaBiblioteca

sacarVocal :: String -> String 
sacarVocal unString = filter (not . esVocal) unString

esVocal :: Char -> Bool 
esVocal unCaracter = elem unCaracter "AEIOUaeiou" 

------------------------------------------ FUNCION BIBLIOTECA LIGERA -------------------------------------------------

-- TODAS SUS LECTURAS MENOS DE 40 PAGINAS, OSEA UN ALL SI O SI
-- PERO PRIMERO TENDRIA QUE HACER UN MAPEO DE TODAS LAS PAGINAS 

esBibliotecaLigera :: Biblioteca -> Bool
esBibliotecaLigera unaBiblioteca = (all (> 40) . cantidadDePaginasDeCadaLibro) unaBiblioteca

------------------------------------------ EJERCICIO TERMINADO -------------------------------------------------
