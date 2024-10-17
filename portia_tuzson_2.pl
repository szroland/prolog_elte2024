% A Portia három ládikáján a következõ feliratok vannak:

% Az aranyon: A kép nem az ezüst ládikában van
% Az ezüstön: A kép nem ebben a ládikában van
% Az ólmon: A kép ebben a ládikában van

% Portia azt is közölte, hogy a legalább egy állítás igaz, és legalább
% egy hamis. Nos, melyik ládikót válassza a kérõ, hogy igényt tarthasson
% Portia kezére
%

% hol lehet a kép
kep(arany).
kep(ezust).
kep(olom).

% Az aranyon: A kép nem az ezüst ládikában van
arany(K) :- not(K = ezust).

% Az ezüstön: A kép nem ebben a ládikában van
ezust(K) :- not(K = ezust).

% Az ólmon: A kép ebben a ládikában van
olom(K) :- K=olom.

egyik_igaz(K):- arany(K); ezust(K); olom(K).
egyik_hamis(K):-not(arany(K)); not(ezust(K)); not(olom(K)).

megoldas(K) :-
    kep(K),
    egyik_igaz(K), egyik_hamis(K).

:- megoldas(K), write("A kép helye: "), writeln(K).

