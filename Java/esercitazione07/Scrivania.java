import java.util.ArrayList;
import java.util.List;

public class Scrivania{
    private List<Appoggiabile> oggetti;

    public Scrivania(){
        oggetti = new ArrayList<>();
    }

    public List<Appoggiabile> getOggetti(){
        return oggetti;
    }

    public void aggiungi(Appoggiabile obj){
        oggetti.add(obj);
    }
}