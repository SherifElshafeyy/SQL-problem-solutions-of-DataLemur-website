select number_of_tweets as tweet_bucket , count(user_id) as users_num

from

(select count(tweet_id) as number_of_tweets ,
user_id 
from tweets
where tweet_date between '1/1/2022' and '12/31/2022'
GROUP BY user_id) as cte

GROUP BY number_of_tweets