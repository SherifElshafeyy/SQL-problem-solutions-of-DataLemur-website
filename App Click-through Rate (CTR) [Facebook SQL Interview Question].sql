select app_id , round((100.0 * count_click/count_impression),2) as ctr
from 

(SELECT app_id,

 sum (case when event_type ='impression' then 1 else 0  end) as Count_impression,
 
 sum (case when event_type='click' then 1 else 0  end) as count_click

FROM events

where timestamp between '1/1/2022' and '12/31/2022'


group by app_id ) as cte