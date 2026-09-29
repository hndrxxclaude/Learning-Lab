public class MonopattinoElettrico extends VeicoloElettrico{
	
	public MonopattinoElettrico(String modello, double capacitaBatteriaKWh){
		super(modello, capacitaBatteriaKWh);
	}
	
	@Override
	public double autonomiaKm(){
		return getCapacitaBatteria() / 0.008;
	}
}