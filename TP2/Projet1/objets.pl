ask(electrique, X):-
    format('Est-ce que l objet � besoin d �lectricit� pour fonctionner ?',[X]),
    read(Response),
    Response = 'oui'.
/* 1er Niveau */
ask(cuisine, X):-
    format('Est-ce que l objet se retrouve principalement dans une cuisine ?',[X]),
    read(Response),
    Response = 'oui'.
ask(transportable, X):-
    format('Est-ce que l objet est souvent transporter par une personne ?',[X]),
    read(Response),
    Response = 'oui'.
ask(menage, X):-
    format('Est-ce que l objet est utilis� pour faire le m�nage ?',[X]),
    read(Response),
    Response = 'oui'.
ask(musique, X):-
    format('Est-ce que l objet est utilis� pour faire de la musique ?',[X]),
    read(Response),
    Response = 'oui'.
ask(dormir, X):-
    format('Est-ce que l objet est utilis� pour dormir ?',[X]),
    read(Response),
    Response = 'oui'.
ask(plante, X):-
    format('Est-ce que l objet est une plante ?', [X]),
    read(Response),
    Response = 'oui'.

/* 2e Niveau */
ask(cuire, X):-
    format('Est-ce que l objet permet de cuire ou rechauffer de la nourriture ?', [X]),
    read(Response),
    Response = 'oui'.
ask(vaisselle, X):-
    format('Est-ce que l objet est de la vaisselle ?', [X]),
    read(Response),
    Response = 'oui'.
ask(dessus, X):-
    format('Est-ce que l on peut deposer d autres objets sur cet objet ?', [X]),
    read(Response),
    Response = 'oui'.
ask(griller, X):-
    format('Est-ce que l objet permet de griller ?', [X]),
    read(Response),
    Response = 'oui'.
ask(pique, X):-
    format('Est-ce que l objet possede des piques ?', [X]),
    read(Response),
    Response = 'oui'.
ask(remplissable, X):-
    format('Est-ce qu on peut mettre de la matiere dans l objet (liquide ou solide) ?', [X]),
    read(Response),
    Response = 'oui'.
ask(poche, X):-
    format('Est-ce que l objet peut se transporter dans une poche ?', [X]),
    read(Response),
    Response = 'oui'.



objet(X):-
    ask(electrique,X),
    electrique(X).
objet(X):-
    non_electrique(X).


electrique(X):-
    ask(cuisine, X),
    cuisine(X),
    electricite(X).
electrique(X):-
    ask(transportable, X),
    transportable(X),
    electricite(X).
electrique(X):-
    ask(menage, X),
    menage(X),
    electricite(X).
electrique(X):-
    lumiere(X),
    electricite(X).

non_electrique(X):-
    ask(cuisine, X),
    cuisine(X),
    sans_electricite(X).
non_electrique(X):-
    ask(transportable, X),
    transportable(X),
    sans_electricite(X).
non_electrique(X):-
    ask(menage, X),
    menage(X),
    sans_electricite(X).
non_electrique(X):-
    ask(musique, X),
    musique(X),
    sans_electricite(X).
non_electrique(X):-
    ask(dormir, X),
    dormir(X),
    sans_electricite(X).
non_electrique(X):-
    ask(plante, X),
    plante(X),
    sans_electricite(X).
non_electrique(X):-
    savon(X),
    sans_electricite(X).


cuisine(X):-
    ask(cuire, X),
    cuire(X).
cuisine(X):-
    ask(remplissable, X),
    remplissable(X).
cuisine(X):-
    ask(vaisselle, X),
    vaisselle(X).
cuisine(X):-
    ask(dessus, X),
    dessus(X).
cuisine(X):-
    nettoyant(X).

vaisselle(X):-
    ask(pique, X),
    pique(X).
vaisselle(X):-
    plat(X).

transportable(X):-
    ask(poche, X),
    poche(X).
transportable(X):-
    ask(remplissable, X),
    remplissable(X).
transportable(X):-
    sac(X).
transportable(X):-
    bois(X).

poche(X):-
    ask(remplissable, X),
    remplissable(X).
poche(X):-
    metal(X).

cuire(X):-
    ask(griller, X),
    griller(X).
cuire(X):-
    ask(dessus, X),
    dessus(X).
cuire(X):-
    onde(X).


electricite('Grille-pain').
electricite('Cuisiniere').
electricite('Four micro-onde').
electricite('Cafetiere').
electricite('Telephone').
electricite('Ordinateur').
electricite('Aspirateur').
electricite('Lampe').

sans_electricite('Fourchette').
sans_electricite('Assiette').
sans_electricite('Fourchette').
sans_electricite('Casserole').
sans_electricite('Table').
sans_electricite('Detergent a vaisselle').
sans_electricite('Cle').
sans_electricite('Porte-feuille').
sans_electricite('Sac a dos').
sans_electricite('Papier').
sans_electricite('Balai').
sans_electricite('Piano').
sans_electricite('Lit').
sans_electricite('Cactus').
sans_electricite('Shampoing').

griller('Grille-pain').
dessus('Cuisiniere').
onde('Four micro-onde').
remplissable('Cafetiere').
metal('Telephone').
sac('Ordinateur').
menage('Aspirateur').
lumiere('Lampe').
pique('Fourchette').
plat('Assiette').
remplissable('Casserole').
dessus('Table').
nettoyant('Detergent a vaisselle').
remplissable('Porte-Feuille').
remplissable('Sac a dos').
metal('Cle').
bois('Papier').
menage('Balai').
musique('Piano').
dormir('Lit').
plante('Cactus').
savon('Shampoing').

