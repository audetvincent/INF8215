ask(ELECTRIQUE, X):-
    format('Est-ce que l objet � besoin d �lectricit� pour fonctionner ?',[X]),
    read(Response),
    Response = 'oui'.
/* 1er Niveau */
ask(CUISINE, X):-
    format('Est-ce que l objet se retrouve principalement dans une cuisine ?',[X]),
    read(Response),
    Response = 'oui'.
ask(TRANSPORTABLE, X):-
    format('Est-ce que l objet est souvent transporter par une personne ?',[X]),
    read(Response),
    Response = 'oui'.
ask(MENAGE, X):-
    format('Est-ce que l objet est utilis� pour faire le m�nage ?',[X]),
    read(Response),
    Response = 'oui'.
ask(MUSIQUE, X):-
    format('Est-ce que l objet est utilis� pour faire de la musique ?',[X]),
    read(Response),
    Response = 'oui'.
ask(DORMIR, X):-
    format('Est-ce que l objet est utilis� pour dormir ?',[X]),
    read(Response),
    Response = 'oui'.
ask(PLANTE, X):-
    format('Est-ce que l objet est une plante ?', [X]),
    read(Response),
    Response = 'oui'.

/* 2e Niveau */


objet(X):-
    ask(electrique,X),
    electrique(X).
