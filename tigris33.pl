%mi lehet a szobában
v(holgy).
v(tigris).

%mindkét felirat ugyanaz
f(S1, S2) :- S1=holgy, S2=holgy .

%elsõ segítség
s1(S1, S2) :-
    S1=holgy, f(S1,S2), writeln(" -> s1 lehet holgy");
    S1=tigris, not(f(S1,S2)), writeln(" -> s1 lehet tigris");
    writeln(" -> s1 nem jó"), fail.
%második segítség
s2(S1, S2) :-
    S2=tigris, f(S1,S2), writeln(" -> s2 lehet tigris");
    S2=holgy, not(f(S1,S2)), writeln(" -> s2 lehet holgy");
    writeln(" -> s2 nem jó"), fail.

%megoldás
m(S1, S2) :-
    v(S1), v(S2),
    write("Próba: S1="), write(S1), write(" S2="), writeln(S2),
    s1(S1, S2), s2(S1, S2) .

p :- m(S1, S2),
    write("Elsõ szoba: "), writeln(S1),
    write("Második szoba: "), writeln(S2) .

%kiírás egybõl
:- p .

