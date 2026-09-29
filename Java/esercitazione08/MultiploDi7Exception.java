public class MultiploDi7Exception extends Exception{
    private final int numero;

    public MultiploDi7Exception(int numero){
        super("Il numero " + numero + " è un multiplo di 7");
        this.numero = numero;
    }

    public int getNumero(){
        return numero;
    }
}
