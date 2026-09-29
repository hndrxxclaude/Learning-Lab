public class Nazione{
	
	int popolazione;
	
	String tipo_di_governo;
	
	String presidente;
	
	String nome;
	
	public void stampaInformazioni(){
		System.out.println(nome + " è una nazione di " + popolazione + " abitanti. Essa è una " + tipo_di_governo + " e il suo attuale presidente è " + presidente + ".");
	}
	
	public Nazione(int population, String gov, String president, String name){
		popolazione = population;
		tipo_di_governo = gov;
		presidente = president;
		nome = name;
	}
	
}

// la parola chiave package viene utilizzata all'interno dei programmi java al fine di dichiarare a quale cartella fisica appartiene la classe che sto scrivendo.