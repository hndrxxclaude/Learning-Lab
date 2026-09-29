public class Calcolatore {
    
    public double dividi(double dividendo, int divisore) throws MultiploDi7Exception{
        if (divisore == 0){
            throw new ArithmeticException("Divisione per 0 non consentita.");
        }

        if (divisore % 7 == 0){
            throw new MultiploDi7Exception(divisore);
        }

        return dividendo / divisore;
    }
}
