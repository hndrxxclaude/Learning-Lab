public class FileReaderRisorsa implements AutoCloseable{
    
    private final String nomeFile;
    private boolean aperto;
    
    public FileReaderRisorsa(String nomeFile){
        if (nomeFile == null || nomeFile.isBlank()){
            throw new IllegalArgumentException("Il nome del file non può essere vuoto.");
        }
        this.nomeFile = nomeFile;
        this.aperto = true;
        System.out.println("[FileReaderRisorsa] Risorsa aperta per il file: " + nomeFile);
    }

    public String leggiDati(){
        if (!aperto){
            throw new IllegalStateException("Impossibile leggere: la risorsa è già stata chiusa.");
        }

        return "Dati letti dal file \"" + nomeFile + "\": [riga1, riga2, riga3]";
    }

    @Override
    public void close(){
        if (aperto){
            aperto = false;
            System.out.println("[FileReaderRisorsa] Risorsa chiusa. File: \"" + nomeFile + "\" rilasciato.");
        }
    }
}
