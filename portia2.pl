% A Portia h�rom l�dik�j�n a k�vetkez� feliratok vannak:
% Az aranyon: A k�p nem az ez�st l�dik�ban van
% Az ez�st�n: A k�p nem ebben a l�dik�ban van
% Az �lmon: A k�p ebben a l�dik�ban van

% Portia azt is k�z�lte, hogy a legal�bb egy �ll�t�s igaz, �s legal�bb
% egy hamis. Nos, melyik l�dik�t v�lassza a k�r�, hogy ig�nyt tarthasson
% Portia kez�re?


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
    write("A k�p helye: "), writeln(L) .





