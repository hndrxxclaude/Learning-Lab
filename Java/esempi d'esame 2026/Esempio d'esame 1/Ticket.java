public abstract class Ticket{
	
	private String codice;
	private String descrizione;
	private String priorita;
	
	public Ticket(String codice, String descrizione, String priorita){
		
		if (codice == null || codice.isBlank()){
			throw new IllegalArgumentException("[Errore] Illegal Argument: Il codice del ticket di assistenza non può essere null.");
		}
		
		if (descrizione == null || descrizione.isBlank()){
			throw new IllegalArgumentException("[Errore] Illegal Argument: Si consiglia di aggiungere una descrizione per un servizio di assistenza più veloce ed efficiente.");
		}
		
		if (priorita == null || priorita.isBlank()){
			throw new IllegalArgumentException("[Errore] Illegal Argument: La priorita deve essere tra queste opzioni: Alta / Media / Bassa.");
		}
		
		if (!priorita.equals("Alta") && !priorita.equals("Media") && !priorita.equals("Bassa")){
			throw new IllegalArgumentException("[Errore] IllegalArgument: La priorita deve essere tra queste opzioni: Alta / Media / Bassa.");
		}
		
		this.codice = codice;
		this.descrizione = descrizione;
		this.priorita = priorita;
	}
	
	public String getCodice(){
		return codice;
	}
	
	public String getDescrizione(){
		return descrizione;
	}
	
	public String getPriority(){
		return priorita;
	}
	
	public boolean urgente(){
		return priorita.equals("Alta");
	}
	
	public abstract int tempoStimatoOre();
	
	public String toString(){
		return "Codice Ticket: " + codice + " | Descrizione: " + descrizione + " | Livello di Priorità: " + priorita;
	}
	
	public static void main(String[] args){
		
		int MAX_DIM = 5;
		
		Ticket[] prenotazioni = new Ticket[MAX_DIM];
		
		Ticket ticket1 = new TicketHardware("H1", "Schermo rotto Mac", "Bassa");
		Ticket ticket2 = new TicketHardware("H2", "SSD failed", "Alta");
		Ticket ticket3 = new TicketSoftware("S1", "Come cambio la suoneria?", "Bassa");
		Ticket ticket4 = new TicketSoftware("S2", "Che vuol dire la schermata stai per ripristinare il dispositivo?", "Alta");
		Ticket ticket5 = new TicketHardware("H3", "Sostituzione Batteria iPhone", "Media");
		
		prenotazioni[0] = ticket1;
		prenotazioni[1] = ticket2;
		prenotazioni[2] = ticket3;
		prenotazioni[3] = ticket4;
		prenotazioni[4] = ticket5;
		
		for (int i = 0; i < MAX_DIM; i++){
			if (prenotazioni[i].urgente()){
				System.out.println(prenotazioni[i].toString());
				System.out.println("Tempo stimato (Ore): " + prenotazioni[i].tempoStimatoOre());
			}
		}
	}
}

