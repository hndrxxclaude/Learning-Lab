/* Creare una classe Quadrato che dichiari una variabile d’istanza intera lato. Creare un metodo pubblico che si chiami perimetro() che ritorni il perimetro del quadrato, un metodo pubblico area() che ritorni l’area del quadrato e un metodo toString() che ritorna una stringa descrittiva del quadrato.
§ Creare una classe TestQuadrato contenente un metodo main() che istanzi due oggetti di tipo
Quadrato, con lati rispettivamente di valore 3 e 5 (con una istruzione simile alla seguente:
nomeOggetto.lato = 5;). Stampare poi il perimetro e l’area degli oggetti appena creati.*/



public class Quadrato {
	
	int lato;
	
	public int perimetro(int side){
		
		int perimetro = 4 * side;
		
		return perimetro;
	}
	
	public int area(int side){
		
		int area = side * side;
		
		return area;
	}
	
	public void toString(int side, int areaq, int perimeter){
		
		System.out.println("Per un quadrato di lato " + side + " il suo perimetro sarà " + perimeter + " e la sua area " + areaq + ".");
		
	}
}