import java.util.Random;

public class TestStatisticheTurni {
    
    public static void main(String[] args){

        StatisticheTurni statistiche = new StatisticheTurni();
        Random numeroTurni = new Random();

        statistiche.stampaStatisticheMap(numeroTurni.nextInt(366));
    }
}
