select Candidate_id 
FROM

(SELECT
  candidate_id ,count (skill)as number_of_skills
FROM candidates
WHERE 
skill IN ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id ) as cte

where number_of_skills = 3
order by candidate_id