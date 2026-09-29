import java.util.Scanner;

public class Moltiplica{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Moltiplicatore v.gg");
		System.out.println("Inserire il primo numero intero: ");
		int input1 = sc.nextInt();
		System.out.println("Inserire il secondo numero intero: ");
		int input2 = sc.nextInt();
		System.out.print("Risultato: ");
		System.out.println(input1 * input2);
		sc.close();
	}
}