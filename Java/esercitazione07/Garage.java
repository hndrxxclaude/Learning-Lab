public final class Garage extends Immobile{
    
    private final double mqPostoAuto;
    private final boolean coperto;

    public Garage(String indirizzo, double prezzo, double mqPostoAuto, boolean coperto){

        super(indirizzo, prezzo);

        if (mqPostoAuto <= 0){
            throw new IllegalArgumentException("Inserire un valore valido per i mq del posto auto.");
        }

        this.mqPostoAuto = mqPostoAuto;
        this.coperto = coperto;
    }

    public double getMQPostoAuto(){
        return mqPostoAuto;
    }

    public boolean coperto(){
        return coperto;
    }

    @Override
    public String toString(){
        return "Garage | " + super.toString()
        + " | MQ Posto Auto: " + mqPostoAuto
        + " | Coperto: " +(coperto ? "Sì" : "No") + ".";
    }
}
