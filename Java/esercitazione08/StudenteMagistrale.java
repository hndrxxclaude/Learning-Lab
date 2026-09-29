import java.time.LocalDate;
import java.util.Objects;

public class StudenteMagistrale extends Studente{
     
    private static final int CFU_RICHIESTI = 120;

    private String corsoTriennale;

    public StudenteMagistrale(String name, int age, LocalDate dataIscrizione, String matricola, String corsoDiLaurea, double contributoIscrizione, String corsoTriennale){
        super(name, age, dataIscrizione, matricola, corsoDiLaurea, contributoIscrizione);

        if (corsoTriennale == null || corsoTriennale.isBlank()){
            throw new IllegalArgumentException("Il corso triennale di provenienza non può essere vuoto.");
        }

        this.corsoTriennale = corsoTriennale;
    }

    public String getCorsoTriennale(){
        return corsoTriennale;
    }

    public void setCorsoTriennale(String corsoTriennale){
         if (corsoTriennale == null || corsoTriennale.isBlank()){
            throw new IllegalArgumentException("Il corso triennale di provenienza non può essere vuoto.");
        }

        this.corsoTriennale = corsoTriennale;
    }

    public int getCFUrichiesti(){
        return CFU_RICHIESTI;
    }

    @Override
    public String toString(){
        return "Studente Magistrale | " + super.toString()
        + " | Corso Triennale di provenienza: " + corsoTriennale
        + " | CFU richiesti: " + CFU_RICHIESTI;
    }

    @Override
    public boolean equals(Object o){
        if (!super.equals(o)){
            return false;
        }
        if(o instanceof StudenteMagistrale sm){
            return Objects.equals(corsoTriennale, sm.corsoTriennale);
        }

        return false;
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), corsoTriennale);
    }
}
