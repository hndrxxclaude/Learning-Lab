import java.util.*;
import java.util.function.*;
public class Test {
	public static void main(String[] args) {
		List<String> parole = new ArrayList<>(List.of("java", "oop", "stream", "api",
			"lambda"));
		Predicate<String> lunga = s -> s.length() >= 4;
		Function<String, String> trasforma = s -> s.substring(0,1).toUpperCase() +
			s.substring(1);
		parole.removeIf(s -> s.length() == 3);
		parole.stream()
			.filter(lunga)
				.map(trasforma)
					.forEach(System.out::println);
		System.out.println(parole.size());	
	}	
}