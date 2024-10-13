szoba(eloszoba).
szoba(furdo).
szoba(halo).
szoba(nappali).

% Tenyek: helyseg(Nev, E, K, D, N).

% Haz B
%helyseg(eloszoba,fal,fal,ajto,bejarat).
%helyseg(furdo,fal,ajto,ablak,ajto).
%helyseg(halo,bejarat,fal,ablak,ajto).
%helyseg(nappali,ajto,ajto,ablak,fal).

% Haz A
helyseg(eloszoba,bejarat,ablak,ajto,ablak).
helyseg(halo,ajto,fal,ajto,fal).
helyseg(nappali,ajto,ablak,ablak,ajto).
helyseg(furdo,bejarat,ajto,fal,fal).

sszoba(X) :-
    helyseg(X, ajto, ajto, _, _), !;
    helyseg(X, _, ajto, ajto, _), !;
    helyseg(X, _, _, ajto, ajto), !;
    helyseg(X, ajto, _, _, ajto), !.

ablaktalan(X) :-
    helyseg(X, E, K, D, N),
    not(E=ablak), not(K=ablak), not(D=ablak), not(N=ablak) .


slprint([]) .
slprint([S]) :- write(S), !.
slprint([S|SS]) :- slprint([S|SS], ",").

slprint([], _) .
slprint([S], _) :- write(S), !.
slprint([S|SS], SEP) :- write(S), write(SEP), slprint(SS, SEP) .

ajtok(ajto, ajto) .

atjaras(A, B) :-
    A \= B,
    helyseg(A, AE, AK, AD, AN),
    helyseg(B, BE, BK, BD, BN),
    (
        ajtok(AE, BD);
        ajtok(AK, BN);
        ajtok(AD, BE);
        ajtok(AN, BK)
    ).

bejaratos(X) :-
    helyseg(X, bejarat, _, _, _), !;
    helyseg(X, _, bejarat, _, _), !;
    helyseg(X, _, _, bejarat, _), !;
    helyseg(X, _, _, _, bejarat), !.

utvonal(A, B, C, D) :-
    bejaratos(A), bejaratos(D),
    atjaras(A, B), atjaras(B, C), atjaras(C, D) .

utvonal([A, B, C, D]) :-
    szoba(A), bejaratos(A),
    szoba(B), B\=A, atjaras(A, B),
    szoba(C), C\=A, C\=B, atjaras(B, C),
    szoba(D), D\=A, D\=B, D\=C, atjaras(C, D), bejaratos(D) .

:- findall(S, sszoba(S), SL), write("Sarokszobak: "), slprint(SL), writeln("") .

:- findall(S, ablaktalan(S), SL), write("Ablaktalan: "), slprint(SL), writeln("") .

:- writeln("Utvonalak: "), utvonal(L), slprint(L, " - "), writeln(""), fail; true .












