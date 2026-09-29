public class Lettore{
	
	String nome;
	
	public Lettore(String name){
		nome = name;
	}
	
	public void leggi(Libro libro){
		System.out.println("Titolo: " + libro.titolo + "; Autore: " + libro.autore + "; Prezzo: " + libro.prezzo + "$.");
	}
}