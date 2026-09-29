public class Podio{

    Tennista primo;
    Tennista secondo;
    Tennista terzo;

    public Podio(Tennista p, Tennista s, Tennista t){
        primo = p;
        secondo = s;
        terzo = t;
    }

    public void printPodio(){
        // System.out.println(String.format("Podio: \n1 - %s\n2 - %s\n3 - %s", primo.nome, secondo.nome, terzo.nome));
        String s = STR."Podio: \n1 - \{primo.nome} \n2 - \{secondo.nome} \n3 - \{terzo.nome}";
        System.out.println(s);
    }

}