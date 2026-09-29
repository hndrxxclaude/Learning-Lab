public class GestoreDivisioni {
    
    private final Calcolatore calcolatore = new Calcolatore();

    public void eseguiDivisione(double dividendo, int divisore){
        try{
            double risultato = calcolatore.dividi(dividendo, divisore);
            System.out.println("Risultato: " + String.format("%.2f", risultato));
        } catch (MultiploDi7Exception e){
            System.out.println(" [Errore] " + e.getMessage() + " (numero coinvolto: " + e.getNumero() + ")");
        } catch (ArithmeticException e){
            System.out.println(" [Errore] " + e.getMessage());
        }
    }

    public static void main(String[] args){
        GestoreDivisioni gestore = new GestoreDivisioni();
 
        System.out.println("=== Esercizio 9.18 Gestore Divisioni ===\n");
 
        gestore.eseguiDivisione(100, 3);   // ok
        gestore.eseguiDivisione(100, 7);   // MultiploDi7Exception (7 è multiplo di 7)
        gestore.eseguiDivisione(100, 14);  // MultiploDi7Exception (14 è multiplo di 7)
        gestore.eseguiDivisione(100, 0);   // ArithmeticException
        gestore.eseguiDivisione(100, 5);   // ok
        gestore.eseguiDivisione(100, 21);  // MultiploDi7Exception (21 è multiplo di 7)
    }
}
