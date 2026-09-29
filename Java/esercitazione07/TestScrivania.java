public class TestScrivania {
    
    public static void main(String[] args){

        Studente io = new Studente("Claudio");
        Scrivania miaScrivania = new Scrivania();

        miaScrivania.aggiungi(new Computer("MacBook Pro M3 Pro", 18, 512));
        miaScrivania.aggiungi(new Libro("Lezioni di Teoria dei Segnali", "Giovanni Garbo", 295));
        miaScrivania.aggiungi(new Lampada("legno", 12));
        miaScrivania.aggiungi(new Penna("nera", "stilografica"));
        miaScrivania.aggiungi(new PortaPenne("legno", 10));
        miaScrivania.aggiungi(new Computer("iPad 11 Gen", 8, 256));

        io.usa(miaScrivania);
    }
}
