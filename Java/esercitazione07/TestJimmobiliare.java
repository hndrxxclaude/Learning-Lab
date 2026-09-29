import java.util.ArrayList;

public class TestJimmobiliare {
    
    public static void main(String[] args){

        Jimmobiliare immobiliare = new Jimmobiliare();

        immobiliare.inserisciAppartamento(new Appartamento("Via Roma 1", 100_000, 0, 80, 6));
        immobiliare.inserisciGarage(new Garage("Via Roma 1", 5000, 1, true));

        ArrayList<Appartamento> appartamenti = new ArrayList<>();
        appartamenti.add(new Appartamento("Viale delle Scienze", 70000, 0, 100, 10));
        appartamenti.add(new Appartamento("Viale delle Scienze", 90000, 1, 120, 12));
        appartamenti.add(new Appartamento("Viale delle Scienze", 100000, 2, 120, 13));
        Palazzo palazzo = new Palazzo("Viale delle Scienze", 260000, 2, appartamenti);

        immobiliare.inserisciPalazzo(palazzo);

        System.out.println("--------------------");

        immobiliare.inserisciImmobile(new Appartamento("Via Roma 1", 100_000, 0, 80, 6));
        immobiliare.inserisciImmobile(new Garage("Via Roma 1", 5000, 1, true));
        immobiliare.inserisciImmobile(palazzo);
    }
}
