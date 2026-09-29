public enum Ruolo {
    RICERCATORE,
    PROFESSORE_ASSOCIATO,
    PROFESSORE_ORDINARIO;

    @Override
    public String toString(){
        return switch(this){
                case RICERCATORE -> "Ricercatore";
                case PROFESSORE_ASSOCIATO -> "Professore Associato";
                case PROFESSORE_ORDINARIO -> "Professore Ordinario";
        };
    }
}
