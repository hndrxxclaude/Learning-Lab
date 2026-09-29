public abstract sealed class Immobile
        permits Appartamento, Garage, Palazzo{
    
    private final String indirizzo;
    private double prezzo;

    public Immobile(String indirizzo, double prezzo){
        if (indirizzo == null || indirizzo.isBlank()){
            throw new IllegalArgumentException("Indirizzo non valido.");
        }

        if (prezzo <= 0){
            throw new IllegalArgumentException("Prezzo non valido.");
        }

        this.indirizzo = indirizzo;
        this.prezzo = prezzo;
    }

    public String getIndirizzo(){
        return indirizzo;
    }

    public double getPrezzo(){
        return prezzo;
    }

    @Override
    public String toString(){
        return "Indirizzo: " + indirizzo + " | Prezzo: " + prezzo + " $.";
    }
}

