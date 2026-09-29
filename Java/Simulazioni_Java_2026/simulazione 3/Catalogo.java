import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Optional;
import java.util.Comparator;

public class Catalogo{
	
	private Map<String,Libro> catalogo;
	
	public Catalogo(){
		this.catalogo = new HashMap<>();
	}
	
	public void aggiungi(Libro book){
		if (book == null){
			throw new IllegalArgumentException("Il libro da inserire non può essere null.");
		}
		
		catalogo.put(book.isbn(), book);
	}
	
	public boolean rimuovi(String isbn){
		return catalogo.remove(isbn) != null;
	}
	
	public Optional<Libro> ricerca(String isbn){
		
		return Optional.ofNullable(catalogo.get(isbn));
	}
	
	public List<Libro> libriOrdinati(){
		
		List<Libro> risultato = new ArrayList<>(catalogo.values());
		
		risultato.sort(Comparator.comparingDouble(Libro::prezzo).thenComparing(Libro::titolo));
		
		return List.copyOf(risultato);
	}
}