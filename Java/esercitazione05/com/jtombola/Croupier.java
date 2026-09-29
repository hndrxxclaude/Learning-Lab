package com.jtombola;

public class Croupier {
    
    private Bussolotto bussolotto;
    private Tabellone tabellone;

    public Croupier(){
        bussolotto = new Bussolotto();
        tabellone = Tabellone.getIstance();
    }

    public void estraiNumero(){
        System.out.println("Estraggo un numero dal bussolotto...");
        int numero = bussolotto.dammiNumero();

        if (numero == -1){
            return;
        }
        
        System.out.println("Estratto il numero " + numero + ".");
        System.out.println("Seleziono il numero " + numero + " sul tabellone...");
        tabellone.selezionaNumero(numero);
        System.out.println("Numero " + numero + " selezionato sul tabellone.");
    }
}
