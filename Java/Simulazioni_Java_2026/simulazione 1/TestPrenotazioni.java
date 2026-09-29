import java.util.Map;
import java.util.HashMap;
import java.util.Scanner;

public class TestPrenotazioni{
	
	public static void main(String[] args){
		
		Map<String, Prenotazione> listaPrenotazioni = new HashMap<>();
		
		listaPrenotazioni.put("P1", new Prenotazione("P1", "Claudio Gentile", 2, FasciaOraria.SERA));
		listaPrenotazioni.put("P2", new Prenotazione("P2", "Fabrizio Baglio", 2, FasciaOraria.SERA));
		listaPrenotazioni.put("P3", new Prenotazione("P3", "Diego Ciappa", 1, FasciaOraria.SERA));
		listaPrenotazioni.put("P4", new Prenotazione("P4", "Francesco Bruni", 2, FasciaOraria.MATTINA));
		listaPrenotazioni.put("P5", new Prenotazione("P5", "Gabriele D'Asta", 12, FasciaOraria.POMERIGGIO));
		
		Scanner sc = new Scanner(System.in);
		boolean trovato = false;
		
		System.out.println("Inserire il codice della prenotazione da cercare: ");
		String codice = sc.next();
		
		int totalePostiPrenotati = 0;
		
		for (Prenotazione p : listaPrenotazioni.values()){
			if (p.getCodice().equals(codice)){
				System.out.println("Prenotazione trovata.");
				System.out.println(p.toString());
				trovato = true;
			}
			totalePostiPrenotati += p.getPosti();
		}
		if (!trovato){
			System.out.println("Prenotazione inesistente.");
		}
		System.out.println("Totale posti prenotati: " + totalePostiPrenotati);

		sc.close();
	}
}