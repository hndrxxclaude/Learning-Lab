public class Libro {
    
    private String titolo;
    private String autore;
    private int pagine;
    private String genere;

    private static final String[] lista = {"romanzo", "thriller", "saggio", "manuale"};

    public Libro(String titolo, String autore, int pagine){
        this.titolo = titolo;
        this.autore = autore;
        this.pagine = pagine;
    }

    public void setGenere(String genre){
        Boolean accettato = false;

        for(String g : lista){
            if (g.equals(genre)){
                accettato = true;
                this.genere = genre;
            }
        }

        if(!accettato){
            System.out.println("Genere non accettato");
        }
    }

    public String getTitolo(){
        return titolo;
    }

    public String getAutore(){
        return autore;
    }

    public int getPagine(){
        return pagine;
    }

    public String getGenere(){
        return genere;
    }

    @Override
    public String toString(){
        return "Titolo: " + titolo + ", Autore: " + autore + ", Genere: " + genere + ", Numero pagine: " + pagine;
    }
}
