-- TELECOMUNICATION DATABASE MANAGEMENT SYSTEM

create database main
use main


-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(15),
    city VARCHAR(50));
INSERT INTO Customers VALUES
(1,'Amit Sharma','9876543210','Delhi'),(2,'Priya Singh','9876543211','Mumbai'),
(3,'Ravi Kumar','9876543212','Chennai'),(4,'Sneha Patel','9876543213','Bangalore'),
(5,'Arjun Reddy','9876543214','Hyderabad'),(6,'Neha Gupta','9876543215','Kolkata'),
(7,'Rohan Das','9876543216','Pune'),(8,'Meera Nair','9876543217','Kochi'),
(9,'Vikram Joshi','9876543218','Jaipur'),(10,'Anjali Mehta','9876543219','Ahmedabad'),
(11,'Kiran Rao','9876543220','Goa'),(12,'Suresh Iyer','9876543221','Coimbatore'),
(13,'Pooja Mishra','9876543222','Lucknow'),(14,'Manish Yadav','9876543223','Patna'),
(15,'Aisha Khan','9876543224','Bhopal'),(16,'Rahul Verma','9876543225','Chandigarh'),
(17,'Deepak Roy','9876543226','Ranchi'),(18,'Swati Agarwal','9876543227','Nagpur'),
(19,'Abhinav Singh','9876543228','Indore'),(20,'Kavya Menon','9876543229','Trivandrum'),
(21,'Harshita Jain','9876543230','Surat'),(22,'Mohit Choudhary','9876543231','Udaipur'),
(23,'Divya Rathi','9876543232','Noida'),(24,'Sameer Khan','9876543233','Gurgaon'),
(25,'Alok Pandey','9876543234','Varanasi');
select*from customers

-- 2. Plans Table
CREATE TABLE Plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    price DECIMAL(10,2),
    validity_days INT,
    data_limit VARCHAR(20)
);

INSERT INTO Plans VALUES
(101,'Daily 1GB',199,28,'1GB/day'),(102,'Daily 2GB',249,28,'2GB/day'),
(103,'Unlimited Calls',299,28,'1.5GB/day'),(104,'Work From Home',399,56,'3GB/day'),
(105,'Super Saver',599,84,'1.5GB/day'),(106,'Annual Basic',1499,365,'1GB/day'),
(107,'Annual Plus',2499,365,'2GB/day'),(108,'Weekend Booster',99,7,'5GB'),
(109,'Student Pack',129,21,'1.5GB/day'),(110,'Talktime Long',999,180,'Unlimited'),
(111,'Budget Pack',79,14,'500MB/day'),(112,'Premium Pack',349,28,'3GB/day'),
(113,'Corporate Plan',1999,365,'Unlimited'),(114,'Family Pack',2999,365,'Unlimited'),
(115,'Roaming Pack',499,28,'2GB/day'),(116,'Ultra Fast',599,28,'4GB/day'),
(117,'Basic Mini',49,7,'200MB/day'),(118,'Night Owl',199,28,'Unlimited 12am-6am'),
(119,'OTT Special',299,30,'2GB/day + OTT'),(120,'5G Trial',99,14,'10GB total');
select*from Plans

-- 3. Recharges Table
CREATE TABLE Recharges (
    recharge_id INT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    recharge_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);
INSERT INTO Recharges VALUES
(1,1,101,'2025-09-01',199),(2,2,102,'2025-09-02',249),
(3,3,103,'2025-09-03',299),(4,4,104,'2025-09-04',399),
(5,5,105,'2025-09-05',599),(6,6,106,'2025-09-06',1499),
(7,7,107,'2025-09-07',2499),(8,8,108,'2025-09-08',99),
(9,9,109,'2025-09-09',129),(10,10,110,'2025-09-10',999),
(11,11,111,'2025-09-11',79),(12,12,112,'2025-09-12',349),
(13,13,113,'2025-09-13',1999),(14,14,114,'2025-09-14',2999),
(15,15,115,'2025-09-15',499),(16,16,116,'2025-09-16',599),
(17,17,117,'2025-09-17',49),(18,18,118,'2025-09-18',199),
(19,19,119,'2025-09-19',299),(20,20,120,'2025-09-20',99),
(21,21,101,'2025-09-21',199),(22,22,102,'2025-09-22',249),
(23,23,103,'2025-09-23',299),(24,24,104,'2025-09-24',399),
(25,25,105,'2025-09-25',599);
select*from Recharges

-- 4. Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    recharge_id INT,
    payment_mode VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (recharge_id) REFERENCES Recharges(recharge_id)
);

INSERT INTO Payments VALUES
(1,1,'UPI','2025-09-01'),(2,2,'Card','2025-09-02'),
(3,3,'Cash','2025-09-03'),(4,4,'NetBanking','2025-09-04'),
(5,5,'UPI','2025-09-05'),(6,6,'Card','2025-09-06'),
(7,7,'UPI','2025-09-07'),(8,8,'Cash','2025-09-08'),
(9,9,'UPI','2025-09-09'),(10,10,'Card','2025-09-10'),
(11,11,'NetBanking','2025-09-11'),(12,12,'UPI','2025-09-12'),
(13,13,'Card','2025-09-13'),(14,14,'UPI','2025-09-14'),
(15,15,'Cash','2025-09-15'),(16,16,'UPI','2025-09-16'),
(17,17,'Card','2025-09-17'),(18,18,'NetBanking','2025-09-18'),
(19,19,'UPI','2025-09-19'),(20,20,'Cash','2025-09-20'),
(21,21,'UPI','2025-09-21'),(22,22,'Card','2025-09-22'),
(23,23,'NetBanking','2025-09-23'),(24,24,'UPI','2025-09-24'),
(25,25,'Cash','2025-09-25');
select*from Payments

-- 5. Call Records
CREATE TABLE Call_Records (
    call_id INT PRIMARY KEY,
    customer_id INT,
    call_time DATETIME,
    duration INT,
    call_type VARCHAR(20),
    charge DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Call_Records VALUES
(1,1,'2025-09-01 10:30:00',5,'Outgoing',2.5),(2,2,'2025-09-01 11:00:00',3,'Incoming',0),
(3,3,'2025-09-01 12:10:00',10,'Outgoing',5),(4,4,'2025-09-01 13:15:00',8,'Outgoing',4),
(5,5,'2025-09-01 14:20:00',6,'Incoming',0),(6,6,'2025-09-01 15:30:00',12,'Outgoing',6),
(7,7,'2025-09-01 16:40:00',15,'Outgoing',7.5),(8,8,'2025-09-01 17:50:00',4,'Incoming',0),
(9,9,'2025-09-01 18:00:00',7,'Outgoing',3.5),(10,10,'2025-09-01 19:15:00',9,'Outgoing',4.5),
(11,11,'2025-09-02 09:00:00',11,'Incoming',0),(12,12,'2025-09-02 10:20:00',20,'Outgoing',10),
(13,13,'2025-09-02 11:45:00',2,'Outgoing',1),(14,14,'2025-09-02 12:10:00',18,'Outgoing',9),
(15,15,'2025-09-02 13:25:00',25,'Outgoing',12.5),(16,16,'2025-09-02 14:40:00',30,'Outgoing',15),
(17,17,'2025-09-02 15:00:00',3,'Incoming',0),(18,18,'2025-09-02 16:30:00',5,'Outgoing',2.5),
(19,19,'2025-09-02 17:20:00',8,'Outgoing',4),(20,20,'2025-09-02 18:10:00',10,'Outgoing',5),
(21,21,'2025-09-02 19:30:00',12,'Outgoing',6),(22,22,'2025-09-02 20:15:00',7,'Incoming',0);
select*from Call_Records

-- 6. SMS Records
CREATE TABLE SMS_Records (
    sms_id INT PRIMARY KEY,
    customer_id INT,
    sms_time DATETIME,
    sms_type VARCHAR(20),
    charge DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO SMS_Records VALUES
(1,1,'2025-09-01 09:00:00','Local',0.5),(2,2,'2025-09-01 09:30:00','Local',0.5),
(3,3,'2025-09-01 10:00:00','International',5),(4,4,'2025-09-01 11:00:00','Local',0.5),
(5,5,'2025-09-01 12:00:00','Promotional',0),(7,7,'2025-09-01 13:00:00','International',5),
(8,8,'2025-09-01 14:00:00','Local',0.5),(9,9,'2025-09-01 15:30:00','Local',0.5),
(10,10,'2025-09-01 16:00:00','Promotional',0),(11,11,'2025-09-01 16:30:00','Local',0.5),
(12,12,'2025-09-01 17:00:00','Local',0.5),(13,13,'2025-09-01 17:45:00','International',5),
(14,14,'2025-09-01 18:30:00','Promotional',0),(15,15,'2025-09-01 19:00:00','Local',0.5),
(16,16,'2025-09-01 19:20:00','Local',0.5),(17,17,'2025-09-01 19:40:00','International',5),
(18,18,'2025-09-01 20:00:00','Local',0.5),(19,19,'2025-09-01 20:15:00','Promotional',0),
(20,20,'2025-09-01 20:30:00','Local',0.5),(21,21,'2025-09-01 21:00:00','Local',0.5),
(22,22,'2025-09-01 21:30:00','International',5),(23,23,'2025-09-01 22:00:00','Local',0.5),
(24,24,'2025-09-01 22:30:00','Promotional',0),(25,25,'2025-09-01 23:00:00','Local',0.5);
select*from SMS_Records

-- 7. Internet Usage
CREATE TABLE Internet_Usage (
    usage_id INT PRIMARY KEY,
    customer_id INT,
    usage_date DATE,
    data_used_mb DECIMAL(10,2),
    charge DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Internet_Usage VALUES
(1,1,'2025-09-01',500,0),(2,2,'2025-09-01',1200,10),
(3,3,'2025-09-01',800,0),(4,4,'2025-09-01',1500,15),
(5,5,'2025-09-01',300,0),(6,6,'2025-09-01',2200,20),
(7,7,'2025-09-01',1000,0),(8,8,'2025-09-01',750,0),
(9,9,'2025-09-01',900,0),(10,10,'2025-09-01',2500,25),
(11,11,'2025-09-02',600,0),(12,12,'2025-09-02',1800,18),
(13,13,'2025-09-02',400,0),(14,14,'2025-09-02',2100,21),
(15,15,'2025-09-02',1300,0),(16,16,'2025-09-02',3000,30),
(17,17,'2025-09-02',700,0),(18,18,'2025-09-02',1600,16),
(19,19,'2025-09-02',900,0),(20,20,'2025-09-02',2700,27),
(21,21,'2025-09-02',1100,0),(22,22,'2025-09-02',2000,20),
(23,23,'2025-09-02',800,0),(24,24,'2025-09-02',1500,15),
(25,25,'2025-09-02',2400,24);
select*from Internet_Usage

-- 8. Towers
CREATE TABLE Towers (
    tower_id INT PRIMARY KEY,
    location VARCHAR(50),
    capacity INT,
    operator VARCHAR(50)
);

INSERT INTO Towers VALUES
(1,'Delhi',5000,'Airtel'),(2,'Mumbai',4500,'Jio'),
(3,'Chennai',4000,'Vodafone'),(4,'Bangalore',4800,'Jio'),
(5,'Hyderabad',4200,'Airtel'),(6,'Kolkata',3800,'BSNL'),
(7,'Pune',4100,'Jio'),(8,'Kochi',3600,'Airtel'),
(9,'Jaipur',3700,'Vodafone'),(10,'Ahmedabad',4300,'Jio'),
(11,'Goa',3000,'BSNL'),(12,'Coimbatore',3500,'Airtel'),
(13,'Lucknow',3300,'Vodafone'),(14,'Patna',3200,'Jio'),
(15,'Bhopal',3400,'Airtel'),(16,'Chandigarh',3100,'Jio'),
(17,'Ranchi',3250,'Vodafone'),(18,'Nagpur',3450,'Airtel'),
(19,'Indore',3550,'Jio'),(20,'Trivandrum',3600,'BSNL');
select*from towers

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUESTIONS
-- 1. Basic Queries

select name,phone_number,city from customers
select*from Plans where price>500
select*from customers where city in("Delhi","Mumbai")
select*from Payments where payment_mode='UPI'
select*from towers where operator='JIO'
select distinct *from customers
select*from customers where name like "R%"
select*from  customers where name like "%a%r"
select*from Plans where price between 500 and 1000
select*from Plans where price is null
select*from  Recharges order by amount
select*from  Payments where (payment_mode="cash") order by payment_id;
select*from Call_Records where charge>5
select*from customers where customer_id in(5,14,23)
select*from Plans where (data_limit="2GB/day" and validity_days>28)
select*from Plans where not(data_limit="2GB/day" or validity_days>28)

-- 2.joins & relations

-- Show all customers with their recharge plan names.
select a.Name, c.Plan_Name from Customers as a join Recharges as b
on a.Customer_id = b.Customer_id join Plans as c on b.Plan_id = c.Plan_id;

-- Display customers, their recharge date, and payment mode.
select a.Name, b.recharge_date,c.payment_mode from Customers as a join Recharges as b
on  a.Customer_id = b.Customer_id join payments as c on b.recharge_id=c.recharge_id

-- Display customers, their recharge date,payment mode,call_type and data_used_mb.
select a.Name,b.recharge_date,c.payment_mode,d.call_type,e.data_used_mb from Customers as a join Recharges as b
on  a.Customer_id = b.Customer_id join payments as c on b.recharge_id=c.recharge_id join Call_Records as d on a.Customer_id=d.Customer_id
join Internet_Usage as e on a.Customer_id=e.Customer_id

-- Find which customers have never done a recharge. 
select a.Name from Customers as a left join Recharges as b
on a.Customer_id = b.Customer_id where b.recharge_id is null

--  Show total amount spent by each customer on recharges.
select a.Name,b.amount from Customers as a join Recharges as b
on a.Customer_id = b.Customer_id 

-- List all call records with customer names and call charges.
select a.Name,b.charge from Customers as a join Call_Records as b
on a.Customer_id = b.Customer_id 

-- GROUP BY Questions

-- a. Show the number of customers in each city:
SELECT city, COUNT(*) AS total_customers from Customers GROUP BY city;

-- b. Find how many customers are using each plan:

SELECT b.plan_name, COUNT(a.customer_id) AS total_users FROM 
Recharges as a JOIN Plans b ON a.plan_id = b.plan_id GROUP BY b.plan_name;

-- c. Total revenue collected by each payment mode:

SELECT payment_mode, SUM(payment_mode) AS total_revenue
FROM Payments GROUP BY payment_mode;

-- d. Show total call duration per customer:

SELECT a.name, SUM(b.duration) AS total_call_seconds
FROM Call_Records as b JOIN Customers a ON b.customer_id = a.customer_id GROUP BY a.name;

-- e. Show total SMS count by type (local vs international):

SELECT sms_type, COUNT(*) AS total_sms
FROM SMS_Records GROUP BY sms_type;

-- f. Show total recharge amount grouped by plan:

SELECT a.plan_name, SUM(a.price) AS total_revenue
FROM Recharges as b JOIN Plans as a ON b.plan_id = a.plan_id GROUP BY a.plan_name;

-- Having

-- a. Cities with more than 1 customer
SELECT city, COUNT(*) AS total_customers
FROM Customers GROUP BY city
HAVING COUNT(*) > 0;

-- b. Plans with more than 2 users
SELECT p.plan_name, COUNT(r.customer_id) AS total_users
FROM Recharges r
JOIN Plans p ON r.plan_id = p.plan_id GROUP BY p.plan_name HAVING COUNT(r.customer_id) > 1;

-- c. Count the Payment modes 
SELECT payment_mode, count(payment_mode) AS total_revenue
FROM Payments GROUP BY payment_mode HAVING count(payment_mode) >'UPI';

-- UNION

-- a. List all customer names and plan names in one column
SELECT name  FROM Customers
UNION
SELECT plan_name FROM Plans;

-- b. List all cities and tower locations in one column
SELECT city AS location
FROM Customers
UNION
SELECT location AS location
FROM Towers;

-- c. List all payment modes and SMS types in one column
SELECT payment_mode AS type_or_mode
FROM Payments
UNION
SELECT sms_type AS type_or_mode
FROM SMS_Records;

select a.Name, c.Plan_Name from Customers as a left join Recharges as b
on a.Customer_id = b.Customer_id left join Plans as c on b.Plan_id = c.Plan_id 
union 
select a.Name, c.Plan_Name from Customers as a right join Recharges as b
on a.Customer_id = b.Customer_id right join Plans as c on b.Plan_id = c.Plan_id;

-- IF AND CASE

select Customer_id,sms_type,if(sms_type = 'Local','Free','Money Charged')as Charge from SMS_Records;


select plan_id,plan_name,price,validity_days,data_limit,case when data_limit>= '3GB/day' then 'more data used'
								   when data_limit between '2GB/day' and '1.5GB/day' then 'average data used'
									else 'less data used'
                                    end as 'Data Used' from plans;


select customer_id,call_time,duration,call_type,charge,case when duration>=25 then 'high cost charged'
								   when duration between 15 and 20 then 'medium cost charged'
									else 'low cost charged'
                                    end as performance from Call_Records;

select customer_id,usage_date,data_used_mb,case when data_used_mb>=500 then 'high'
								   when data_used_mb between 500 and 1000 then 'medium'
									else 'low'
                                    end as performance from Internet_Usage;
                                    
                                    
-- sub query
select*from Customers where name =any(select name from Customers where name in ("Neha Gupta","Aisha Khan"))


-- demo view
create view demoview as select*from Customers where customer_id =14
select*from demoview


-- stored procedure
sample -->   call main.proj();
