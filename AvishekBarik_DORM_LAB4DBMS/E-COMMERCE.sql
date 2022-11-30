CREATE DATABASE IF NOT EXISTS e_commerce;
use e_commerce;

CREATE TABLE IF NOT EXISTS supplier (SUPP_ID int, SUPP_NAME varchar(50) PRIMARY KEY, SUPP_CITY  varchar(50) NOT NULL, SUPP_PHONE varchar(50) NOT NULL);
CREATE TABLE IF NOT EXISTS customers (CUS_ID int PRIMARY KEY, CUS_NAME varchar(20) NOT NULL, CUS_PHONE varchar(10) NOT NULL, CUS_CITY varchar(30) NOT NULL, CUS_GENDER char);
CREATE TABLE IF NOT EXISTS category (CAT_ID int PRIMARY KEY, CAT_NAME varchar(20) NOT NULL);
CREATE TABLE IF NOT EXISTS product (PRO_ID int PRIMARY KEY, PRO_NAME varchar(20) NOT NULL DEFAULT('Dummy'),PRO_DESC varchar(60), CAT_ID int REFERENCES category(CAT_ID));
CREATE TABLE IF NOT EXISTS supplier_pricing (PRICING_ID int, PRO_ID int, SUPP_ID int, SUPP_PRICE int DEFAULT(0), PRIMARY KEY(PRICING_ID), FOREIGN KEY(PRO_ID) REFERENCES product(PRO_ID));
CREATE TABLE IF NOT EXISTS orders (ORD_ID int PRIMARY KEY, ORD_AMOUNT int NOT NULL, ORD_DATE date NOT NULL, CUS_ID int REFERENCES customer(CUS_ID), 
PRICING_ID int REFERENCES supplier_pricing(PRICING_ID));
CREATE TABLE IF NOT EXISTS rating (RAT_ID int PRIMARY KEY, ORD_ID int REFERENCES order_(ORD_ID), RAT_RATSTARS int NOT NULL);
#drop table supplier_pricing;
INSERT INTO supplier VALUES (1,		'Rajesh Retails'	,		'Delhi'	,	1234567890);
INSERT INTO supplier VALUES (2,		'Appario Ltd.'		,		'Mumbai',	2589631470);
INSERT INTO supplier VALUES (3,		'Knome products'	,		'Banglore',	9785462315);
INSERT INTO supplier VALUES (4,		'Bansal Retails'	,		'Kochi'	,	8975463285);
INSERT INTO supplier VALUES (5,		'Mittal Ltd.'		,		'Lucknow',	7898456532);

INSERT INTO customers VALUES (1	,	'AAKASH'	,	9999999999,		'DELHI'	,	'M');
INSERT INTO customers VALUES (2	,	'AMAN'		,	9785463215,		'NOIDA'	,	'M');
INSERT INTO customers VALUES (3	,	'NEHA'		,	9999999999,		'MUMBAI',	'F');
INSERT INTO customers VALUES (4	,	'MEGHA'		,	9994562399,		'KOLKATA',	'F');
INSERT INTO customers VALUES (5	,	'PULKIT'	,	7895999999,		'LUCKNOW',	'M');

INSERT INTO category VALUES(1,		'BOOKS');
INSERT INTO category VALUES(2,		'GAMES');
INSERT INTO category VALUES(3,		'GROCERIES');
INSERT INTO category VALUES(4,		'ELECTRONICS');
INSERT INTO category VALUES(5,		'CLOTHES');

INSERT INTO product VALUES(1,		'GTA V'				,	'Windows 7 and above with i5 processor and 8GB RAM'		,	2);
INSERT INTO product VALUES(2,		'TSHIRT'			,	'SIZE-L with Black, Blue and White variations'			,	5);
INSERT INTO product VALUES(3,		'ROG LAPTOP'		,	'Windows 10 with 15inch screen, i7 processor, 1TB SSD'	,	4);
INSERT INTO product VALUES(4,		'OATS'				,	'Highly Nutritious from Nestle'							,	3);
INSERT INTO product VALUES(5,		'HARRY POTTER'		,	'Best Collection of all time by J.K Rowling'			,	1);
INSERT INTO product VALUES(6,		'MILK'				,	'1L Toned MIlk'											,	3);
INSERT INTO product VALUES(7,		'Boat Earphones'	,	'1.5Meter long Dolby Atmos'								,	4);
INSERT INTO product VALUES(8,		'Jeans'				,	'Stretchable Denim Jeans with various sizes and color'	,	5);
INSERT INTO product VALUES(9,		'Project IGI'		,	'compatible with windows 7 and above'					,	2);
INSERT INTO product VALUES(10,		'Hoodie'			,	'Black GUCCI for 13 yrs and above'						,	5);
INSERT INTO product VALUES(11,		'Rich Dad Poor Dad' ,	'Written by RObert Kiyosaki'							,	1);
INSERT INTO product VALUES(12,		'Train Your Brain'  ,	'By Shireen Stephen'									,	1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO orders VALUES(101,			1500	,	'2021-10-06',	2,		1);
INSERT INTO orders VALUES(102,			1000	,	'2021-10-12',	3,		5);
INSERT INTO orders VALUES(103,			30000	,	'2021-09-16',	5,		2);
INSERT INTO orders VALUES(104,			1500	,	'2021-10-05',	1,		1);
INSERT INTO orders VALUES(105,			3000	,	'2021-08-16',	4,		3);
INSERT INTO orders VALUES(106,			1450	,	'2021-08-18',	1,		9);
INSERT INTO orders VALUES(107,			789		,	'2021-09-01',	3,		7);
INSERT INTO orders VALUES(108,			780		,	'2021-09-07',	5,		6);
INSERT INTO orders VALUES(109,			3000	,	'2021-09-10',	5,		3);
INSERT INTO orders VALUES(110,			2500	,	'2021-09-10',	2,		4);
INSERT INTO orders VALUES(111,			1000	,	'2021-09-15',	4,		5);
INSERT INTO orders VALUES(112,			789		,	'2021-09-16',	4,		7);
INSERT INTO orders VALUES(113,			31000	,	'2021-09-16',	1,		8);
INSERT INTO orders VALUES(114,			1000	,	'2021-09-16',	3,		5);
INSERT INTO orders VALUES(115,			3000	,	'2021-09-16',	5,		3);
INSERT INTO orders VALUES(116,			99		,	'2021-09-17',	2,		14);

INSERT INTO rating VALUES(1	,	101	,	4);
INSERT INTO rating VALUES(2	,	102	,	3);
INSERT INTO rating VALUES(3	,	103	,	1);
INSERT INTO rating VALUES(4	,	104	,	2);
INSERT INTO rating VALUES(5	,	105	,	4);
INSERT INTO rating VALUES(6	,	106	,	3);
INSERT INTO rating VALUES(7	,	107	,	4);
INSERT INTO rating VALUES(8	,	108	,	4);
INSERT INTO rating VALUES(9	,	109	,	3);
INSERT INTO rating VALUES(10,	110	,	5);
INSERT INTO rating VALUES(11,	111	,	3);
INSERT INTO rating VALUES(12,	112	,	4);
INSERT INTO rating VALUES(13,	113	,	2);
INSERT INTO rating VALUES(14,	114	,	1);
INSERT INTO rating VALUES(15,	115	,	1);
INSERT INTO rating VALUES(16,	116	,	0);

#3.Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select cus_gender as gender,count(cus_gender) as costomers from customers where (select sum(ord_amount) from orders where orders.cus_id=customers.cus_id)>=3000
group by cus_gender;


#4.Display all the orders along with product name ordered by a customer having Customer_Id=2
select * from orders 
JOIN supplier_pricing ON supplier_pricing.PRICING_ID=orders.PRICING_ID
JOIN product ON  supplier_pricing.PRO_ID=product.PRO_ID
where CUS_ID=2;


#5.Display the Supplier details who can supply more than one product.
select * from supplier
WHERE supp_id 
in (select supp_id from supplier_pricing
group by supp_id
having count(supp_id)>1);

#6.Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select c.cat_id,c.cat_name, min(min_price)  from category c inner join
(select cat_id, pro_name, t1.min_price from product p inner join  
(select pro_id, min(supp_price) as min_price from supplier_pricing group by pro_id) 
as t1 where t1.pro_id = p.pro_id)
as t2 where t2.cat_id = c.cat_id group by c.cat_id;

#7.Display the Id and Name of the Product ordered after “2021-10-05”.
select p.pro_id, p.pro_name from product p, orders o,supplier_pricing sp
where o.ord_date>'2021-10-05' 
and p.pro_id=sp.pro_id
and sp.pricing_id=o.pricing_id;

#8.Display customer name and gender whose names start or end with character 'A'.
select cus_name,cus_gender from customers where cus_name like "%A" or cus_name like "A%";

#9.Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
#If rating >2 print “Average Service” else print “Poor Service”.

DELIMITER &&  
CREATE PROCEDURE Proc()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
	WHEN report.Average =5 THEN "Excellent Service"
	WHEN report.Average >4 THEN "Good Service"
	WHEN report.Average >2 THEN "Average Service"
	ELSE "Poor Service"
END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select orders.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from orders inner join rating on 
rating.ord_id = orders.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END &&  
DELIMITER ;  
call Proc();