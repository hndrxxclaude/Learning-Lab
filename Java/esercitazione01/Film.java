public class Film{
	
	String titolo;
	int durata;
	String genere;
	
	public void stampaDettagli(){
		System.out.println("Film: " + titolo + "; Genere: " + genere + "; Durata: " + durata + " minuti.");
	}
	
	public Film(String title, String genre, int duration){
		titolo = title;
		genere = genre;
		durata = duration;
	}
}