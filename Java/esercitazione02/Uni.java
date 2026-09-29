/* I record sono dei tipi progettati per la rappresentazione di dati immutabili. I loro oggetti hanno uno stato immutabile. Essi dichiarano implicitamente un costruttore metodi per accedere direttamente alle variabili d'istanza e metodi fondamentali come toString. */

record Studente(String nome, int matricola){}
	
record Corso(String nomeCorso, int cfu){}
	
public class Uni{
		
	public static void main(String[] args){
		
		Studente io = new Studente("Clod", 789368);
		Corso tds = new Corso("Teoria dei Segnali", 9);
		System.out.println("Lo studente " + io.nome() + ", matricola " + io.matricola() + " segue il corso " + tds.nomeCorso() + " da " + tds.cfu() + " CFU.");
	}
}