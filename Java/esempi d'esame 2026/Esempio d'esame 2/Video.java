public class Video extends Contenuto{
	
	private int bitRate;
	
	public Video(String titolo, double durataMinuti, int bitRate){
		super(titolo, durataMinuti);
		
		if (bitRate < 0){
			throw new IllegalArgumentException("Invalid input: bitRate must be a positive integer.");
		}
		
		this.bitRate = bitRate;
	}
	
	public int getBitRate(){
		return bitRate;
	}
	
	@Override
	public double dimensioneMB(){
		double secondi = getDurata() / 60;
		
		return (bitRate * secondi) / 8;
	}
	
	@Override
	public void riproduci(){
		System.out.println("Video in riproduzione: " + getTitolo());
	}
	
	@Override
	public String toString(){
		return "Video | " + super.toString();
	}
}