sz�l�(�lmos,�rp�d).
sz�l�(�rp�d,solt).
sz�l�(�rp�d,levente).
sz�l�(solt,taksony).
sz�l�(taksony,g�za).
sz�l�(taksony,mih�ly).
% �s szab�ly
�s(�se,Kinek):-sz�l�(�se,Kinek).
�s(�se,Kinek):-sz�l�(�se,Valaki),�s(Valaki,Kinek).
%gyerek(Gyereke,Sz�l�nek) szab�lyt
gyerek(Gyereke,Sz�l�nek):- sz�l�(Sz�l�nek,Gyereke).
%lesz�rmazott(Lesz�rmazottja,�snek).
lesz�rmazott(Lesz�rmazottja, �snek):-sz�l�(�snek, Lesz�rmazottja).
lesz�rmazott(Lesz�rmazottja, �snek):-sz�l�(�snek, Valaki),
    lesz�rmazott(Lesz�rmazottja, Valaki).
