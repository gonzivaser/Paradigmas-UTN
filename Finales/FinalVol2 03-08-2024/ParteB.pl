% EMPIEZA CODIGO CONSIGNA 
% genero(Cancion, Genero). 
genero(el38, rock). 
genero(sisters, reggae). 
genero(muchoPorHacer, rock).
genero(tusOjos, reggae).
genero(bastara, reggae).

% toca(Cancion, Banda).
toca(el38, divididos).
toca(sisters, divididos).
toca(muchoPorHacer, riff). 
toca(tusOjos, losCafres).
toca(bastara, losCafres).

rockera(Banda) :-  
    findall(Canciones, (toca(Cancion, Banda), genero(Cancion, Genero), Genero \= rock), Canciones), 
    length(Canciones, 0).
/* 
   GENERA UNA LISTA DE CANCIONES QUE EL GENERO DE LAS CANCIONES SEA DISTINTO DE ROCK Y SE ASEGURA QUE ESA LISTA
   TENGA LONGITUD 0. OSEA QUE LA LISTA GENERADA CON DISTINTOS TEMAS DE ROCK SEA 0
*/
% TERMINA CODIGO CONSIGNA 

% 1
/*
   a) rockera(riff). --> True, ya que no toca otro tema que no sea rock
   b) rockera(divididos) --> False, ya que tiene una cancion que no es de rock, entonces la lista seria 1
   c) rockera(42) --> True, ya que 42 no esta en la base de conocimientos, pero tampoco tieen otro tema distinto de rock, 
      entonces va a devolver true. 
   d) rockera(Banda) --> False, porque no se generan las bandas antes de entrar al findall
*/

% 2
/*
   Las consultas que no funcioan correctamente son la c y la d, porque el predicado no es inversible para la banda, por lo que
   las consultas con bandas fuera de la base de conocimiento devuelve true, y no se puede hacer consultas con variables libres.
*/

