package com.jtombola;

public class Tabellone {
    
    private boolean[] numeri;
    private static Tabellone istance = null;

    private Tabellone(){
        numeri = new boolean[91];
    }

    public static Tabellone getIstance(){
        if (istance == null){
            istance = new Tabellone();
        }
        return istance;
    }

    public void selezionaNumero(int numero){
        numeri[numero] = true;
    }
}
