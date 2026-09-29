import java.util.*;
import java.util.function.Predicate;
public class TestLambda {
    static List<String> applicaFiltro(List<String> dati, Predicate<String> criterio) {
List<String> risultato = new ArrayList<>();
for (String s : dati) {
if (criterio.test(s)) {
risultato.add(s.toUpperCase());
}
}
return risultato;
}
public static void main(String[] args) {
List<String> codici = Arrays.asList("A12", "B", "C305", "D7", "EF99");
Predicate<String> lungo = s -> s.length() >= 3;
Predicate<String> contieneNumero5 = s -> s.contains("5");
System.out.println(applicaFiltro(codici, lungo));
System.out.println(applicaFiltro(codici, lungo.and(contieneNumero5)));
}
}