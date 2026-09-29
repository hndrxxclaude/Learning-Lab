/* In occasione di una gara canora si vuole gestire il televoto. Il pubblico da casa può votare per uno dei 15 
partecipanti ma può votare al massimo 5 volte. Il sistema deve poter raccogliere i voti in forma anonima e
alla fine delle operazioni stampare la classifica risultante dal televoto.
Scrivete quindi un programma che permette di inserire un nuovo voto, verifica se da quel numero telefonico
sono stati effettuati meno di 5 voti e, in caso affermativo, aggiorna la classifica. Si osservi che non si
possono memorizzare i singoli voti (il voto deve restare anonimo) ma bisogna memorizzare l’elenco dei
votanti e del numero di voti effettuati da ciascuno.
Scrivete un programma che all’interno di un menu testuale, permette di 1) simulare l’arrivo di un nuovo
voto tramite inserimento di numero di telefono del votante e numero del cantante votato, 2) stampare il
totale dei voti ricevuti fino a quel momento e 3) stampare il numero di voti ricevuti da ciascun cantante. */

import java.util.Map;
import java.util.HashMap;
import java.util.Scanner;
import java.util.LinkedHashMap;

public class GaraCanora {
    
    private Map<String, Integer>  classifica;
    private Map<String, Integer> votanti;
    private int totaleVoti;
    private int numeroPartecipanti;

    public GaraCanora(int numeroPartecipanti){
        if (numeroPartecipanti < 2){
            throw new IllegalArgumentException("Argomento non valido. Una gara canora deve avere almeno 2 partecipanti.");
        }
        this.numeroPartecipanti = numeroPartecipanti;
        classifica = new LinkedHashMap<>();
        votanti = new HashMap<>();
        for (int i = 1; i <= numeroPartecipanti; i++){
            classifica.put("Partecipante " + i, 0);
        }
        totaleVoti = 0;
    }
    
    public void nuovoVoto(String numero, int partecipante){
        if (numero == null || numero.isBlank()){
            throw new IllegalArgumentException("Il numero del votante non può essere null.");
        }
        if (partecipante <= 0 || partecipante > numeroPartecipanti){
            throw new IllegalArgumentException("Inserire un numero da votare valido (1 - " + numeroPartecipanti + ").");
        }
        if (!votanti.containsKey(numero)){
            votanti.put(numero, 1);
            totaleVoti += 1;
            classifica.put("Partecipante " + partecipante, classifica.get("Partecipante " + partecipante) + 1);
        } else if (votanti.get(numero) >= 5){
            throw new IllegalStateException("Questo numero: " + numero + " ha raggiunto il numero massimo di voti effettuabili.");
        } else {
            votanti.put(numero, votanti.get(numero) + 1);
            totaleVoti += 1;
            classifica.put("Partecipante " + partecipante, classifica.get("Partecipante " + partecipante) + 1);
        }
    }

    public void stampaVotiTotali(){
        System.out.println("Voti totali: " + totaleVoti);
    }

    public void stampaVotiPartecipanti(){
        for (int i = 1; i <= numeroPartecipanti; i++){
            System.out.println("Partecipante " + i + ": " + classifica.get("Partecipante " + i) + " voti");
        }
    }

    public static void main(String[] args){

        GaraCanora gara = new GaraCanora(15);

        Scanner sc = new Scanner(System.in);
        do{
            System.out.println("----- Gara Canora -----");
            System.out.println("Selezionare una tra le seguenti opzioni: ");
            System.out.println("1. Nuovo voto.");
            System.out.println("2. Numero totale dei voti.");
            System.out.println("3. Numero dei voti di ogni partecipante.");
            System.out.println("0. Uscita.");
            try{
                int scelta = sc.nextInt();
                switch (scelta){

                    case 1 -> {
                        System.out.println("Inserire il numero di telefono per votare: ");
                        try {
                            String numero = sc.next();
                            System.out.println("Inserire il numero del partecipante che si desidera votare (1 - 15): ");
                            int partecipante = sc.nextInt();
                            gara.nuovoVoto(numero, partecipante);
                            System.out.println("Grazie per aver votato!");
                        } catch (Exception e) {
                                System.out.println("[Errore]: " + e.getMessage());
                                sc.nextLine();
                        }
                    }


                    case 2 -> {
                        gara.stampaVotiTotali();
                    }

                    case 3 -> {
                        gara.stampaVotiPartecipanti();
                    }

                    case 0 -> {
                        System.out.println("Uscita...");
                        sc.close();
                        return;
                    }

                    default -> System.out.println("Scelta non valida.");
                }
            } catch (Exception e){
                System.out.println("[Errore]: " + e.getMessage());
                sc.nextLine();
            }
        } while (true);
    }
}


