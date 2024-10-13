van(holgy) .
van(tigris) .

f1(S1, S2) :- S1 = holgy, S2 = tigris .
f2(S1, S2) :-
    f1(S1, S2) ;
    S1 = tigris, S2 = holgy .

s(S1, S2) :-
    f1(S1, S2), not(f2(S1, S2));
    not(f1(S1, S2)), f2(S1, S2).

megold(S1, S2) :- van(S1), van(S2), s(S1, S2) .

