logicPrb(ColumnSpecs,LineSpecs,Lines):-
    length(ColumnSpecs, N),
    valid_lines(),
    valid_columns(ColumnSpecs,Lines,1),
    print_nonogram(Lines).

/* fonction pour valider que la "SEQ" (ligne ou colonne) respecte les contraintes
 *  "CONSTRAINTS" (linesSpecs ou columnSpecs)*/
valid_seq(CONSTRAINTS, SEQ):-
    fail.

/* fonction qui parcours la matrice et verifie pour chacune d'elles qu'elles sont valide par
 *  rapport � linesSpecs. Il faut aussi verifier que les elements de la
 *  matrice ne prenne que deux valeurs (noir=1 ou blanc=0). */
valid_lines(LineSpecs,Lines):-
    fail.

/* fonction analogue a valid_lines() mais pour les colones */
vaild_columns([ColumnSpec|ColumnSpecs], Lines, Column):-
    valid_column(ColumnSpec, Lines, Column),
    ColumnPlusPlus is Column + 1,
    valid_columns(ColumnSpecs,Lines,ColumnPlusPlus).

vaild_column(ColumnSpec, Lines, ColumnIndex):-
    extract(ColumnIndex,Lines,Column),
    valid_seq(ColumnSpec,Column).

/* Comme X est une liste de lignes, il nous faut extraire les colonnes pour les tester.
 *  Cette fonction extrait donc la K-eme colonne de X, et la renvoie dans le champ COLUMN.
 *  Vous aurez besoin de la fonction (deja dans prolog) suivante pour extraire le i-eme
 *  element d�une liste L : nth1(i,L,ELEMENT).
 */
extract(K,X,COLUMN):-
    nth1(K,X,COLUMN).


/* Fonctions pour afficher la solution au probleme */
print_nonogram(N):-
    nl,write('Found nonogram:'),nl,
    print_nonogram1(N).

print_nonogram1([]).
print_nonogram1([Line | Lines]):-
    print_line(Line),nl,
    print_nonogram1(Lines).

print_line([]).
print_line([Head | Tail]):-
    Head = 1,
    write('# '),
    print_line(Tail).
print_line([Head | Tail]):-
    Head = 0,
    write('. '),
    print_line(Tail).

/* test grille 5x5 */
columnSpecs([3,1],[1,1,1],[1,1,1],[1,1,1],[1,3]).
linesSpecs([5],[1],[5],[1],[5]).
lines([],[],[],[],[]).
