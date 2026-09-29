public class Carta implements Pagabile{
	
	private final String numeroCarta;
	private String scadenza;
	private String codiceSicurezza;
	
	public Carta(String numeroCarta, String scadenza, String codiceSicurezza){
		if (numeroCarta == null || numeroCarta.isBlank()){
			throw new IllegalArgumentException("Il numero della carta non può essere null");
		}
		
		if (scadenza == null || scadenza.isBlank()){
			throw new IllegalArgumentException("La scadenza della carta non può essere null");
		}
		
		if (codiceSicurezza == null || codiceSicurezza.isBlank() || codiceSicurezza.length() != 3){
			throw new IllegalArgumentException("Il codice di sicurezza della carta non può essere null e deve essere di 3 cifre.");
		}
		
		this.numeroCarta = numeroCarta;
		this.scadenza = scadenza;
		this.codiceSicurezza = codiceSicurezza;
	}
	
	public String getNumeroCarta(){
		return numeroCarta;
	}
	
	public String getDataScadenza(){
		return scadenza;
	}
	
	@Override
	public double calcolaCommissione(double importo){
		return importo / 100.0;
	}

	@Override
	public String descrizione(){
		return "Informazioni private.";
	}
}