import java.util.*; 
 
class Prodotto { 
    private String nome; 
    private double prezzo; 
 
    public Prodotto(String nome, double prezzo) { 
        this.nome = nome; 
        this.prezzo = prezzo; 
    } 
 
    public String getNome() { return nome; } 
    public double getPrezzo() { return prezzo; } 
} 
 
public class TestReduce { 
    public static void main(String[] args) { 
        List<Prodotto> prodotti = Arrays.asList( 
                new Prodotto("Mouse", 15.0), 
                new Prodotto("Monitor", 180.0), 
                new Prodotto("Cavo", 8.0) 
        ); 
 
        double media = prodotti.stream() 
                .mapToDouble(Prodotto::getPrezzo) 
                .average() 
                .orElse(0.0); 
 
        double sommaCostosi = prodotti.stream() 
                .filter(p -> p.getPrezzo() > media) 
                .map(Prodotto::getPrezzo) 
                .reduce(0.0, (a, b) -> a + b); 
 
        System.out.println(media); 
        System.out.println(sommaCostosi); 
    } 
}