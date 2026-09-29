import java.util.List;
import java.util.ArrayList;

public class TestDipendenti{
	
	public static void main(String[] args){
		
		List<Dipendente> dipendenti = new ArrayList<>();
		
		dipendenti.add(new ImpiegatoFisso(1, "Mario Gentile"));
		dipendenti.add(new Consulente(2, "Claudiomario Gentile"));
		dipendenti.add(new Venditore(3, "Claudio Gentile"));
		
		double maxStipendio = 0;
		Dipendente maxStipendiato = null;
		
		for (Dipendente d : dipendenti){
			if (d.stipendio() > maxStipendio){
				maxStipendiato = d;
				maxStipendio = d.stipendio();
			}
		}
		
		System.out.println("Dipendente con stipendio massimo: ");
		System.out.println(maxStipendiato.toString());
	}
}