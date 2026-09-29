public class TestDado{
	
	public static void main(String[] args){
		
		Dado dado1 = new Dado();
		Dado dado2 = new Dado();
		
		for(int i = 0; i < 100; i++){
			int num1 = dado1.lancia();
			int num2 = dado2.lancia();
			
			if(num1 + num2 == 12){
				System.out.println("Valore massimo ottenuto.");
			}
		}
	}
}