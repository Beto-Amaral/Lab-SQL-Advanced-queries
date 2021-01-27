-- Silly example: Get all the loans for which the status is 'B'

-- Example without any subquery
select * from bank.loan
where status = 'B';

-- Example with a subquery
with cte_loan as (
  select * from bank.loan
)
select * from cte_loan
where status = 'B';

-- Another example
--  Find the total amount and total balance of each customer in the transactions table 
--  and then pull more information on those customers by using a join between the CTE and the account table:

-- Inner query: Getting the total amount and balance for each customer
select account_id, round(sum(amount),2) as Total_amount, round(sum(balance),2) as Total_balance from bank.trans
group by account_id;

with cte_transactions as (
  select account_id, round(sum(amount),2), round(sum(balance),2)
  from bank.trans
  group by account_id
)
select * from cte_transactions ct
join bank.account a
on ct.account_id = a.account_id;