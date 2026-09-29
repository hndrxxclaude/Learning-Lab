import java.util.ArrayList;
import java.util.Iterator;

public class TestWhileDispari {
    
    public static void main(String[] args) {
        
        ArrayList<Integer> lista = new ArrayList<>();

        for(int i = 1; i <= 10; i++){
            lista.add(i);
        }

        System.out.println(lista);

        Iterator<Integer> iteratore = lista.iterator();

        while(iteratore.hasNext()) {
            if(iteratore.next() % 2 != 0){
                iteratore.remove();
            }
        }

        System.out.println(lista);
    }
}
