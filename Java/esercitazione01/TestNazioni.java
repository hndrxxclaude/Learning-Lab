public class TestNazioni{
	public static void main(String[] args){
		
		Nazione Italia = new Nazione(60000000, "Democrazia", "Giorgia Meloni", "Italia");
		Italia.stampaInformazioni();
		
		Nazione Russia = new Nazione(100000000, "Dittatura", "Vladimir Putin", "Russia");
		Russia.stampaInformazioni();
		
		Nazione Francia = new Nazione(80000000, "Democrazia", "Macron", "Francia");
		Francia.stampaInformazioni();
		
	}
}