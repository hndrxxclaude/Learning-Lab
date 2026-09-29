public class AutoElettrica extends VeicoloElettrico{
	
	private String segmento;
	private int consumoMedio;
	
	public AutoElettrica(String modello, double capacitaBatteriaKWh, String segmento, int consumoMedio){
		super(modello, capacitaBatteriaKWh);
		
		if(segmento == null || segmento.isBlank()){
			throw new IllegalArgumentException("[Errore] Invalid Argument: Il segmento non può essere null.");
		}
		
		if(consumoMedio <= 0){
			throw new IllegalArgumentException("[Errore] Invalid Argument: Il consumo medio deve essere positivo.");
		}
		
		this.segmento = segmento;
		this.consumoMedio = consumoMedio;
	}
	
	@Override
	public double autonomiaKm(){
		return (getCapacitaBatteria() / consumoMedio) * 100;
	}
	
	@Override
	public String toString(){
		return super.toString() + " | Segmento: " + segmento + " | Consumo Medio: " + consumoMedio + " KWh / 100Km.";
	}
}