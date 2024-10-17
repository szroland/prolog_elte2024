% A Portia h�rom l�dik�j�n a k�vetkez� feliratok vannak:

% Az aranyon: A k�p nem az ez�st l�dik�ban van
% Az ez�st�n: A k�p nem ebben a l�dik�ban van
% Az �lmon: A k�p ebben a l�dik�ban van

% Portia azt is k�z�lte, hogy a legal�bb egy �ll�t�s igaz, �s legal�bb
% egy hamis. Nos, melyik l�dik�t v�lassza a k�r�, hogy ig�nyt tarthasson
% Portia kez�re
%

% hol lehet a k�p
kep(arany).
kep(ezust).
kep(olom).

% Az aranyon: A k�p nem az ez�st l�dik�ban van
arany(K) :- not(K = ezust).

% Az ez�st�n: A k�p nem ebben a l�dik�ban van
ezust(K) :- not(K = ezust).

% Az �lmon: A k�p ebben a l�dik�ban van
olom(K) :- K=olom.

egyik_igaz(K):- arany(K); ezust(K); olom(K).
egyik_hamis(K):-not(arany(K)); not(ezust(K)); not(olom(K)).

megoldas(K) :-
    kep(K),
    egyik_igaz(K), egyik_hamis(K).

:- megoldas(K), write("A k�p helye: "), writeln(K).

