import java.util.HashMap;

public class Pagella{

   Studente studente;
   String[][] valutazioni;

   public Pagella(Studente student){
    studente = student;
   }

    public void stampaPagella() {
        System.out.println("Studente: " + studente.nome() + " " + studente.cognome());
        System.out.println("Classe " + studente.classe());
        for (String[] materia : valutazioni) {
            System.out.println("[" + materia[0] + ", " + materia[1] + ", " + materia[2] + "]");
        }
    }
}