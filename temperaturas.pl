temperaturas_dia(1, 5, 10).
temperaturas_dia(2, 15, 19).
temperaturas_dia(3, 10, 11).
temperaturas_dia(4, 20, 32).
temperaturas_dia(5, 18, 27).
temperaturas_dia(6, 15, 21).

% Temperatura Maxima %
max_temp_producto_cartesiano(X,Y):-
    temperaturas_dia(_,_,X),
    temperaturas_dia(_,_,Y),
    X<Y.

max_temp(X):-
    temperaturas_dia(_,_,X), 
    \+ max_temp_producto_cartesiano(X,_).

% Temperatura Minima %
min_temp_producto_cartesiano(X,Y):-
    temperaturas_dia(_,X,_),
    temperaturas_dia(_,Y,_),
    X<Y.

min_temp(X):-
    temperaturas_dia(_,X,_),
    \+ min_temp_producto_cartesiano(_,X).

% Promedio %
promedio_dia(D,P):-
    temperaturas_dia(D,Min,Max),
    P is (Min+Max)/2.

sumatoria(0,0):-!.
sumatoria(D,S):-
    D1 is D - 1,
    sumatoria(D1,S1),
    promedio_dia(D,P),
    S is S1+P.

% Promedio con el dia indicado
promedio(D,P):-
    sumatoria(D,S),
    P is S/D.

max_dia_producto_cartesiano(X,Y):-
    temperaturas_dia(X,_,_),
    temperaturas_dia(Y,_,_),
    X<Y.

max_dia(X):-
    temperaturas_dia(X,_,_), 
    \+ max_dia_producto_cartesiano(X,_).

% Promedio con el dia implicito
promedio(P):-
    max_dia(D),
    promedio(D,P).
    