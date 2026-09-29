package com.jeometria.test;

import com.jeometria.Rettangolo;

public class TestRettangolo {
    
    public static void main(String[] args){
        // Creazione di un rettangolo
        Rettangolo r1 = new Rettangolo(5.0, 3.0);
        System.out.println("Rettangolo creato: " + r1);
        System.out.println("Perimetro: " + r1.calcolaPerimetro());
        System.out.println("Area:      " + r1.calcolaArea());
 
        System.out.println();
 
        // La classe è immutabile: withBase() restituisce un NUOVO oggetto
        Rettangolo r2 = r1.withBase(10.0);
        System.out.println("Nuovo rettangolo con base modificata: " + r2);
        System.out.println("Perimetro: " + r2.calcolaPerimetro());
        System.out.println("Area:      " + r2.calcolaArea());
 
        System.out.println();
 
        // r1 non è stato modificato
        System.out.println("r1 è rimasto invariato: " + r1);
 
    }
}
