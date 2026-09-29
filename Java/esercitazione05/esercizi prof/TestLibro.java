public class TestLibro {
    
    public static void main(String[] args){

        Libro buddha = new Libro("Siddharta", "Hesse", 150);

        buddha.setGenere("romanzo");

        Libro gay = new Libro("It", "King", 400);

        gay.setGenere("horror");

        System.out.println(buddha.toString());
    }
}


