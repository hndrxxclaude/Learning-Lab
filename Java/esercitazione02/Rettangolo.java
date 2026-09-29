public class Rettangolo{
	
	int base; 
	int altezza;
	
	public int perimetro(int b, int h){
		
		return (2 * b) + (2 * h);
	}
	
	public int area(int b, int h){
		
		return b * h;
	}
	
	public void toString(int b, int h, int perimeter, int ar) {
		
		System.out.println("Per un rettangolo di base " + b + " e altezza " + h + " il perimetro sarà " + perimeter + " e l'area " + ar + ".");
	}
	
	public Rettangolo(int b, int h){
		base = b;
		altezza = h;
	}
}