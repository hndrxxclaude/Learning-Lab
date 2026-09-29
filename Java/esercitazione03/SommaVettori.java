/* Scrivere una classe SommaVettori dotata di un metodo main che: generi attraverso la Math.random()
(restituisce un double fra 0.0 e 1.0) due array di double compresi fra 0 e 1000, vettore1 e vettore2, di
dimensione 10; utilizzi un array di interi risultato per memorizzare la somma di vettore1 e vettore2;
stampi il risultato della somma. */

import java.util.Arrays;

public class SommaVettori{
    public static void main(String[] args){

        double[] vettore1 = new double[10];
        double[] vettore2 = new double[10];

        int[] risultato = new int[10];

        for (int i = 0; i < 10; i++){
            vettore1[i] = Math.random() * 1000;
            vettore2[i] = Math.random() * 1000;
            risultato[i] = (int)(vettore1[i] + vettore2[i]);
        }
        System.out.println(Arrays.toString(risultato));
    }
}