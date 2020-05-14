potencia(A,0,1):-not(A=0).
potencia(X,Y,P):-Y>0, Y1 is Y-1, potencia(X,Y1,P1), P is X*P1.
%Ejemplo de uso:
/*
?- potencia(5,2,R).
	R = 25 ;
*/
factorial(0,1).
factorial(N,X):-N>0, Y is N-1, factorial(Y,X1), X is N*X1.
%Ejemplo de uso:
/*
?- factorial(5,R).
	R = 120 ;
*/
division(A,B,0):-B>A. 
division(A,B,X):-B>0, A>0, T is A-B, division(T,B,P), X is P+1.
%Ejemplo de uso:
/*
?- division(10,2,R).
	R = 5 ;
*/
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,R):-N>1, A is N-1, B is N-2, fibonacci(A,T1), fibonacci(B,T2), R is T1+T2.
%Ejemplo de uso:
/*
?- fibonacci(10,R).
	R = 55 ;
*/
multiplicacion(_,0,0).
multiplicacion(A,B,R):- B>0, T is B-1, multiplicacion(A,T,P),R is P+A.
%Ejemplo de uso:
/*
?- multiplicacion(5,2,R).
	R = 10 ;
*/



%-------------------- Listas --------------------
%Listas con Recursividad
contador([],0).
contador([_|Y],N):- contador(Y,M), N is M+1.
%Ejemplo de uso:
/*
?- contador([a,b,c,d,e,f,g,h],R).
	R = 8.
*/

ultimo([X],X).
ultimo([_|Y],X):-ultimo(Y,X).
%Ejemplo de uso:
/*
?- ultimo([a,b,c,d,e,f,g,h],R).
	R = h ;
*/

borrar(X,[X|Y],Y).
borrar(X,[Z|L],[Z|M]):- borrar(X,L,M).
%Ejemplo de uso:
/*
?- borrar(c,[a,b,c,d,e,f,g,h],R).
	R = [a, b, d, e, f, g, h] ;
*/

insertar(E,L,[E|L]).
insertar(E,[E|Y],[E|Z]):-insertar(E,Y,Z).
%Ejemplo de uso:
/*
?- insertar(z,[a,b,c,d,e,f,g,h],R).
	R = [z, a, b, c, d, e, f, g, h] ;
*/

borrarN(1,[_|Y],Y).
borrarN(N,[Z|L],[Z|M]):-N1 is N-1,borrarN(N1,L,M).
%Ejemplo de uso:
/*
?- borrarN(5,[a,b,c,d,e,f,g,h],R).
	R = [a, b, c, d, f, g, h] ;
*/


%-------------------- Aspiradora --------------------
%Ejemplo Aspiradora
%Version 1
/*
aspiradora(2,0).
aspiradora(N,R):-T is N+1,
write("Limpiando cuarto "),write(T),writeln(""),
aspiradora(T,R1),R is R1+1.
*/
%Version 2
cuarto(N):-write("El cuarto "),write(N),write(" esta sucio").
aspiradora(2,0).
aspiradora(N,R):-T is N+1, N<2,
cuarto(T),write(" limpiando cuarto "),write(T),writeln(""),
aspiradora(T,R1),R is R1+1.
%Ejemplo de uso:
/*
?- aspiradora(0,R).
	El cuarto 1 esta sucio limpiando cuarto 1
	El cuarto 2 esta sucio limpiando cuarto 2
	R = 2 ;
*/
%Version 3
/*
cuarto(U,E):-U="D", E="S", write("El cuarto "),write(E),write(" esta sucio"), cuarto("I",E).
cuarto(U,E):-U="I", E="S", write("El cuarto "),write(E),write(" esta sucio"), cuarto("D",E).
*/