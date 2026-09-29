class DatoNonValidoException extends Exception {
	public DatoNonValidoException(String m) { super(m); }
}

public class Gestione {
	static int converti(String s) throws DatoNonValidoException {
		try {
			int n = Integer.parseInt(s);
			if (n < 0) throw new DatoNonValidoException("negativo");
			return n;
		} catch (NumberFormatException e) {
			throw new DatoNonValidoException("non numerico");
		} finally {
			System.out.print("F ");
		}
	}
	
	public static void main(String[] args) {
		for (String s : new String[]{"4", "-2", "x"}) {
			try {
				System.out.println(converti(s));
			} catch (DatoNonValidoException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}