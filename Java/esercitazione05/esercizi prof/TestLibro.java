public class TestLibro {
    
    public static void main(String[] args){

        Libro buddha = new Libro("Siddharta", "Hesse", 150);

        buddha.setGenere("romanzo");

        Libro it = new Libro("It", "King", 400);

        it.setGenere("horror");

        System.out.println(buddha.toString());
    }
}


