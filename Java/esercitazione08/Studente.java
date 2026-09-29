import java.time.LocalDate;
import java.util.Objects;

public abstract class Studente extends Persona{
    
    private LocalDate dataIscrizione;
    private String matricola;
    private String corsoDiLaurea;
    private double contributoIscrizione;

    public Studente(String name, int age, LocalDate dataIscrizione, String matricola, String corsoDiLaurea, double contributoIscrizione){
        super(name, age);

        if (dataIscrizione == null){
            throw new IllegalArgumentException("La data di iscrizione non può essere null.");
        }

        if (matricola == null || matricola.isBlank()){
            throw new IllegalArgumentException("La matricola non può essere vuota.");
        }

        if(corsoDiLaurea == null || corsoDiLaurea.isBlank()){
            throw new IllegalArgumentException("Il corso di laurea non può essere vuoto.");
        }

        if (contributoIscrizione < 0){
            throw new IllegalArgumentException("Il contributo di iscrizione non può essere minore di 0.");
        }

        this.dataIscrizione = dataIscrizione;
        this.matricola = matricola;
        this.corsoDiLaurea = corsoDiLaurea;
        this.contributoIscrizione = contributoIscrizione;
    }

    public LocalDate getDataIscrizione(){
        return dataIscrizione;
    }

    public String getMatricola(){
        return matricola;
    }

    public String getCorsoDiLaurea(){
        return corsoDiLaurea;
    }

    public double getContributoIscrizione(){
        return contributoIscrizione;
    }

    public void setDataIscrizione(LocalDate dataIscrizione){
        if (dataIscrizione == null){
            throw new IllegalArgumentException("La data di iscrizione non può essere null.");
        }
        this.dataIscrizione = dataIscrizione;
    }

    public void setMatricola(String matricola){
        if (matricola == null || matricola.isBlank()){
            throw new IllegalArgumentException("La matricola non può essere vuota.");
        }
        this.matricola = matricola;
    }

    public void setCorsoDiLaurea(String corsoDiLaurea){
        if(corsoDiLaurea == null || corsoDiLaurea.isBlank()){
            throw new IllegalArgumentException("Il corso di laure non può essere vuoto.");
        }
        this.corsoDiLaurea = corsoDiLaurea;
    }

    public void setContributoIscrizione(double contributoIscrizione){
        if (contributoIscrizione < 0){
            throw new IllegalArgumentException("Il contributo di iscrizione non può essere minore di 0.");
        }
        this.contributoIscrizione = contributoIscrizione;
    }

    public abstract int getCFUrichiesti();

    @Override
    public String toString(){
        return super.toString() + " | Data di iscrizione: " + dataIscrizione
        + " | Matricola: " + matricola 
        + " | Corso di laurea: " + corsoDiLaurea 
        + " | Contributo di iscrizione: " + String.format("%.2f $", contributoIscrizione);
    }

    @Override
    public boolean equals(Object o){
        if(!super.equals(o)){
            return false;
        }
        if(o instanceof Studente student){
            return Objects.equals(matricola, student.matricola);
        }

        return false;
    }

    @Override
    public int hashCode(){
        return Objects.hash(super.hashCode(), matricola);
    }
}
