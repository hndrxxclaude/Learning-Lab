import java.util.ArrayList;

public class IntegerSet {
    
    /* boolean[] sBooleans = new boolean[100];

    public IntegerSet() {
        for (int i = 0; i < 100; i++) {
            sBooleans[i] = false;
        }
    }

    public void unionOfIntegerSet(IntegerSet set1, IntegerSet set2) {
        for (int i = 0; i < 100; i++) {
            sBooleans[i] = set1.sBooleans[i] || set2.sBooleans[i]; // ✅ sovrascrive sempre
        }
    }

    public void intersectionOfIntegerSet(IntegerSet set1, IntegerSet set2) {
        for (int i = 0; i < 100; i++) {
            sBooleans[i] = set1.sBooleans[i] && set2.sBooleans[i]; // ✅ sovrascrive sempre
        }
    }

    public void insertElement(int k) {
        sBooleans[k] = true;
    }

    public void deleteElement(int k) {
        sBooleans[k] = false;
    }

    public String toString() {
        String stringa = "";
        boolean num = false;

        for (int i = 0; i < 100; i++) {
            if (sBooleans[i]) {
                num = true;
                stringa += i + " ";
            }
        }

        if (num) {
            return stringa.trim(); // ✅ rimuove lo spazio finale
        } else {
            return "L'insieme è vuoto";
        }
    }*/

    ArrayList<Integer> elementi = new ArrayList<>();

    public IntegerSet() {}

    public void unionOfIntegerSet(IntegerSet set1, IntegerSet set2) {
        
        elementi.clear();

        for (int el: set1.elementi){
            if(!elementi.contains(el)){
                elementi.add(el);
            }
        }

        for (int el: set2.elementi){
            if(!elementi.contains(el)){
                elementi.add(el);
            }
        }
    }

    public void intersectionOfIntegerSet(IntegerSet set1, IntegerSet set2){

        elementi.clear();

        for(int el: set1.elementi) {
            if(set2.elementi.contains(el)){
                elementi.add(el);
            }
        }
    }

    public void insertElement(int k){

        if(!elementi.contains(k)){
            elementi.add(k);
        }
    }

    public void deleteElement(int k){
        
        if(elementi.contains(k)){
            elementi.remove(Integer.valueOf(k));
        }
    }

    public String toString() {

        if(elementi.isEmpty()){
            return "L'insieme è vuoto";
        }

        String stringa = new String();

        for(int el: elementi){
            stringa += el + " ";
        }
        return stringa;
        
    }
}