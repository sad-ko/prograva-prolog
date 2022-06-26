parcial1(ana,7).
parcial1(reimu,9).
parcial1(marisa,9).
parcial1(juan,4).
parcial1(carlos,4).
parcial1(jon,10).

parcial2(ana,9).
parcial2(reimu,9).
parcial2(marisa,9).
parcial2(juan,8).
parcial2(carlos,2).

% El listado de los alumnos que promocionan la materia, 
% indicando el nombre y la nota final (promedio de los dos parciales), para cada uno.
promocionados(Nombre, P):-
    parcial1(Nombre, Nota_1),
    Nota_1 > 6,
    parcial2(Nombre, Nota_2),
    Nota_2 > 6,
    P is (Nota_1 + Nota_2)/2.

% El listado de los alumnos que obtendrán la cursada. 
cursada(Nombre):-
    parcial1(Nombre, Nota_1),
    parcial2(Nombre, Nota_2),
    Nota_1 > 3,
    Nota_2 > 3,
    (Nota_1 < 7 ; Nota_2 < 7).

% El listado de los alumnos que recursan la materia.
recursados(Nombre):-
    parcial1(Nombre, Nota_1),
    parcial2(Nombre, Nota_2),
    (Nota_1 < 4 ; Nota_2 < 4).

% A fin de entregar la medalla al mérito, encontrar de aquellos que promocionan, 
% el o los alumnos con mayor nota final. 
producto_cartesiano(X,Y):-
    promocionados(_,X),
    promocionados(_,Y).

merito(Nombre, Nota):-
    promocionados(Nombre,Nota),
	% Si Nota < Y = Se busca el mayor
	% Si Nota > Y = Se busca el menor
    \+ (producto_cartesiano(Nota,Y), Nota<Y).

%El listado se compone de al menos una nota para cada alumno. 
%En caso de que algún alumno adeude uno de los parciales, su condición es ausente.
%No se toman en cuenta quienes no dieron ninguno de los  parciales.
ausentes(Nombre):-
    % Primero nos aseguramos que haya rendido un parcial
	(parcial1(Nombre,_) ; parcial2(Nombre,_)),
    % y luego de que no haya rendido el otro.
    (\+ parcial1(Nombre,_) ; \+ parcial2(Nombre,_)).
