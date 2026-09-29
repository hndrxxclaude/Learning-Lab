package com.jimmobiliare.dati;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class Palazzo extends Immobile {
    
    private final int nPiani;
    private final List<Appartamento> appartamenti;

    public Palazzo(String indirizzo, double prezzo, int nPiani, List<Appartamento> appartamenti){
        super(indirizzo, prezzo);

        if (nPiani <= 0){
            throw new IllegalArgumentException("Inserire un valore positivo per il numero dei piani.");
        }

        this.nPiani = nPiani;
        this.appartamenti = new ArrayList<>();
    }

    public int getNPiani(){
        return nPiani;
    }

    public List<Appartamento> getAppartamenti(){
        return Collections.unmodifiableList(appartamenti);
    }

    public void aggiungiAppartamento(Appartamento a){
        if (a == null){
            throw new IllegalArgumentException("L'appartamento non può essere null.");
        }
        appartamenti.add(a);
    }

}
