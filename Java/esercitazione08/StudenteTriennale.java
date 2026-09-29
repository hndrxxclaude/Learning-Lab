import java.time.LocalDate;
import java.util.Objects;

public class StudenteTriennale extends Studente{
     
    private static final int CFU_RICHIESTI = 180;

    private String scuolaSuperiore;

    public StudenteTriennale(String name, int age, LocalDate dataIscrizione, String matricola, String corsoDiLaurea, double contributoIscrizione, String scuolaSuperiore){
        super(name, age, dataIscrizione, matricola, corsoDiLaurea, contributoIscrizione);

        if (scuolaSuperiore == null || scuolaSuperiore.isBlank()){
            throw new IllegalArgumentException("La scuola superiore di provenienza non può essere vuota.");
        }

        this.scuolaSuperiore = scuolaSuperiore;
    }

    public String getScuolaSuperiore(){
        return scuolaSuperiore;
    }

    public void setScuolaSuperiore(String scuolaSuperiore){
        if (scuolaSuperiore == null || scuolaSuperiore.isBlank()){
            throw new IllegalArgumentException("La scuola superiore di provenienza non può essere vuota.");
        }

        this.scuolaSuperiore = scuolaSuperiore;
    }

    public int getCFUrichiesti(){
        return CFU_RICHIESTI;
    }

    @Override
    public String toString() {
        return "Studente Triennale| " + super.toString() 
        + " | Scuola superiore di provenienza: " + scuolaSuperiore
        + " | CFU richiesti: " + CFU_RICHIESTI;
    }

    @Override
    public boolean equals(Object o){
        if (!super.equals(o)){
            return false;
        }
        if (o instanceof StudenteTriennale st){
            return Objects.equals(scuolaSuperiore, st.scuolaSuperiore);
        }

        return false;
    }

    @Override 
    public int hashCode(){
        return Objects.hash(super.hashCode(), scuolaSuperiore);
    }
}
