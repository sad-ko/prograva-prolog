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

