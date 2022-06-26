nota(abc,1).
nota(bcd,2).
nota(cde,3).

producto_cartesiano(X,Y):-
    nota(_,X),
    nota(_,Y),
    X<Y.

max(X):-
    nota(_,X),
    not(producto_cartesiano(X,_)).