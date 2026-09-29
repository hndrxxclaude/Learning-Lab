public class GestoreFile {
    
    public void leggiFile(String nomeFile){
        
        System.out.println("Apertura file: " + nomeFile);

        try (FileReaderRisorsa risorsa = new FileReaderRisorsa(nomeFile)) {

            String dati = risorsa.leggiDati();
            System.out.println(dati);

        } catch (IllegalStateException e){
            System.out.println(" [Errore] " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        
        GestoreFile gestore = new GestoreFile();

        try{
            gestore.leggiFile("dati.txt");
        } catch (IllegalArgumentException e){
            System.out.println(" [Errore catturato] " + e.getMessage());
        }

        try{
            gestore.leggiFile("");
        } catch (IllegalArgumentException e){
            System.out.println(" [Errore catturato] " + e.getMessage());
        }

        FileReaderRisorsa risorsaEsterna = new FileReaderRisorsa("test.txt");
        risorsaEsterna.close();

        try{
            risorsaEsterna.leggiDati();
        } catch (IllegalStateException e){
            System.out.println(" [Errore catturato]: " + e.getMessage());
        }
    }
}
