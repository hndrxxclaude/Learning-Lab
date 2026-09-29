public class TestPagella{

    public static void main(String[] args){

        Studente boh = new Studente("Giovanni", "Battista", "5A");

        Pagella pagella = new Pagella(boh);

        pagella.valutazioni = new String[11][];

        pagella.valutazioni[0] = new String[]{"Italiano", "7", "Non si impegna troppo."};
        pagella.valutazioni[1] = new String[]{"Matematica", "9", "È molto portato per questa materia."};
        pagella.valutazioni[2] = new String[]{"Storia", "7", "Potrebbe fare di più."};
        pagella.valutazioni[3] = new String[]{"Geografia", "8", "Appassionato."};
        pagella.valutazioni[4] = new String[]{"Inglese", "9", "Capace di sostenere dialoghi."};
        pagella.valutazioni[5] = new String[]{"Scienze Motorie", "6", "Voto d'incoraggiamento."};
        pagella.valutazioni[6] = new String[]{"Musica", "7", "Ha una certa passione per la materia."};
        pagella.valutazioni[7] = new String[]{"Arte", "8", "Mostra creatività e interesse."};
        pagella.valutazioni[8] = new String[]{"Informatica", "9", "Mostra grande abilità nell'uso degli strumenti digitali."};
        pagella.valutazioni[9] = new String[]{"Filosofia", "7", "Ragiona bene, ma può approfondire."};
        pagella.valutazioni[10] = new String[]{"Educazione Civica", "8", "Partecipe e attento alle tematiche sociali."};

        pagella.stampaPagella();
    }


}