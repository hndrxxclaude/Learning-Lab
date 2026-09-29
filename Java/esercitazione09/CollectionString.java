import java.util.HashSet;

public class CollectionString extends HashSet<String>{
    @Override
    public boolean add(String s) throws CollectionException{
        if (!super.add(s)){
            throw new CollectionException("Stringa già presente: " + s);
        }
        return true;
    }

    public static void main(String[] args){
        CollectionString cs = new CollectionString();
        try {
            cs.add("Hello");
            cs.add("World");
            System.out.println(cs);
            cs.add("Hello");
        } catch (Exception e){
            System.out.println("[Errore]: " + e.getMessage());
        }
    }
}
