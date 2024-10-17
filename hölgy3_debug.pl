% legalább az egyik szobábban hölgy va. II. a másiks szobában hölgy van.
% Ha az I. szobábab hölgy van, akkor a felira igaz, ha tigris akkor
% hamis. A ii. szoba ha hölgy akkor hamis, ha tigris akkor igaz.

%tények

szoba(hölgy).
szoba(tigris).

%feliratok

felirat1(Szoba1,Szoba2):-
    Szoba1=hölgy;
    Szoba2=hölgy.

felirat2(Szoba1,Szoba2):-
    Szoba1=hölgy,
    Szoba2=_.

%szabákyok

igaz(Szoba1,Szoba2):-
    Szoba1=hölgy,
    felirat1(Szoba1,Szoba2),
    writeln(" - igaz/1 jó").
igaz(Szoba1,Szoba2):-
    felirat2(Szoba1,Szoba2),
    Szoba2=tigris,
    writeln(" - igaz/2 jó").
hamis(Szoba1,Szoba2):-
    Szoba1=tigris,
    not(felirat1(Szoba1,Szoba2)),
    writeln(" - hamis/1 jó").
hamis(Szoba1,Szoba2):-
    Szoba2=hölgy,
    not(felirat2(Szoba1,Szoba2)),
    writeln(" - hamis/2 jó").

%megodás
megoldas(Szoba1,Szoba2):-
    szoba(Szoba1),
    szoba(Szoba2),
    write("Próba: szoba1="), write(Szoba1), write(" szoba2="), writeln(Szoba2),
    igaz(Szoba1,Szoba2);
    hamis(Szoba1,Szoba2).

:- megoldas(X,Y), write(" elsõ szobában:"),writeln(X), write("második szobábna"), writeln(Y).
