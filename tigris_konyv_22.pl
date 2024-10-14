%ha hölgy van a szobában, a felirat igaz
felirat(holgy, F) :- F.
%ha tigris van a szobában, a felirat hamis
felirat(tigris, F) :- not(F).
%különben igaz és hamis is lehet
felirat(ures, _).

%szobában hölgy
h(holgy) .
%szobában nem hölgy
nh(tigris) .
nh(ures) .

% pontosan egy hölgy van a 9 szobában
% a lehetséges felállásokat generálódnak itt: 9 elemû listák, amelyek
% pontosan egy eleme hölgy
egyholgy([], 0, 0) .
% az eddigi lista, N: mennyit kell még generálni, HN: kell-e még hölgy
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

%király lehetséges válaszai
kiraly_valasz(s8_ures).
kiraly_valasz(s8_nem_ures).
%a válaszok következménye
vicces_kiraly(s8_ures, [_,_,_,_,_,_,_,ures,_]) .
vicces_kiraly(s8_nem_ures, [_,_,_,_,_,_,_,holgy,_]) .
vicces_kiraly(s8_nem_ures, [_,_,_,_,_,_,_,tigris,_]) .

%visszaadja H-ban, hogy az X listában hanyadik helyen van a hölgy
holgyhelye(H, [X|XS], N) :-
    X=holgy, H is N;
    nh(X), N1 is N+1, holgyhelye(H, XS, N1).
holgyhelye(H, X) :- holgyhelye(H, X, 1).


%megoldások keresése
lehetseges_helyek(H, KS) :-
% egy hölgy van
    egyholgy(X),
% figyelembe vesszük a feliratokat
    feliratok(X),
% a mókás király lehetésges válaszait is
    vicces_kiraly(KS, X),
% végül kiszámoljuk, hányadik helyre került így a hölgy
    holgyhelye(H, X) .

megold(KS, L) :-
% király lehetséges válaszai
    kiraly_valasz(KS),
% a válasz alapján hol lehet a hölgy: itt néha több megoldás is lehet
% még, mert a király segítsége nélkül nem egyértelmû a megoldás
    setof(H, lehetseges_helyek(H, KS), L),
% az a jó válasz a királytól, ami alapján csak egy megoldás marad
    length(L, 1).

:- megold(KS, L),
    write('Király válasza: '), writeln(KS),
    write('Hölgy helye: '), writeln(L).
