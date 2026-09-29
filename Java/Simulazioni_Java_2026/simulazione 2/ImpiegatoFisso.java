public class ImpiegatoFisso extends Dipendente{
	
	public ImpiegatoFisso(int id, String nome){
		super(id, nome);
	}
	
	@Override
	public double stipendio(){
		return 1700.0;
	}
	
	@Override 
	public String toString(){
		return "Impiegato Fisso | ID: " + getID() + " | Nome: " + getNome()
		+ " | Stipendio: " + this.stipendio();
	}
}