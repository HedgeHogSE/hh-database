select v.id, v.title
from vacancies as v
join applications as a on a.vacancy_id = v.id
where a.created_at between v.published_at and v.published_at + INTERVAL '7 days'
group by v.id, v.title
having count(v.id) > 5
order by v.id;