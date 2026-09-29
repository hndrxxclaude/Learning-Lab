sealed abstract class Veicolo permits Auto, Bici {
	public String descrivi() { return "Veicolo"; }
}

final class Auto extends Veicolo {
	@Override public String descrivi() { return "Auto"; }
	public int porte() { return 5; }
}

non-sealed class Bici extends Veicolo {
	@Override public String descrivi() { return "Bici"; }
}
public class TestVeicoli {
	
	static void stampa(Veicolo v) {
		System.out.print(v.descrivi());
		if (v instanceof Auto a) {
			System.out.print(" " + a.porte());
		}
		System.out.println();
	}
	
	public static void main(String[] args) {
		Veicolo v1 = new Auto();
		Veicolo v2 = new Bici();
		stampa(v1);
		stampa(v2);
	}
}