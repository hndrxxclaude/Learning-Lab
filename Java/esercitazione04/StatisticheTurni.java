import java.time.DayOfWeek;
import java.util.HashMap;

public class StatisticheTurni {
    
    public void stampaStatistiche(int numeroTurni){

        if (numeroTurni <= 0) {
            System.out.println("Nessun turno da analizzare.");
            return;
        }

        GestioneTurni turno = new GestioneTurni();

        int numeroInizioSettimana = 0;
        int numeroCentroSettimana = 0;
        int numeroFineSettimana = 0;
        int numeroWeekend = 0;

        for (int i = 0; i < numeroTurni; i++){

            int giorno = turno.dammiGiornoDellaSettimana().getValue();

            if (giorno == 1){

                numeroInizioSettimana++;

            } else if (giorno == 5){

                numeroFineSettimana++;

            } else if(giorno == 6 || giorno == 7){

                numeroWeekend++;

            } else {

                numeroCentroSettimana++;
            }
        }

        System.out.println("Su un totale di " + numeroTurni + " turni, il " + String.format("%.2f",(numeroInizioSettimana / (double)numeroTurni) * 100) + "% erano il Lunedì.");
        System.out.println("Il " + String.format("%.2f",(numeroCentroSettimana / (double)numeroTurni) * 100) + "% nel mezzo della settimana.");
        System.out.println("Il " + String.format("%.2f",(numeroFineSettimana / (double)numeroTurni) * 100) + "% il Venerdì.");
        System.out.println("Il " + String.format("%.2f",(numeroWeekend / (double)numeroTurni) * 100) + "% nel weekend."); 
            
        
    }

    public void stampaStatisticheMap(int numeroTurni){

        GestioneTurni turno = new GestioneTurni();
        
        HashMap<DayOfWeek, Integer> tabella = new HashMap<>();
        tabella.put(DayOfWeek.MONDAY, 0);
        tabella.put(DayOfWeek.TUESDAY, 0);
        tabella.put(DayOfWeek.WEDNESDAY, 0);
        tabella.put(DayOfWeek.THURSDAY, 0);
        tabella.put(DayOfWeek.FRIDAY, 0);
        tabella.put(DayOfWeek.SATURDAY, 0);
        tabella.put(DayOfWeek.SUNDAY, 0);

        for (int i = 0; i < numeroTurni; i++){

            tabella.put(turno.dammiGiornoDellaSettimana(), tabella.get(turno.dammiGiornoDellaSettimana()) + 1);
        }

        System.out.println(tabella);    
    }
}
