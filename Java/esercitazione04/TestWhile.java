import java.util.ArrayList;

public class TestWhile {
    
    public static void main(String[] args){

        ArrayList<Integer> lista = new ArrayList<>();

        int i = 1;

        while(i <= 10){
        
            if(i <= 4 || i % 2 == 0){
                lista.add(i);
            }   

            i++;
        }

        System.out.println(lista);
    }
}
