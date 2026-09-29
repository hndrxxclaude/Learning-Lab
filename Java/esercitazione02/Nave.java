public class Nave {
	
	String nome;
	int capienza;
	Auto[] autoArray; // Dichiariamo l'array qui senza istanziarlo
	
	public Nave(String n, int c) {
		nome = n;
		capienza = c;
		autoArray = new Auto[capienza]; // Ora lo istanziamo con la grandezza corretta
	}
	
	public void caricaAuto(Auto car) {
		boolean autoParcheggiata = false; // Flag per capire se abbiamo trovato posto
		
		for(int i = 0; i < capienza; i++) {
			if(autoArray[i] == null) { // Cerchiamo un posto VUOTO
				autoArray[i] = car;
				System.out.println(car.tipo + " a bordo.");
				autoParcheggiata = true; // Segniamo che l'operazione è riuscita
				break; // Interrompiamo il ciclo per non riempire tutta la nave con la stessa auto
			}
		}
		
		// Se il ciclo finisce e il flag è ancora false, significa che non c'erano posti a null
		if (!autoParcheggiata) {
			System.out.println("Posti esauriti!");
		}
	}
}