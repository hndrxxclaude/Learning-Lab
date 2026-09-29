public class Esercizio3S {
	
	public static void main(String[] args){
		
		Auto miaAuto = new Auto("Musa");
		Auto tuaAuto = new Auto("Yaris");
		Auto terza_auto = new Auto("Porsche");
		
		Nave traghetto = new Nave("Traghetto", 2);
		
		traghetto.caricaAuto(miaAuto);
		traghetto.caricaAuto(tuaAuto);
		traghetto.caricaAuto(terza_auto);
		
	}
}

