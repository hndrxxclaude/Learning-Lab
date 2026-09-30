public class TestRubrica {
    public static void main(String[] args){

        Contatto io = new Contatto(1, "Claudio", "Gentile", "esempio@gmail.com", "0000000000");
        Contatto pa = new Contatto(53, "Papà", "Gentile", "esempio@libero.it", "1111111111");
        Contatto ma = new Contatto(48, "Mamma", "Zangara", "", "2222222222");

        Rubrica myrubrica = new Rubrica();

        myrubrica.aggiungi(io);
        myrubrica.aggiungi(pa);
        myrubrica.aggiungi(ma);

        System.out.println(myrubrica);

        myrubrica.visualizza("Gentile");

        myrubrica.elimina(48);
        myrubrica.elimina(47);

        Contatto trovato = myrubrica.cerca(53);
        if (trovato != null) {
            System.out.println("Trovato: " + trovato);
        } else {
            System.out.println("Contatto non trovato.");
        }
    }
}
