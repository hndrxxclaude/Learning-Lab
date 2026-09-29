import java.util.HashMap;

public class Calciatore implements Giocatore{

    final String nome;
    String ruolo;

    @Override
    public void gioca(){
        System.out.println(nome + " gioca nel ruolo di " + ruolo);
    }

    public Calciatore(String name, String role) {
        nome = name;
        ruolo = role;
    }

    public static void main(String[] args){

        HashMap<Integer, String> mappa = new HashMap<>();

        mappa.put(1, "Portiere");
        mappa.put(10, "Attaccante");
        mappa.put(3, "Difensore");
        mappa.put(3, "Laura");

        for (int i : mappa.keySet()){
            System.out.println(mappa.get(i));
        }


    }

    
}