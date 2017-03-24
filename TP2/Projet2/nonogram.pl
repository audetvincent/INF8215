logicPrb(ColumnSpecs,LineSpecs,Lines):-
    length(ColumnSpecs, N),
    valid_lines(),
    valid_columns(ColumnSpecs,Lines,1),
    print_nonogram(Lines).















/**********************************************************************************************
* VALID_SEQ
* Fonction pour valider que la "SEQ" (ligne ou colonne) respècte les contraintes "CONSTRAINTS" 
* (linesSpecs ou columnSpecs). 
**********************************************************************************************/
valid_seq(CONSTRAINTS, SEQ).

/*Si la première valeur de la séquence est blanche, on doit l'ignorer.
* On rappelle donc valid_seq en passant cette fois-ci le tail de la SEQ
* comme liste complète (le 0 ne s'y trouve plus).*/
valid_seq(CONSTRAINTS, [0 | SEQ_TAIL]) :-
    valid_seq(CONSTRAINTS, SEQ_TAIL).

/*Si la première valeur de la séquence est noire, on regarde la taille
* que ce bloc doit avoir (SIZECHUNK). On s'assure ensuite que cette taille
* est positive et on lui retranche 1 (puisque ce bloc noir est le head de
* la SEQ. On appelle ensuite valid_seq_rest avec la nouvelle taille du bloc
* et le tail de la SEQ.
*/
valid_seq([SIZECHUNK | CONSTRAINTS_TAIL], [1 | SEQ_TAIL]) :-
    SIZECHUNK > 0,
    SIZECHUNK_MINUSONE is SIZECHUNK - 1,
    valid_seq_rest([SIZECHUNK_MINUSONE | CONSTRAINTS_TAIL], SEQ_TAIL).

/*Si la liste de contraintes est vide, on doit traiter la validation de
* séquence commme si la liste possédait un zéro (ne se passera rien). */
valid_seq([], SEQ) :-
    valid_seq([0], SEQ).

/*Similairement, si la liste de contraintes est un zéro et que la ligne
* ou la colonne est vide, il ne se passe rien.*/
valid_seq([0], []).

/*Si on travaille sur le tail de la SEQ et que la contrainte est nulle,
* il ne se passe rien.*/
valid_seq_rest([0], SEQ) :-
    valid_seq([0], SEQ).

/*Encore une fois, si la tête des contraintes restantes est nulle,
* il n'y a rien a faire, on retourne au début pour aller la voir
* la contrainte suivante.
*/
valid_seq_rest([0 | CONSTRAINTS_TAIL], [0 | SEQ_TAIL]) :-
    valid_seq(CONSTRAINTS_TAIL, SEQ_TAIL).

/*Finalement, si valid_seq_rest est appelle avec un sizechunk positif
* et que la ligne ou la colonne est noire, on décrémente la taille du bloc
* et on appelle récursivement jusqu'à ce que le sizechunk soit nul. Une fois
* cela survenu, on retourne a valid_seq pour aller chercher le chunk suivant.
*/
valid_seq_rest([SIZECHUNK | CONSTRAINTS_TAIL], [1 | SEQ_TAIL]) :-
    SIZESHUNK > 0,
    SIZECHUNK_MINUSONE is SIZECHUNK - 1,
    valid_seq_rest([SIZECHUNK_MINUSONE | CONSTRAINTS_TAIL], SEQ_TAIL).
/**********************************************************************************************
***********************************************************************************************
**********************************************************************************************/




















/* fonction qui parcours la matrice et verifie pour chacune d'elles qu'elles sont valide par
 *  rapport à linesSpecs. Il faut aussi verifier que les elements de la
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
 *  element d’une liste L : nth1(i,L,ELEMENT).
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
