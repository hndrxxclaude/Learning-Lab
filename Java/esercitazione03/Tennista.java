public class Tennista implements Giocatore{

    final String nome;

    @Override
    public String toString(){
        return nome;
    }

    public Tennista(String n){
        nome = n;
    }

    @Override
    public void gioca(){
        System.out.println(nome + " sta giocando");
    }
}