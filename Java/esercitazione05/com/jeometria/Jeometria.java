package com.jeometria;

public class Jeometria {

    public static double calcolaPerimetroRettangolo(double base, double altezza){
        
        return new Rettangolo(base, altezza).calcolaPerimetro();

    }

    public static double calcolaAreaRettangolo(double base, double altezza){

        return new Rettangolo(base, altezza).calcolaArea();
    }


}
