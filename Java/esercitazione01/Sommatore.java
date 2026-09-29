public class Sommatore{
	public static void main(String[] args){
		int lunghezza = args.length;
		int somma = 0;
		for(int i = 0; i < lunghezza; i++){
			String numeroString = args[i];
			int numeroInt = Integer.parseInt(numeroString);
			somma = somma + numeroInt;
		}
		System.out.println("La somma è " + somma);
	}
}

// Se uno degli argomenti non è un intero, per esempio un float come 5.5, il programma non verrà neanche compilato.

