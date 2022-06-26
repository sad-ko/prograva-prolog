% Ej.1

%clauses
entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne(filete_de_cerdo).
carne(pollo_asado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).
%fin clauses

%a) ¿Cuáles son los menús que ofrece el restaurante?
plato_principal(Y) :-
    carne(Y) ; pescado(Y).

menu(X,Y,Z) :-
    entrada(X),
    plato_principal(Y),
    postre(Z).

%b) ¿Cuáles son los menús que tienen Consomé en las entradas?
menu_consome(X,Y,Z) :-
    X = consome,
    plato_principal(Y),
    postre(Z).

%c) ¿Cuáles son los menús que no contienen flan como postre?
menu_flanless(X,Y,Z) :-
    menu(X,Y,Z),
    Z \== flan.


% Ej.2
%Completar el programa “menú” de manera que una comida esté formada también por
%la elección de una bebida, a elegir entre vino, cerveza o agua mineral.

%clauses
bebida(vino).
bebida(cerveza).
bebida(agua_mineral).
%fin clauses

menu(X,Y,Z,W) :-
    menu(X,Y,Z),
    bebida(W).

%Ej.6
% menu(E,P,D),!. -> Toma la primer fila del menu y corta.
% menu(E,P,D),pescado(P),!. -> Toma la primer fila del menu que contenga pescado y corta.
% menu(E,P,D),!,pescado(P) -> Toma la primer fila del menu y el primer pescado de
% la base de conocimientos y compara si ambos P son iguales.

% Ej.4

%clauses
transporte(roma,20).
transporte(londres,30).
transporte(tunez,10).

alojamiento(roma,hotel,50).
alojamiento(roma,hostal,30).
alojamiento(roma,camping,10).
alojamiento(londres,hotel,60).
alojamiento(londres,hostal,40).
alojamiento(londres,camping,20).
alojamiento(tunez,hotel,40).
alojamiento(tunez,hostal,20).
alojamiento(tunez,camping,5).
%finclauses

% Expresar la relación viaje(C,S,H,P) que se interpreta por: 
% el viaje a la ciudad C durante S semanas con estancia en H cuesta P pesos.
viaje(C,S,H,P) :-
    S =< 2, S >= 1,
	transporte(C,A),
    alojamiento(C,H,B),
    P is A+(B*S).

% Completar con viajeeconomico(C,S,H,P,Pmax) que expresa que el costo P es
% menor quePmax pesos
viajeeconomico(C,S,H,P,Pmax) :-
    viaje(C,S,H,P),
    P < Pmax.


%Ej.10
% e. Codifique en prolog las reglas necesarias para obtener la potencia N de un
% número X aplicando multiplicaciones sucesivas.
pow(_,0,1).
pow(B,E,R):-
    E > 0,
    E1 is E -1,
    pow(B,E1,R1),
    R is B * R1.

% f. Codifique en prolog las reglas necesarias para obtener el cociente entre dos
% números a partir de restas sucesivas.
% g. Idem 6, pero que permita obtener el cociente y el resto.
divide(_,0,_,_) :- !, fail . % X/0 is undefined and so can't be solved.
divide(0,_,0,0) :- !.        % 0/X is always 0.
divide(X,Y,Q,R) :-           % the ordinary case, simply invoke the
  divrem(X,Y,0,Q,R)          % helper with the accumulator seeded with 0
  .

divrem(X,Y,Q,Q,X) :-   % if X < Y, we're done.
  X < Y .              %
divrem(X,Y,T,Q,R) :-   % otherwise...
  X >= Y ,             % as long as X >= Y,
  X1 is X - Y ,        % compute the next X
  T1 is T + 1 ,        % increment the accumulator
  divrem(X1,Y,T1,Q,R)  % recurse down
  .                    % Easy!
