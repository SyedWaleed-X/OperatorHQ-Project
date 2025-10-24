create table users (

id serial primary key,
name varchar(100) not null,
email varchar(100) not null unique,
role varchar (50)


);


create table projects(

    id serial primary key,
    project_name varchar(100) not null,
    start_date DATE,
    due_date date,

    lead_user_id int references users(id)

);

create table tasks (

    id serial primary key,
    task_description TEXT not null,

    status varchar(20) NOT NULL default 'To Do' check (status in ('To Do', 'In progress', 'Done')),

    project_id int not null references projects(id) on delete CASCADE,
    assigned_user_id int references users(id) on delete set null

)

create table internal_memos (

    id serial primary key,
    memo_title varchar(255) not null,
    memo_content TEXT,
    creation_date TIMESTAMP with time zone DEFAULT current_timestamp


);