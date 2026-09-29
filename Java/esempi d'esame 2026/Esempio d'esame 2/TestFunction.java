import java.util.*; 
import java.util.function.Function; 

public class TestFunction { 
	public static void main(String[] args) { 
		
		List<String> nomi = Arrays.asList("paolo", "anna", "giulia"); 
		Function<String, String> trasformazione = s -> 
			s.substring(0, 1).toUpperCase() + s.substring(1);
		
		nomi.stream() 
                .map(trasformazione) 
                .filter(s -> s.length() > 4) 
                .forEach(System.out::println); 
    } 
}