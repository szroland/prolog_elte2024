% András, Béla és Csaba arra fogadtak, hogy a barátságos labdarugó
% tornán, résztvevõ három csapat – az FTC, az MTK, a Vasas és a Honvéd –
% milyen eredményt fog elérni:
%  (a) András: a gyõztes vagy az FTC vagy az MTK lesz
%  (b) Béla: az FTC nem lesz elsõ
%  (c) Csaba: sem a MTK sem a Honvéd nem lesz elsõ.
%
% A labdarugó torna végén kiderült, hogy pontosan az egyikük állítása
% igaz. Melyik csapat nyerte a tornát?


a([ftc,_,_,_]).
a([mtk,_,_,_]).

b([Elso,_,_,_]) :- not(Elso = ftc).
c([Elso,_,_,_]) :- not(Elso = mtk), not(Elso = honved).

eredmeny(E) :- permutation([ftc,mtk,vasas,honved],E).

meccs(E) :-
    eredmeny(E),
    (   a(E), not(b(E)), not(c(E));
        not(a(E)), b(E), not(c(E));
        not(a(E)), not(b(E)), c(E)
    ).

elso(E) :- meccs([E,_,_,_]) .

foci(T) :-
    setof(E, elso(E), [T]), !; writeln("Nincs megoldas"), fail.


