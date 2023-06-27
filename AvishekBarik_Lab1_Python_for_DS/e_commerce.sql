create table supplier(SUPP_ID int primary key, SUPP_NAME varchar(50), SUPP_CITY varchar(50), SUPP_PHONE varchar(10));

create table customer(CUS_ID INT NOT NULL, CUS_NAME VARCHAR(20) NULL DEFAULT NULL, CUS_PHONE VARCHAR(10), CUS_CITY varchar(30) , CUS_GENDER CHAR, PRIMARY KEY (CUS_ID));

create table category(CAT_ID INT NOT NULL, CAT_NAME VARCHAR(20) NULL DEFAULT NULL,PRIMARY KEY (CAT_ID));

create table product(PRO_ID INT NOT NULL, PRO_NAME VARCHAR(20) NULL DEFAULT NULL, PRO_DESC VARCHAR(60) NULL DEFAULT NULL, CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID));

create table product_details(PROD_ID INT NOT NULL, PRO_ID INT NOT NULL, SUPP_ID INT NOT NULL, 
PROD_PRICE INT NOT NULL, PRIMARY KEY (PROD_ID),FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID), FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID));

create table orders(ORD_ID INT NOT NULL, ORD_AMOUNT INT NOT NULL, ORD_DATE DATE, CUS_ID INT NOT NULL, PROD_ID INT NOT NULL, PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID), FOREIGN KEY (PROD_ID) REFERENCES PRODUCT_DETAILS(PROD_ID));
                          
create table rating(RAT_ID INT NOT NULL, CUS_ID INT NOT NULL, SUPP_ID INT NOT NULL, RAT_RATSTARS INT NOT NULL, 
PRIMARY KEY (RAT_ID),FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER (SUPP_ID), FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID));
                          
                          
INSERT INTO supplier VALUES (1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES (2,"Appario Ltd.","Mumbai",'2589631470');
 INSERT INTO supplier VALUES (3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES (4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES (5,"Mittal Ltd.","Lucknow",'7898456532');
                          
INSERT INTO customer VALUES(1, 'AAKASH', '9999999999', 'DELHI','M');
INSERT INTO customer VALUES(2, 'AMAN', '9785463215', 'NOIDA','M');
INSERT INTO customer VALUES(3, 'NEHA', '9999999998', 'MUMBAI','F');
INSERT INTO customer VALUES(4, 'MEGHA', '9994562399', 'KOLKATA','F');
INSERT INTO customer VALUES(5, 'PULKIT', '7895999999', 'LUCKNOW','M');

INSERT INTO category VALUES(1, 'BOOKS');
INSERT INTO category VALUES(2, 'GAMES');
INSERT INTO category VALUES(3, 'GROCERIES');
INSERT INTO category VALUES(4, 'ELECTRONICS');
INSERT INTO category VALUES(5, 'CLOTHES');

INSERT INTO product VALUES(1, 'GTA V', 'DFJDJFDJFDJFDJFJF', 2);
INSERT INTO product VALUES(2, 'TSHIRT', 'DFDFJDFJDKFD', 5);
INSERT INTO product VALUES(3, 'ROG LAPTOP', 'DFNTTNTNTERND', 4);
INSERT INTO product VALUES(4, 'OATS', 'REURENTBTOTH', 3);
INSERT INTO product VALUES(5, 'HARRY POTTER', 'NBEMCTHTJTH', 1);

INSERT INTO product_details VALUES(1, 1, 2, 1500);
INSERT INTO product_details VALUES(2, 3, 5, 30000);
INSERT INTO product_details VALUES(3, 5, 1, 3000);
INSERT INTO product_details VALUES(4, 2, 3, 2500);
INSERT INTO product_details VALUES(5, 4, 1, 1000);	

INSERT INTO orders VALUES(20, 1500, '2021-10-12', 3, 5);
INSERT INTO orders VALUES(2, 30500, '2021-09-16', 5, 2);
INSERT INTO orders VALUES(3, 2000, '2021-10-05', 1, 1);
INSERT INTO orders VALUES(4, 3500, '2021-08-16', 4, 3);
INSERT INTO orders VALUES(5, 2000, '2021-10-06', 2, 1);	

INSERT INTO rating VALUES(1, 2, 2, 4);
INSERT INTO rating VALUES(2, 3, 4, 3);
INSERT INTO rating VALUES(3, 5, 1, 5);
INSERT INTO rating VALUES(4, 1, 3, 2);
INSERT INTO rating VALUES(5, 4, 5, 4);


SELECT CUSTOMER.CUS_GENDER, COUNT(CUSTOMER.CUS_GENDER) AS COUNT FROM CUSTOMER 
INNER JOIN ORDERS ON CUSTOMER.CUS_ID=ORDERS.CUS_ID 
WHERE ORDERS.ORD_AMOUNT>=3000 GROUP BY CUSTOMER.CUS_GENDER;

SELECT ORDERS.*, PRODUCT.PRO_NAME FROM ORDERS, PRODUCT_DETAILS, PRODUCT 
WHERE ORDERS.CUS_ID=2 AND ORDERS.PROD_ID = PRODUCT_DETAILS.PROD_ID AND PRODUCT_DETAILS.PRO_ID = PRODUCT.PRO_ID;

SELECT SUPPLIER.* FROM SUPPLIER WHERE SUPPLIER.SUPP_ID IN 
             (SELECT SUPP_ID FROM PRODUCT_DETAILS GROUP BY SUPP_ID HAVING COUNT(SUPP_ID) > 1)
             GROUP BY SUPPLIER.SUPP_ID;
             
SELECT CATEGORY.* FROM ORDERS INNER JOIN PRODUCT_DETAILS ON ORDERS.PROD_ID = PRODUCT_DETAILS.PROD_ID 
             INNER JOIN PRODUCT ON PRODUCT.PRO_ID = PRODUCT_DETAILS.PRO_ID
             INNER JOIN CATEGORY ON CATEGORY.CAT_ID = PRODUCT.CAT_ID 
             WHERE ORDERS.ORD_AMOUNT = (SELECT MIN(ORD_AMOUNT) FROM ORDERS);
             
             
SELECT PRODUCT.PRO_ID, PRODUCT.PRO_NAME FROM PRODUCT 
             INNER JOIN PRODUCT_DETAILS ON PRODUCT.PRO_ID = PRODUCT_DETAILS.PRO_ID 
             INNER JOIN ORDERS ON ORDERS.PROD_ID = PRODUCT_DETAILS.PROD_ID 
             WHERE ORDERS.ORD_DATE > "2021-10-05";
             
SELECT SUPPLIER.SUPP_ID, SUPPLIER.SUPP_NAME, RATING.RAT_RATSTARS, CUSTOMER.CUS_NAME FROM RATING 
             INNER JOIN SUPPLIER ON RATING.SUPP_ID = SUPPLIER.SUPP_ID 
             INNER JOIN CUSTOMER ON RATING.CUS_ID = CUSTOMER.CUS_ID
             ORDER BY RATING.RAT_RATSTARS DESC LIMIT 3;
             
SELECT CUS_NAME, CUS_GENDER FROM CUSTOMER WHERE CUS_NAME LIKE '%A%';

SELECT SUM(ORD_AMOUNT) AS TOTAL_AMOUNT FROM ORDERS WHERE CUS_ID IN 
              (SELECT CUS_ID FROM CUSTOMER WHERE CUS_GENDER='M');
              
SELECT CUSTOMER.*, ORDERS.ORD_ID, ORDERS.ORD_AMOUNT, ORDERS.ORD_DATE, ORDERS.PROD_ID, PRODUCT.PRO_NAME FROM CUSTOMER 
              LEFT OUTER JOIN ORDERS ON CUSTOMER.CUS_ID=ORDERS.CUS_ID
              LEFT OUTER JOIN PRODUCT_DETAILS ON PRODUCT_DETAILS.PROD_ID=ORDERS.PROD_ID
              LEFT OUTER JOIN PRODUCT ON PRODUCT.PRO_ID=PRODUCT_DETAILS.PRO_ID;
              

                          
                          
                          
					
                          
                          
                          
                          
                          
                          