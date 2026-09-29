public class TestLettura{
	public static void main(String[] args){
		Libro book1 = new Libro("Fiori per Algernon", "Daniel Keyes", 13.50);
		Libro book2 = new Libro("Siddharta", "Hermann Hesse", 12.50);
		Lettore me = new Lettore("Claude");
		
		me.leggi(book1);
		me.leggi(book2);
	}
}