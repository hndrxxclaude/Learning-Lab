public class TestOrchestra {
	
	public static void main(String [] args){
		
		var direttore = new Direttore("Blackmore");
		var orchestra = new Orchestra(direttore);
		System.out.println("Il direttore dell'orchestra è " + orchestra.goat.nome);
		var nuovoDirettore = new Direttore("Lord");
		orchestra.cambiaDirettore(nuovoDirettore);
		System.out.println("Il direttore dell'orchestra è " + orchestra.goat.nome);
		
		System.out.println(direttore);
	}
}