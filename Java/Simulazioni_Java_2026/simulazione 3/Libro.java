public record Libro(String isbn, String titolo, Genere genere, double prezzo){
	
	public Libro{
		if(isbn == null || isbn.isBlank()){
			throw new IllegalArgumentException("L'ISBN di un libro non può essere vuoto.");
		}
	
		if(titolo == null || titolo.isBlank()){
			throw new IllegalArgumentException("Il titolo di un libro non può essere vuoto.");
		}
	
		if(genere == null){
			throw new IllegalArgumentException("Il genere di un libro non può essere vuoto.");
		}
	
		if (prezzo <= 0){
			throw new IllegalArgumentException("Il prezzo deve essere maggiore di 0.");
		}
	}
	
}