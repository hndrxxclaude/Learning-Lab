/* § Utilizza una classe Persona che contiene le variabili nome, cognome, eta (età) e implementa tutti i
costruttori e i metodi che si ritengono necessari. Si dichiari inoltre un metodo toString che restituisca
in una stringa le informazioni sulla persona e il metodo equals che verifica se due oggetti
rappresentano la stessa persona. Ricordarsi di utilizzare le convenzioni e le regole per i nomi di
classi, metodi e variabili descritte a lezione. */

public class Persona{

    String nome;
    String cognome;
    int eta;

    public Persona(String n, String c, int e){
        nome = n;
        cognome = c;
        eta = e;
    }

    public String toString(){
        return "Questa persona si chiama " + nome + " " + cognome + " e ha " + eta + " anni.";
    }

    public boolean equals(Persona p){
        if (nome.equalsIgnoreCase(p.nome) && cognome.equalsIgnoreCase(p.cognome) && eta == p.eta) {
            return true;
        } else {
            return false;
        }
    }

    public static void main(String[] args){

        Persona io = new Persona("Claudiomario", "Gentile", 20);
        Persona sempreio = new Persona("Claudiomario", "Gentile", 20);
        Persona collega = new Persona("Gabriele", "D'Asta", 20);

        System.out.println(io.toString());
        System.out.println(sempreio.toString());

        if(io.equals(sempreio)){
            System.out.println("Sono la stessa persona.");
        } else {
            System.out.println("Non sono la stessa persona");
        }

        if(io.equals(collega)){
            System.out.println("Sono la stessa persona.");
        } else {
            System.out.println("Non sono la stessa persona");
        }
    }
}