% EMPIEZA CODIGO CONSIGNA 
precio(lata(atun, 100, nereida), 70).
precio(lata(atun, 200, nereida), 120).
precio(lacteo(laSerenisima, leche), 15). 
precio(lacteo(sancor, leche), 22).

compro(martina, lata(atun, 100, nereida)). 
compro(martina, lacteo(sancor, leche)). 
compro(aye, lacteo(sancor, leche)). 

cliente(Cliente) :-
    compro(Cliente, _). 
% TERMINA CODIGO CONSIGNA 

% 1
comproMarca(UnCliente, UnaMarca) :-
    cliente(UnCliente), 
    compro(Cliente, UnProducto),
    esDeMarca(UnProducto, UnaMarca). 

esDeMarca(lata(_, _, OtraMarca), UnaMarca) :-
    precio(lata(_, _, UnaMarca), _), 
    OtraMarca = UnaMarca.

esDeMarca(lacteo(OtraMarca, _), UnaMarca) :-
    precio(lacteo(UnaMarca, _), _), 
    OtraMarca = UnaMarca.

% 2
marcaPopu1(Marca) :-
    forall(cliente(Cliente), comproMarca(Cliente, Marca)). 

/*En este caso, esta mal la solucion porque no se liga la marca antes de entrar al forall.*/

marcaPopu2(Marca) :-
    cliente(Cliente), 
    forall(cliente(Cliente), comproMarca(Cliente, Marca)). 

/*
  En este otro caso, tambien esta mal la solucion planteada porque no se verifica que todos los clientes hayan 
  comprado esa marca sino que solo se verifica que un solo cliente haya comprado una sola marca.
*/

/*NO LO PIDE LA CONSIGNA PERO LO HAGO BIEN PARA PRACTICAR*/
marcaPopuBienHecha(UnaMarca) :-
    esMarca(UnaMarca), 
    forall(cliente(Cliente), comproMarca(Cliente, UnaMarca)). 

esMarca(UnaMarca) :-
    precio(lacteo(UnaMarca, _), _).

esMarca(UnaMarca) :-
    precio(lata(_, _, UnaMarca), _). 


