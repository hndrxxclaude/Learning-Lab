public class ClassificaTemperatura{
	static String classifica(double temperatura){
		if (temperatura < 10){
			return "BASSA";
		} else if (temperatura >= 10 && temperatura < 25){
			return "NORMALE";
		} else {
			return "ALTA";
		}
	}
}