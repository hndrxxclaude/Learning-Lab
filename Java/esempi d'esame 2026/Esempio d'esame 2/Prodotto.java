import java.util.Objects;
import java.util.HashMap;
import java.util.Scanner;

public class Prodotto{
	
	private String codice;
	private String nome;
	private double prezzo;
	
	public Prodotto(String codice, String nome, double prezzo){
		if (codice == null || codice.isBlank()){
			throw new IllegalArgumentException("Invalid input: il codice del prodotto non può essere null.");
		}
		
		if (nome == null || nome.isBlank()){
			throw new IllegalArgumentException("Invalid input: il nome del prodotto non può essere null.");
		}
		
		if (prezzo <= 0){
			throw new IllegalArgumentException("Invalid input: il prezzo del prodotto deve essere maggiore di 0.");
		}
		
		this.codice = codice;
		this.nome = nome;
		this.prezzo = prezzo;
	}
	
	public String getCodice(){
		return codice;
	}
	
	public void setCodice(String codice){
		if (codice == null || codice.isBlank()){
			throw new IllegalArgumentException("Invalid input: il codice del prodotto non può essere null.");
		}
		
		this.codice = codice;
	}
	
	public String getNome(){
		return nome;
	}
	
	public void setNome(String nome){
		if (nome == null || nome.isBlank()){
			throw new IllegalArgumentException("Invalid input: il nome del prodotto non può essere null.");
		}
		
		this.nome = nome;
	}
	
	public double getPrezzo(){
		return prezzo;
	}
	
	public void setPrezzo(double prezzo){
		if (prezzo <= 0){
			throw new IllegalArgumentException("Invalid input: il prezzo del prodotto deve essere maggiore di 0.");
		}
		
		this.prezzo = prezzo;
	}
	
	@Override
	public boolean equals(Object obj){
		if (this == obj){
			return true;
		}
		
		if (obj == null || getClass() != obj.getClass()){
			return false;
		}
		
		Prodotto other = (Prodotto) obj;
		
		return codice.equals(other.codice) && nome.equals(other.nome) && Double.compare(prezzo, other.prezzo) == 0;
	}
	
	@Override
	public int hashCode(){
		return Objects.hash(codice);
	}
	
	@Override
	public String toString(){
		return "Prodotto | Codice: " + codice
		+ " | Nome: " + nome 
		+ " | Prezzo: " + prezzo;
	}
	
	public static void main(String[] args){
		
		HashMap<String, Prodotto> prodotti = new HashMap<>();
		
		prodotti.put("Prodotto 1", new Prodotto("P1", "Banana", 0.39));
		prodotti.put("Prodotto 2", new Prodotto("P2", "Biscotti", 2.79));
		prodotti.put("Prodotto 3", new Prodotto("P3", "Shampoo", 3.59));
		prodotti.put("Prodotto 4", new Prodotto("P4", "Spada Laser", 2000000));
		prodotti.put("Prodotto 5", new Prodotto("P5", "Gesù Cristo", 1.09));
		
		boolean trovato = false;
		Prodotto ricercato = null;
		
		Scanner sc = new Scanner(System.in);
		
		try{
			System.out.println("Inserire il codice del prodotto che si desidera cercare: ");
			String id = sc.next();
		
			for (Prodotto p : prodotti.values()){
				if (p.getCodice().equals(id)){
					ricercato = p;
					trovato = true;
				}
			}
		
			if(!trovato){
				System.out.println("Prodotto non trovato.");
			} else {
				System.out.println(ricercato.toString());
			}
		} catch (Exception e){
			System.out.println("[Errore] " + e.getMessage());
		}

		sc.close();
		
		System.out.println("\nTutti i prodotti disponibili: ");
		for (Prodotto p : prodotti.values()){
			System.out.println(p.toString());
		}
	}
}