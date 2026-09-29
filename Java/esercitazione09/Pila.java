/* Usate una pila per invertire le parole di una frase. Continuate a leggere parole, aggiungendole alla pila,
fin quando non trovate una parola che termina con un punto. A questo punto estraete tutte le parole
dalla pila e visualizzatele. Realizzate la pila tramite una Deque.  */

import java.util.Deque;
import java.util.LinkedList;
import java.util.Scanner;

public class Pila {
    
    public static void main(String[] args){

        Deque<String> stack = new LinkedList<>();
        Scanner sc = new Scanner(System.in);
        String input;

        System.out.println("Enter strings to push in the stack");
        while (true){
            try {
                input = sc.next();
            } catch (Exception e){
                System.out.println("Error reading input: " + e.getMessage());
                break;
            }
            if (input.endsWith(".")){
                break;
            }
            stack.push(input);
        }

        System.out.println("\nPopping elements from the stack: ");
        while (!stack.isEmpty()){
            System.out.println(stack.pop());
        }

        sc.close();
    }
}
