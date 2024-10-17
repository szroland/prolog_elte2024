% legal�bb az egyik szob�bban h�lgy va. II. a m�siks szob�ban h�lgy van.
% Ha az I. szob�bab h�lgy van, akkor a felira igaz, ha tigris akkor
% hamis. A ii. szoba ha h�lgy akkor hamis, ha tigris akkor igaz.

%t�nyek

szoba(h�lgy).
szoba(tigris).

%feliratok

felirat1(Szoba1,Szoba2):-
    Szoba1=h�lgy;
    Szoba2=h�lgy.

felirat2(Szoba1,Szoba2):-
    Szoba1=h�lgy,
    Szoba2=_.

%szab�kyok

igaz(Szoba1,Szoba2):-
    Szoba1=h�lgy,
    felirat1(Szoba1,Szoba2),
    writeln(" - igaz/1 j�").
igaz(Szoba1,Szoba2):-
    felirat2(Szoba1,Szoba2),
    Szoba2=tigris,
    writeln(" - igaz/2 j�").
hamis(Szoba1,Szoba2):-
    Szoba1=tigris,
    not(felirat1(Szoba1,Szoba2)),
    writeln(" - hamis/1 j�").
hamis(Szoba1,Szoba2):-
    Szoba2=h�lgy,
    not(felirat2(Szoba1,Szoba2)),
    writeln(" - hamis/2 j�").

%megod�s
megoldas(Szoba1,Szoba2):-
    szoba(Szoba1),
    szoba(Szoba2),
    write("Pr�ba: szoba1="), write(Szoba1), write(" szoba2="), writeln(Szoba2),
    igaz(Szoba1,Szoba2);
    hamis(Szoba1,Szoba2).

:- megoldas(X,Y), write(" els� szob�ban:"),writeln(X), write("m�sodik szob�bna"), writeln(Y).
