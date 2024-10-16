szülõ(álmos,árpád).
szülõ(árpád,solt).
szülõ(árpád,levente).
szülõ(solt,taksony).
szülõ(taksony,géza).
szülõ(taksony,mihály).
% õs szabály
õs(Õse,Kinek):-szülõ(Õse,Kinek).
õs(Õse,Kinek):-szülõ(Õse,Valaki),õs(Valaki,Kinek).
%gyerek(Gyereke,Szülõnek) szabályt
gyerek(Gyereke,Szülõnek):- szülõ(Szülõnek,Gyereke).
%leszármazott(Leszármazottja,Õsnek).
leszármazott(Leszármazottja, Õsnek):-szülõ(Õsnek, Leszármazottja).
leszármazott(Leszármazottja, Õsnek):-szülõ(Õsnek, Valaki),
    leszármazott(Leszármazottja, Valaki).
