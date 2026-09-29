package com.jtombola;

public class TestCroupier {
    
    public static void main(String[] args){

        Croupier tavolo = new Croupier();

        for (int i = 1; i <= 91; i++){
            tavolo.estraiNumero();
        }
        
    }
}
