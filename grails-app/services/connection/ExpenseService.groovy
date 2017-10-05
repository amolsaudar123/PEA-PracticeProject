package connection

import grails.transaction.Transactional

@Transactional
class ExpenseService {


    List<String> getBankName(String name) {

       Account.findAllByUserNameLike(name).collect { it.bankName }
    }

    def getByUserName(String nam){
        Expense.findAllByUserNameLike(nam).collect{it}
    }
    }
