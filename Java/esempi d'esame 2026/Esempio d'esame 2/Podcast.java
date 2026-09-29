public class Podcast extends Contenuto{
	
	private int kbps;
	
	public Podcast(String titolo, double durataMinuti, int kbps){
		super(titolo, durataMinuti);
		
		if (kbps < 0){
			throw new IllegalArgumentException("Invalid input: kbps (kilobit per second) must be a positive integer.");
		}
		
		this.kbps = kbps;
	}
	
	public int getKBPS(){
		return kbps;
	}
	
	@Override
	public double dimensioneMB(){
		double secondi = getDurata() / 60;
		
		return (secondi * kbps) / 8192;
	}
	
	@Override
	public void riproduci(){
		System.out.println("Podcast in ascolto: " + getTitolo());
	}
	
	@Override
	public String toString(){
		return "Podcast | " + super.toString();
	}
}