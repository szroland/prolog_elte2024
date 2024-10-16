% Andr�s, B�la �s Csaba arra fogadtak, hogy a bar�ts�gos labdarug�
% torn�n, r�sztvev� h�rom csapat � az FTC, az MTK, a Vasas �s a Honv�d �
% milyen eredm�nyt fog el�rni:
%  (a) Andr�s: a gy�ztes vagy az FTC vagy az MTK lesz
%  (b) B�la: az FTC nem lesz els�
%  (c) Csaba: sem a MTK sem a Honv�d nem lesz els�.
%
% A labdarug� torna v�g�n kider�lt, hogy pontosan az egyik�k �ll�t�sa
% igaz. Melyik csapat nyerte a torn�t?


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


