# Advanced-SQL
## PART 1:Advanced SQL commands

This Advanced SQL course offers a comprehensive and structured learning path for individuals seeking to expand their expertise in database management and querying. By delving into functions, stored procedures, triggers, views, and other advanced concepts, students are empowered to handle intricate data operations and enhance their efficiency in working with databases. With a practical hands-on approach, learners can not only gain theoretical knowledge but also gain practical experience that will prove invaluable in real-world scenarios. By completing this course, students can confidently demonstrate their ability to create, manage, and optimize SQL queries, setting the stage for successful and effective data manipulation and management in various professional settings.

# Introduction
The realm of database management and querying has evolved significantly, enabling organizations to extract meaningful insights and efficiently manage their data resources. In the context of relational databases, Structured Query Language (SQL) serves as the backbone, offering a wide array of functionalities to interact with data. One crucial aspect of SQL is the advanced level of proficiency that can be achieved through comprehensive training, allowing individuals to harness its capabilities for sophisticated tasks. 
This learning guide introduces the Advanced SQL course, building upon the foundation of SQL Fundamentals. This 75-hour self-directed practical training covers topics such as functions, procedures, triggers, views, and more, enabling students to master complex SQL operations and amplify their database management prowess.

## Modules
### Module 1: MySQL aggregate functions
#### a.Exercise 1.1: AVG 
The MySQL AVG() function is used to calculate the average value of a numeric column in a table. It takes a single argument, which is typically the column name or an expression involving column(s) on which you want to calculate the average. The result of the AVG() function is the arithmetic mean of all the values in the specified column e.g.

SELECT 
    AVG(buyprice) 'Average Price'
FROM
products;
The AVG(buyprice) part calculates the average value of the 'buyprice' column in the 'products' table.The AS 'Average Price' renames the calculated average value column to 'Average Price' in the result set.

#### b.Exercise 1.2: COUNT
The MySQL COUNT() function is used to count the number of rows in a table that satisfy a certain condition or have non-null values in a specified column. It is commonly used to determine the total number of records that meet a specific criterion. The function can also be used without any argument to count all rows in the table.
In your example:
The CREATE TABLE statement creates a table named count_demos with columns id and val.
The INSERT INTO statement inserts multiple rows into the count_demos table with different values for the val column, including some NULL values.
CREATE TABLE count_demos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    val INT
);
INSERT INTO count_demos(val) 
VALUES(1),(1),(2),(2),(NULL),(3),(4),(NULL),(5);
SELECT COUNT(*) FROM count_demos;

#### c.Exercise 1.3: SUM
The MySQL SUM() function is used to calculate the sum of all values in a specified column of a table. It adds up the numeric values in the specified column and returns the total sum.In the example:
CREATE TABLE sum_demo (
    n INT
);
-INSERT INTO sum_demo(n) 
VALUES(1),(1),(2),(NULL),(3);
SELECT 
    SUM(n)
FROM
    sum_demo;
The CREATE TABLE statement creates a table named sum_demo with a single column named n.The INSERT INTO statement inserts multiple rows into the sum_demo table with different values for the n column, including some NULL values.

#### d.Exercise 1.4: MIN 
The MySQL MIN() function is used to retrieve the minimum value from a specified column in a table. It finds the smallest value in the column and returns that value.
In the example query:
SELECT 
    MIN(buyPrice)
FROM
products;
The query calculates the minimum value from the 'buyPrice' column in the 'products' table. The result will be the smallest value found in that column.

#### e.Exercise 1.5: MAX 
The MySQL MAX() function is used to retrieve the maximum value from a specified column in a table. It finds the largest value in the column and returns that value. In the example query:
SELECT MAX(amount)
FROM payments;
The query calculates the maximum value from the 'amount' column in the 'payments' table. 

#### f.Exercise 1.6: GROUP_CONCAT
The MySQL GROUP_CONCAT() function is used to concatenate multiple values from a column into a single string, where the values are separated by a specified delimiter. It is often used with the GROUP BY clause to aggregate values from multiple rows into a single result.
The CREATE TABLE statement creates a table named t with a single column named v.The INSERT INTO statement inserts multiple rows into the t table with different values for the v column.The query:
CREATE TABLE t (
    v CHAR
);

INSERT INTO t(v) VALUES('A'),('B'),('C'),('B');

SELECT 
    GROUP_CONCAT(DISTINCT v
        ORDER BY v ASC
        SEPARATOR ';')
FROM
t;

### Module 2: MySQL string functions
a.Exercise 2.1: CONCAT
The MySQL CONCAT() function is used to concatenate multiple strings together. It takes one or more string values as arguments and combines them into a single string. In in the below examples:
SELECT CONCAT('MySQL','CONCAT');
SELECT 
    concat(contactFirstName,' ',contactLastName) Fullname
FROM
customers;
This query uses the CONCAT() function to concatenate the values of the 'contactFirstName' and 'contactLastName' columns with a space in between. The result will be a new column named 'Fullname' that contains the concatenated full names of the customers from the 'customers' table.

#### b.Exercise 2.2: LENGTH and CHAR_LENGTH
In MySQL, there are two functions related to string length: CHAR_LENGTH() and LENGTH(). These functions provide information about the length of strings, but they have different behaviors based on the character encoding used.
CHAR_LENGTH() function:
The CHAR_LENGTH() function is used to return the number of characters in a given string. It counts the number of characters based on the specified character set.
LENGTH() function:
The LENGTH() function returns the number of bytes in a string. It considers each character as a single byte, regardless of the actual character's length in multi-byte character sets.
In the below examples:
SHOW CHARACTER SET;
SET @s = CONVERT('MySQL String Length' USING ucs2);
SELECT CHAR_LENGTH(@s), LENGTH(@s);

#### c.Exercise 2.3: REPLACE
The MySQL REPLACE() function is used to search for a substring within a given string and replace all occurrences of that substring with another specified string. It's particularly useful when you need to modify or correct data in a text column. In the below examples:
UPDATE products 
SET 
    productDescription = REPLACE(productDescription,
        'abuot',
        'about');
This query performs an update on the 'products' table. It searches for the substring 'abuot' within the 'productDescription' column and replaces all occurrences with the correct spelling 'about'. For instance, if you have a row in the 'products' table with 'productDescription' containing 'This is abuot the product', after running the update query, the value will be updated to 'This is about the product'.
 The REPLACE() function is very useful when you need to perform batch updates to correct or modify data in text columns across multiple rows. It can save you time and effort by automatically making changes to large amounts of data in a consistent way.

#### d.Exercise 2.4: SUBSTRING
The MySQL SUBSTRING() function is used to extract a portion of a given string based on the specified starting position and length. It allows you to extract substrings from a string column or a literal string. In the examples:
SELECT SUBSTRING('MYSQL SUBSTRING', 7);
SELECT SUBSTRING('MySQL SUBSTRING' FROM 1 FOR 5); -- MySQL
SELECT SUBSTRING('MySQL SUBSTRING' FROM -15 FOR 5); -- MySQL
This query is similar to the previous one, but it uses a negative starting position to count from the end of the string.  The negative starting position counts from the end of the string. In this case, it starts 15 characters from the end and extracts the same substring 'MySQL' with a length of 5 characters.
The SUBSTRING() function is useful when you want to extract specific parts of a string, such as words, phrases, or sections, based on their position and length within the string.


#### e.Exercise 2.5: LEFT
The MySQL LEFT() function is used to extract a specified number of characters from the left (start) of a given string. It allows you to retrieve a substring from the beginning of a string up to a certain length.
SELECT LEFT('MySQL LEFT', 5);
SELECT LEFT('MySQL LEFT', 0);
SELECT LEFT('MySQL LEFT', -2);
This query uses a negative length (-2) in the LEFT() function to attempt to extract characters from the left of the string 'MySQL LEFT'. MySQL interprets a negative length as 0, resulting in an empty string
The LEFT() function is useful when you want to retrieve a portion of a string starting from the left side of the string, up to a specified length. It's often used for tasks like truncating strings or extracting prefixes from text.

#### f.Exercise 2.6: FIND_IN_SET
The MySQL FIND_IN_SET() function is used to search for a specified string within a comma-separated list of values. It returns the position (index) of the searched string in the list, or 0 if the string is not found.
SELECT FIND_IN_SET('y','x,y,z'); -- 2
SELECT FIND_IN_SET('a','x,y,z');
CREATE TABLE IF NOT EXISTS divisions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    belts VARCHAR(200) NOT NULL
);
INSERT INTO divisions(name,belts)
VALUES ('O-1','white,yellow,orange'),
	('O-2','purple,green,blue'),
	('O-3','brown,red,black'),
	('O-4','white,yellow,orange'),
	('O-5','purple,green,blue'),
	('O-6','brown,red'),
	('O-7','black'),
	('O-8','white,yellow,orange'),
	('O-9','purple,green,blue'),
	('O-10','brown,red');
SELECT 
    name, 
    belts
FROM
    divisions
WHERE
FIND_IN_SET('red', belts);
This query selects the 'name' and 'belts' columns from the 'divisions' table for rows where the 'belts' column contains the string 'red'. It uses the FIND_IN_SET() function to perform the search within the comma-separated list of belts.
Assuming the 'belts' column contains values like 'white,yellow,orange', 'purple,green,blue', etc., the result will include rows where 'red' is found in the 'belts' list. The FIND_IN_SET() function is particularly useful when you have data stored as comma-separated values, such as tags, categories, or options, and you need to query based on specific values within those lists.







#### g.Exercise 2.7: TRIM
The MySQL TRIM() function is used to remove specified characters or spaces from the beginning, end, or both sides of a string. It helps to clean up and format text data by removing unwanted leading and trailing characters.
SELECT TRIM(' MySQL TRIM Function ');
SELECT TRIM(LEADING FROM '    MySQL TRIM Function   ');
The result is the same as the first query. However, in this case, only leading spaces are removed.

The TRIM() function is useful when you want to remove unnecessary spaces or specific characters from the beginning, end, or both ends of a string. It's often used to clean up data before performing comparisons or storing it in a database.

h.Exercise 2.8: INSTR
The MySQL INSTR() function is used to find the position (index) of a substring within a given string. It returns the position of the first occurrence of the substring in the string, or 0 if the substring is not found.
SELECT INSTR('MySQL INSTR', 'MySQL');
SELECT INSTR('MySQL INSTR', 'mysql');
EXPLAIN SELECT 
    productname
FROM
    products
WHERE
instr(productname,'1900');
This query uses the INSTR() function within a SELECT statement to search for the substring '1900' within the 'productname' column of the 'products' table. The EXPLAIN keyword is used to analyze how the query will be executed. The INSTR() function can be helpful when you need to locate specific substrings within text data or perform searches within larger strings, such as descriptions or titles.


Module 3: MySQL date , time and comparison functions
a.Exercise 3.1: DATEDIF
The MySQL DATEDIFF() function is used to calculate the difference in days between two date values. It returns the number of days between the specified dates, considering the start date and end date.
SELECT DATEDIFF('2011-08-17', '2011-08-17'); -- 0 day
SELECT 
    orderNumber, 
    DATEDIFF(requiredDate, shippedDate) daysLeft
FROM
    orders
ORDER BY daysLeft DESC;
This query calculates the difference in days between the 'requiredDate' and 'shippedDate' columns of the 'orders' table for each order. The calculated difference is assigned the alias 'daysLeft'. The results are ordered in descending order based on the calculated difference.

The result will include a list of order numbers along with the number of days left between the required date and the shipped date for each order. Orders with the longest delay will appear first in the result set.
The DATEDIFF() function is commonly used when you need to calculate the time duration between two date values, such as measuring the time elapsed between order placement and order shipment.





#### b.Exercise 3.2: DATE_FORMAT
The MySQL DATE_FORMAT() function is used to format a date value into a specific string representation according to a specified format string. It allows you to customize how dates are displayed in the result set.
SELECT 
    orderNumber,
    DATE_FORMAT(orderdate, '%Y-%m-%d') orderDate,
    DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
    DATE_FORMAT(shippedDate, '%W %D %M %Y') shippedDate
FROM
orders;
This query retrieves data from the 'orders' table and uses the DATE_FORMAT() function to format the date values in different ways. DATE_FORMAT(orderdate, '%Y-%m-%d'): This formats the 'orderdate' column using the format '%Y-%m-%d', which represents the year, month, and day in the 'YYYY-MM-DD' format.
DATE_FORMAT(requireddate, '%a %D %b %Y'): This formats the 'requireddate' column using the format '%a %D %b %Y', which represents the abbreviated weekday name, day of the month with ordinal suffix, abbreviated month name, and year.
DATE_FORMAT(shippedDate, '%W %D %M %Y'): This formats the 'shippedDate' column using the format '%W %D %M %Y', which represents the full weekday name, day of the month with ordinal suffix, full month name, and year.
The result set will display the formatted dates according to the specified formats for each order, providing a clear and human-readable representation of the date values. This function is useful when you want to present date information to users in a specific format.

#### c.Exercise 3.3: STR_TO_DATE 
The MySQL STR_TO_DATE() function is used to convert a string representation of a date or time into a MySQL date or datetime value. It requires two arguments: the input string and a format string that defines how the input string is structured.
SELECT STR_TO_DATE('21,5,2013','%d,%m,%Y');
SELECT STR_TO_DATE('113005','%h%i%s');
This query uses the STR_TO_DATE() function to convert the input string '113005' into a MySQL time value. The format string '%h%i%s' indicates that the input string is in the format hour, minute, second.
The result is the time '11:30:05', which corresponds to 11 hours, 30 minutes, and 5 seconds.
The STR_TO_DATE() function is useful when you need to convert date and time information stored as strings into MySQL's native date and time data types for proper storage and manipulation.


#### d.Exercise 3.4: NOW
The MySQL NOW() function is used to retrieve the current date and time as a MySQL datetime value. It's commonly used to record the timestamp when a record is created or modified.
       -- mysql now minus 1 hour
SELECT (NOW() - INTERVAL 1 HOUR) 'NOW - 1 hour',
        NOW(),
       -- mysql now plus 1 hour
       NOW() + INTERVAL 1 HOUR 'NOW + 1 hour';
CREATE TABLE tmp(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    created_on DATETIME NOT NULL DEFAULT NOW() -- or CURRENT_TIMESTAMP
);
INSERT INTO tmp(title)
VALUES('Test NOW() function');
SELECT * FROM tmp;

This query retrieves all records from the 'tmp' table, including the 'id', 'title', and 'created_on' columns. The 'created_on' column will display the timestamp when each record was inserted. The NOW() function is commonly used in scenarios where you need to track the creation or modification time of records in your database.

#### e.Exercise 3.5: GREATEST and LEAST 
The MySQL GREATEST() and LEAST() functions are used to find the maximum and minimum values among a list of expressions or values, respectively. They are often used to determine the greatest or smallest value from a set of inputs.

SELECT GREATEST(10, 20, 30),  -- 30
       LEAST(10, 20, 30); -- 10
SELECT GREATEST(10, null, 30),  -- null
       LEAST(10, null , 30); -- null
This query demonstrates how the GREATEST() and LEAST() functions handle NULL values. If any of the input values is NULL, the GREATEST() function returns NULL because it's impossible to determine the greatest value when one of the inputs is unknown. The LEAST() function also returns NULL when any of the input values is NULL.
These functions are useful for comparing values within SQL queries and determining the maximum and minimum values among a set of expressions or columns. Just keep in mind that when NULL values are involved, the result may also be NULL.

#### f.Exercise 3.6: ISNULL
The MySQL ISNULL() function is used to test whether an expression or value is NULL. It returns 1 if the expression is NULL, and 0 if the expression is not NULL.
CREATE TABLE special_isnull (
    start_date DATE NOT NULL
);
INSERT INTO special_isnull(start_date) 
VALUES('2000-01-01'),
      ('0000-00-00');
SELECT 
    *
FROM
    special_isnull
WHERE
ISNULL(start_date); 

This query retrieves all records from the 'special_isnull' table where the 'start_date' column is NULL. However, in this case, it's important to note that the 'start_date' column is defined as NOT NULL, so it cannot contain NULL values. Therefore, even though the query is checking for NULL values, it will not return any rows because the 'start_date' column cannot hold NULL values according to its definition.
The ISNULL() function is generally used to check for NULL values in columns that allow NULL, not in columns defined as NOT NULL. In your provided example, due to the NOT NULL constraint on the 'start_date' column, the result will be an empty result set.

### Module 4: Introduction to database views, MySQL views and create views
#### a.Exercise 4.1: Creating Views in MySQL.
The MySQL CREATE VIEW statement is used to create a virtual table that is based on the result of a SELECT query. Views allow you to abstract complex queries into a simplified and reusable form, making it easier to query and analyze data.
CREATE VIEW salePerOrder AS
    SELECT 
        orderNumber, 
        SUM(quantityOrdered * priceEach) total
    FROM
        orderDetails
    GROUP by orderNumber
ORDER BY total DESC;
SHOW TABLES;
This query creates a view named 'salePerOrder'. The view retrieves data from the 'orderDetails' table and calculates the total sales amount for each order. It uses the SUM() function to calculate the sum of the product of 'quantityOrdered' and 'priceEach' columns for each order. The result is grouped by the 'orderNumber' column and ordered in descending order by the total sales amount.
This command will show a list of full tables and views in the database, along with their types. The 'salePerOrder' view you created using the CREATE VIEW statement acts as a virtual table that stores the results of the query. You can query this view to retrieve the total sales amount for each order without needing to repeat the complex query logic each time. It provides a convenient way to access summarized data.


### Module 5: Creating updatable Views, Ensuring Views Consistency and Managing
Views
#### a)Exercise 5.1: How to create an updatable view and update data in the underlying tablethrough the view
MySQL Updatable Views allow you to perform certain UPDATE operations on the view itself, which will update the underlying data in the base table. However, there are certain conditions that need to be met for a view to be updatable.
CREATE VIEW officeInfo
 AS 
   SELECT officeCode, phone, city
   FROM offices;
UPDATE officeInfo 
SET 
    phone = '+33 14 723 5555'
WHERE
officeCode = 4;

#### b)Exercise 5.2: Ensuring Views Consistency Using WITH CHECK OPTION Clause
The WITH CHECK OPTION clause in MySQL views is used to enforce that any data modification made through the view adheres to the conditions specified in the view's WHERE clause. In other words, it ensures that only rows satisfying the view's condition can be modified through the view.
CREATE OR REPLACE VIEW vps AS
    SELECT 
        employeeNumber,
        lastname,
        firstname,
        jobtitle,
        extension,
        email,
        officeCode,
        reportsTo
    FROM
        employees
    WHERE
        jobTitle LIKE '%VP%';
SELECT * FROM vps;

#### c)Exercise 5.3: How to manage views in MySQL including displaying, modifying and removing views
In MySQL, views can be created, altered, and managed to provide a more convenient and efficient way to query data. Your example illustrates the process of creating a view, altering its structure, and then querying it:

CREATE VIEW organization AS
    SELECT 
        CONCAT(E.lastname, E.firstname) AS Employee,
        CONCAT(M.lastname, M.firstname) AS Manager
    FROM
        employees AS E
            INNER JOIN
        employees AS M ON M.employeeNumber = E.ReportsTo
ORDER BY Manager;
SHOW CREATE VIEW organization;
ALTER VIEW organization
  AS 
  SELECT CONCAT(E.lastname,E.firstname) AS Employee,
         E.email AS  employeeEmail,
         CONCAT(M.lastname,M.firstname) AS Manager
  FROM employees AS E
  INNER JOIN employees AS M
    ON M.employeeNumber = E.ReportsTo
  ORDER BY Manager;

### Module 6: MySQL Stored Procedures Introduction
#### a.Exercise 6.1: How to develop the first MySQL stored procedure using CREATE PROCEDURE statement
In MySQL, a stored procedure is a named group of SQL statements that can be executed as a single unit. Stored procedures provide a way to encapsulate business logic or specific tasks and can be called with specific parameters.
SELECT * FROM products;
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT *  FROM products;
END //

DELIMITER ;
The DELIMITER command is used to change the delimiter from the default semicolon (;) to a custom one (in this case, //). This is necessary because you're defining a stored procedure that contains multiple SQL statements, and the semicolon is used to separate individual statements. By changing the delimiter, MySQL knows that the stored procedure definition will continue until the new delimiter is encountered. Calling the stored procedure will execute the SQL statement inside it, which in this case is the SELECT query to retrieve all products from the 'products' table.

#### b.Exercise 6.2: How to declare, and use variables in the stored procedure. In addition, you will learn about the scopes of variables.
In MySQL stored procedures, variables can be declared and used to store temporary values. These variables allow you to perform calculations, store results, and control the flow of your procedure. Your example demonstrates the use of variables in a stored procedure:

DECLARE productCount INT DEFAULT 0;
SELECT COUNT(*) 
INTO productCount
FROM products;
This query calculates the total number of rows in the 'products' table using the COUNT(*) function. The result is assigned to the productCount variable using the INTO clause.
Variables are an important feature in stored procedures, as they allow you to store and manipulate data within the procedure's scope. They can be used in various ways, such as storing query results, intermediate calculation results, or control values.

#### c.Exercise 6.3: how to write MySQL stored procedures that have parameters
In MySQL stored procedures, you can define parameters that allow you to pass values into the procedure when it's called. Your example demonstrates the creation and usage of a stored procedure with parameters:
CREATE PROCEDURE GetOfficeByCountry(
	IN countryName VARCHAR(255)
)
-- BEGIN
	SELECT * 
 	FROM offices
	WHERE country = countryName;
-- END //
-- DELIMITER ;
CALL GetOfficeByCountry('USA');

Module 7: MySQL Stored Procedure Parameters and Return Multiple Values
a.Exercise 7.1: How to Return Multiple Values in stored procedure
DELIMITER $$
CREATE PROCEDURE get_order_by_cust(
	IN cust_no INT,
	OUT shipped INT,
	OUT canceled INT,
	OUT resolved INT,
	OUT disputed INT)
BEGIN
		-- shipped
		SELECT
            count(*) INTO shipped
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Shipped';

		-- canceled
		SELECT
            count(*) INTO canceled
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Canceled';

		-- resolved
		SELECT
            count(*) INTO resolved
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Resolved';

		-- disputed
		SELECT
            count(*) INTO disputed
        FROM
            orders
        WHERE
            customerNumber = cust_no
                AND status = 'Disputed';

END

### Module 8: MySQL IF and CASE Statements
#### a)Exercise 8.1: how to use MySQL IF statement to execute a block of SQL code based on conditions.
DELIMITER $$
CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    END IF;
END$$

DELIMITER ;
SELECT 
    customerNumber, 
    creditLimit
FROM 
    customers
WHERE 
    creditLimit > 50000
ORDER BY 
    creditLimit DESC;


#### b)Exercise 8.2: how to use MySQL CASE statements to construct complex conditional statements inside stored programs.
DELIMITER $$

CREATE PROCEDURE GetCustomerShipping(
	IN  pCustomerNUmber INT, 
	OUT pShipping       VARCHAR(50)
)
BEGIN
    DECLARE customerCountry VARCHAR(100);

SELECT 
    country
INTO customerCountry FROM
    customers
WHERE
    customerNumber = pCustomerNUmber;

    CASE customerCountry
		WHEN  'USA' THEN
		   SET pShipping = '2-day Shipping';
		WHEN 'Canada' THEN
		   SET pShipping = '3-day Shipping';
		ELSE
		   SET pShipping = '5-day Shipping';
	END CASE;
END$$

DELIMITER ;

### Module 9: MySQL Loop Statements, Cursor, Listing and Error Handling in Store
Procedure
#### a.Exercise 9.1: How to use various loop statements in stored procedure to execute a block of code repeatedly based on a given Boolean condition.
DROP PROCEDURE LoopDemo;

DELIMITER $$
CREATE PROCEDURE LoopDemo()
BEGIN
	DECLARE x  INT;
	DECLARE str  VARCHAR(255);
        
	SET x = 1;
	SET str =  '';
        
	loop_label:  LOOP
		IF  x > 10 THEN 
			LEAVE  loop_label;
		END  IF;
            
		SET  x = x + 1;
		IF  (x mod 2) THEN
			ITERATE  loop_label;
		ELSE
			SET  str = CONCAT(str,x,',');
		END  IF;
	END LOOP;
	SELECT str;
END$$
DELIMITER ;
CALL LoopDemo();


#### b.Exercise 9.2: How to use MySQL cursor in stored procedures to loop over a result set and process each row at a time.
DELIMITER $$
CREATE PROCEDURE createEmailList (
	INOUT emailList varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE curEmail 
		CURSOR FOR 
			SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curEmail;

	getEmail: LOOP
		FETCH curEmail INTO emailAddress;
		IF finished = 1 THEN 
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,";",emailList);
	END LOOP getEmail;
	CLOSE curEmail;

END$$
DELIMITER ;

#### c.Exercise 9.3: How to list all stored procedures in a MySQL database.

SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = '<database_name>';
SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = 'classicmodels';

#### d.Exercise 9.4: How to use MySQL handler to handle exceptions or errors encountered in stored procedures.
DROP PROCEDURE IF EXISTS InsertSupplierProduct;

DELIMITER $$

CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062 SELECT 'Duplicate keys error encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 'SQLSTATE 23000' ErrorCode;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

### Module 10: MySQL Stored Procedures – Raising Error Conditions and Stored Function
a.Exercise 10.1: How to use MySQL SIGNAL and RESIGNAL statements to raise error conditions inside stored procedures.
DELIMITER $$
CREATE PROCEDURE AddOrderItem(
		         in orderNo int,
			 in productCode varchar(45),
			 in qty int, 
                         in price double, 
                         in lineNo int )
BEGIN
	DECLARE C INT;

	SELECT COUNT(orderNumber) INTO C
	FROM orders 
	WHERE orderNumber = orderNo;

	-- check if orderNumber exists
	IF(C != 1) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Order No not found in orders table';
	END IF;
	-- more code below
	-- ...
END
CALL AddOrderItem(10,'S10_1678',1,95.7,1);

#### b.Exercise 10.2: How to create MySQL stored functions using CREATE FUNCTION statement.
DELIMITER $$

CREATE FUNCTION CustomerLevel(
	credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 50000 AND 
			credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END$$
DELIMITER ;

### Module 11: MySQL Triggers Implementation, Creating and Managing
#### a.Exercise 11.1: Introduces you to MySQL triggers implementation.
tablename_(BEFORE | AFTER)_(INSERT| UPDATE | DELETE)

#### b.Exercise 11.2: Shows you how to create a simple trigger in MySQL to audit the changes of a table.
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();
SHOW TRIGGERS;


#### c.Exercise 11.3: Shows you how to create multiple triggers for the same trigger event and action time
CREATE TABLE PriceLogs (
    id INT AUTO_INCREMENT,
    productCode VARCHAR(15) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    updated_at TIMESTAMP NOT NULL 
			DEFAULT CURRENT_TIMESTAMP 
            ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (productCode)
        REFERENCES products (productCode)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
DELIMITER $$

CREATE TRIGGER before_products_update 
   BEFORE UPDATE ON products 
   FOR EACH ROW 
BEGIN
     IF OLD.msrp <> NEW.msrp THEN
         INSERT INTO PriceLOgs(productCode,price)
         VALUES(old.productCode,old.msrp);
     END IF;
END$$

DELIMITER ;
SELECT 
    productCode, 
    msrp 
FROM 
    products
WHERE 
    productCode = 'S12_1099';

#### d.Exercise 11.4: How to manage triggers including displaying, modifying, and removing triggers in MySQL databases
SHOW TRIGGERS
FROM classicmodels;


### Module 12: Working with MySQL Scheduled Event and Modifying MySQL Events
#### a.Exercise 12.1 : Working with MySQL Scheduled Event
SHOW PROCESSLIST;
SET GLOBAL event_scheduler = ON;
SHOW PROCESSLIST;


#### b.Exercise 12.2 :Modifying MySQL Events
ALTER EVENT test_event_04
DO
   INSERT INTO messages(message,created_at)
   VALUES('Message from event',NOW());

Module 13: MySQL Full-Text Search
a.Exercise 13.1: How to define FULLTEXT Indexes for MySQL Full-Text Searching
CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  PRIMARY KEY (id),
  FULLTEXT KEY (body )
);
ALTER TABLE offices
DROP INDEX address;

#### b.Exercise 13.2: MySQL Natural Language Full-Text Searches
In MySQL, the FULLTEXT search capability allows you to perform natural language searches on text-based columns. Your example demonstrates how to set up and perform a natural language full-text search:
ALTER TABLE products 
ADD FULLTEXT(productline);
SELECT 
    productName, 
    productLine 
FROM products 
WHERE 
    MATCH(productLine) 
    AGAINST('Classic');

This query searches for products in the 'products' table where the 'productLine' column contains the word 'Classic' using the MATCH ... AGAINST syntax.
SELECT productName, productLine: This part specifies the columns you want to retrieve in the result.
FROM products: This indicates that you're querying the 'products' table.
WHERE MATCH(productLine) AGAINST('Classic'): This is the condition where you use the MATCH ... AGAINST clause to perform the full-text search. It checks if the 'productLine' column matches the word 'Classic'.
The MATCH ... AGAINST clause is used to perform natural language searches. It requires a FULLTEXT index on the columns being searched. The search term 'Classic' is used as an example, and it will match rows where the 'productLine' contains that term.
Natural language full-text searches are useful when you want to search for relevant content based on the actual language used in the data. It's important to note that full-text searches have specific requirements and limitations, and their performance depends on the size of the dataset and the nature of the search terms.

## Conclusion
In conclusion, the Advanced SQL course offers a comprehensive and structured learning path for individuals seeking to expand their expertise in database management and querying. By delving into functions, stored procedures, triggers, views, and other advanced concepts, students are empowered to handle intricate data operations and enhance their efficiency in working with databases. With a practical hands-on approach, learners can not only gain theoretical knowledge but also gain practical experience that will prove invaluable in real-world scenarios. By completing this course, students can confidently demonstrate their ability to create, manage, and optimize SQL queries, setting the stage for successful and effective data manipulation and management in various professional settings.



# PART 2: Database concepts
In this sample project, we have undertaken the task of designing a comprehensive database for Fit @ Home, a home gym concierge service that offers equipment subscription packages and personalized training sessions in the comfort and safety of one's home. The assignment focuses on various crucial concepts of database design, such as conceptual modeling, normalization, and creating a logical and physical data model. The goal is to organize the existing disorganized data into an efficient and structured database system that will enable Fit @ Home to manage their operations effectively and support their business growth.

Throughout the assignment, we have carefully examined the provided data, identified entities, defined attributes, and established relationships to construct a robust conceptual model. Subsequently, we followed the normalization process to ensure that the database design adheres to the principles of First, Second, and Third Normal Form, thereby eliminating data redundancy and maintaining data integrity. Moreover, we extended the logical model by introducing additional tables and refining the relationships, culminating in the creation of a detailed physical model.

The completion of this assignment marks a significant achievement in designing a reliable and well-structured database system for Fit @ Home. By thoroughly analyzing the data and applying database design principles, we have successfully transformed the initial archaic and disorganized system into a powerful database that can efficiently manage member information, equipment inventory, trainer details, and training sessions. The adoption of Crow's Foot Database Notation in Microsoft Visio allowed us to create clear and visually appealing Entity-Relationship Diagrams (ERD), effectively representing the entities, attributes, relationships, primary keys, foreign keys, and data types.
The newly designed database will empower Fit @ Home to streamline their operations, enhance data integrity, and make informed business decisions. The scalable and well-organized structure will facilitate future expansions and modifications to meet the evolving needs of their growing business. In sum, this assignment has provided invaluable insights into the importance of thoughtful database design, planning, and prioritization in creating a robust foundation for an organization's data management endeavors.


# Comprehensive Database Implementation and Optimization


## SQL19D-Comprehensive Database Implementation and Optimization

### Step 1: Install SQL Server 2019 Instance
#### A.Login
Installed SQL Server 2019 on a Windows Server machine and login.
Chose appropriate service accounts during installation.



#### B.Enable remote SQL TCP connections
Enabled remote SQL TCP connections in SQL Server Configuration Manager.

Completed the installation process and verified that SQL Server was running correctly.




#### C.Ensuring that all SQL necessary SQL Server services are set to start automatically and accept secure network connections.
Configured SQL Server to accept secure network connections.
Ensured that all necessary SQL Server services were set to start automatically.





### Step 2: Database Design
i.Designed a database for an IT Consulting Company providing services and equipment.
ii.Identified entities such as Clients, Services, EquipmentTypes, Equipment, Transactions, Purchases, and Resales.
iii.Created entity-relationship diagrams (ERD) to visualize table relationships.
iv.Defined table structures including columns, data types, constraints, and relationships.
v.Ensured normalization and appropriate data integrity constraints.
vi.Documented the database design process for future reference.
#### 1.Tables
##### a.Clients
Stores information about client organizations. 
Columns: ClientID (Primary Key), Name, ContactInfo 
##### b.Services
Contains details of services provided by the IT consulting company.
Columns: ServiceID (Primary Key), Description, Price 
##### c.EquipmentTypes
Describes different types of equipment available.
Columns: TypeID (Primary Key), TypeName 
##### d.Equipment
Records information about the equipment being sold or purchased. 
Columns: EquipmentID (Primary Key), TypeID (Foreign Key), Description 
##### e.Transactions
Tracks transactions made by clients. 
Columns: TransactionID (Primary Key), ClientID (Foreign Key), ServiceID (Foreign Key), Quantity, TotalPrice, Date 
##### f.Purchases
Logs equipment purchases made by the company. 
Columns: PurchaseID (Primary Key), EquipmentID (Foreign Key), Date, Price 
##### g.Resales
Records equipment resales to clients.
Columns: ResaleID (Primary Key), ClientID (Foreign Key), EquipmentID, Date and price. 

2.Relationships
i.Clients has a one-to-many relationship with Transactions and Resales tables. 
ii.Services has a one-to-many relationship with Transactions table. 
iii.EquipmentTypes has a one-to-many relationship with Equipment table. 
iv.Transactions and Purchases tables are related through the EquipmentID column.
v.Transactions and Services tables are related through the ServiceID column. 
vi.Resales and Equipment tables are related through the EquipmentID column.
vii.Purchases and Equipment tables are related through the EquipmentID column. 
This ER diagramabove,  provides a clear representation of the database structure for the IT Consulting Company, including tables, columns/datatypes, and table relationships. It forms the foundation for creating the database schema in SQL Server 2019.

### Step 3: Create Database and Tables
i.Created a new database named "ITConsultingDB" in SQL Server Management Studio.
ii.Executed SQL scripts to create tables for each entity identified in the database design phase.
iii.Ensured that each table was created with appropriate columns, data types, primary keys, foreign keys, and constraints.
iv.Verified the successful creation of tables by querying the system catalogs.
a.Create Database

b.Create Tables

c.Populate Tables with atleast 50 records
i)Clients

ii)Services

iii)EquipmentTypes

iv)Equipment

v)Transactions

vi)Purchases

vii)Resales.

d.Create Indexes

e.Database options

This command will create a full backup of the database and store it at the specified location ('C:\Users\n\Desktop\ITConsultingDB.bak';). 
### Step 4: SQL Logins and Users
i.Created SQL logins for accessing the database.
ii.Created a SQL login with permissions to access and modify records within the database.
iii.Created another SQL login with read-only permissions to access records within the database.
iv.Created a SQL login for the application developer within the organization.
v.Associated each SQL login with a corresponding user in the database.




i.Create a SQL login with permissions to access and modify records
CREATE LOGIN KaylaMcFarlane1 WITH PASSWORD = '@KaylaMcFarlane1';

ii.Create a user in the database associated with the login
USE ITConsultingDB;
CREATE USER KaylaMcFarlane1 FOR LOGIN KaylaMcFarlane1;

iii.Grant appropriate permissions to the user
Example: Grant SELECT, INSERT, UPDATE, DELETE permissions to the user
GRANT SELECT, INSERT, UPDATE, DELETE ON EquipmentTypes TO KaylaMcFarlane1;
iv.Create a SQL login with read-only access
CREATE LOGIN KaylaMcFarlane2 WITH PASSWORD = '@KaylaMcFarlane2';

v.Create a user in the database associated with the read-only login
USE ITConsultingDB;
CREATE USER KaylaMcFarlane3 FOR LOGIN KaylaMcFarlane2;

vi.Grant read-only permissions to the user
Example: Grant SELECT permissions to the user
GRANT SELECT ON Services TO KaylaMcFarlane3;

Create a login for the app developer
CREATE LOGIN KaylaMcFarlane4 WITH PASSWORD = '@KaylaMcFarlane4';

vii.Create a user in the database associated with the app developer login
USE ITConsultingDB;
CREATE USER KaylaMcFarlane5 FOR LOGIN KaylaMcFarlane4;

### Step 5: Performance Monitoring and Optimization
i.Configured performance monitoring tools to isolate performance issues.
ii.Established ongoing monitoring of SQL performance and usage.
iii.Implemented optimization techniques to enhance database performance.
iv.Scheduled regular database consistency checks to ensure data integrity.
v.Set up automated database backups for disaster recovery.
vi.Configured email notifications to alert about any performance or integrity issues, with notifications sent to oumawere2001@gmail.com






### Step 6: Fault Tolerance
i.Implemented fault tolerance measures to ensure high availability and reliability of the database.
ii.Configured database mirroring or clustering to provide failover support in case of server failure.
iii.Established redundant storage solutions to prevent data loss in case of disk failure.
iv.Tested failover mechanisms to ensure they function as expected during system disruptions.



### Step 7: Optional Bonus
#### a.The design
The optional bonus involves designing a new database that serves as a data warehouse for the IT consulting company's operational database. The purpose of this data warehouse is to facilitate business intelligence analysis by organizing and consolidating data from various sources for reporting and analysis purposes. In this context, the data warehouse schema comprises several dimensions and a fact table. 
The dimensions represent different aspects of the business, such as time, clients, services, equipment, and transactions. Each dimension contains key attributes that provide context and detail for the data stored in the fact table. The fact table, on the other hand, serves as the central repository for transactional data. It captures information related to client transactions, including details about the services rendered, equipment used, transaction dates, quantities, and prices. 
#### b.The new database that will be used as a data warehouse for IT Consulting Company 

By structuring the data in this manner, the data warehouse enables analysts to perform complex queries and generate meaningful insights into various aspects of the company's operations. For example, analysts can analyze sales trends over time, assess the performance of different services or equipment types, and identify patterns in client behavior. In sum, the data warehouse provides a valuable resource for decision-makers within the organization, empowering them to make informed decisions based on comprehensive and accurate data analysis. 




