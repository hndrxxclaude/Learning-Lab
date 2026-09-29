import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

class StringComparator implements Comparator<String>{
    @Override
    public int compare(String s1, String s2){
        return s1.toLowerCase().compareTo(s2.toLowerCase());
    }
}

public class TestComparator {
    
    public static void main(String[] args) {
        
        ArrayList<String> lista = new ArrayList<>();

        lista.add("luce");
        lista.add("la");
        lista.add("Urano");
        lista.add("su");
        lista.add("Arriva");

        System.out.println("Lista: " + lista);

        Comparator<String> myComparator = new StringComparator();

        Collections.sort(lista, myComparator);

        System.out.println("Lista ordinata: " + lista);
    }
}
