import java.time.LocalDate;
import java.util.Objects;

public class Professore extends Persona{
    
    private LocalDate dataAssunzione;
    private Ruolo ruolo;
    private String dipartimento;
    private int stipendio;

    public Professore(String name, int age, LocalDate dataAssunzione, Ruolo ruolo, String dipartimento, int stipendio){
        super(name, age);

        if (dataAssunzione == null){
            throw new IllegalArgumentException("La data di assunzione non può essere null.");
        }

        if (ruolo == null){
            throw new IllegalArgumentException("Il ruolo non può essere null.");
        }

        if (dipartimento == null || dipartimento.isBlank()){
            throw new IllegalArgumentException("Assegnare un dipartimento.");
        }

        if (stipendio < 0){
            throw new IllegalArgumentException("Lo stipendio non può essere negativo.");
        }

        this.dataAssunzione = dataAssunzione;
        this.ruolo = ruolo;
        this.dipartimento = dipartimento;
        this.stipendio = stipendio;
    }

    public LocalDate getDataAssunzione(){
        return dataAssunzione;
    }

    public Ruolo getRuolo(){
        return ruolo;
    }

    public String getDipartimento(){
        return dipartimento;
    }

    public int getStipendio(){
        return stipendio;
    }

    public void setDataAssunzione(LocalDate dataAssunzione){
        if (dataAssunzione == null){
            throw new IllegalArgumentException("La data di assunzione non può essere null.");
        }
        this.dataAssunzione = dataAssunzione;
    }

    public void setRuolo(Ruolo ruolo){
        if (ruolo == null){
            throw new IllegalArgumentException("Il ruolo non può essere null.");
        }
        this.ruolo = ruolo;
    }

    public void setDipartimento(String dipartimento){
        if (dipartimento == null || dipartimento.isBlank()){
            throw new IllegalArgumentException("Assegnare un dipartimento.");
        }
        this.dipartimento = dipartimento;
    }

    public void setStipendio(int stipendio){
        if (stipendio < 0){
            throw new IllegalArgumentException("Lo stipendio non può essere negativo.");
        }
        this.stipendio = stipendio;
    }

    @Override 
    public String toString(){
        return super.toString() + " | Ruolo: " + ruolo 
        + " | Data di Assunzione: " + dataAssunzione 
        + " | Dipartimento: " + dipartimento
        + " | Stipendio: " + stipendio + " $";
    }

    @Override
    public boolean equals(Object o){
        if (!super.equals(o)){
            return false;
        }
        if (o instanceof Professore p){
            return stipendio == p.stipendio 
            && Objects.equals(dataAssunzione, p.dataAssunzione) 
            && ruolo == p.ruolo 
            && Objects.equals(dipartimento, p.dipartimento);
        }
        return false;
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), dataAssunzione, ruolo, dipartimento, stipendio);
    }
}
