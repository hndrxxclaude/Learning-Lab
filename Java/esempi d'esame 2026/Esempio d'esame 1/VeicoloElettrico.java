import java.util.List;
import java.util.ArrayList;

public abstract class VeicoloElettrico{
	
	private String modello;
	private double capacitaBatteriaKWh;
	
	public VeicoloElettrico(String modello, double capacitaBatteriaKWh){
		if (modello == null || modello.isBlank()){
			throw new IllegalArgumentException("[Errore] Invalid Argument: Il modello del veicolo non può essere null.");
		}
		
		if (capacitaBatteriaKWh <= 0){
			throw new IllegalArgumentException("Errore] Invalid Argument: La capacità della batteria deve essere poositiva.");
		}
		
		this.modello = modello;
		this.capacitaBatteriaKWh = capacitaBatteriaKWh;
	}
	
	public String getModello(){
		return modello;
	}
	
	public double getCapacitaBatteria(){
		return capacitaBatteriaKWh;
	}
	
	public abstract double autonomiaKm();
	
	public String toString(){
		return "Modello: " + modello + " | Capacità della Batteria(KWh): " + capacitaBatteriaKWh;
	}
	
	public static void main(String[] args){
		
		List<VeicoloElettrico> veicoli = new ArrayList<>();
		
		veicoli.add(new AutoElettrica("Ferrari Luce", 122, "Berlina", 23));
		veicoli.add(new MonopattinoElettrico("Xiaomi Scooter", 0.48));
		
		double autonomiaMedia;
		double autonomiaTot = 0;
		double autonomiaMax = 0;
		VeicoloElettrico veicoloAutonomiaMax = null;
		
		for(VeicoloElettrico v : veicoli){
			autonomiaTot += v.autonomiaKm();
			if (v.autonomiaKm() > autonomiaMax){
				veicoloAutonomiaMax = v;
				autonomiaMax = v.autonomiaKm();
			}
		}
		
		autonomiaMedia = autonomiaTot / veicoli.size();
		
		System.out.println("Autonomia media: " + autonomiaMedia + "Km. Veicolo con autonomia massima: ");
		System.out.println(veicoloAutonomiaMax.toString());
	}
}