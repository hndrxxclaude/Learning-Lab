import java.util.ArrayList;
import java.util.List;

public class CorsoDiLaurea {
    
    private static final int MAX_DIM = 100;

    private final String nome;

    private final List<Persona> membri;

    public CorsoDiLaurea(String nome){
        if (nome == null || nome.isBlank()){
            throw new IllegalArgumentException("Il nome del corso di laurea non può essere vuoto.");
        }
        this.nome = nome;
        this.membri = new ArrayList<>();
    }

    public void aggiungi(Persona persona){
        if (persona == null){
            throw new IllegalArgumentException("Non si può inserire un null.");
        }
        if(membri.size() >= MAX_DIM){
            throw new IllegalStateException("Corso pieno: impossibile aggiungere altri membri. Membri: " + MAX_DIM);
        }
        if (!(persona instanceof Professore) && !(persona instanceof Studente)){
            throw new IllegalArgumentException("E' possibile aggiungere solamente professori o studenti.");
        }
        membri.add(persona);
    }

    public void rimuovi(Persona persona){
        if (persona == null){
            throw new IllegalArgumentException("Non posso rimuovere un null.");
        }
        if (membri.isEmpty()){
            throw new IllegalStateException("Non ci sono membri da rimuovere.");
        }
        if(!(membri.contains(persona))){
            throw new IllegalArgumentException("Questa persona non è presente tra i membri del corso.");
        }
        membri.remove(persona);
    }

    public List<Persona> getMembri(){
        return List.copyOf(membri);
    }

    public String getNome(){
        return nome;
    }

    public boolean isPieno(){
        return membri.size() >= MAX_DIM;
    }

    public boolean isEmpty(){
        return membri.isEmpty();
    }

    public int size(){
        return membri.size();
    }

    public int stampaCostoStipendi(){
        int totale = 0;
        for(Persona membro : membri){
            if (membro instanceof Professore p){
                totale += p.getStipendio();
            }
        }
        System.out.println("Costo totale stipendi dei professori: " + totale + " $");
        return totale;
    }

    public double stampaRicavoContributi(){
        double totale = 0;
        for(Persona membro : membri){
            if(membro instanceof Studente s){
                totale += s.getContributoIscrizione();
            }
        }
        System.out.println("Ricavo totale dai contributi di iscrizione degli studenti: " + String.format("%.2f $", totale));
        return totale;
    }

    public void stampaMembers(){
        for(Persona p : membri){
            System.out.println(p);
        }
    }

    @Override
    public String toString(){
        return "Corso di Laurea: " + nome + " | Membri: " + membri.size() + " / " + MAX_DIM;
    }
}
