public class Orchestra{
	Direttore goat;
	
	public Orchestra(Direttore direttore){
		goat = direttore;
	}
	
	public void cambiaDirettore(Direttore newDirector){
		goat = newDirector;
	}
}