%mi lehet a szob�ban
v(holgy).
v(tigris).

%mindk�t felirat ugyanaz
f(S1, S2) :- S1=holgy, S2=holgy .

%els� seg�ts�g
s1(S1, S2) :-
    S1=holgy, f(S1,S2), writeln(" -> s1 lehet holgy");
    S1=tigris, not(f(S1,S2)), writeln(" -> s1 lehet tigris");
    writeln(" -> s1 nem j�"), fail.
%m�sodik seg�ts�g
s2(S1, S2) :-
    S2=tigris, f(S1,S2), writeln(" -> s2 lehet tigris");
    S2=holgy, not(f(S1,S2)), writeln(" -> s2 lehet holgy");
    writeln(" -> s2 nem j�"), fail.

%megold�s
m(S1, S2) :-
    v(S1), v(S2),
    write("Pr�ba: S1="), write(S1), write(" S2="), writeln(S2),
    s1(S1, S2), s2(S1, S2) .

p :- m(S1, S2),
    write("Els� szoba: "), writeln(S1),
    write("M�sodik szoba: "), writeln(S2) .

%ki�r�s egyb�l
:- p .

