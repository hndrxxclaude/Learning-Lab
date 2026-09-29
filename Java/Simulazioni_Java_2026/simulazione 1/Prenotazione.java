import java.util.Objects;

public class Prenotazione{
	private String codice;
	private String nomeStudente;
	private int numeroPosti;
	private FasciaOraria fasciaOraria;
	
	public Prenotazione(String codice, String nomeStudente, int numeroPosti, FasciaOraria fasciaOraria){
		if (codice == null || codice.isBlank()){
			throw new IllegalArgumentException("Il codice della prenotazione non può essere null.");
		}
		
		if (nomeStudente == null || nomeStudente.isBlank()){
			throw new IllegalArgumentException("Il nome dello studente non può essere vuoto.");
		}
		
		if (numeroPosti < 1){
			throw new IllegalArgumentException("Il numero posti deve essere positivo.");
		}
		
		if (fasciaOraria == null){
			throw new IllegalArgumentException("La fascia oraria non può essere null.");
		}
		
		this.codice = codice;
		this.nomeStudente = nomeStudente;
		this.numeroPosti = numeroPosti;
		this.fasciaOraria = fasciaOraria;
		
	}
	
	public String getCodice(){
		return codice;
	}
	
	public String getStudente(){
		return nomeStudente;
	}
	
	public int getPosti(){
		return numeroPosti;
	}
	
	public FasciaOraria getFasciaOraria(){
		return fasciaOraria;
	}
	
	@Override
	public boolean equals(Object obj){
		if (this == obj){
			return true;
		}
		
		if (obj == null || this.getClass() != obj.getClass()){
			return false;
		}
		
		Prenotazione other = (Prenotazione) obj;
		
		return codice.equals(other.codice) && nomeStudente.equals(other.nomeStudente) && numeroPosti == other.numeroPosti && fasciaOraria.equals(other.fasciaOraria);
	}
	
	@Override 
	public int hashCode(){
		return Objects.hash(codice, nomeStudente, numeroPosti, fasciaOraria);
	}
	
	@Override
	public String toString(){
		return "Prenotazione| Codice: " + codice + " | Studente: " + nomeStudente + " | Numero Posti: " + numeroPosti + " | Fascia oraria: " + fasciaOraria;
	}

}