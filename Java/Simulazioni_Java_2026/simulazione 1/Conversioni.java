public class Conversioni {
	public static void main(String[] args) {
		byte b = 10;
		int x = b + 120;
		double d = x / 4;
		double e = x / 4.0;
		
		int i = 3;
		int risultato = i++ + ++i;
		boolean ok = (x > 100) || (++i > 10);
		
		System.out.println(x);
		System.out.println(d);
		System.out.println(e);
		System.out.println(risultato);
		System.out.println(i + " " + ok);
	}
}