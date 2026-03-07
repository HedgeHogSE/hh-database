insert into areas (name) values
('Москва'),
('Санкт-Петербург'),
('Саратов'),
('Энгельс'),
('Новосибирск'),
('Ростов-на-Дону'),
('Екатеринбург'),
('Казань'),
('Нижний Новгород'),
('Челябинск'),
('Самара'),
('Омск'),
('Уфа'),
('Пермь'),
('Воронеж'),
('Волгоград'),
('Краснодар'),
('Сочи'),
('Калининград'),
('Томск'),
('Владивосток');


insert into applicants (first_name, last_name, middle_name) values
('Александр','Ежак','Владимирович'),
('Дмитрий','Смирнов','Андреевич'),
('Максим','Кузнецов','Олегович'),
('Илья','Попов','Владимирович'),
('Андрей','Васильев','Петрович'),
('Никита','Соколов','Алексеевич'),
('Егор','Морозов','Игоревич'),
('Артём','Новиков','Дмитриевич'),
('Сергей','Фёдоров','Андреевич'),
('Павел','Михайлов','Сергеевич'),
('Ирина','Павлова','Олеговна'),
('Анна','Семёнова','Андреевна'),
('Мария','Голубева','Игоревна'),
('Ольга','Виноградова','Петровна'),
('Наталья','Богданова','Сергеевна'),
('Кирилл','Воробьёв','Дмитриевич'),
('Владислав','Тарасов','Андреевич'),
('Роман','Беляев','Игоревич'),
('Тимур','Комаров','Олегович'),
('Георгий','Орлов','Александрович'),
('Елена','Макарова','Андреевна'),
('Светлана','Никитина','Петровна'),
('Юлия','Захарова','Игоревна'),
('Дарья','Киселёва','Сергеевна'),
('Татьяна','Лебедева','Алексеевна'),
('Игорь','Поляков','Владимирович'),
('Олег','Крылов','Сергеевич'),
('Виктор','Жуков','Андреевич'),
('Константин','Соловьёв','Игоревич'),
('Михаил','Яковлев','Олегович');


insert into employers (company_name, description) values
('HeadHunter','Сервис, который помогает найти работу и подобрать персонал'),
('Яндекс','Российская IT-компания, интернет-сервисы и технологии'),
('Сбер','Крупнейший банк России и технологическая компания'),
('Тинькофф','Финтех компания'),
('VK','Интернет-компания, социальные сети и сервисы'),
('Ozon','Маркетплейс и e-commerce платформа'),
('Wildberries','Крупный онлайн-ритейлер'),
('JetBrains','Компания-разработчик инструментов для программистов'),
('Kaspersky','Разработка решений для кибербезопасности'),
('Luxoft','IT-консалтинг и разработка программного обеспечения'),
('EPAM','Глобальная IT-компания'),
('Avito','Сервис объявлений'),
('2ГИС','Геоинформационный сервис'),
('Газпром','Энергетическая компания'),
('Росатом','Государственная корпорация атомной энергии'),
('Ростелеком','Телекоммуникационная компания'),
('МТС','Мобильный оператор и IT сервисы'),
('X5 Group','Ритейл компания'),
('Лаборатория Касперского','Кибербезопасность'),
('Google','Международная технологическая компания'),
('Amazon','Глобальная e-commerce компания');


insert into specializations (category, name) values
('Информационные технологии', 'Backend разработчик'),
('Информационные технологии', 'Frontend разработчик'),
('Информационные технологии', 'Fullstack разработчик'),
('Информационные технологии', 'DevOps инженер'),
('Информационные технологии', 'QA инженер'),
('Информационные технологии', 'Data Scientist'),
('Информационные технологии', 'Mobile разработчик'),
('Информационные технологии', 'Системный администратор'),
('Маркетинг', 'Интернет-маркетолог'),
('Маркетинг', 'SEO специалист'),
('Маркетинг', 'SMM менеджер'),
('Финансы', 'Бухгалтер'),
('Финансы', 'Финансовый аналитик'),
('Продажи', 'Менеджер по продажам'),
('Продажи', 'Аккаунт-менеджер'),
('Дизайн', 'UX/UI дизайнер'),
('Дизайн', 'Графический дизайнер');


insert into vacancies (
    title, description, compensation_from, compensation_to, currency,
    experience, employment_type, work_format, schedule, working_hours,
    payment_frequency, education, area_id, specialization_id, employer_id, published_at
)
select
	'Вакансия №' || gs, --title
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. 
	Aenean commodo ligula eget dolor. Aenean massa. 
	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', --description
	floor(50000 + random() * 50000), --compensation_from
	floor(100000 + random() * 500000), --compensation_to
	(array['RUB','EUR','USD','GBP'])[floor(random()*4+1)], --currency
	(array['Без опыта','1–3 года','3–5 лет','5+ лет'])[floor(random()*4+1)], --experience
	(array['Полная занятость','Частичная','Стажировка','Проект'])[floor(random()*4+1)], --employment_type
	(array['Удалённо','В офисе','Гибрид'])[floor(random()*3+1)], --work_format
	(array['5/2','2/2','6/1','3/3','По выходным'])[floor(random()*5+1)], --schedule
	floor(1 + random() * 12)::numeric, --working_hours
	(array['Месяц','Неделя','День'])[floor(random()*3+1)], --payment_frequency
	(array['Высшее','Среднее','Неполное высшее'])[floor(random()*3+1)], --education
	floor(random()*(select max(id) from areas) + 1)::int, --area_id
	floor(random()*(select max(id) from specializations) + 1)::int, --specialization_id
	floor(random()*(select max(id) from employers) + 1)::int, --employer_id
	now() - random() * interval '1000 days' --published_at
	
from generate_series(1,10000) gs


insert into resumes (
	title, description, compensation_from, compensation_to, currency,
    experience, employment_type, work_format, schedule, working_hours,
    education, area_id, specialization_id, applicant_id, phone, email, created_at
)
select
	'Резюме №' || gs,  --title
	'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. 
	Aenean commodo ligula eget dolor. Aenean massa. 
	Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', --description
	floor(50000 + random() * 50000), --compensation_from
	floor(100000 + random() * 500000), --compensation_to
	(array['RUB','EUR','USD','GBP'])[floor(random()*4+1)], --currency
	(array['Без опыта','1–3 года','3–5 лет','5+ лет'])[floor(random()*4+1)], --experience
	(array['Полная занятость','Частичная','Стажировка','Проект'])[floor(random()*4+1)], --employment_type
	(array['Удалённо','В офисе','Гибрид'])[floor(random()*3+1)], --work_format
	(array['5/2','2/2','6/1','3/3','По выходным'])[floor(random()*5+1)], --schedule
	floor(1 + random() * 12)::numeric, --working_hours
	(array['Высшее','Среднее','Неполное высшее'])[floor(random()*3+1)], --education
	floor(random()*(select max(id) from areas) + 1)::int, --area_id
	floor(random()*(select max(id) from specializations) + 1)::int, --specialization_id
	floor(random()*(select max(id) from applicants) + 1)::int, --applicant_id
	'89876879952', --phone
	'ivanov.roman@ya.ru', --email
	now() - random() * interval '1000 days' --created_at
	
from generate_series(1,100000) gs


insert into applications (
    vacancy_id,
    resume_id,
    application_type,
    created_at
)
select
    floor(random()*10000 + 1)::int,
    floor(random()*100000 + 1)::int,
    (array['Приглашение', 'Собеседование', 'Отказ', 'Ожидание'])[floor(random()*4+1)],
    now() - random() * interval '365 days'
from generate_series(1,300000)
on conflict (vacancy_id, resume_id) do nothing; -- из за unique(vacancy_id, resume_id) 