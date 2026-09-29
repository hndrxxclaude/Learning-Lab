public class Complesso{
	
	double parteRe;
	double parteIm;
	
	public void set(double re, double im){
		parteRe = re;
		parteIm = im;
	}
	
	public String toString(){
		return parteRe + "+ " + parteIm + "i";
	}
	
	public void stampa(){
		System.out.println(parteRe + " + " + parteIm + "i ");
	}
	
	public Complesso somma(Complesso c){
		
		Complesso risultato = new Complesso();
		
		risultato.parteRe = parteRe + c.parteRe;
		risultato.parteIm = parteIm + c.parteIm;
		
		return risultato;
	}
	
	public Complesso sottrai(Complesso c){
		
		Complesso risultato = new Complesso();
		
		risultato.parteRe = parteRe - c.parteRe;
		risultato.parteIm = parteIm - c.parteIm;
		
		return risultato;
	}
}