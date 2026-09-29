public class ContoBancario {
    private double saldo;
    private String numeroConto;

    public double getSaldo(){
        return saldo;
    }

    public String getNumeroConto(){
        return numeroConto;
    }

    public void setSaldo(){
        saldo = 0;
    }

    public void setNumeroConto(String numero){
        if(numero.length() == 16){
            numeroConto = numero;
        }
    }

    public void deposita(double deposito){
        saldo += deposito;
    }

    public double preleva(double prelievo){
        if (prelievo <= saldo){
            saldo -= prelievo;
            return prelievo;
        } else {
            System.out.println("Saldo insufficiente. Prelevare una somma inferiore al proprio saldo.");
        }

        return 0;
    }

    public ContoBancario(String numeroConto){
        this.numeroConto = numeroConto;
    }

    public ContoBancario(double saldo, String numeroConto){
        if (saldo > 0){
            this.saldo = saldo;
        } else {
            System.out.println("Il saldo deve essere positivo.");
        }

        this.numeroConto = numeroConto;
    }
}
