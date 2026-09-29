package com.jimmobiliare.dati;

public final class Appartamento extends Immobile{
    
    private final int piano;
    private final double mq;
    private final int nLocali;

    public Appartamento(String indirizzo, double prezzo, int piano, double mq, int nLocali){
        super(indirizzo, prezzo);

        if (piano < 0){
            throw new IllegalArgumentException("Inserire un piano valido (piano >= 0).");
        }

        if (mq <= 0){
            throw new IllegalArgumentException("Inserire un valore valido per i mq.");
        }

        if (nLocali <= 0){
            throw new IllegalArgumentException("Inserire un valore valido per il numero dei locali.");
        }

        this.piano = piano;
        this.mq = mq;
        this.nLocali = nLocali;
    }

    public int getPiano(){
        return piano;
    }

    public double getMQ(){
        return mq;
    }

    public int getNLocali(){
        return nLocali;
    }

    @Override
    public String toString(){
        return "Appartamento | " + super.toString() 
        + " | Piano: " + piano
        + " | MQ: " + mq
        + " | Numero Locali: " + nLocali + ".";
    }
}
