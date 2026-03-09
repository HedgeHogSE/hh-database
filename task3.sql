select area_id, 
	avg(compensation_from) as avg_compensation_from,
	avg(compensation_to) as avg_compensation_to,
	avg((coalesce(compensation_to, 0) + coalesce(compensation_from, 0)) / 2) as avg_arithmetic_mean_from_and_to
from vacancies
group by area_id
order by area_id;

