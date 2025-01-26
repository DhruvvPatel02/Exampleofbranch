-- ANS 2
create table events (
    event_id decimal primary key,
    event_name varchar(255),
    start_date date,
    start_time time,
    end_timestamp timestamp(9),
    created_at timestamp with time zone
);

create table time_intervals (
    interval_id decimal primary key,
    description varchar(255),
    duration_years_months interval year to month,
    duration_days_seconds interval day to second(6)
);

-- ANS 3
create table Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(255),
    LAST_NAME VARCHAR(255),
    SALARY DECIMAL(10,2),
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(255)
);

create table Bonus (
    WORKER_REF_ID INT,
    BONUS_DATE DATE,
    BONUS_AMOUNT DECIMAL(10,2)
);

create table Title (
    WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(255),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Bonus(WORKER_REF_ID)
);

insert into Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
values
    (001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

insert into Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
values
    (1, '2016-02-20', 5000),
    (2, '2016-06-11', 3000),
    (3, '2016-02-20', 4000),
    (1, '2016-02-20', 4500),
    (2, '2016-06-11', 3500);

insert into Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
values
    (1, 'Manager', '2016-02-20 00:00:00'),
    (2, 'Executive', '2016-06-11 00:00:00'),
    (8, 'Executive', '2016-06-11 00:00:00'),
    (5, 'Manager', '2016-06-11 00:00:00'),
    (4, 'Asst. Manager', '2016-06-11 00:00:00'),
    (7, 'Executive', '2016-06-11 00:00:00'),
    (6, 'Lead', '2016-06-11 00:00:00'),
    (3, 'Lead', '2016-06-11 00:00:00');

SELECT SUBSTRING(FIRST_NAME, 1, 3) AS First_Three_Characters FROM Worker;

SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) AS Department_Length FROM Worker;

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Worker;

SELECT * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');

SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____H';

SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

SELECT FIRST_NAME, LAST_NAME FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;

SELECT DEPARTMENT, COUNT(*) AS Worker_Count FROM Worker GROUP BY DEPARTMENT ORDER BY Worker_Count DESC;

SELECT * FROM Worker LIMIT 10















