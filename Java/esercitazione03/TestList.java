import java.util.ArrayList;

public class TestList{

    public static void main(String[] args){

        ArrayList<Integer> miaLista = new ArrayList<>();

        miaLista.add(1);
        miaLista.add(2);
        miaLista.add(3);

        for (Integer i : miaLista) {
            System.out.println(i);
        }
    }
}