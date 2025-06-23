CREATE TABLE BOOKS
( BOOK_ID  INT	PRIMARY KEY,
TITLE	VARCHAR(100),	
AUTHOR	VARCHAR(100),	
GENRE	VARCHAR(50),	
PUBLISHED_YEAR	INT	,
PRICE NUMERIC(10,2),	
STOCK	INT	
);

CREATE TABLE CUSTOMERS
(
Customer_ID	INT 	PRIMARY KEY,
Name	VARCHAR(50),	
Email	VARCHAR(50),	
Phone	INT ,	
City	VARCHAR(50),	
Country	VARCHAR(50)	
);

CREATE TABLE ORDERS
(Order_ID	INT	PRIMARY KEY,
Customer_ID	INT REFERENCES CUSTOMERS(CUSTOMER_ID)	,
Book_ID	INT	REFERENCES BOOKS(BOOK_ID),
Order_Date	DATE ,	
Quantity	INT	,
Total_Amount	NUMERIC(10,2)	
);

DROP TABLE ORDERS;

SELECT * FROM BOOKS;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;

-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM BOOKS
WHERE GENRE = 'Fiction';



-- 2) Find books published after the year 1950:
SELECT * FROM BOOKS
WHERE PUBLISHED_YEAR > 1950;


-- 3) List all customers from the Canada:
SELECT * FROM CUSTOMERS
WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-11-1' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(STOCK) AS TOTAL_STOCK FROM BOOKS;

-- 6) Find the details of the most expensive book:
SELECT * FROM BOOKS ORDER BY PRICE DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM ORDERS
WHERE QUANTITY >1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM ORDERS
WHERE TOTAL_AMOUNT > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT GENRE FROM BOOKS;

-- 10) Find the book with the lowest stock:
SELECT * FROM BOOKS ORDER BY STOCK ASC;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(TOTAL_AMOUNT) AS REVENUE FROM ORDERS;

-- Advance Questions : 
SELECT * FROM BOOKS;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;

-- 1) Retrieve the total number of books sold for each genre:
SELECT SUM(O.QUANTITY) AS TOTAL_NUMBER, B.GENRE FROM
ORDERS O
JOIN
BOOKS B
ON
O.BOOK_ID = B.BOOK_ID
GROUP BY B.GENRE;


-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(PRICE) AS AVG_PRCE FROM BOOKS
WHERE GENRE = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:
SELECT C.NAME,O.customer_id,COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM CUSTOMERS C JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMER_ID
GROUP BY C.NAME,O.CUSTOMER_ID
HAVING COUNT(ORDER_ID) >=2
;

-- 4) Find the most frequently ordered book:
SELECT O.BOOK_ID,B.TITLE,COUNT(O.BOOK_ID) AS FREQUENTLY_ORDER
FROM
ORDERS O
JOIN
BOOKS B
ON O.BOOK_ID = B.BOOK_ID
GROUP BY O.BOOK_ID,B.TITLE
ORDER BY FREQUENTLY_ORDER DESC
LIMIT 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT TITLE,GENRE, PRICE FROM BOOKS
WHERE GENRE = 'Fantasy'
ORDER BY PRICE DESC
LIMIT 3;








SELECT * FROM BOOKS;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMERS;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT B.AUTHOR,SUM(O.QUANTITY) AS TOTAL_QUANTITY
FROM
BOOKS B
JOIN
ORDERS O
ON
B.BOOK_ID = O.BOOK_ID
GROUP BY B.AUTHOR;

-- 7) List the cities where customers who spent over $30 are located :
SELECT C.CITY, O.TOTAL_AMOUNT FROM CUSTOMERS C JOIN ORDERS O
ON
C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE TOTAL_AMOUNT > 30 
GROUP BY C.CITY ,O.TOTAL_AMOUNT;

-- 8) Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;
