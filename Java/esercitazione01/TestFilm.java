public class TestFilm{
	public static void main(String[] args){
		
		Film film1 = new Film("Donnie Darko", "Sci-Fi/Thriller", 120);
		film1.stampaDettagli();
		
		Film film2 = new Film("Django Unchained", "Action", 135);
		film2.stampaDettagli();
	}
}