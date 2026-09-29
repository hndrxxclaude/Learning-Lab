public abstract class Contenuto{
	private String titolo;
	private double durataMinuti;
	
	public Contenuto(String titolo, double durataMinuti){
		if (titolo == null || titolo.isBlank()){
			throw new IllegalArgumentException("Invalid input: title must not be empty.");
		}
		
		if (durataMinuti < 0){
			throw new IllegalArgumentException("Invalid input: content duration must be positive.");
		}
		
		this.titolo = titolo;
		this.durataMinuti = durataMinuti;
	}
	
	public String getTitolo(){
		return titolo;
	}
	
	public double getDurata(){
		return  durataMinuti;
	}
	
	/*public setDurata(double durataMinuti){
		if (durataMinuti <= 0){
			throw new IllegalArgumentException("Invalid input: content duration must be positive.");
		}
		
		this.durataMinuti = durataMinuti;
	} */
	
	public abstract double dimensioneMB();
	public abstract void riproduci();
	
	@Override
	public String toString(){
		return "Title: " + titolo + " | Duration: " + durataMinuti;
	}
}