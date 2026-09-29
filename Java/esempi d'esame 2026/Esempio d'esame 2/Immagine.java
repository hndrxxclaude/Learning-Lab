public class Immagine extends Contenuto{
	
	private int altezzaPX;
	private int larghezzaPX;
	
	public Immagine(String titolo, int altezzaPX, int larghezzaPX){
		super(titolo, 0);
		
		if (altezzaPX < 0){
			throw new IllegalArgumentException("Invalid input: heigth in pixels must be positive."); 
		}
		
		if (larghezzaPX < 0){
			throw new IllegalArgumentException("Invalid input: width in pixels must be positive.");
		}
		
		this.altezzaPX = altezzaPX;
		this.larghezzaPX = larghezzaPX;
	}
	
	public int getAltezzaPX(){
		return altezzaPX;
	}
	
	public int getLarghezzaPX(){
		return larghezzaPX;
	}
	
	@Override
	public double dimensioneMB(){
		return (altezzaPX * larghezzaPX * 32) / (8 * 1024 * 1024);
	}
	
	@Override
	public void riproduci(){
		System.out.println("Immagine aperta: " + getTitolo());
	}
	
	@Override
	public String toString(){
		return "Image | " + super.toString();
	}
}