public class TestRettangolo{

	public static void main(String[] args){
		
		Rettangolo rect1 = new Rettangolo(5, 3);
		Rettangolo rect2 = new Rettangolo(6, 7);
		
		int p1 = rect1.perimetro(rect1.base, rect1.altezza);
		int a1 = rect1.area(rect1.base, rect1.altezza);
		
		int p2 = rect2.perimetro(rect2.base, rect2.altezza);
		int a2 = rect2.perimetro(rect2.base, rect2.altezza);
		
		rect1.toString(rect1.base, rect1.altezza, p1, a1);
		rect2.toString(rect2.base, rect2.altezza, p2, a2);
		
	}
}