public class TicketHardware extends Ticket{
	
	public TicketHardware(String codice, String descrizione, String priorita){
		super(codice, descrizione, priorita);
	}
	
	@Override
	public int tempoStimatoOre(){
		return 8;
	}
	
	@Override
	public String toString(){
		return "Ticket di Assistenza Hardware | " + super.toString();
	}
}