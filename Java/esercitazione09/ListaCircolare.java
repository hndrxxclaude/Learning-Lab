import java.util.List;
import java.util.LinkedList;

public class ListaCircolare {
    
    private List<String> lista;
    private int currentIndex;

    public ListaCircolare(){
        lista = new LinkedList<>();
        currentIndex = -1;
    }

    public void add(String element){
        if(lista.isEmpty()){
            lista.add(element);
            currentIndex = 0;
        } else {
            currentIndex = currentIndex + 1;
            lista.add(currentIndex, element);
        }
    }

    private void checkEmpty(){
        if (currentIndex == -1){
            throw new IllegalStateException("La lista è già vuota.");
        }
    }

    public void removeCurrent(){
        checkEmpty();
        lista.remove(currentIndex);
        currentIndex--;
        if (currentIndex < 0){
            currentIndex = lista.size() - 1;
        }
    }

    public String getCurrent(){
        checkEmpty();
        return lista.get(currentIndex);
    }

    public void next(){
        checkEmpty();
        currentIndex++;
        if (currentIndex == lista.size()){
            currentIndex = 0;
        }
    }

    public void previous(){
        checkEmpty();
        currentIndex--;
        if (currentIndex < 0){
            currentIndex = lista.size() - 1;
        }
    }

    public static void main(String[] args){
        
        ListaCircolare lista = new ListaCircolare();
        lista.add("A");
        lista.add("B");
        lista.add("C");
        lista.add("D");
        lista.add("E");
        
        System.out.println(lista.getCurrent()); // E
        lista.next();
        System.out.println(lista.getCurrent()); // A
        lista.previous();
        System.out.println(lista.getCurrent()); // E
        System.out.println(lista.getCurrent()); // E
        lista.previous();
        System.out.println(lista.getCurrent()); // D
        lista.previous();
        System.out.println(lista.getCurrent()); // C
        lista.previous();
        System.out.println(lista.getCurrent()); // B
        lista.next();
        System.out.println(lista.getCurrent()); // C
        lista.next();
        System.out.println(lista.getCurrent()); // D
        lista.next();
        System.out.println(lista.getCurrent()); // E
        lista.removeCurrent();
        System.out.println(lista.getCurrent()); // D
        lista.removeCurrent();
        System.out.println(lista.getCurrent()); // C
        lista.add("F");
        System.out.println(lista.getCurrent()); // F
    }
}



