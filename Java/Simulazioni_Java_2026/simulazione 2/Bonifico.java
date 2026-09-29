public class Bonifico implements Pagabile{
	
	private String mandante;
	private double importo;
	private String destinatario;
	private String causale;
	
	public Bonifico(String mandante, double importo, String destinatario, String causale) throws ImportoNonValidoException{
		if (mandante == null || mandante.isBlank()){
			throw new IllegalArgumentException("Il mandante non può essere null.");
		}
		
		if (importo <= 0){
			throw new ImportoNonValidoException("L'importo deve essere maggiore di 0.");
		}
		
		if (destinatario == null || destinatario.isBlank()){
			throw new IllegalArgumentException("Il destinatario non può essere null.");
		}
		
		this.mandante = mandante;
		this.importo = importo;
		this.destinatario = destinatario;
		this.causale = causale;
	}
	
	public String getMandante(){
		return mandante;
	}
	
	public String getDestinatario(){
		return destinatario;
	}
	
	public double getImporto(){
		return importo;
	}
	
	public String getCausale(){
		return causale;
	}
	
	public void setImporto(double importo) throws ImportoNonValidoException{
		if (importo <= 0){
			throw new ImportoNonValidoException("L'importo deve essere maggiore di 0.");
		}
		
		this.importo = importo;
	}
	
	public void setDestinatario(String destinatario){
		if (destinatario == null || destinatario.isBlank()){
			throw new IllegalArgumentException("Il destinatario non può essere null.");
		}
		
		this.destinatario = destinatario;
	}
	
	public void setCausale(String causale){
		this.causale = causale;
	}
	
	
	@Override
	public double calcolaCommissione(double importo){
		return 0.0;
	}
	
	@Override
	public String descrizione(){
		return "Mandante: " + mandante + " | Importo: " + importo + " | Destinatario: " + destinatario + " | Causale: " + causale;
	}
}