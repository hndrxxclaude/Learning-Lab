import java.util.List;
import java.util.ArrayList;

public class TestContenuti{
	
	public static void main(String[] args){
		
		List<Contenuto> contenuti = new ArrayList<>();
		
		contenuti.add(new Video("Chest Opening più grande d'Italia", 10, 60));
		contenuti.add(new Podcast("The Hubermann Podcast: Ep.147", 50, 128));
		contenuti.add(new Immagine("Speed my momma kinda homeless", 450, 800));
		
		double totaleMB = 0;
		for (Contenuto c : contenuti){
			totaleMB += c.dimensioneMB();
		}
		
		System.out.println("Dimensione totale dei miei contenuti: " + totaleMB + " MB.");
	}
}