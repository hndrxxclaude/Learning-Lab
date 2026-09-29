public class TicketSoftware extends Ticket{
	
	public TicketSoftware(String codice, String descrizione, String priorita){
		super(codice, descrizione, priorita);
	}
	
	@Override
	public int tempoStimatoOre(){
		return 1;
	}
	
	@Override
	public String toString(){
		return "Ticket di Assistenza Software | " + super.toString();
	}
}