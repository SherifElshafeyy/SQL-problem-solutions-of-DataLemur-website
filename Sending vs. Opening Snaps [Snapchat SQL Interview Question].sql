
with cte as 
(
select 
 b.age_bucket,
 SUM(case when a.activity_type='open' then a.time_spent else 0 END) as open_time,
 SUM(case when a.activity_type='send' then a.time_spent else 0 END)as send_time,
 SUM(a.time_spent) as total_time
FROM
 activities as a inner join age_breakdown as b
on 
 a.user_id = b.user_id
where 
 a.activity_type in ('open','send')
group by 
 b.age_bucket
)


SELECT
 age_bucket,
 round (100.0 * send_time/total_time,2) as send_perc,
 round(100.0  * open_time/total_time,2) as open_perc
 
FROM
 cte


