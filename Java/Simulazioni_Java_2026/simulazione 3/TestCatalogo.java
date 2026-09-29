
	
	public class TestCatalogo {

	    public static void main(String[] args) {

	        Catalogo catalogo = new Catalogo();

	        catalogo.aggiungi(
	            new Libro("ISBN1", "1984", Genere.ROMANZO, 12.90)
	        );

	        catalogo.aggiungi(
	            new Libro("ISBN2", "Il Signore degli Anelli",
	                      Genere.FANTASY, 25.00)
	        );

	        catalogo.aggiungi(
	            new Libro("ISBN3", "Animal Farm",
	                      Genere.ROMANZO, 12.90)
	        );

	        catalogo.ricerca("ISBN2")
	                .ifPresentOrElse(
	                    libro -> System.out.println(
	                        "Trovato: " + libro
	                    ),
	                    () -> System.out.println(
	                        "Libro non trovato"
	                    )
	                );

	        System.out.println("\nLibri ordinati:");

	        for (Libro libro : catalogo.libriOrdinati()) {
	            System.out.println(libro);
	        }

	        boolean rimosso = catalogo.rimuovi("ISBN1");
	        System.out.println("\nLibro rimosso: " + rimosso);
	    }
	}