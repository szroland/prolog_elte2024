
%hely(H) :- H=arany; H=ezust; H=olom.

hely(arany) .
hely(ezust) .
hely(olom) .

%f1(HOL) :- HOL=arany .
%f2(HOL) :- HOL=arany; HOL=olom .
%f3(HOL) :- HOL=ezust; HOL=olom .

f1(arany).
f2(arany). f2(olom).
f3(ezust). f3(olom).

s(H) :-
    f1(H), not(f2(H)), not(f3(H));
    not(f1(H)), f2(H), not(f3(H));
    not(f1(H)), not(f2(H)), f3(H).

p :- hely(H), s(H), write("A kép helye: "), writeln(H) .

:- p.
