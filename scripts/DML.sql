create table state (
    id int primary key,
    name varchar(50)
);

create table county (
    id int,
    state_id int,
    name varchar(50),
    foreign key (state_id) references state(id),
    primary key (id, state_id)
);

create table county_sub (
    id int,
    county_id int,
    state_id int,
    name varchar(50),
    foreign key (county_id, state_id) references county(id, state_id),
    primary key (id, county_id, state_id)
);

create table place (
    id int,
    state_id int,
    name varchar(50),
    foreign key (state_id) references state(id),
    primary key (id, state_id)
);

create table consolidated_city (
    id int,
    state_id int,
    name varchar(50),
    foreign key (state_id) references state(id),
    primary key (id, state_id)
);

create table bea_datasets (
    id varchar(50),
    description varchar(100),
    primary key (id)
);

create table bea_dataset_tables (
    id varchar(50),
    dataset_id varchar(50),
    description varchar(200),
    primary key (id, dataset_id),
    foreign key (dataset_id) references bea_datasets(id)
);