%Feliratok

%I. Legal�bb az egyik szob�ban h�lgy van.
felirat1(h�lgy, _).
felirat1(_, h�lgy).
%II. A m�sik szob�ban (ami az els� szoba) h�lgy van.
felirat2(h�lgy, _).


%Szab�lyok

% Ha az I. szob�ban h�lgy van, akkor a felirat igaz, ha tigris akkor
% hamis
s1(h�lgy, S2):- felirat1(h�lgy, S2).
s1(tigris, S2):- not(felirat1(h�lgy, S2)).

% A II. szob�ban ha h�lgy van, akkor a felirat hamis, ha tigris akkor
% igaz.
s2(S1, h�lgy):- not(felirat2(S1, h�lgy)).
s2(S1, tigris):- felirat2(S1, tigris).

%megod�s
megoldas(S1, S2):-
    %mindk�t szab�lynak teljes�lni kell
    s1(S1, S2),
    s2(S1, S2).

:- megoldas(X,Y),
    write("Els� szob�ban: "), writeln(X),
    write("M�sodik szob�ban: "), writeln(Y).










