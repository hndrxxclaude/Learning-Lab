public class TestPodio{

    public static void main(String[] args){

        Tennista primo = new Tennista("Gabriele D'Asta");
        Tennista secondo = new Tennista("Alcaraz");
        Tennista terzo = new Tennista("Sinner");

        Podio podio = new Podio(primo, secondo, terzo);

        podio.printPodio();
    }
}