select count(job_count) as duplicate_companies
from

(SELECT 
  company_id, 
  title, 
  description, 
  COUNT(job_id) AS job_count
FROM job_listings
GROUP BY title, description, company_id  
) as cte 
 where job_count>1