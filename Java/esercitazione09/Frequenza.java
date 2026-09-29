import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

public class Frequenza {
    
    public static void main(String[] args){

        String text = """
                Scrivete un programma che, utilizzando il metodo split su una stringa contenente il testo di questo
                esercizio, determina il numero totale di parole presenti nel testo e la parola che compare con maggiore
                frequenza. Potreste anche pensare di utilizzare una HashMap<String, Integer> per memorizzare la
                frequenza di ciascuna parola utilizzando la parola stessa come chiave. Stampate, infine, la frequenza di
                ciascuna parola (è sufficiente stampare l’intera HashMap).
                Per inserire una coppia chiave,valore nella mappa potete usare il metodo put(K key, V value) mentre per
                leggere il valore corrispondente a una chiave il metodo V get(Object key).""";

        String[] words = text.split(" ");
        Map<String, Integer> frequencyMap = new HashMap<>();

        for (String word : words){
            if (frequencyMap.containsKey(word)){
                frequencyMap.put(word, frequencyMap.get(word) + 1);
            } else {
                frequencyMap.put(word, 1);
            }
        }

        System.out.println("Total words: " + words.length);
        System.out.println();

        System.out.println("Frequencies: ");
        System.out.println(frequencyMap);
        System.out.println();

        System.out.println("Sorted frequencies: ");

        List<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(frequencyMap.entrySet());

        sortedEntries.sort((e1, e2) -> e2.getValue().compareTo(e1.getValue()));
        System.out.println(sortedEntries);
        System.out.println();
    }
}
