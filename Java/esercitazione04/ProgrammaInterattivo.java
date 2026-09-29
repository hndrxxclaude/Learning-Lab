import java.util.Scanner;
import java.util.ArrayList;

public class ProgrammaInterattivo {
    public static void main(String args[]) {
        
        Scanner scanner = new Scanner(System.in);
        
        String stringa = "";
        ArrayList<String> proibite = new ArrayList<>();

        proibite.add("Ciao");
        proibite.add("Banana");
        proibite.add("Melanzana");
        proibite.add("palla");
        proibite.add("tubo");
        
        System.out.println("Digita qualcosa e batti il tasto "
        + "\"INVIO\", oppure scrivi \"fine\" per terminare "
        + "il programma");
        
        // Assegniamo a stringa l'input utente e testiamo se vale "fine"
        
        while(!(stringa = scanner.next()).equals("fine")) {
            
            for(String parola: proibite){
                if(stringa.toLowerCase().contains(parola.toLowerCase())){

                    stringa = "****";

                }
            }
            System.out.println("Hai digitato " + stringa.toUpperCase() + "!");
        }
        
        System.out.println("Fine programma!");

        scanner.close();
    }
}