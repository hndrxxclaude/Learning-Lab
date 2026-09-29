import java.util.List;
import java.util.ArrayList;

public class TestPagamenti{
	
	public static void main(String[] args){
		
		List<Pagabile> pagabili = new ArrayList<>();
		
		pagabili.add(new Carta("12345678", "06/28", "562"));
		
		try{
			pagabili.add(new Bonifico("Claudiomario Gentile", 3.0, "Alessandra Albanese", "Mensile Apple Music"));
		} catch(ImportoNonValidoException e){
			System.out.println("[Errore]: " + e.getMessage());
		}
		
		double totaleCommissioni = 0;
		
		for (Pagabile p : pagabili){
			if (p instanceof Carta c){
				System.out.println("Tipo concreto: " + c.getClass().getName());
			}
			
			if (p instanceof Bonifico b){
				System.out.println("Tipo concreto: " + b.getClass().getName());
			}
			
			totaleCommissioni += p.calcolaCommissione(3.0);
		}
		
		System.out.println("Totale commissioni pagabili su 3 euro: " + totaleCommissioni + " euro");
	}
}