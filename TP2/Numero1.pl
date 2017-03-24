ask(homme,X):-
    format('Est-ce un homme ?',[X]),
    read(Response),
    Response = 'oui'.
/* 1er niveau */
ask(artiste,X):-
    format('Est-ce que X pratique un art comme profession ?',[X]),
    read(Response),
    Response = 'oui'.
ask(personnage,X):-
    format('Est-ce que X est un personnage ?',[X]),
    read(Response),
    Response = 'oui'.
ask(sport,X):-
    format('Est-ce que X pratique un sport comme profession ?',[X]),
    read(Response),
    Response = 'oui'.
ask(religion,X):-
    format('Est-ce que X est un religieux ?',[X]),
    read(Response),
    Response = 'oui'.
ask(dirigeant,X):-
    format('Est-ce que X est un dirigeant ?',[X]),
    read(Response),
    Response = 'oui'.
ask(prof,X):-
    format('Est-ce que X est un professeur ?',[X]),
    read(Response),
    Response = 'oui'.

/* 2e niveau */
ask(musicien,X):-
    format('Est-ce que X est dans le domaine de la musique ?',[X]),
    read(Response),
    Response = 'oui'.
ask(television,X):-
    format('Est-ce que X est dans le domaine de la television ?',[X]),
    read(Response),
    Response = 'oui'.
ask(ecriture,X):-
    format('Est-ce que X est dans le domaine de l ecriture ?',[X]),
    read(Response),
    Response = 'oui'.

ask(action,X):-
    format('Est-ce que X est un personnage d action ?',[X]),
    read(Response),
    Response = 'oui'.
ask(jeux_video,X):-
    format('Est-ce que X est un personnage de jeux videos ?',[X]),
    read(Response),
    Response = 'oui'.

ask(tennis,X):-
    format('Est-ce que X joue au tennis ?',[X]),
    read(Response),
    Response = 'oui'.

ask(prophete,X):-
    format('Est-ce que X est un prophete ?',[X]),
    read(Response),
    Response = 'oui'.

ask(os,X):-
    format('Est-ce que X enseigne systeme d exploitation ?',[X]),
    read(Response),
    Response = 'oui'.

/* 3e niveau */
ask(chanteur,X):-
    format('Est-ce que X chante ?',[X]),
    read(Response),
    Response = 'oui'.
ask(symphonie,X):-
    format('Est-ce que X est reconnu pour ses symphonies ?',[X]),
    read(Response),
    Response = 'oui'.

ask(christianisme,X):-
    format('Est-ce que X est chretien ?',[X]),
    read(Response),
    Response = 'oui'.



personne(X):-
    ask(homme,X),
    homme2(X).
personne(X):-
    femme2(X).

/* 1er niveau */
homme2(X):-
    ask(artiste,X),
    artiste(X),
    homme(X).
homme2(X):-
    ask(personnage,X),
    personnage(X),
    homme(X).
homme2(X):-
    ask(sport,X),
    sport(X),
    homme(X).
homme2(X):-
    ask(religion,X),
    religion(X),
    homme(X).
homme2(X):-
    ask(dirigeant,X),
    dirigeant(X),
    homme(X).
homme2(X):-
    ask(prof,X),
    prof(X),
    homme(X).

femme2(X):-
    ask(artiste,X),
    artiste(X),
    femme(X).
femme2(X):-
    ask(personnage,X),
    personnage(X),
    femme(X).
femme2(X):-
    ask(sport,X),
    sport(X),
    femme(X).
femme2(X):-
    ask(dirigeant,X),
    dirigeant(X),
    femme(X).

/* 2e niveau */
artiste(X):-
    ask(musicien,X),
    musicien(X).
artiste(X):-
    ask(television,X),
    television(X).
artiste(X):-
    ask(ecriture,X),
    ecrivain(X).

personnage(X):-
    ask(action,X),
    action(X).
personnage(X):-
    ask(jeux_video,X),
    jeux_video(X).
personnage(X):-
    princesse(X).
personnage(X):-
    animal(X).

sport(X):-
    ask(tennis,X),
    tennis(X).
sport(X):-
    automobile(X).

religion(X):-
    ask(prophete,X),
    prophete(X).
religion(X):-
    pape(X).

/* 3e niveau */
musicien(X):-
    ask(chanteur,X),
    chanteur(X).
musicien(X):-
    ask(symphonie,X),
    symphonie(X).
musicien(X):-
    pianiste(X).

prophete(X):-
    ask(christianisme,X),
    chretien(X).
prophete(X):-
    juif(X).

prof(X):-
    ask(os,X),
    os(X).
prof(X):-
    web(X).

/* Artiste */
chanteur('Michael Jackson').
symphonie('Wolfgang Amadeus Mozart').
pianiste('John Lewis').
television('Julie Snyder').
television('Brad Pitt').
ecrivain('J.K. Rowling').
ecrivain('Victor Hugo').

/* Personnage */
action('James Bond').
action('Lara Croft').
princesse('Blanche-Neige').
animal('Garfield').
jeux_video('Mario').

/* Sport */
tennis('Rafael Nadal').
tennis('Eugenie Bouchard').
automobile('Jacques Villeneuve').

/* Religion */
chretien('Jesus').
pape('Pape Francois').
juif('Moise').

/* Politique */
dirigeant('Stephen Harper').
dirigeant('Cleopatre VII').

/* Prof */
os('Michel Dagenais').
web('Michel Gagnon').

/*list_homme('Michael Jackson','Stephen Harper','Wolfgang Amadeus Mozart','Moise','Mario','Michel Gagnon','Rafael Nadal','Jacques Villeneuve','Garfield','Michel Dagenais','Victor Hugo','John Lewis','Jesus','Pape Francois','James Bond','Brad Pitt').
*/

homme('Michael Jackson').
homme('Stephen Harper').
homme('Wolfgang Amadeus Mozart').
homme('Moise').
homme('Mario').
homme('Michel Gagnon').
homme('Rafael Nadal').
homme('Jacques Villeneuve').
homme('Garfield').
homme('Michel Dagenais').
homme('Victor Hugo').
homme('John Lewis').
homme('Jesus').
homme('Pape Francois').
homme('James Bond').
homme('Brad Pitt').

femme('Julie Snyder').
femme('Lara Croft').
femme('Blanche-Neige').
femme('J.K. Rowling').
femme('Cleopatre VII').
femme('Eugenie Bouchard').

