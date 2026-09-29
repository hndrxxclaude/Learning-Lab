/* Scrivere una classe SommaMatrici dotata di un metodo main che: generi attraverso la la Math.random()
due matrici di double fra 0 e 100, matrice1 e matrice2, di dimensione 3x5; utilizzi una matrice di double
risultato per memorizzare la somma di matrice1 e matrice2; stampi il risultato della somma. */

public class SommaMatrici{

    public static void main(String[] args){

        double[][] matrice1 = new double[3][5];
        double[][] matrice2 = new double[3][5];

        int[][] risultato = new int[3][5];

        for (int i = 0; i < 3; i++){
            for (int j = 0; j < 5; j++){
                matrice1[i][j] = Math.random() * 100;
                matrice2[i][j] = Math.random() * 100;
                risultato[i][j] = (int)(matrice1[i][j] + matrice2[i][j]);
            }
        }

        for (int i = 0; i < risultato.length; i++){
            for (int j = 0; j < risultato[i].length; j++){
                System.out.print(risultato[i][j] + "\t");
            }
            System.out.println();
        }
    }
}