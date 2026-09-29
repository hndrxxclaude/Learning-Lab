/* Scrivete una classe VectorInteger per la gestione di un array dinamico di oggetti Integer. La dimensione
del VectorInteger viene definita come parametro del costruttore (di default sarà 10) e il VectorInteger
viene inizializzato con il valore 0. L’accesso ai membri deve avvenire mediante metodi set e get che
verificano le dimensioni del VectorInteger ed eventualmente lanciano un’eccezione. Prevedete metodi
per la somma, la differenza e il prodotto scalare che restituiscono un nuovo VectorInteger contenente il
risultato e che verificano che i VectorInteger su cui fare l’operazione siano della stessa dimensione
(eventualmente lanciate un’eccezione). Prevedete anche un metodo che restituisce un VectorInteger
ottenuto moltiplicandolo per uno scalare e un metodo che restituisce il modulo (double). Utilizzate
un’ArrayList per memorizzare internamente i dati. Implementate i metodi equals e hashCode l’interfaccia
Comparable<VectorInteger> col metodo compareTo che restituisce 0 se i due VectorInteger sono uguali 
e 1 oppure -1 in base al confronto dei moduli. Scrivete infine un programma per testare la classe. */

import java.util.ArrayList;
import java.util.List;

public class VectorInteger implements Comparable<VectorInteger>{
    
    private List<Integer> vector;
    private int size;

    public VectorInteger(int size){
        this.size = size;
        this.vector = new ArrayList<>();
        for (int i = 0; i < size; i++){
            vector.add(0);
        }
    }

    public VectorInteger(){
        this(10);
    }

    public int get(int index){
        if (index >= 0 && index < size){
            return vector.get(index);
        } else {
            throw new IndexOutOfBoundsException("Index: " + index + "; Size: " + size);
        }
    }

    public void set(int index, int value){
        if(index >= 0 && index < size){
            vector.set(index, value);
        } else {
            throw new IndexOutOfBoundsException("Index: " + index + "; Size: " + size);
        }
    }

    public VectorInteger add(VectorInteger other){
        if (size != other.size){
            throw new IllegalArgumentException("Vectors must be of the same size!");
        }
        VectorInteger newVector = new VectorInteger(size);
        for (int i = 0; i < size; i++){
            newVector.set(i, vector.get(i) + other.get(i));
        }
        return newVector;
    }

    public VectorInteger minus(VectorInteger other){
        if (size != other.size){
            throw new IllegalArgumentException("Vectors must be of the same size!");
        }
        VectorInteger newVector = new VectorInteger(size);
        for (int i = 0; i < size; i++){
            newVector.set(i, vector.get(i) - other.get(i));
        }
        return newVector;
    }

    public VectorInteger dotProduct(VectorInteger other){
        if (size != other.size){
            throw new IllegalArgumentException("Vectors must be of the same size!");
        }
        VectorInteger newVector = new VectorInteger(size);
        for (int i = 0; i < size; i++){
            newVector.set(i, vector.get(i) * other.get(i));
        }
        return newVector;
    }

    public VectorInteger scalarMultiply(int scalar){
        VectorInteger result = new VectorInteger(size);
        for (int i = 0; i < size; i++){
            result.set(i, vector.get(i) * scalar);
        }
        return result;
    }

    public double norm() {
        int sumOfSquares = 0;
        for (int i = 0; i < size; i++) {
            sumOfSquares += this.get(i) * this.get(i);
        }
        return Math.sqrt(sumOfSquares);
    }

    @Override
    public boolean equals(Object obj){
        if (this == obj){
            return true;
        }
        if (obj == null || this.getClass() != obj.getClass()){
            return false;
        }
        VectorInteger other = (VectorInteger) obj;
        if (this.size != other.size){
            return false;
        }
        for(int i = 0; i < size; i++){
            if (this.get(i) != other.get(i)){
                return false;
            }
        }
        return true;
    }

    @Override 
    public int hashCode(){
        int result = 1;
        for (int i = 0; i < size; i++){
            result += 31 * result + get(i);
        }
        return result;
    }

    @Override
    public String toString(){
        return vector.toString();
    }

    @Override
    public int compareTo(VectorInteger other){
        if (this.size != other.size){
            throw new IllegalArgumentException("Error: vectors must be of the same size.");
        }
        if (this.equals(other)){
            return 0;
        }
        if (this.norm() < other.norm()){
            return -1;
        } else {
            return 1;
        }
    }

    public static void main(String[] args){

        VectorInteger v1 = new VectorInteger(3);
        v1.set(0, 0);
        v1.set(1, 1);
        v1.set(2, 2);

        VectorInteger v2 = new VectorInteger(2);
        v1.set(0, 0);
        v1.set(1, 1);

        VectorInteger v3 = new VectorInteger(3);
        v3.set(0, 0);
        v3.set(1, 1);
        v3.set(2, 2);

        
    }
}
