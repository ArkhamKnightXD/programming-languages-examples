%hechos
:-dynamic receta/2.
:-dynamic procedimiento/2.
:-dynamic plato/2.
:-dynamic plato/4.
:-dynamic plato_con_batidora/1.
:-dynamic plato_sin_batidora/1.
:-dynamic plato_sin_mantequilla/1.
:-dynamic plato_sin_huevos_sin_batidora/1.

plato(P,I):-receta(P,I).
plato(P,I1,I2,I3):-receta(P,I1), receta(P,I2),receta(P,I3).
plato_con_batidora(P):-receta(P,_), procedimiento(P,batidora).
plato_sin_batidora(P):-receta(P,_), not(procedimiento(P,batidora)).
plato_sin_mantequilla(P):-receta(P,_),not(receta(P,mantequilla)).
plato_sin_huevos_sin_batidora(P):-receta(P,_),not(procedimiento(P,batidora)),not(receta(P,huevos)).

