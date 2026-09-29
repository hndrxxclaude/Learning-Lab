/* Creare una classe Direttore che contiene un’unica variabile d’istanza nome, e un costruttore che permette di
settare il nome del direttore.
Creare una classe Orchestra, che ha come variabile d’istanza un reference di tipo Direttore (come
identificatore potete utilizzare direttore), un costruttore che permetta di settare l’oggetto direttore e un metodo
chiamato cambiaDirettore, che permette di cambiare il direttore dell’orchestra.
Compilare i due file e lanciare il seguente file del main per testare il codice che abbiamo scritto: */

public class Direttore{
	String nome;
	
	public Direttore(String n){
		nome = n;
	}
}