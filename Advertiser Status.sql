
  /*we create a full join between two tables to get the users current status and if paid or not"NuLL"
   and also to get users who paid and not in the advertiser users yet*/
  with cte as (
   SELECT 
    a.user_id AS user_status, 
    a.status, 
    d.paid, 
    d.user_id AS user_paid,
    CASE 
        WHEN a.user_id IS NULL THEN d.user_id 
        ELSE a.user_id 
    END AS user_id
FROM advertiser a
FULL OUTER JOIN daily_pay d
ON a.user_id = d.user_id
)
/*then we apply the conditions to get the update status of every user*/
SELECT 
    user_id,
    CASE 
        when user_status ISNULL then 'NEW'
        WHEN paid IS NULL THEN 'CHURN'
        WHEN paid IS NOT NULL AND status = 'CHURN' THEN 'RESURRECT'
        WHEN paid IS NOT NULL AND (status in( 'NEW' ,  'EXISTING' , 'RESURRECT')) THEN 'EXISTING'
    END AS new_status
FROM cte
order by user_id;

