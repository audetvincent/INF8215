/*###############################FONCTION_D'APPELLE###############################*/
logicPrb(COLUMNSPECS,LINESPECS,LINES):-
	valid_lines(LINESPECS, LINES, 1),
	valid_columns(COLUMNSPECS,LINES, 1),
	print_nonogram(LINES).
/*################################################################################*/



/*###################################VALID_SEQ###################################*/
valid_seq(CONSTRAINTS, SEQ).

/*Si la premi�re valeur de la s�quence est blanche, on doit l'ignorer.
* On rappelle donc valid_seq en passant cette fois-ci le tail de la SEQ
* comme liste compl�te (le 0 ne s'y trouve plus).*/
valid_seq(CONSTRAINTS, [0 | SEQ_TAIL]) :-
	valid_seq(CONSTRAINTS, SEQ_TAIL).

/*Si la premi�re valeur de la s�quence est noire, on regarde la taille
* que ce bloc doit avoir (SIZECHUNK). On s'assure ensuite que cette taille
* est positive et on lui retranche 1 (puisque ce bloc noir est le head de
* la SEQ. On appelle ensuite valid_seq_rest avec la nouvelle taille du bloc
* et le tail de la SEQ.*/
valid_seq([SIZECHUNK | CONSTRAINTS_TAIL], [1 | SEQ_TAIL]) :-
	SIZECHUNK > 0,
	SIZECHUNK_MINUSONE is SIZECHUNK - 1,
	valid_seq_rest([SIZECHUNK_MINUSONE | CONSTRAINTS_TAIL], SEQ_TAIL).

/*Si la liste de contraintes est vide, on doit traiter la validation de
* s�quence commme si la liste poss�dait un z�ro (ne se passera rien). */
valid_seq([], SEQ) :-
	valid_seq([0], SEQ).

/*Similairement, si la liste de contraintes est un z�ro et que la ligne
* ou la colonne est vide, il ne se passe rien.*/
valid_seq([0], []).

/*Si on travaille sur le tail de la SEQ et que la contrainte est nulle,
* il ne se passe rien.*/
valid_seq_rest([0], SEQ) :-
	valid_seq([0], SEQ).

/*Encore une fois, si la t�te des contraintes restantes est nulle,
* il n'y a rien a faire, on retourne au d�but pour aller la voir
* la contrainte suivante.
*/
valid_seq_rest([0 | CONSTRAINTS_TAIL], [0 | SEQ_TAIL]) :-
	valid_seq(CONSTRAINTS_TAIL, SEQ_TAIL).

/*Finalement, si valid_seq_rest est appelle avec un sizechunk positif
* et que la ligne ou la colonne est noire, on d�cr�mente la taille du bloc
* et on appelle r�cursivement jusqu'� ce que le sizechunk soit nul. Une fois
* cela survenu, on retourne a valid_seq pour aller chercher le chunk suivant.
*/
valid_seq_rest([SIZECHUNK | CONSTRAINTS_TAIL], [1 | SEQ_TAIL]) :-
	SIZECHUNK > 0,
	SIZECHUNK_MINUSONE is SIZECHUNK - 1,
	valid_seq_rest([SIZECHUNK_MINUSONE | CONSTRAINTS_TAIL], SEQ_TAIL).
/*###############################################################################*/



/*###################################VALID_LINES##################################*/
/*Si la liste de LINESPECS est vide, les autres variables sont anonymes.*/
valid_lines([], _, _).

/*On divise la liste de LINESPECS en head et tail, puis on appelle
* valid_line (voir fonction plus bas) sur la premiere ligne et le
* head. Ensuite, on incr�mente l'index de la ligne et on recommence
* r�cursivement.*/
valid_lines([LINESSPECS | LINESSPECS_TAIL], LINES, FIRSTLINE) :-
	valid_line(FIRSTLINE, LINESSPECS, LINES),
	FIRSTLINE_PLUSONE is FIRSTLINE + 1,
	valid_lines(LINESSPECS_TAIL, LINES, FIRSTLINE_PLUSONE).

/*On extrait (voir fonction plus bas) dans LIGNE la ligne � l'index.
* pour �tre en mesure de la valider.*/
valid_line(INDEX, LINESSPECS, LINES) :-
	extract(INDEX, LINES, LINE),
	valid_seq(LINESSPECS, LINE).
/*################################################################################*/



/*##################################VALID_COLUMNS#################################*/
/*Si la liste de COLUMNSPECS est vide, les autres variables sont anonymes.*/
valid_columns([], _, _).

/*On divide la liste de COLUMNSPECS en head et tail, puis on appelle
* valid_column (voir fonction plus bas) sur la premiere colonne et le
* head. Ensuite, on incr�mente l'index de la colonne et on recommence
* r�cursivement.*/
valid_columns([COLUMNSPECS | COLUMNSPECS_TAIL], LINES, FIRSTCOLUMN) :-
	valid_column(FIRSTCOLUMN, COLUMNSPECS, LINES),
	FIRSTCOLUMN_PLUSONE is FIRSTCOLUMN + 1,
	valid_columns(COLUMNSPECS_TAIL, LINES, FIRSTCOLUMN_PLUSONE).
    
/*On extrait (voir fonction plus bas) dans COLUMN la colonne � l'index.
* pour �tre en mesure de la valider.*/
valid_column(INDEX, COLUMNSPECS, LINES) :-
	extract(INDEX, LINES, COLUMN),
	valid_seq(COLUMNSPECS, COLUMN).
/*################################################################################*/



/*#####################################EXTRACT####################################*/
/*Encore une fois, l'index est de type anonyme avec des listes vides*/
extract(_, [], []).

/*On utilise la fonction de prolog nth pour extraire de la liste
* DATA la liste � l'index et la mettre dans RESULT. Le coupe-choix
* permet d'emp�cher toute forme de backtracking et de ne conserver
* qu'uniquement la solution courante.*/
extract(INDEX, [DATA], [RESULT]) :-
	nth1(INDEX, DATA, RESULT),!.

/*Cette fonction permet de faire le travail sur l'ensemble de la liste
* de mani�re r�cursive. On effectue en effet un simple extrat (voir ci-haut
* sur le head, puis on recommence avec le tail r�cursivement.*/
extract(INDEX, [DATA | DATA_TAIL], [RESULT | RESULT_TAIL]) :-
	extract(INDEX, [DATA], [RESULT]),
	extract(INDEX, LIST_TAIL, RESULT_TAIL).
/*################################################################################*/



/*#################################PRINT_NONOGRAM#################################*/
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
/*################################################################################*/



/*######################################TEST#####################################*/
/*Test 5x5*/
columnSpecs([3,1],[1,1,1],[1,1,1],[1,1,1],[1,3]).
linesSpecs([5],[1],[5],[1],[5]).
lines([],[],[],[],[]).
/*################################################################################*/
