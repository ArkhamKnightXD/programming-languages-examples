progenitor(antonio, carlos).
progenitor(antonio, eva).
progenitor(maria, carlos).
progenitor(maria, eva).
progenitor(carlos, fernando).
progenitor(carlos, silvia).
progenitor(elena, silvia).
progenitor(elena, fernando).
progenitor(eva, emilio).
progenitor(david, emilio).

abuelo(Abuelo, Nieto):-progenitor(Abuelo, Padre), progenitor(Padre, Nieto).






