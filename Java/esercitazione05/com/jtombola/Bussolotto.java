package com.jtombola;

import java.util.ArrayList;
import java.util.Random;

public class Bussolotto {
    
    private ArrayList<Integer> bussolotto;

    public Bussolotto(){
        bussolotto = new ArrayList<>();
        for(int i = 1; i <= 90; i++) {
            bussolotto.add(i);
        }
    }

    public int dammiNumero(){

        if (bussolotto.isEmpty()){
            System.out.println("Il gioco è terminato.");
            return -1;
        }

        Random generatore = new Random();

        Boolean pescato = false;
        int numero;

        do{
            numero = generatore.nextInt(90) + 1;
            if (bussolotto.contains(numero)){
                bussolotto.remove(Integer.valueOf(numero));
                pescato = true;
            }
        } while (!pescato);

        return numero;

    }


}
