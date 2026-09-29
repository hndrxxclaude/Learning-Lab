import java.util.HashSet;
import java.util.Scanner;
import java.util.Collection;

public class CollectionStudente {
    
    public static void main(String[] args){

        Collection<Studente> listaStudenti = new HashSet<>();
        Scanner sc = new Scanner(System.in);

        do {
            System.out.println("1. Inserire un nuovo studente");
            System.out.println("2. Cercare per nome e cognome");
            System.out.println("3. Cercare per matricola");
            System.out.println("4. Cancellare per matricola");
            System.out.println("5. Stampa lista studenti");
            System.out.println("6. Cancellare intera lista studenti");
            System.out.println("7. Uscire");
            System.out.print("> ");
            try {
                int choice = sc.nextInt();
                switch (choice){
                    case 1 -> {
                        System.out.println("Inserire il nome: ");
                        String nome = sc.next();
                        System.out.println("Inserire il cognome: ");
                        String cognome = sc.next();
                        System.out.println("Inserire la matricola: ");
                        int matricola = sc.nextInt();
                        listaStudenti.add(new Studente(nome, cognome, matricola));
                    }

                    case 2 -> {
                        System.out.println("Inserire il nome: ");
                        String nome = sc.next();
                        System.out.println("Inserire il cognome: ");
                        String cognome = sc.next();
                        for (Studente s : listaStudenti){
                            if (s.nome().equals(nome) && s.cognome().equals(cognome)){
                                System.out.println("Trovato: " + s);
                                break;
                            }
                        }
                    }

                    case 3 -> {
                        System.out.println("Inserire la matricola: ");
                        int matricola = sc.nextInt();
                        for (Studente s : listaStudenti){
                            if (s.matricola() == matricola){
                                System.out.println("Trovato: " + s);
                                break;
                            }
                        }
                    }

                    case 4 -> {
                        System.out.println("Inserire la matricola: ");
                        int matricola = sc.nextInt();
                        for (Studente s : listaStudenti){
                            if (s.matricola() == matricola){
                                listaStudenti.remove(s);
                                System.out.println("Studente rimosso.");
                                break;
                            }
                        }
                    }

                    case 5 -> {
                        System.out.println("Studenti: ");
                        for (Studente s : listaStudenti){
                            System.out.println(s);
                        }
                    }

                    case 6 -> {
                        System.out.println("Rimozione di tutti gli studenti...");
                        for (Studente s : listaStudenti){
                            listaStudenti.remove(s);
                        }
                        System.out.println("Lista cancellata.");
                    }

                    case 7 -> {
                        System.out.println("Uscita...");
                        sc.close();
                        return;
                    }

                    default -> System.out.println("Scelta non valida.");
                }
            } catch (Exception e){
                System.out.println("Input error: " + e.getMessage());
                sc.nextLine();
            }
        } while (true);
    }
}
