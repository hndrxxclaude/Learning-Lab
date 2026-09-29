import java.util.Scanner;

public class TestDoWhile {
    
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);

        int numero;

        do{
            System.out.println("Inserire un numero positivo: ");
            numero = sc.nextInt();
        } while(numero <= 0);

        System.out.println("Numero inserito: " + numero);

        sc.close();
    }
}
