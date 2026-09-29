import java.util.Random;

public class Dado{
	
	public int lancia(){
		Random random = new Random();
		return random.nextInt(6) + 1;
	}
}