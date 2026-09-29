public abstract class Dipendente{
	
	private final int id;
	private String nome;
	
	public Dipendente(int id, String nome){
		if (id <= 0){
			throw new IllegalArgumentException("L'id dell'impiegato deve essere maggiore di 0.");
		}
		
		if (nome == null || nome.isBlank()){
			throw new IllegalArgumentException("Il nome dell'impiegato non può essere null");
		}
		
		this.id = id;
		this.nome = nome;
	}
	
	public int getID(){
		return id;
	}
	
	public String getNome(){
		return nome;
	}
	
	public void setNome(String nome){
		if (nome == null || nome.isBlank()){
			throw new IllegalArgumentException("Il nome dell'impiegato non può essere null");
		}
		
		this.nome = nome;
	}
	
	public abstract double stipendio();
}