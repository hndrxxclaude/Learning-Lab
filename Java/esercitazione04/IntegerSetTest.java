public class IntegerSetTest {
    
    public static void main(String[] args){
        
        IntegerSet setVuoto = new IntegerSet();

        System.out.println(setVuoto.toString());

        setVuoto.insertElement(3);
        System.out.println(setVuoto.toString());

        setVuoto.insertElement(99);
        System.out.println(setVuoto.toString());

        setVuoto.deleteElement(99);
        System.out.println(setVuoto.toString());

        IntegerSet nuovoSet = new IntegerSet();
        nuovoSet.insertElement(3);
        nuovoSet.insertElement(4);
        nuovoSet.insertElement(5);
        nuovoSet.insertElement(10);
        nuovoSet.insertElement(99);
        System.out.println(nuovoSet.toString());

        IntegerSet setUnione = new IntegerSet();

        setUnione.unionOfIntegerSet(setVuoto, nuovoSet);
        System.out.println(setUnione.toString());

        IntegerSet setIntersezione = new IntegerSet();

        setIntersezione.intersectionOfIntegerSet(setVuoto, nuovoSet);
        System.out.println(setIntersezione.toString());
    }
}
