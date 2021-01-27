/*
In this query, we are creating a view to find the current customers that might be risky in the future. 
For this we found the average balance for the current customers in category C and checked which are 
the customers that have balances more than the average balance for that status category:
*/

use bank;

-- First step: Getting the balance = amount -payments for all the loans in status 'C' 
-- ordered by balance:
select *, sum(amount-payments) as Balance from bank.loan
where status = 'C'
group by loan_id
order by Balance;


drop view if exists running_contract_ok_balances;
create view running_contract_ok_balances as
select *, sum(amount-payments) as Balance from bank.loan
where status = 'C'
group by loan_id
order by Balance;

select * from bank.running_contract_ok_balances;

select * from bank.running_contract_ok_balances
where Balance > (select round(avg(Balance),2) from
bank.running_contract_ok_balances)
order by Balance desc
limit 20;

--
drop view if exists bank.running_contract_ok_balances;
create view bank.running_contract_ok_balances as
with cte_running_contract_ok_balances  as (
  select *, sum(amount-payments) as Balance
  from bank.loan
  where status = 'C'
  group by loan_id
  order by Balance
)
select * from cte_running_contract_ok_balances
where Balance > (
  select round(avg(Balance),2)
  from cte_running_contract_ok_balances
)
order by Balance desc
limit 20;

select * from bank.running_contract_ok_balances;



