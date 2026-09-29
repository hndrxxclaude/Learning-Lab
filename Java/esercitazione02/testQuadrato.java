public class testQuadrato{
	
	public static void main(String[] args){
		
		Quadrato q1 = new Quadrato();
		q1.lato = 3;
		
		Quadrato q2 = new Quadrato();
		q2.lato = 5;
		
		int perimetro1 = q1.perimetro(q1.lato);
		int area1 = q1.area(q1.lato);
		
		int perimetro2 = q2.perimetro(q2.lato);
		int area2 = q2.area(q2.lato);
		
		q1.toString(q1.lato, area1, perimetro1);
		q2.toString(q2.lato, area2, perimetro2);
	}
}