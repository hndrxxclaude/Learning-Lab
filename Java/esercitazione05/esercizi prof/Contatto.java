public class Contatto {
    private int id;
    private String nome;
    private String cognome;
    private String email;
    private String telefono;
    
    public Contatto(int id, String nome, String cognome, String email, String telefono){
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.telefono = telefono;

    }

    public int getID(){
        return id;
    }

    public String getNome(){
        return nome;
    }

    public String getCognome(){
        return cognome;
    }

    public String getEmail(){
        return email;
    }

    public String getTelefono(){
        return telefono;
    }

    @Override
    public String toString(){
        return "ID: " + id + ", " + nome + " " + cognome + ", " + email + ", " + telefono;
    }
}