SELECT p.page_id
from Pages p left join page_likes l
on p.page_id=  l.page_id 
where user_id is null
ORDER BY p.page_id