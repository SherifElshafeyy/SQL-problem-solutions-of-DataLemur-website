SELECT
user_id , spend , transaction_date

from 
(

SELECT *,
 row_number() OVER (PARTITION BY user_id ORDER BY transaction_date) AS group_number

FROM transactions
) as cte
where group_number=3
