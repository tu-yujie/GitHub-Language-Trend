use yt1421;

select 
language, 
total_number, 
created_at, 
rank() (over partition by created_at order by total_number desc) as ranking
from
(select 
language, 
count(1) as total_number, 
date_format(created_at, "yyyyMM") as created_time 
from cleanedProjects 
group by language, created_time 
order by total_number desc) temp
order by created_at, ranking desc;
