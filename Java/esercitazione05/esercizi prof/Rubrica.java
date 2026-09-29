import java.util.ArrayList;

public class Rubrica {
    
    ArrayList<Contatto> rubrica = new ArrayList<>();

    public void aggiungi(Contatto c){
        Boolean presente = false;
        
        if (rubrica.contains(c)){
            System.out.println("Contatto già in rubrica.");
            presente = true;
        }
        
        if (!presente){
            rubrica.add(c);
        }    
    }

    public void elimina(int id){
        Boolean eliminato = false;
        
        for (Contatto contact : rubrica){
            if (contact.getID() == id){
                rubrica.remove(contact);
                eliminato = true;
                break;
            }
        }

        if (!eliminato){
            System.out.println("Non è presente nessun contatto con tale id in rubrica.");
        }
    }

    public Contatto cerca(int id){
        
        for (Contatto c : rubrica){
            if (c.getID() == id){
                return c;
            }
        }

        return null;
    }

    public void visualizza(String surname){

        for(Contatto contact : rubrica){
            if(contact.getCognome().equals(surname)){
                System.out.println(contact.toString());
            }
        }
    }


}

