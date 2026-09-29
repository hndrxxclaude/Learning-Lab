import java.time.DayOfWeek;
import java.util.Random;

public class GestioneTurni {

    public DayOfWeek dammiGiornoDellaSettimana(){

        Random giornoRandom = new Random();

        switch(giornoRandom.nextInt(7)){

            case 0: 
                return DayOfWeek.MONDAY;

            case 1:
                return DayOfWeek.TUESDAY;

            case 2: 
                return DayOfWeek.WEDNESDAY;

            case 3:
                return DayOfWeek.THURSDAY;

            case 4:
                return DayOfWeek.FRIDAY;

            case 5: 
                return DayOfWeek.SATURDAY;

            default:
                return DayOfWeek.SUNDAY;
            
        }
    }
}
