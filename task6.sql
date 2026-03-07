create index idx_applications_vacancy_id -- часто с помощью join будем склеивать applications и vacancies
on applications(vacancy_id);

create index idx_applications_resume_id --аналогично с idx_applications_vacancy_id
on applications(resume_id);

create index idx_vacancies_area_id -- ускоряет агрегаты и фильтрацию вакансий по региону
on vacancies(area_id);

create index idx_vacancies_published_at -- ускоряет группировку и фильтрацию по дате публикации
on vacancies(published_at);