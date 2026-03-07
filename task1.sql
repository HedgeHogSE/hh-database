-- Таблица регионов
create table areas (
    id serial primary key,
    name varchar(255) not null
);


-- Таблица специализаций 
create table specializations (
    id serial primary key,
    category varchar(255) not null, -- Подкатегория (по типу "Информационные технологии")
    name varchar(255) not null -- Категория (у "Информационные технологии" будет, к примеру, "DevOps")
);


-- Таблица пользователей
create table applicants (
    id serial primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    middle_name varchar(100)
);


-- Таблица компаний (или просто работодателей)
create table employers (
    id serial primary key,
    company_name varchar(255) not null,
    description text
);


-- Таблица вакансий
create table vacancies (
    id serial primary key,
    title varchar(255) not null,
    description text,

    compensation_from numeric check(compensation_from >= 0),
    compensation_to numeric check(compensation_to >= 0),
    currency varchar(3),

    experience varchar(100),
    employment_type varchar(100),
    work_format varchar(100),
    schedule varchar(100),
    working_hours integer check (working_hours > 0),
    payment_frequency varchar(100),
    education varchar(100),

    area_id integer not null references areas(id) on delete cascade,
    specialization_id integer not null references specializations(id) on delete cascade,
    employer_id integer not null references employers(id) on delete cascade,

    published_at timestamp not null
);


-- Таблице резюме
create table resumes (
    id serial primary key,
	title varchar(100),
    description text,

    compensation_from numeric check(compensation_from >= 0),
    compensation_to numeric check(compensation_to >= 0),
    currency varchar(3),

    experience varchar(100),
    employment_type varchar(100),
    work_format varchar(100),
    schedule varchar(100),
    working_hours integer check (working_hours > 0),
    education varchar(100),

    area_id integer not null references areas(id) on delete cascade,
    specialization_id integer not null references specializations(id) on delete cascade,
    applicant_id integer not null references applicants(id) on delete cascade,

    phone varchar(30),
    email varchar(255),

    created_at timestamp not null
);



-- Таблица откликов
create table applications (
    id serial primary key,

    vacancy_id integer not null references vacancies(id) on delete cascade,
    resume_id integer not null references resumes(id) on delete cascade,

    application_type varchar(100),

    created_at timestamp not null,
	unique (vacancy_id, resume_id)
);