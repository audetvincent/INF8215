
public class State {
	/*
	 * pos donne la position de la voiture i dans sa ligne ou colonne (premiere
	 * case occupee par la voiture)
	 */
	public int[] pos;

	/*
	 * c,d et prev premettent de retracer letat precedent et le dernier
	 * mouvement effectuee
	 */
	public int c;
	static private RushHour rh;
	public int d;
	public State prev;
	/*
	 * a utiliser dans la deuxieme partie, 
	 * n indique la distance entre letat
	 * actuel et letat initial, f le cout de letat actuel.
	 */
	public int n;
	public int f = 0;

	/*
	 * Contructeur dun etat initial (& recebem qualquer valor = lixo)
	 */
	public State(int[] p, RushHour rh) {
		n = 0;
		int tam = p.length;
		pos = new int[tam];
		for (int i = 0; i < tam; i++)
			pos[i] = p[i];
		prev = null;
		State.rh = rh;
	}

	/*
	 * constructeur dun etat a partir deun atat s et deun mouvement (c,d)
	 */
	public State(State s, int c, int d) {
		prev = s;
		pos = new int[s.pos.length];
		for(int i = 0; i < pos.length; i++)
			pos[i] = s.pos[i];
		pos[c] += d;
		this.c = c;
		this.d = d;
		//Astar
		n = s.n + 1;
		//f = n;
		//f = n + estimee1();
		f = n + estimee2();
	}


	// this est il final?
	public boolean success() {
		if(this.pos[0] == 4)
			return true;
		return false;
	}

	/*
	 * Estimation du nombre de coup restants
	 */
	public int estimee1() {
		int distance;
		distance = 4 - this.pos[0];
		return distance;
	}

	public int estimee2() {
		int distance;
		int x, y;
		distance = 4 - this.pos[0];
		for(int i = 0; i < rh.nbcars; i++) {
			//Make sure car is vertical
			if(rh.horiz[i] == false) {
				y = rh.moveon[i];
				x = this.pos[i];
				//Make sure car is in front of red car in the y axis
				if(y >= this.pos[0] + rh.len[0]) {
					//Make sure car intersects the exit row (2)
					for(int j = 0; j < rh.len[i]; j++) {
						if(x + j == 2)
							distance++;
					}
				}
			}
		}
		return distance;
	}

	@Override
	public boolean equals(Object o) {
		State s = (State) o;
		if (s.pos.length != pos.length) {
			System.out.println("les etats nont pas le meme nombre de voitures");
		}
		int tamanho = pos.length;

		for (int i = 0; i < tamanho; i++)
			if (pos[i] != s.pos[i])
				return false;
		return true;
	}

	@Override
	public int hashCode() {
		int h = 0;
		for (int i = 0; i < pos.length; i++)
			h = 37 * h + pos[i];
		return h;
	}

	
}