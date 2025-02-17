% EMPIEZA CODIGO CONSIGNA 
% marca(Producto, Marca).
marca(cindor, laSerenisima).
marca(latuna, nereida). 
marca(serenito, laSerenisima).

% compro(Cliente, Producto).
compro(martina, latuna). 
compro(martina, cindor).
compro(aye, cindor). 
compro(aye, serenito). 

cliente(Cliente) :-
    compro(Cliente, _).

% TERMINA CODIGO CONSIGNA 

% 1
% a) Esta mal, porque falta ligar lo que seria el cliente con la marca antes de entrar al forall. Falta especificar
%    cual es la marca antes de entrar al forall  
obsesivo(Cliente) :-
    cliente(Cliente), 
    forall(compro(Cliente, Producto), marca(Producto, Marca)).

% b) Tambien es erronea, porque no se genera el Cliente antes de entrar al forall, y tampoco se liga este con la marca.
%    y el forall en este caso verifica que un solo cliente compre de una marca especifica, lo cual seria incorrecto
obsesivo(Cliente) :-
    marca(_, Marca), 
    forall(compro(Cliente, Producto), marca(Producto, Marca)).

% c) Lo mismo, no se genera al Cliente antes de entrar al forall, y no se especifica lo que seria la marca antes de entrar
%    al forall
obsesivo(Cliente) :-
    marca(Producto, _), 
    forall(compro(Cliente, Producto), marca(Producto, Marca)).


% 2
obesivoSuperadora(UnCliente) :-
    cliente(UnCliente), 
    compro(UnCliente, UnProducto),
    marca(UnProducto, UnaMarca), 
    not((compro(UnCliente, OtroProducto), marca(OtroProducto, OtraMarca), UnaMarca \= OtraMarca)). 
