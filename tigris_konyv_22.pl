%ha h�lgy van a szob�ban, a felirat igaz
felirat(holgy, F) :- F.
%ha tigris van a szob�ban, a felirat hamis
felirat(tigris, F) :- not(F).
%k�l�nben igaz �s hamis is lehet
felirat(ures, _).

%szob�ban h�lgy
h(holgy) .
%szob�ban nem h�lgy
nh(tigris) .
nh(ures) .

% pontosan egy h�lgy van a 9 szob�ban
% a lehets�ges fel�ll�sokat gener�l�dnak itt: 9 elem� list�k, amelyek
% pontosan egy eleme h�lgy
egyholgy([], 0, 0) .
% az eddigi lista, N: mennyit kell m�g gener�lni, HN: kell-e m�g h�lgy
egyholgy([X|XS], N, HN) :-
    N>0, N1 is N-1,
    (
        HN = 1, h(X), egyholgy(XS, N1, 0);
        HN = 1, nh(X), egyholgy(XS, N1, 1);
        HN = 0, nh(X), egyholgy(XS, N1, 0)
    ).

egyholgy(X) :- egyholgy(X, 9, 1).

%feliratok
f1([S1,_,S3,_,S5,_,S7,_,S9]) :-
    S1=holgy; S3=holgy; S5=holgy; S7=holgy; S9=holgy.
f2([_,ures,_,_,_,_,_,_,_]) .
f3(X) :- f5(X); not(f7(X)) .
f4(X) :- not(f1(X)) .
f5(X) :- f2(X); f4(X) .
f6(X) :- not(f3(X)).
f7([S1,_,_,_,_,_,_,_,_]) :- nh(S1).
f8([_,_,_,_,_,_,_,tigris,ures]).
f9([S1,S2,S3,S4,S5,S6,S7,S8,tigris]) :- not(f6([S1,S2,S3,S4,S5,S6,S7,S8,tigris])).

feliratok([S1,S2,S3,S4,S5,S6,S7,S8,S9]) :-
    felirat(S1, f1([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S2, f2([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S3, f3([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S4, f4([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S5, f5([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S6, f6([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S7, f7([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S8, f8([S1,S2,S3,S4,S5,S6,S7,S8,S9])),
    felirat(S9, f9([S1,S2,S3,S4,S5,S6,S7,S8,S9])).

%kir�ly lehets�ges v�laszai
kiraly_valasz(s8_ures).
kiraly_valasz(s8_nem_ures).
%a v�laszok k�vetkezm�nye
vicces_kiraly(s8_ures, [_,_,_,_,_,_,_,ures,_]) .
vicces_kiraly(s8_nem_ures, [_,_,_,_,_,_,_,holgy,_]) .
vicces_kiraly(s8_nem_ures, [_,_,_,_,_,_,_,tigris,_]) .

%visszaadja H-ban, hogy az X list�ban hanyadik helyen van a h�lgy
holgyhelye(H, [X|XS], N) :-
    X=holgy, H is N;
    nh(X), N1 is N+1, holgyhelye(H, XS, N1).
holgyhelye(H, X) :- holgyhelye(H, X, 1).


%megold�sok keres�se
lehetseges_helyek(H, KS) :-
% egy h�lgy van
    egyholgy(X),
% figyelembe vessz�k a feliratokat
    feliratok(X),
% a m�k�s kir�ly lehet�sges v�laszait is
    vicces_kiraly(KS, X),
% v�g�l kisz�moljuk, h�nyadik helyre ker�lt �gy a h�lgy
    holgyhelye(H, X) .

megold(KS, L) :-
% kir�ly lehets�ges v�laszai
    kiraly_valasz(KS),
% a v�lasz alapj�n hol lehet a h�lgy: itt n�ha t�bb megold�s is lehet
% m�g, mert a kir�ly seg�ts�ge n�lk�l nem egy�rtelm� a megold�s
    setof(H, lehetseges_helyek(H, KS), L),
% az a j� v�lasz a kir�lyt�l, ami alapj�n csak egy megold�s marad
    length(L, 1).

:- megold(KS, L),
    write('Kir�ly v�lasza: '), writeln(KS),
    write('H�lgy helye: '), writeln(L).
