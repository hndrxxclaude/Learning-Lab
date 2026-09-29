import java.util.List;
import java.util.ArrayList;

public class Principale{

    public static void main(String[] args){

        List <Persona> miaLista = new ArrayList<>();

        Persona io = new Persona("Claudiomario", "Gentile", 20);
        Persona collega_1 = new Persona("Gabriele", "D'Asta", 20);
        Persona collega_2 = new Persona("Fabrizio", "Baglio", 21);

        miaLista.add(io);
        miaLista.add(collega_1);
        miaLista.add(collega_2);

        System.out.println(miaLista.size());

        System.out.println(miaLista.get(2));
        miaLista.remove(2);

        for (Persona i : miaLista){
            System.out.println(i);
        }

        miaLista.clear();

        System.out.println(miaLista.size());
    }
}