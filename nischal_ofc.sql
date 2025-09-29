CREATE DATABASE nischal_office;
use nischal_office;
create table manu_ch (id int auto_increment primary key, name VARCHAR(100) NOT NULL, email varchar (100) unique, age int);
insert into manu_ch (name, email, age)
values
('Bhavya Sachdeva', 'bhavyasachdeva18@gmail.com', 26),
('Navodit Sachdeva', 'navoditsachdeva19@gmail.com', 28),
('Sanya Sachdeva', 'sanyasachdeva007@gmail.com', 31),
('Rohit Manik', 'rohitmanik22@gmail.com', 34);
select * from manu_ch
where age > 27;

select name, email from manu_ch;

update manu_ch
set name = 'Vishu Sachdeva'
where id = 3;

set sql_safe_updates = 0;

delete from manu_ch
where id = 3;

set sql_safe_updates = 1;
insert into manu_ch ( id, name, email, age)
values (3,'Sanya Sachdeva', 'sanyasachdeva07@gmail.com',  32);

select * from  manu_ch
order by age asc;

select * from manu_ch
where name like '%manik%';

select count(*) as total_users from manu_ch;

select avg(age) as average_age from manu_ch;

select age, count(*) as count_per_age
from manu_ch
group by age;

CREATE TABLE rahul_pa (
    order_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique ID for each order
    manu_id INT,                                -- Links to manu_ch table
    product_name VARCHAR(100),                  -- Name of the product
    amount DECIMAL(10,2),                       -- Price of the product
    FOREIGN KEY (manu_id) REFERENCES manu_ch(id)  -- Foreign key linking to manu_ch
);

show tables;
select * from rahul_pa;

insert into rahul_pa (manu_id, product_name, amount)
values
(1, 'Product A', 500.00),
(2, 'Product B', 1200.50),
(1, 'Product C', 750.25);

SELECT 
    r.order_id,
    r.product_name,
    r.amount,
    m.id AS manu_id,
    m.name AS manu_name,
    m.email,
    m.age
FROM rahul_pa r
JOIN manu_ch m
ON r.manu_id = m.id;

#Total orders per customer
SELECT m.name, COUNT(r.order_id) AS total_orders
FROM manu_ch m
LEFT JOIN rahul_pa r ON m.id = r.manu_id
GROUP BY m.name;

#Total amount spent per customer
SELECT m.name, SUM(r.amount) AS total_spent
FROM manu_ch m
JOIN rahul_pa r ON m.id = r.manu_id
GROUP BY m.name;

#Find customers with no orders
SELECT m.name, m.email
FROM manu_ch m
LEFT JOIN rahul_pa r ON m.id = r.manu_id
WHERE r.order_id IS NULL;

# Total amount spent by each customer and their name, email.
Select m.name, m.email, Sum(r.amount) AS total_spent
FROM manu_ch m
left join rahul_pa r ON m.id = r.manu_id
GROUP BY m.id, m.name, m.email;


select * from rahul_pa;
SELECT m.id, m.name, COUNT(r.order_id) AS Order_count
FROM manu_ch m
LEFT JOIN rahul_pa r ON m.id = r.manu_id
GROUP BY m.id, m.name
HAVING COUNT(r.order_id) > 1;

Select m.id, m.name, m.email, r.product_name, r.amount
from manu_ch m
left join rahul_pa r on m.id = r.manu_id
order by r.amount desc;

Select m.name, m.email, sum(r.amount) as total_count
from manu_ch m
left join rahul_pa r on m.id = r.manu_id
group by m.name, m.email
having sum(r.amount) > 1250;

