select TO_CHAR(published_at, 'Month') as "month", count(*) as max_num_vacancies
from vacancies
group by TO_CHAR(published_at, 'Month')
order by count(*) desc
limit 1;

select TO_CHAR(created_at, 'Month') as "month", count(*) as max_num_resumes
from resumes
group by TO_CHAR(created_at, 'Month')
order by count(*) desc
limit 1;