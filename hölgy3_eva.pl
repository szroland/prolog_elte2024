%Feliratok

%I. Legalább az egyik szobában hölgy van.
felirat1(hölgy, _).
felirat1(_, hölgy).
%II. A másik szobában (ami az elsõ szoba) hölgy van.
felirat2(hölgy, _).


%Szabályok

% Ha az I. szobában hölgy van, akkor a felirat igaz, ha tigris akkor
% hamis
s1(hölgy, S2):- felirat1(hölgy, S2).
s1(tigris, S2):- not(felirat1(hölgy, S2)).

% A II. szobában ha hölgy van, akkor a felirat hamis, ha tigris akkor
% igaz.
s2(S1, hölgy):- not(felirat2(S1, hölgy)).
s2(S1, tigris):- felirat2(S1, tigris).

%megodás
megoldas(S1, S2):-
    %mindkét szabálynak teljesülni kell
    s1(S1, S2),
    s2(S1, S2).

:- megoldas(X,Y),
    write("Elsõ szobában: "), writeln(X),
    write("Második szobában: "), writeln(Y).










