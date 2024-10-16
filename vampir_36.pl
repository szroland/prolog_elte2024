

elme(orult).
elme(egeszseges).
tipus(vampir).
tipus(ember).

szereplo(E-T):- elme(E), tipus(T).

orult(orult-_).
egeszseges(egeszseges-_).
ember(_-ember).
vampir(_-vampir).

allit(X, F) :-
    egeszseges(X), ember(X), F;
    orult(X), ember(X), not(F);
    egeszseges(X), vampir(X), not(F);
    orult(X), vampir(X), F.

egyik_vampir(A, B) :-
    ember(A), vampir(B);
    vampir(A), ember(B).
mindketto_orult(A, B) :- orult(A), orult(B) .

megold(Lucy, Minna) :-
    szereplo(Lucy), szereplo(Minna),
    egyik_vampir(Lucy, Minna),
    allit(Lucy, mindketto_orult(Lucy, Minna)),
    allit(Minna, not(mindketto_orult(Lucy, Minna))).


