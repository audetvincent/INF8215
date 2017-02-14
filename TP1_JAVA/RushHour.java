import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Queue;

public class RushHour {

	/*
	 * representation du probleme : Les six lignes sont numerotees de haut en
	 * bas, de 0 a 5 et les 6 colonnes de gauche a droite, de 0 a 5.
	 *
	 * il y a nbcars voitures, numerotees de 0 a nbcars-1 pour chaque voiture i
	 * on a : - color[i] sa couleur - horiz[i] si la voiture est horizontale
	 * (vrai) ou verticale (faux) - len[i] sa longueur (2 ou 3) - moveon[i] la
	 * ligne (si horiz[i]) ou la colonne (sinon) ou se trouve la voiture
	 *
	 */

	public int nbcars;
	public String[] color;
	public boolean[] horiz;
	public int[] len;
	public int[] moveon;

	public int nbMoves;
	/*
	 * la matrice free permet de savoir si une case est libre
	 */
	public boolean[][] free = new boolean[6][6];

	void initFree(State s) {
		int x;
		int y;
		//Initialize all matrix to true (free)
		for(int i = 0; i < 6; i++) {
			for(int j = 0; j < 6; j++) {
				free[i][j] = true;
			}
		}
		//Loop through all cars and check where they are in the matrix
		for(int i = 0; i < nbcars; i++) {
			if(horiz[i] == true) {
				x = moveon[i];
				y = s.pos[i];
				for(int j = 0; j < len[i]; j++)
					free[x][y+j] = false;
			}
			else {
				y = moveon[i];
				x = s.pos[i];
				for(int j = 0; j < len[i]; j++)
					free[x+j][y] = false;
			}
		}
	}

	/*
	 * renvoie la liste des deplacements possibles
	 */
	
	public ArrayList<State> moves(State s) {
		initFree(s);
		ArrayList<State> l = new ArrayList<State>();
		int x, y;
		//On a inverse lordre de parcours pour avoir le meme resultat que dans lenonce
		//au numero 4 (plus facile de verifier).
		for(int i = nbcars - 1; i >= 0; i--) {
			if(horiz[i] == true) {
				x = moveon[i];
				y = s.pos[i];
				//Check left move
				if(x >= 0 && x<= 5 && (y-1) >= 0 && (y-1) <=5) {
					if(free[x][y-1] == true) {
						l.add(new State(s, i, -1));
					}
				}
				//Check right move
				if(x >= 0 && x<= 5 && (y+len[i]) >= 0 && (y+len[i]) <=5) {
					if(free[x][y + len[i]] == true) {
						l.add(new State(s, i, +1));
					}
				}
			}
			else {
				y = moveon[i];
				x = s.pos[i];
				//Check up move
				if((x-1) >= 0 && (x-1) <= 5 && y >= 0 && y-1 <=5) {
					if(free[x - 1][y] == true) {
						l.add(new State(s, i, -1));
					}
				}
				//Check down move
				if((x+len[i]) >= 0 && (x+len[i]) <= 5 && y >= 0 && y-1 <=5) {
					if(free[x + len[i]][y] == true) {
						l.add(new State(s, i, +1));
					}
				}
			}
		}
		return l;
	}

	/*
	 * trouve une solution a partir de s
	 */
	public State solve(State s) {
		State temp;
		HashSet<State> visited = new HashSet<State>();
		Queue<State> Q = new LinkedList<State>();
		Q.add(s);
		while(!Q.isEmpty()) {
			temp = Q.remove();
			if(!visited.contains(temp)) {
				if(temp.success()){
					return temp;
				}
				else {
					visited.add(temp);
					Q.addAll(moves(temp));
				}
			}
		}
		System.out.println("pas de solution");
		return null;
	}

	public State solveAstar(State s) {
		HashSet<State> visited = new HashSet<State>();
		visited.add(s);
		PriorityQueue<State> Q = new PriorityQueue<State>(10, new MyComparator());
		//TODO
		System.out.println("pas de solution");
		return null;
	}

	/*
	 * affiche la solution
	 */

	void printSolution(State s) {
		System.out.println(s.n + " mouvements");
		ArrayList<String> solution = new ArrayList<String>();
		while(s.prev != null) {
			if(horiz[s.c] == true && s.d ==1) {
				//Move to the right
				solution.add("voiture " + color[s.c] + " vers la droite");
			}
			else if(horiz[s.c] == true && s.d == -1) {
				//Move to the left
				solution.add("voiture " + color[s.c] + " vers la gauche");
			}
			else if(horiz[s.c] == false && s.d == 1) {
				//Move down
				solution.add("voiture " + color[s.c] + " vers le bas");
			}
			else if(horiz[s.c] == false && s.d == -1) {
				//Move up
				solution.add("voiture " + color[s.c] + " vers le haut");
			}
			s = s.prev;
		}
		
		//Print in reverse order because we start with final solution
		for(int i = solution.size() - 1; i >= 0; i--) {
			System.out.println(solution.get(i));
		}
	}
	
	private class MyComparator implements Comparator<State> {
		@Override
		public int compare(State arg0, State arg1) {
			return arg0.f - arg1.f;
		}
	}
}