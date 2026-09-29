package com.jeometria;

public class JeometriaSingleton {
    
    private static JeometriaSingleton istance = null;
    
    private JeometriaSingleton(){}

    public static JeometriaSingleton getIstance(){
        if (istance == null){
            istance =  new JeometriaSingleton();
        }

        return istance;
    }

    public double calcolaPerimetroRettangolo(double base, double altezza){

        return new Rettangolo(base, altezza).calcolaPerimetro();
    }

    public double calcolaAreaRettangolo(double base, double altezza){

        return new Rettangolo(base, altezza).calcolaArea();
    }
}
