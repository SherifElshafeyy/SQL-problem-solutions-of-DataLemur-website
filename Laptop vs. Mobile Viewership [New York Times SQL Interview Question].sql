select sum(laptop_views) as laptop_views , sum(mobile_views) as mobile_views

FROM

(SELECT 
  CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END AS laptop_views, 
  

  CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END AS mobile_views
  
FROM viewership
 
) cte


--or

SELECT 
sum(  CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  

sum(  CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
  
FROM viewership

