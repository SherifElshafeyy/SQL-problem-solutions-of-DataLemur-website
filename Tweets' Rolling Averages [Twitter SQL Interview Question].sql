--this query git the 3 weight moving average of tweet count fot twitter users
-- the window function partition average of tweet counts for every user 


SELECT
  user_id,
  tweet_date,
  round(AVG(tweet_count) OVER (
    PARTITION BY user_id
    ORDER BY tweet_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg
FROM tweets;
