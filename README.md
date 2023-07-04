# Lab-SQL-Advanced-queries

Lesson_1(2).sql

Example 1: Get all the loans for which the status is 'B'

Example 2: Find the total amount and total balance of each customer in the transactions table and then pull more information on those customers by using a join between the CTE and the account table.

-- Inner query: Getting the total amount and balance for each customer

Lesson_2(2).sql

This query performs the following steps to find the current customers who might be risky in the future:

The first step is to calculate the balance for all loans in status 'C' by subtracting the payments made from the loan amount. The result is ordered by the balance in ascending order.

A view called "running_contract_ok_balances" is created to store the results of the previous step. The view includes the loan details and the calculated balance for each loan in status 'C'.

The query selects all rows from the "bank.running_contract_ok_balances" view where the balance is greater than the average balance for loans in status 'C'. The average balance is calculated using a subquery.

The result of the above query is sorted in descending order by balance and limited to the top 20 rows.

The view "bank.running_contract_ok_balances" is dropped and re-created using a CTE (Common Table Expression) named "cte_running_contract_ok_balances". The CTE performs the same calculations as in the previous steps.

The query selects rows from the CTE "cte_running_contract_ok_balances" where the balance is greater than the average balance calculated within the CTE. The result is sorted in descending order by balance and limited to the top 20 rows.

The final step is to select all rows from the "bank.running_contract_ok_balances" view to display the results.

Overall, this query identifies and retrieves information about current customers in status 'C' whose balances exceed the average balance for that status category, potentially indicating higher risk.


