# Advanced-SQL
## Advanced SQL commands

This Advanced SQL course offers a comprehensive and structured learning path for individuals seeking to expand their expertise in database management and querying. By delving into functions, stored procedures, triggers, views, and other advanced concepts, students are empowered to handle intricate data operations and enhance their efficiency in working with databases. With a practical hands-on approach, learners can not only gain theoretical knowledge but also gain practical experience that will prove invaluable in real-world scenarios. By completing this course, students can confidently demonstrate their ability to create, manage, and optimize SQL queries, setting the stage for successful and effective data manipulation and management in various professional settings.

# Database concepts
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




