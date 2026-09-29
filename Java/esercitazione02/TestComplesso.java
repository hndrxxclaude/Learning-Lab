import java.util.Scanner;

public class TestComplesso{
	
	public static void main(String[] args){
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Inserire la parte reale: ");
		double num1Re = sc.nextDouble();
		System.out.println("Inserire la parte immaginaria: ");
		double num1Im = sc.nextDouble();
		
		Complesso mioComplesso = new Complesso();
		mioComplesso.set(num1Re, num1Im);
		
		String mioStringa = mioComplesso.toString();
		System.out.println(mioStringa);
		
		mioComplesso.stampa();
		
		System.out.println("Inserire la parte reale da sommare: ");
		double num2Re = sc.nextDouble();
		System.out.println("Inserire la parte immaginaria da sommare: ");
		double num2Im = sc.nextDouble();
		
		Complesso cSommato = new Complesso();
		cSommato.set(num2Re, num2Im);
		
		Complesso somma = mioComplesso.somma(cSommato);
		
		System.out.println("Risultato della somma: ");
		somma.stampa();
		
		System.out.println("Inserire la parte reale da sottrarre: ");
		double num3Re = sc.nextDouble();
		System.out.println("Inserire la parte immaginaria da sottrarre: ");
		double num3Im = sc.nextDouble();
		
		Complesso cSottratto = new Complesso();
		cSottratto.set(num3Re, num3Im);
		
		Complesso differenza = mioComplesso.sottrai(cSottratto);
		
		System.out.println("Risultato della sottrazione: ");
		differenza.stampa();

		sc.close();
	}
}