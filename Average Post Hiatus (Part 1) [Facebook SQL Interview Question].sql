

select user_id , (last_date) - (first_date) days_between

from

(SELECT user_id , max(date(post_date)) last_date , min(date(post_date)) first_date ,
count(post_id)

FROM posts

where post_date between '1/1/2021' and '12/31/2021'

group by user_id

having count(post_id) >2 ) as CTE