precio(lata(atun, 100, nereida), 70). 
precio(lata(atun, 200, nereida), 120).
precio(lacteo(sancor, leche), 22). 
compro(martina, lata(atun, 100, nereida)).
compro(aye, lacteo(sancor, leche)).

cliente(Cliente) :-
    compro(Cliente, _).

% PUNTO 1
comproMarca(UnCliente, UnaMarca) :-
    cliente(UnCliente), 
    compro(UnCliente, UnProducto), 
    marca(UnProducto, UnaMarca).

marca(lata(_, _, Marca), UnaMarca) :-
    precio(lata(_, _, Marca), _), 
    Marca = UnaMarca.

marca(lacteo(Marca, _), UnaMarca) :-
    precio(lacteo(Marca, _), _), 
    Marca = UnaMarca.

% PUNTO 2
marcaPopu1(Marca) :-
    forall(cliente(Cliente), comproMarca(Cliente, Marca)).  % NO ESTA ASEGURANDO QUE HAYA CLIENTES QUE COMPREN ESA MARCA

marcaPopu2(Marca) :-
    forall(cliente(Cliente), forall(cliente(Cliente), comproMarca(Cliente, Marca))).   % NO ESTA ASEGURANDO QUE HAYA CLIENTES QUE COMPREN ESA MARCA Y EL FORALL SE APLICA SOLO SOBRE UN CLIENTE

marcaPopuBienHecha(UnaMarca) :-
    compro(_, Producto),
    marca(Producto, UnaMarca),
    forall(cliente(Cliente), comproMarca(Cliente, UnaMarca)).