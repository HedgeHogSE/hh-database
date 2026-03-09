-- Таблица регионов
create table areas (
    id serial primary key,
    name varchar(255) not null
);


-- Таблица специализаций 
create table specializations (
    id serial primary key,
    name varchar(255) not null,
    parent_id integer references specializations(id) on delete cascade
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

create type currency_enum as enum (
    'RUB',
    'EUR',
    'USD',
    'GBP'
);

create type experience_enum as enum (
    'Без опыта',
    '1–3 года',
    '3–5 лет',
    '5+ лет'
);

create type employment_type_enum as enum (
    'Полная занятость',
    'Частичная',
    'Стажировка',
    'Проект'
);

create type work_format_enum as enum (
    'Удалённо',
    'В офисе',
    'Гибрид'
);

create type schedule_enum as enum (
    '5/2',
    '2/2',
    '6/1',
    '3/3',
    'По выходным'
);

create type payment_frequency_enum as enum (
    'Месяц',
    'Неделя',
    'День'
);

create type education_enum as enum (
    'Высшее',
    'Среднее',
    'Неполное высшее'
);


-- Таблица вакансий
create table vacancies (
    id serial primary key,
    title varchar(255) not null,
    description text,

    compensation_from integer check(compensation_from >= 0),
    compensation_to integer check(compensation_to >= 0),
    currency currency_enum,

    experience experience_enum,
    employment_type employment_type_enum,
    work_format work_format_enum,
    schedule schedule_enum,
    working_hours integer check (working_hours > 0),
	payment_frequency payment_frequency_enum,
    education education_enum,

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

    compensation_from integer check(compensation_from >= 0),
    compensation_to integer check(compensation_to >= 0),
    currency currency_enum,

    experience experience_enum,
    employment_type employment_type_enum,
    work_format work_format_enum,
    schedule schedule_enum,
    working_hours integer check (working_hours > 0),
    education education_enum,

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