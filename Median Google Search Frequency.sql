--link for problem: https://datalemur.com/questions/median-search-freq
--Median Google Search Frequency Data Lemeur Problems
--the generate series is gereating a series of 1 to num_users for each row and cross join lateral assign for each row the result from series 
--EX, for first row if first row searches = 1 , num_users = 2 then generate series is (1,2) and the result will be searches(1,1) , list(1,2)
with cte as (
select searches , list
from search_frequency
cross join lateral 
generate_series(1,num_users) as list
)

SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY searches) AS median
FROM cte