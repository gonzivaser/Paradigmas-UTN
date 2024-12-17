% genero(Cancion, Genero). 
genero(el38, rock). 
genero(sisters, reggae). 
genero(muchoPorHacer, rock).
genero(tusOjos, reggae).
genero(bastara, reggae).

% toca(Tema, Banda).
toca(el38, divididos).
toca(sisters, divididos).
toca(muchoPorHacer, riff). 
toca(tusOjos, losCafres).
toca(bastara, losCafres).


rockera(Banda) :- % GENERA UNA LISTA DE CANCIONES QUE NO SON DE ROCK, SI LA LISTA ES VACIA, LA BANDA ES ROCKERA
    findall(Tema, (toca(Tema, Banda), genero(Tema, Genero), Genero \= rock), Temas), 
    length(Temas, 0).

    
% PUNTO 1: DECIR EL RESULTADO DE LAS SIGUIENTES CONSULTAS
% rockera(riff) -> true ; Porque riff toca solo temas de rock 
% rockera(divididos) -> false ; Porque divididos toca temas de rock y reggae
% rockera(42) -> true ; Porque 42 no toca temas, pero su lista de temas que no sean de rock es vacia, por lo que seria true
% rockera(Banda) -> false ; Porque no se generan las bandas antes de entrar al findall


% PUNTO 2: 
% 1era: La consulta de rockera(Banda), no se puede realizar porque no se generan las bandas antes de entrar al findall
% 2nda: La consulta de rockera(cualquierNombre), se realiza y devuelve true, porque se genera una lista de temas que no son de rock, y si la lista es vacia, la banda es rockera y tambien porque no se asegura de la existencia de las bandas que se consultan

% PUNTO 3:
rockeraVol2(UnaBanda) :-
    toca(_, UnaBanda), 
    forall(toca(Tema, UnaBanda), genero(Tema, rock)).