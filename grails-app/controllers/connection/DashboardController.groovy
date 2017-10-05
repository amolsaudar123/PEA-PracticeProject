package connection

import grails.converters.JSON

class DashboardController {

    def dashboardService

    def onLogin() {

        def newUserName = session.user
        if (newUserName){
            List<AccountSummary> accountSummaries = dashboardService.calculateBalance(newUserName)

            def expenses = dashboardService.getExpeses(newUserName)
            def previousMonthSpending=dashboardService.getMonthlySpending(newUserName)
            def currentMonthSpening=dashboardService.getCurrentMonthSpending(newUserName)
           // def status= previousMonthSpending>currentMonthSpening ? "You Spend ${previousMonthSpending-currentMonthSpening} rupee less in this month" : previousMonthSpending<currentMonthSpening ? "In this Month You Spend ${currentMonthSpening-previousMonthSpending} INR more  " :"Same Spending"

            render(view: 'onLogin', model: [expenses: expenses, accountSummaries: accountSummaries, previousMonthSpending:previousMonthSpending, currentMonthSpening:currentMonthSpening])
        }else {
            render(view: 'onLogin', model: [expenses: [], accountSummaries: []])
        }


    }

    def profile() {


    }
}

