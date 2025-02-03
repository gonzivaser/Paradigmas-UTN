% EMPIEZA CODIGO CONSIGNA 
% esAutorDe(Autor, Obra). 
esAutorDe(tolkien, elSeniorDeLosAnillos). 
esAutorDe(tolkien, elHobbit). 
esAutorDe(rowling, harryPoterYLaCamaraSecreta). 
esAutorDe(rowling, unaVacanteImprevista). 
esAutorDe(miguelCervantes, donQuijote). 
esAutorDe(borges, elAleph). 

%genero(Obra, Genero). 
genero(elSeniorDeLosAnillos, fantasia). 
genero(elHobbit, fantasia). 
genero(harryPoterYLaCamaraSecreta, fantasia). 
genero(unaVacanteImprevista, novela). 
genero(donQuijote, novela). 
genero(elAleph, cuento).

autorEspecifico(Autor) :-
    esAutorDe(Autor, _), 
    forall(genero(Obra, _), esAutorDe(Autor, Obra)).

% TERMINA CODIGO CONSIGNA 

% 1
/*
  Esta solucion no cumple con lo pedido, ya que no se esta verificando que el autor se dedique exclusivamente a un unico genero literario,
  antes de entrar al forall.
*/

% 2
autorEspecificoCorrecta(UnAutor) :-
    esAutorDe(UnAutor, UnaObra), 
    genero(UnaObra, UnGenero),
    forall(esAutorDe(UnAutor, OtraObra), genero(OtraObra, UnGenero)).

% ?- autorEspecificoCorrecta(tolkien) -> True
% ?- autorEspecificoCorrecta(UnAutor) -> UnAutor = tolkien .

% 3
/*
  Orden superior: Aparece cuando se utiliza el forall ya que es un predicado de orden superior
  Inversibilidad: Aparece cuando "esAutorDe(UnAutor, UnaObra)" y "genero(UnaObra, UnGenero)" ya que es lo que hace inversible al predicado
*/