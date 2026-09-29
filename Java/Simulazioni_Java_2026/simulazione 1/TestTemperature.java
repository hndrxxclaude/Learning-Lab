public class TestTemperature{
	
	public static void main(String[] args){
		
		int MAX_DIM = 8;
		
		Double[] temperature = new Double[MAX_DIM];
		
		temperature[0] = 10.0;
		temperature[1] = 23.0;
		temperature[2] = 2.0;
		temperature[3] = -7.0;
		temperature[4] = 31.0;
		temperature[5] = 18.0;
		temperature[6] = 15.0;
		temperature[7] = 12.0;

		double minimo = temperature[0];
		double massimo = temperature[0];
		double totale = 0;
		
		for (int i = 0; i < temperature.length; i++){
			totale += temperature[i];
			if (temperature[i] < minimo){
				minimo = temperature[i];
			}
			if(temperature[i] > massimo){
				massimo = temperature[i];
			}
		}
		
		System.out.println("Temperatura minima: " + minimo);
		System.out.println("Temperatura massima: " + massimo);
		
		double media = totale / temperature.length;
		
		int counter = 0;
		
		System.out.println("Temperature tra i 18 e i 25 gradi inclusi: ");
		for(int i = 0; i < temperature.length; i++){
			if (temperature[i] > media){
				counter++;
			}
			if(temperature[i] >= 18 && temperature[i] <= 25){
				System.out.println(temperature[i]);
			}
		}
		System.out.println("Numero di temperature sopra la media(" + media + "): " + counter);
		
		System.out.println("Classificazione delle temperature raccolte: ");
		for (int i = 0; i < temperature.length; i++){
			System.out.println(ClassificaTemperatura.classifica(temperature[i]));
		}
	}
}