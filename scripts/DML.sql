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

create table puma (
    id int,
    state_id int,
    name varchar(150),
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

create table census_datasets (
    id serial,
    description varchar(100),
    primary_table varchar(50),
    secondary_table varchar(50),
    primary key (id)
);

create table census_dataset_years(
    dataset_id int,
    year int,
    primary key (dataset_id, year),
    foreign key (dataset_id) references census_datasets(id)
);

create table census_variable_groups (
    id varchar(50),
    dataset_id int,
    description varchar(250),
    priority int,
    group_type int,
    primary key (dataset_id, id),
    foreign key (dataset_id) references census_datasets(id)
);

create table census_variable_group_type (
    id int,
    description varchar(50),
    primary key (id)
);

create table census_data_profile_variables (
    parent varchar(200),
    child varchar(200),
    primary key (parent, child)
);

create table census_data_profile_variable_groups(
    group_id varchar(15),
    primary key (group_id)
);

create table census_variables (
    id varchar(50),
    group_id varchar(50),
    dataset_id int,
    description varchar(250),
    primary key (id),
    foreign key (group_id, dataset_id) references census_variable_groups(id, dataset_id)
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

create table label_alias (
    variable_name varchar(50),
    alias varchar(50),
    primary key (variable_name)
);