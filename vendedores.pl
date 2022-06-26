% 20% del total vendido en el año para aquellos vendedores que hayan tenido
% ventas en ambos semestres y cada una de ellas supera los $ 20000.
% 10% del total vendido en el año para aquellos vendedores que hayan tenido
% ventas en ambos semestres, pero no superan los $ 20000 en alguno de estos.
% 5% del total vendido para los vendedores que no registran ventas en algún semestre

% 20% 
ventas1erSem(reimu,20000).
ventas1erSem(marisa,20000).
% 10%
ventas1erSem(banki,20000).
ventas1erSem(shiki,10000).
% 5%
ventas1erSem(komachi,20000).

ventas2doSem(reimu,20000).
ventas2doSem(marisa,20000).
ventas2doSem(banki,19999).
ventas2doSem(shiki,10000).
ventas2doSem(cirno,5000).

porciento_20(Comision, T1, T2):-
    T1 >= 20000, T2 >= 20000,
    Comision is (T1+T2) * 0.2.

porciento_10(Comision, T1, T2):-
    (T1 < 20000 ; T2 < 20000),
    Comision is (T1+T2) * 0.1.

porciento_5(Comision, T1):-
    Comision is T1 * 0.05.

listado_anual(Vendedor, Comision):-
    ventas1erSem(Vendedor, T1),
    ventas2doSem(Vendedor, T2),
    (porciento_20(Comision, T1, T2);
    porciento_10(Comision, T1, T2)).

lista(Vendedor, Comision):-
    (ventas1erSem(Vendedor, T1);ventas2doSem(Vendedor,T1)),
    porciento_5(Comision, T1),
    \+ listado_anual(Vendedor,_).