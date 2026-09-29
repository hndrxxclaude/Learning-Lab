public final class Consulente extends Dipendente{
	
	public Consulente(int id, String nome){
		super(id, nome);
	}
	
	@Override
	public double stipendio(){
		return 1800.0;
	}
	
	@Override 
	public String toString(){
		return "Consulente | ID: " + getID() + " | Nome: " + getNome()
		+ " | Stipendio: " + this.stipendio();
	}
}

/* La classe è stata dichiarata final, quindi inestendibile, poichè un consulente
potrebbe essere di tantissime tipologie diverse, e può anche essere considerata una sottoclasse di un Impiegato Fisso.
Gerarchie troppo profonde possono diventare problematiche per la gestione del codice e dei metodi.*/