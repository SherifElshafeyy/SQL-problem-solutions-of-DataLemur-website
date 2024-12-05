/*perform  self join on the transaction tables with condition that the first timestamp
from first table less than timestamp from second table 
and timestamp from second table less than or equal to timestamp from first stable + 10 minutes
*/
 
with cte as (
select t.transaction_id ,
t.merchant_id,
t.credit_card_id,
t.amount,
t.transaction_timestamp, 
s.transaction_timestamp

    FROM transactions t
    JOIN transactions s
    ON
    t.merchant_id = s.merchant_id
    and
    t.credit_card_id=s.credit_card_id
    and
    t.amount=s.amount
    and 
    t.transaction_timestamp < s.transaction_timestamp
    and
    s."transaction_timestamp" <= t."transaction_timestamp" + INTERVAL '10' MINUTE )

select 
count(*) as payment_count
from cte 