import java.util.HashSet;
import java.util.ArrayList;
import java.util.Collections;


public class TestSet{

    public static void main(String[] args){

        HashSet <String> set = new HashSet<>();

        set.add("Arriva");
        set.add("la");
        set.add("luce");
        set.add("su");
        set.add("Urano");
        set.add("luce");

        System.out.println(set);
        
        ArrayList <String> miaLista = new ArrayList<>();

        miaLista.addAll(set);
        
        Collections.sort(miaLista);
        
        System.out.println(miaLista);
        
    }
}