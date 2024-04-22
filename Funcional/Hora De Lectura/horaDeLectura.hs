-- DECLARO EL TIPO DE UN LIBRO EN GENERAL 
type Titulo = String
type Autor = String
type CantidadDePaginas = Int
type Libro = (Titulo, Autor, CantidadDePaginas)

-- CREO LIBROS
elVisitante :: Libro
elVisitante = ("El Visitante", "Stephen King", 592)

shingeiNoKyojinCapitulo1 :: Libro
shingeiNoKyojinCapitulo1 = ("Shingei No Kyojin Capitulo 1", "Hajime Isayama", 40)

shingeiNoKyojinCapitulo2 :: Libro
shingeiNoKyojinCapitulo2 = ("Shingei No Kyojin Capitulo 2", "Hajime Isayama", 40)

shingeiNoKyojinCapitulo3 :: Libro
shingeiNoKyojinCapitulo3 = ("Shingei No Kyojin Capitulo 3", "Hajime Isayama", 40)

fundacion :: Libro
fundacion = ("Fundacion", "Isaac Asimov", 230)

sandmanCapitulo5 :: Libro 
sandmanCapitulo5 = ("Sandman Capitulo 1", "Neil Gaiman", 35)

sandmanCapitulo10 :: Libro 
sandmanCapitulo10 = ("Sandman Capitulo 10", "Neil Gaiman", 35)

sandmanCapitulo12 :: Libro 
sandmanCapitulo12 = ("Sandman Capitulo 12", "Neil Gaiman", 35)

eragon :: Libro 
eragon = ("Eragon", "Christopher Paolini", 544)

eldest :: Libro 
eldest = ("Eldest", "Christopher Paolini", 704)

brisignr :: Libro 
brisignr = ("Brisignr", "Christopher Paolini", 700)

legado :: Libro 
legado = ("Legado", "Christopher Paolini", 811)


-- DECLARO UNA LISTA DE LIBROS PARA MI BIBLIOTECA 
type Biblioteca = [Libro]
unaBiblioteca :: Biblioteca
unaBiblioteca = [elVisitante, shingeiNoKyojinCapitulo1, shingeiNoKyojinCapitulo2, shingeiNoKyojinCapitulo3, sandmanCapitulo5, sandmanCapitulo10, sandmanCapitulo12, eragon, eldest, brisignr, legado]


-- DECLARO FUNCIONES UTILES 
cantidadDePaginas :: Libro -> Int 
cantidadDePaginas (_, _, paginas) = paginas

unTitulo :: Libro -> String
unTitulo (titulo, _, _) = titulo

unAutor :: Libro -> String
unAutor (_, autor, _) = autor


-- ---------------------------------- FUNCION PROMEDIO DE HOJAS ----------------------------------
promedioDeHojas :: Biblioteca -> Int
promedioDeHojas unaBiblioteca = div (cantidadDePaginasTotal unaBiblioteca) (cantidadDeLibros unaBiblioteca)

-- CANTIDAD DE LIBROS 
cantidadDeLibros :: Biblioteca -> Int
cantidadDeLibros unaBiblioteca = length unaBiblioteca

-- PAGINAS TOTALES POR CANTIDAD DE PAGINAS TOTAL 
cantidadDePaginasTotal :: Biblioteca -> Int 
cantidadDePaginasTotal unaBiblioteca = (sumarPaginas . cantidadDeHojasPorLibro) unaBiblioteca

-- SUMO LAS PAGINAS DE LOS LIBROS
sumarPaginas :: [Int] -> Int
sumarPaginas paginasDeLibros = sum paginasDeLibros

-- MAPEO LA CANTIDAD DE PAGINAS POR CADA LIBRO Y LO GUARDO EN UNA LISTA DE ENTEROS 
cantidadDeHojasPorLibro :: Biblioteca -> [Int]
cantidadDeHojasPorLibro unaBiblioteca = map cantidadDePaginas unaBiblioteca


-- ---------------------------------- FUNCION LECTURA OBLIGATORIA ----------------------------------
esLecturaObligatoria :: Libro -> Bool
esLecturaObligatoria unLibro = esLibroDe "Stephen King" unLibro || esLibroDe "Christopher Paolini" unLibro || esLibroDe "Isaac Asimov" unLibro

esLibroDe :: Autor -> Libro -> Bool 
esLibroDe elAutor unLibro = unAutor unLibro == elAutor


-- ---------------------------------- FUNCION ES FANTASIOSA ----------------------------------
esFantasiosa :: Biblioteca -> Bool
esFantasiosa unaBiblioteca = any esLibroFantasioso unaBiblioteca

esLibroFantasioso :: Libro -> Bool 
esLibroFantasioso unLibro = esLibroDe "Christopher Paolini" unLibro || esLibroDe "Neil Gaiman" unLibro


-- ---------------------------------- FUNCION NOMBRE DE LA BIBLIOTECA ----------------------------------
nombreDeLaBiblioteca :: Biblioteca -> String 
nombreDeLaBiblioteca unaBiblioteca = (sacarVocales . concatenacionTitulos) unaBiblioteca

-- CHEQUEO CARACTER A CARACTER DEL STRING SI LA LETRA ES VOCAL O NO, SI LO ES, ENTONCES DEVUELVE TRUE, Y AHI 
-- ES CUANDO APARECE EL NOT, QUE ME LO NIEGA, ENTONCES PASA A SER FALSE, Y EL FILTER SOLO FILTREA CUANDO ES TRUE 
-- ENTONCES ESA LETRA NO LA VA A FILTRAR
sacarVocales :: String -> String 
sacarVocales unString = filter (not . esVocal) unString

esVocal :: Char -> Bool 
esVocal unCaracter = elem unCaracter "aeiouAEIOU"

concatenacionTitulos :: Biblioteca -> String 
concatenacionTitulos unaBiblioteca = (concat . nombresTitulos) unaBiblioteca

nombresTitulos :: Biblioteca -> [String]
nombresTitulos unaBiblioteca = map unTitulo unaBiblioteca


-- ---------------------------------- FUNCION BIBLIOTECA LIGERA ----------------------------------
bibliotecaLigera :: Biblioteca -> Bool 
bibliotecaLigera unaBiblioteca = all esLecturaLigera unaBiblioteca

esLecturaLigera :: Libro -> Bool 
esLecturaLigera unLibro = cantidadDePaginas unLibro <= 40
