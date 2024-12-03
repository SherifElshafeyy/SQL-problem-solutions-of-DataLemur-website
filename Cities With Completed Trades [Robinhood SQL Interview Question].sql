SELECT distinct  (u.city) ,count(t.order_id)
from trades t join users u
on t.user_id = u.user_id
where status = 'Completed'
group by  (u.city) 
order by count(t.order_id) desc
limit 3