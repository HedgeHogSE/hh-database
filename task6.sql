create index idx_vacancies_area_id -- ускоряет агрегаты и фильтрацию вакансий по региону
on vacancies(area_id);

create index idx_vacancies_published_at -- ускоряет группировку и фильтрацию по дате публикации
on vacancies(published_at);

create index idx_applications_created_at
on applications(created_at); -- ускоряет выборку откликов по диапазону времени

create index idx_resumes_created_at
on resumes(created_at); -- ускоряет фильтрации, сортировки и группировки резюме по дате создания, что важно для запросов по месяцам или диапазонам дат