SELECT sender_id, count(message_id) message_count

from messages

where sent_date between '8/1/2022' and '8/31/2022'

GROUP BY sender_id

order by message_count DESC

limit 2