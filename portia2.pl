% A Portia három ládikáján a következõ feliratok vannak:
% Az aranyon: A kép nem az ezüst ládikában van
% Az ezüstön: A kép nem ebben a ládikában van
% Az ólmon: A kép ebben a ládikában van

% Portia azt is közölte, hogy a legalább egy állítás igaz, és legalább
% egy hamis. Nos, melyik ládikót válassza a kérõ, hogy igényt tarthasson
% Portia kezére?


kep(arany).
kep(ezust).
kep(olom).

f1(arany).
f1(olom).
f2(arany).
f2(olom).
f3(olom).

s1(K) :-
    f1(K);
    f2(K);
    f3(K).
s2(K) :-
    not(f1(K));
    not(f2(K));
    not(f3(K)).

l(P, L) :-
    P, L=igaz;
    not(P), L=hamis.

portia(K) :-
    kep(K),
    s1(K), s2(K).

megoldas(L) :-
    setof(K, portia(K), L).


:- megoldas([L]),
    write("A kép helye: "), writeln(L) .





