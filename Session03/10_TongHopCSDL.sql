CREATE TABLE Departments (
   department_id serial primary key,
   department_name varchar(150) not null unique
);

CREATE TABLE Projects (
    project_id serial primary key,
    project_name varchar(255) not null,
    start_date date not null,
    end_date date check ( end_date > start_date )
);

CREATE TABLE Employees (
    emp_id serial primary key,
    name varchar(150) not null,
    dob date,
    department_id int REFERENCES Departments(department_id)
);

CREATE TABLE EmployeeProjects (
    emp_id int REFERENCES Employees(emp_id),
    project_id int REFERENCES Projects(project_id),
    primary key (emp_id,project_id)
);