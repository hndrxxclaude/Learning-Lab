public class TestContoBancario {
    
    public static void main(String[] args){

        ContoBancario mio = new ContoBancario("1234");
        ContoBancario tuo = new ContoBancario(1500.50, "5678");

        System.out.println(mio.getNumeroConto());
        System.out.println(tuo.getNumeroConto());
        System.out.println(tuo.getSaldo());

        ContoBancario falso = new ContoBancario(-1, "0000");

        mio.deposita(100);
        System.out.println(mio.getSaldo());

        System.out.println(tuo.preleva(1500));
        System.out.println(tuo.getSaldo());
        tuo.preleva(1);

    }
}
