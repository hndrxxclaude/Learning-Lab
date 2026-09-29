public class Venditore extends Dipendente{
	
	public Venditore(int id, String nome){
		super(id, nome);
	}
	
	@Override
	public double stipendio(){
		return 2500.0;
	}
	
	@Override 
	public String toString(){
		return "Venditore | ID: " + getID() + " | Nome: " + getNome()
		+ " | Stipendio: " + this.stipendio();
	}
}