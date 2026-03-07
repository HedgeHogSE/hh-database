select v.id, v.title
from vacancies as v
join applications as a on a.vacancy_id = v.id
where abs(v.published_at::date - a.created_at::date) <= 7
group by(v.id, v.title)
having count(v.id) > 5
order by v.id;