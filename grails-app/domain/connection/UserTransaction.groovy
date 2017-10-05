package connection

class UserTransaction {

    Integer amount
    Account account
    Date date
    String tag
    String type
    String payee
    String payer
    String user


    static constraints = {
        payee nullable: true, blank: true
        payer nullable: true, blank: true
    }
}
