public class Studente {
    
    private String nome;

    public Studente(String nome){
        this.nome = nome;
    }
    
    public void usa(Scrivania scrivania){
        System.out.println(nome + " esamina la scrivania.");
        for (Appoggiabile oggetto : scrivania.getOggetti()){
            switch(oggetto){
                
                case Libro libro ->
                    System.out.println("Libro| Titolo: " + libro.titolo() 
                    + " | Autore: " + libro.autore()
                    + " | Pagine: " + libro.pagine() + ".");

                case Computer computer ->
                    System.out.println("Computer| Marca: " + computer.marca()
                    + " | RAM: " + computer.ram() + " GB"
                    + " | Storage: " + computer.storage() + " GB.");

                case Lampada lampada ->
                    System.out.println("Lampada| Colore: " + lampada.colore()
                    + " | Watt: " + lampada.watt() + ".");

                case Penna penna ->
                    System.out.println("Penna| Colore: " + penna.colore()
                    + " | Tipo: " + penna.tipo() + ".");

                case PortaPenne pp ->
                    System.out.println("Porta penne| Materiale: " + pp.materiale()
                    + " | Capienza: " + pp.capienza() + ".");
            }
        }
    }
}
