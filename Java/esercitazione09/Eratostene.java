/* Realizzate il crivello di Eratostene, un metodo per calcolare i numeri primi noto agli antichi greci. Scegliete
un numero n: questo metodo calcolerà tutti i numeri primi fino a n. Come prima cosa inserite in un Set tutti
i numeri da 2 a n. Poi, cancellate tutti i multipli di 2 (eccetto 2); vale a dire 4, 6, 8, … Dopodiché cancellate
tutti i multipli di 3 (eccetto 3), cioè 6, 9, 12, … Arrivate fino a n/2, quindi visualizzate il Set. */

import java.util.HashSet;
import java.util.Set;

public class Eratostene{

    public static void main(String[] args){

        Set<Integer> primes = new HashSet<>();
        int n = 100;

        for (int i = 2; i <= n; i++){
            primes.add(i);
        }

        for (int i = 2; i < n / 2; i++){
            if (primes.contains(i)){
                for (int j = 2; i * j <= n; j++){
                    primes.remove(i * j);
                }
            }
        }

        System.out.println("Prime numbers up to " + n + ": ");
        System.out.print(primes);
    }
}