package com.jeometria;

public final class Rettangolo {
    private final double base;
    private final double altezza;

    public Rettangolo(double base, double altezza){
        if (base <= 0 || altezza <= 0) {
            throw new IllegalArgumentException("Base e altezza devono essere maggiori di zero.");
        }
        this.base = base;
        this.altezza = altezza;
    }

    public double calcolaPerimetro(){
        return (base * 2) + (altezza * 2);
    }

    public double calcolaArea(){
        return base * altezza;
    }

    public double getBase(){
        return base;
    }

    public double getAltezza(){
        return altezza;
    }

    public Rettangolo withBase(double nuovaBase){
        if (nuovaBase < 0){
            throw new IllegalArgumentException("La base deve avere valore positivo");
        }

        return new Rettangolo(nuovaBase, this.altezza);
    }
}
