public class Squadra implements Giocatore{

    int numeroGiocatori;
    Calciatore[] team;

    @Override
    public void gioca(){
        System.out.println("La squadra di oggi sarà composta da " + numeroGiocatori + " giocatori.");
    }

}