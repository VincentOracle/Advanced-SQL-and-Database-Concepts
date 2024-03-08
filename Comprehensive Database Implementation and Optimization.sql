--Creating the Database
CREATE DATABASE ITConsultingDB;

--Creating the Tables

-- Clients table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    ContactInfo NVARCHAR(255),
    Address NVARCHAR(255)
);

-- Services table
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10, 2)
);

-- EquipmentTypes table
CREATE TABLE EquipmentTypes (
    EquipmentTypeID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
);

-- Equipment table
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    EquipmentTypeID INT,
    Description NVARCHAR(255),
    Price DECIMAL(10, 2),
    FOREIGN KEY (EquipmentTypeID) REFERENCES EquipmentTypes(EquipmentTypeID)
);

-- Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    TransactionType NVARCHAR(50) NOT NULL,
    TransactionDate DATETIME,
    ClientID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

-- Purchases table
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    TransactionID INT,
    EquipmentID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Resales table
CREATE TABLE Resales (
    ResaleID INT PRIMARY KEY,
    TransactionID INT,
    EquipmentID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

--Creating Indexes
-- Index for Clients table
CREATE INDEX IX_Clients_Name ON Clients(Name);

-- Index for Equipment table
CREATE INDEX IX_Equipment_Name ON Equipment(Name);
CREATE INDEX IX_Equipment_EquipmentTypeID ON Equipment(EquipmentTypeID);

-- Index for Transactions table
CREATE INDEX IX_Transaction_TransactionDate ON Transactions(TransactionDate);
CREATE INDEX IX_Transactions_ClientID ON Transactions(ClientID);

-- Index for Purchases table
CREATE INDEX IX_Purchases_TransactionID ON Purchases(TransactionID);
CREATE INDEX IX_Purchases_EquipmentID ON Purchases(EquipmentID);

-- Index for Resales table
CREATE INDEX IX_Resales_TransactionID ON Resales(TransactionID);
CREATE INDEX IX_Resales_EquipmentID ON Resales(EquipmentID);


--Populating the Tables
-- Insert sample data into the Clients table
INSERT INTO Clients (ClientID, Name, ContactInfo, Address)
VALUES
    (1, 'ABC Corporation', 'John Smith - 123-456-7890', '123 Main St, Anytown, USA'),
    (2, 'XYZ Corp', 'Jane Doe - 987-654-3210', '456 Elm St, Othertown, USA'),
    (3, 'Tech Solutions Inc.', 'Mike Johnson - 555-555-5555', '789 Oak St, Anycity, USA'),
    (4, 'Global Enterprises', 'Emily Brown - 222-333-4444', '321 Pine St, Newville, USA'),
    (5, 'Innovative Solutions Ltd.', 'Tom Wilson - 888-999-0000', '567 Maple St, Nextcity, USA'),
    (6, 'Future Tech Inc.', 'Sarah Adams - 111-222-3333', '890 Cedar St, Somewhere, USA'),
    (7, 'DataWorks LLC', 'David Clark - 444-555-6666', '456 Birch St, Anycity, USA'),
    (8, 'Dynamic Systems', 'Lisa Roberts - 777-888-9999', '789 Oak St, Anytown, USA'),
    (9, 'TechGenius Solutions', 'Alex Johnson - 666-777-8888', '321 Pine St, Othertown, USA'),
    (10, 'Visionary Technologies', 'Jessica Turner - 333-444-5555', '567 Willow St, Newville, USA'),
    (11, 'Tech Innovations Ltd.', 'Mark Thompson - 999-888-7777', '890 Pine St, Anytown, USA'),
    (12, 'Alpha Solutions', 'Michelle Davis - 444-333-2222', '123 Elm St, Othertown, USA'),
    (13, 'Smart Systems Inc.', 'Robert Garcia - 111-222-3333', '456 Maple St, Anycity, USA'),
    (14, 'InfoTech Solutions', 'Jennifer Martinez - 777-666-5555', '789 Cedar St, Newville, USA'),
    (15, 'Prime Consultants', 'Erica White - 888-777-6666', '890 Birch St, Nextcity, USA'),
    (16, 'IT Experts LLC', 'Daniel Harris - 555-444-3333', '123 Oak St, Somewhere, USA'),
    (17, 'TechPro Innovations', 'Steven Lee - 222-333-4444', '456 Pine St, Anytown, USA'),
    (18, 'Bright Minds Solutions', 'Rachel Scott - 999-888-7777', '789 Elm St, Othertown, USA'),
    (19, 'Future Solutions Inc.', 'Andrew Miller - 444-555-6666', '123 Maple St, Anycity, USA'),
    (20, 'GlobalTech Enterprises', 'Laura Wilson - 111-222-3333', '456 Cedar St, Newville, USA'),
    (21, 'Innovate IT Solutions', 'Christopher Clark - 777-666-5555', '890 Birch St, Nextcity, USA'),
    (22, 'Blue Chip Technologies', 'Maria Garcia - 888-777-6666', '123 Oak St, Somewhere, USA'),
    (23, 'Apex Systems', 'James Brown - 555-444-3333', '456 Pine St, Anytown, USA'),
    (24, 'Data Dynamics Inc.', 'Emily Roberts - 999-888-7777', '789 Elm St, Othertown, USA'),
    (25, 'TechGenius Innovations', 'Michael Johnson - 444-555-6666', '123 Maple St, Anycity, USA'),
    (26, 'Swift Solutions Ltd.', 'Jessica Wilson - 111-222-3333', '456 Cedar St, Newville, USA'),
    (27, 'Strategic IT Solutions', 'William Davis - 777-666-5555', '890 Birch St, Nextcity, USA'),
    (28, 'ProTech Systems', 'Sophia Garcia - 888-777-6666', '123 Oak St, Somewhere, USA'),
    (29, 'NexGen Technologies', 'Matthew Harris - 555-444-3333', '456 Pine St, Anytown, USA'),
    (30, 'TechVision Inc.', 'Olivia Lee - 999-888-7777', '789 Elm St, Othertown, USA'),
    (31, 'Innovative Solutions Inc.', 'David Miller - 444-555-6666', '123 Maple St, Anycity, USA'),
    (32, 'DataTech Corporation', 'Sarah Wilson - 111-222-3333', '456 Cedar St, Newville, USA'),
    (33, 'Dynamic Systems Ltd.', 'John Clark - 777-666-5555', '890 Birch St, Nextcity, USA'),
    (34, 'Tech Innovations Inc.', 'Emma Brown - 888-777-6666', '123 Oak St, Somewhere, USA'),
    (35, 'Smart Solutions LLC', 'Noah Harris - 555-444-3333', '456 Pine St, Anytown, USA'),
    (36, 'Blue Star Technologies', 'Ava Roberts - 999-888-7777', '789 Elm St, Othertown, USA'),
    (37, 'TechPro Systems', 'Ethan Johnson - 444-555-6666', '123 Maple St, Anycity, USA'),
    (38, 'Innova IT Solutions', 'Isabella Wilson - 111-222-3333', '456 Cedar St, Newville, USA'),
    (39, 'Data Dynamics Ltd.', 'Mia Garcia - 777-666-5555', '890 Birch St, Nextcity, USA'),
    (40, 'FutureTech Solutions', 'Logan Brown - 888-777-6666', '123 Oak St, Somewhere, USA'),
    (41, 'NextGen IT Innovations', 'Harper Harris - 555-444-3333', '456 Pine St, Anytown, USA'),
    (42, 'SmartTech Corporation', 'Liam Roberts - 999-888-7777', '789 Elm St, Othertown, USA'),
    (43, 'TechGenius Inc.', 'Evelyn Johnson - 444-555-6666', '123 Maple St, Anycity, USA'),
    (44, 'Swift Solutions LLC', 'Benjamin Wilson - 111-222-3333', '456 Cedar St, Newville, USA'),
    (45, 'Data Innovations Inc.', 'Chloe Garcia - 777-666-5555', '890 Birch St, Nextcity, USA'),
    (46, 'Blue Sky Technologies', 'Wyatt Brown - 888-777-6666', '123 Oak St, Somewhere, USA'),
    (47, 'Innovative IT Solutions', 'Lily Harris - 555-444-3333', '456 Pine St, Anytown, USA'),
    (48, 'Dynamic IT Solutions', 'Jackson Roberts - 999-888-7777', '789 Elm St, Othertown, USA'),
    (49, 'TechGenius Solutions Ltd.', 'Zoey Johnson - 444-555-6666', '123 Maple St, Anycity, USA'),
    (50, 'Innova IT Corporation', 'Lucas Wilson - 111-222-3333', '456 Cedar St, Newville, USA');

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM Clients;
SELECT * 
FROM Clients;

-- Populate the Services table with sample data
INSERT INTO Services (ServiceID, Name, Description, Price)
VALUES
    (1, 'Network Setup', 'Installation and configuration of network infrastructure.', 250.00),
    (2, 'Database Development', 'Design and implementation of custom database solutions.', 500.00),
    (3, 'Server Maintenance', 'Regular maintenance and monitoring of server systems.', 300.00),
    (4, 'Software Installation', 'Installation and setup of software applications.', 150.00),
    (5, 'Data Backup Solutions', 'Implementation of data backup and recovery solutions.', 400.00),
    (6, 'Cloud Migration Services', 'Migration of on-premises infrastructure to cloud platforms.', 600.00),
    (7, 'IT Consulting', 'Expert consulting services for IT infrastructure planning and optimization.', 450.00),
    (8, 'Security Assessment', 'Comprehensive security assessment and vulnerability analysis.', 350.00),
    (9, 'Hardware Procurement', 'Procurement of hardware equipment for client organizations.', 200.00),
    (10, 'System Integration', 'Integration of disparate systems for seamless operation.', 550.00),
    (11, 'Network Security Setup', 'Implementation of security measures for network infrastructure.', 300.00),
    (12, 'Database Optimization', 'Optimization and tuning of database performance.', 400.00),
    (13, 'Server Virtualization', 'Deployment of virtual server environments for resource optimization.', 450.00),
    (14, 'Software Upgrades', 'Upgrade and patch management for software applications.', 200.00),
    (15, 'Disaster Recovery Planning', 'Development of disaster recovery plans and strategies.', 600.00),
    (16, 'Cloud Security Solutions', 'Implementation of security measures for cloud environments.', 350.00),
    (17, 'IT Strategy Development', 'Development of strategic IT plans aligned with business objectives.', 500.00),
    (18, 'Network Performance Analysis', 'Analysis and optimization of network performance.', 400.00),
    (19, 'Hardware Installation', 'Installation and setup of hardware components.', 250.00),
    (20, 'Application Integration', 'Integration of various applications for seamless data flow.', 550.00),
    (21, 'Data Encryption Services', 'Implementation of data encryption mechanisms for security.', 300.00),
    (22, 'Database Migration', 'Migration of databases between different platforms.', 450.00),
    (23, 'Server Configuration', 'Configuration and setup of server systems for optimal performance.', 350.00),
    (24, 'Software Customization', 'Customization of software applications to meet specific requirements.', 400.00),
    (25, 'Backup Management Services', 'Management and monitoring of data backup processes.', 350.00),
    (26, 'Cloud Infrastructure Design', 'Design and architecture of cloud infrastructure solutions.', 600.00),
    (27, 'IT Risk Assessment', 'Assessment of IT risks and mitigation strategies.', 400.00),
    (28, 'Network Infrastructure Planning', 'Planning and design of network infrastructure for scalability.', 450.00),
    (29, 'Hardware Maintenance', 'Regular maintenance and support for hardware components.', 300.00),
    (30, 'Application Development', 'Custom application development for specific business needs.', 700.00),
    (31, 'Endpoint Security Solutions', 'Implementation of security solutions for endpoints.', 350.00),
    (32, 'Database Security Assessment', 'Assessment of database security measures.', 400.00),
    (33, 'Server Monitoring Services', 'Continuous monitoring and alerting for server systems.', 300.00),
    (34, 'Software Licensing Management', 'Management of software licensing agreements and compliance.', 250.00),
    (35, 'Data Replication Solutions', 'Implementation of data replication mechanisms for redundancy.', 550.00),
    (36, 'Cloud Migration Strategy', 'Development of strategies for migrating to cloud platforms.', 500.00),
    (37, 'IT Governance Consulting', 'Consulting services for IT governance frameworks and practices.', 450.00),
    (38, 'Network Security Assessment', 'Assessment of network security posture and vulnerabilities.', 400.00),
    (39, 'Hardware Upgrades', 'Upgrades and enhancements for hardware infrastructure.', 300.00),
    (40, 'Application Support Services', 'Ongoing support and maintenance for business applications.', 600.00),
    (41, 'Firewall Configuration', 'Configuration and management of firewall devices for security.', 350.00),
    (42, 'Database Performance Tuning', 'Fine-tuning of database performance for optimal operation.', 400.00),
    (43, 'Server Backup Solutions', 'Implementation of backup solutions for server data protection.', 300.00),
    (44, 'Software Deployment Services', 'Deployment and rollout of software applications across the organization.', 250.00),
    (45, 'Data Archiving Solutions', 'Archiving of historical data for compliance and storage management.', 550.00),
    (46, 'Cloud Cost Optimization', 'Optimization of cloud resources to reduce costs and improve efficiency.', 500.00),
    (47, 'IT Audit Services', 'Audit and assessment services for IT infrastructure and processes.', 450.00),
    (48, 'Network Redundancy Planning', 'Planning for network redundancy and failover mechanisms.', 400.00),
    (49, 'Hardware Procurement Management', 'Management and oversight of hardware procurement processes.', 300.00),
    (50, 'Mobile Application Development', 'Development of mobile applications for various platforms.', 700.00);

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM Services;
SELECT *
FROM Services;

-- Populate the EquipmentTypes table with sample data
INSERT INTO EquipmentTypes (EquipmentTypeID, Name, Description)
VALUES
    (1, 'Desktop', 'A personal computer designed for regular use at a single location.'),
    (2, 'Laptop', 'A portable computer with a clamshell form factor, suitable for mobile use.'),
    (3, 'Server', 'A computer system used to provide network services to other devices.'),
    (4, 'Router', 'A networking device that forwards data packets between computer networks.'),
    (5, 'Switch', 'A networking device that connects devices together on a computer network.'),
    (6, 'Firewall', 'A network security device that monitors and controls incoming and outgoing network traffic.'),
    (7, 'Printer', 'A peripheral device that produces text or graphics on paper.'),
    (8, 'Scanner', 'A device that optically scans images, printed text, handwriting, or an object.'),
    (9, 'Projector', 'A device that projects an image onto a surface.'),
    (10, 'Storage Device', 'A device used to store, retrieve, and manage digital information.'),
    (11, 'Monitor', 'A display device used to visually represent electronic data.'),
    (12, 'Keyboard', 'A peripheral device for typing text and executing commands.'),
    (13, 'Mouse', 'A pointing device that detects two-dimensional motion.'),
    (14, 'Network Attached Storage (NAS)', 'A file-level computer data storage server connected to a computer network.'),
    (15, 'Wireless Access Point (WAP)', 'A networking hardware device that allows wireless devices to connect to a wired network.'),
    (16, 'UPS (Uninterruptible Power Supply)', 'An electrical apparatus that provides emergency power to a load when the input power source fails.'),
    (17, 'VoIP Phone', 'A telephone that uses voice over IP (VoIP) technologies for placing and transmitting telephone calls over an IP network.'),
    (18, 'External Hard Drive', 'A portable storage device that can be attached to a computer through a USB or other interface.'),
    (19, 'Graphics Card', 'A hardware component responsible for rendering images, videos, and animations.'),
    (20, 'Network Cable', 'A cable used to connect network devices together.'),
    (21, 'Wireless Mouse', 'A cordless pointing device that communicates with the computer via radio frequency (RF) signals.'),
    (22, 'Webcam', 'A video camera that feeds or streams an image or video in real time to or through a computer.'),
    (23, 'External SSD (Solid State Drive)', 'A portable storage device that uses flash memory to store data.'),
    (24, 'Barcode Scanner', 'A device that reads and translates barcodes into readable characters.'),
    (25, 'Ethernet Switch', 'A network switch that connects devices together on an Ethernet network.'),
    (26, 'Wireless Keyboard', 'A keyboard that communicates with the computer via radio frequency (RF) signals.'),
    (27, 'RAID Controller', 'A hardware device or software program used to manage and control RAID arrays.'),
    (28, 'Headset', 'A pair of headphones combined with a microphone for communication.'),
    (29, 'Docking Station', 'A device that allows a laptop computer to connect to other peripherals.'),
    (30, 'Memory Card', 'A small storage medium used to store data such as text, pictures, audio, and video.'),
    (31, 'Wireless Router', 'A networking device that performs the functions of a router and also includes the functions of a wireless access point.'),
    (32, 'Network Switch', 'A networking device that connects devices together on a computer network.'),
    (33, 'Power Strip', 'An electrical extension cord with multiple outlets.'),
    (34, 'Printer Toner Cartridge', 'A replaceable component of a laser printer that contains the toner.'),
    (35, 'Webcam Cover', 'A physical cover used to block or obscure a webcam lens.'),
    (36, 'External DVD Drive', 'A portable optical disc drive that reads and writes data to DVDs.'),
    (37, 'Microphone', 'An audio input device used to capture sound.'),
    (38, 'Wireless Headphones', 'Headphones that connect to a device via Bluetooth or other wireless technology.'),
    (39, 'USB Flash Drive', 'A portable storage device that plugs into the USB port of a computer.'),
    (40, 'Ethernet Cable', 'A cable used to connect network devices together.'),
    (41, 'Wireless Adapter', 'A device that allows a computer to connect to a wireless network.'),
    (42, 'Printer Ink Cartridge', 'A replaceable component of an inkjet printer that contains the ink.'),
    (43, 'External Battery Pack', 'A portable power source for charging electronic devices on the go.'),
    (44, 'External CD Drive', 'A portable optical disc drive that reads and writes data to CDs.'),
    (45, 'Bluetooth Adapter', 'A device that adds Bluetooth wireless functionality to a computer.'),
    (46, 'Barcode Printer', 'A printer that creates barcode labels.'),
    (47, 'Thunderbolt Cable', 'A high-speed data transfer cable used primarily to connect external devices to a computer.'),
    (48, 'USB Hub', 'A device that expands a single USB port into several ports, allowing multiple devices to be connected.'),
    (49, 'Wireless Mouse and Keyboard Combo', 'A set of cordless input devices for controlling a computer.'),
    (50, 'External Blu-ray Drive', 'A portable optical disc drive that reads and writes data to Blu-ray discs.');

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM EquipmentTypes;
SELECT * 
FROM EquipmentTypes;

-- Populate the Equipment table with sample data
INSERT INTO Equipment (EquipmentID, Name, EquipmentTypeID, Description, Price)
VALUES
    (1, 'Desktop Computer', 1, 'A personal computer designed for regular use at a single location.', 799.99),
    (2, 'Laptop Computer', 2, 'A portable computer with a clamshell form factor, suitable for mobile use.', 1299.99),
    (3, 'Server Rack', 3, 'A rack-mounted server used to provide network services to other devices.', 2999.99),
    (4, 'Wireless Router', 10, 'A networking device that forwards data packets between computer networks.', 99.99),
    (5, 'Network Switch', 10, 'A networking device that connects devices together on a computer network.', 149.99),
    (6, 'Firewall Appliance', 6, 'A network security device that monitors and controls incoming and outgoing network traffic.', 899.99),
    (7, 'Color Laser Printer', 7, 'A peripheral device that produces color text or graphics on paper.', 399.99),
    (8, 'Flatbed Scanner', 8, 'A device that optically scans images, printed text, handwriting, or an object.', 149.99),
    (9, 'Digital Projector', 9, 'A device that projects a digital image onto a surface.', 899.99),
    (10, 'External Hard Drive', 10, 'A portable storage device that can be attached to a computer through a USB interface.', 79.99),
    (11, 'Desktop Computer', 1, 'A personal computer designed for regular use at a single location.', 799.99),
    (12, 'Laptop Computer', 2, 'A portable computer with a clamshell form factor, suitable for mobile use.', 1299.99),
    (13, 'Server Rack', 3, 'A rack-mounted server used to provide network services to other devices.', 2999.99),
    (14, 'Wireless Router', 10, 'A networking device that forwards data packets between computer networks.', 99.99),
    (15, 'Network Switch', 10, 'A networking device that connects devices together on a computer network.', 149.99),
    (16, 'Firewall Appliance', 6, 'A network security device that monitors and controls incoming and outgoing network traffic.', 899.99),
    (17, 'Color Laser Printer', 7, 'A peripheral device that produces color text or graphics on paper.', 399.99),
    (18, 'Flatbed Scanner', 8, 'A device that optically scans images, printed text, handwriting, or an object.', 149.99),
    (19, 'Digital Projector', 9, 'A device that projects a digital image onto a surface.', 899.99),
    (20, 'External Hard Drive', 10, 'A portable storage device that can be attached to a computer through a USB interface.', 79.99),
    (21, 'Desktop Computer', 1, 'A personal computer designed for regular use at a single location.', 799.99),
    (22, 'Laptop Computer', 2, 'A portable computer with a clamshell form factor, suitable for mobile use.', 1299.99),
    (23, 'Server Rack', 3, 'A rack-mounted server used to provide network services to other devices.', 2999.99),
    (24, 'Wireless Router', 10, 'A networking device that forwards data packets between computer networks.', 99.99),
    (25, 'Network Switch', 10, 'A networking device that connects devices together on a computer network.', 149.99),
    (26, 'Firewall Appliance', 6, 'A network security device that monitors and controls incoming and outgoing network traffic.', 899.99),
    (27, 'Color Laser Printer', 7, 'A peripheral device that produces color text or graphics on paper.', 399.99),
    (28, 'Flatbed Scanner', 8, 'A device that optically scans images, printed text, handwriting, or an object.', 149.99),
    (29, 'Digital Projector', 9, 'A device that projects a digital image onto a surface.', 899.99),
    (30, 'External Hard Drive', 10, 'A portable storage device that can be attached to a computer through a USB interface.', 79.99),
    (31, 'Desktop Computer', 1, 'A personal computer designed for regular use at a single location.', 799.99),
    (32, 'Laptop Computer', 2, 'A portable computer with a clamshell form factor, suitable for mobile use.', 1299.99),
    (33, 'Server Rack', 3, 'A rack-mounted server used to provide network services to other devices.', 2999.99),
    (34, 'Wireless Router', 10, 'A networking device that forwards data packets between computer networks.', 99.99),
    (35, 'Network Switch', 10, 'A networking device that connects devices together on a computer network.', 149.99),
    (36, 'Firewall Appliance', 6, 'A network security device that monitors and controls incoming and outgoing network traffic.', 899.99),
    (37, 'Color Laser Printer', 7, 'A peripheral device that produces color text or graphics on paper.', 399.99),
    (38, 'Flatbed Scanner', 8, 'A device that optically scans images, printed text, handwriting, or an object.', 149.99),
    (39, 'Digital Projector', 9, 'A device that projects a digital image onto a surface.', 899.99),
    (40, 'External Hard Drive', 10, 'A portable storage device that can be attached to a computer through a USB interface.', 79.99),
    (41, 'Desktop Computer', 1, 'A personal computer designed for regular use at a single location.', 799.99),
    (42, 'Laptop Computer', 2, 'A portable computer with a clamshell form factor, suitable for mobile use.', 1299.99),
    (43, 'Server Rack', 3, 'A rack-mounted server used to provide network services to other devices.', 2999.99),
    (44, 'Wireless Router', 10, 'A networking device that forwards data packets between computer networks.', 99.99),
    (45, 'Network Switch', 10, 'A networking device that connects devices together on a computer network.', 149.99),
    (46, 'Firewall Appliance', 6, 'A network security device that monitors and controls incoming and outgoing network traffic.', 899.99),
    (47, 'Color Laser Printer', 7, 'A peripheral device that produces color text or graphics on paper.', 399.99),
    (48, 'Flatbed Scanner', 8, 'A device that optically scans images, printed text, handwriting, or an object.', 149.99),
    (49, 'Digital Projector', 9, 'A device that projects a digital image onto a surface.', 899.99),
    (50, 'External Hard Drive', 10, 'A portable storage device that can be attached to a computer through a USB interface.', 79.99);

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM Equipment;
SELECT *
FROM Equipment;

-- Populate the Transactions table with sample data
INSERT INTO Transactions (TransactionID, TransactionType, TransactionDate, ClientID)
VALUES
    (1, 'Service', '2024-02-01 08:30:00', 1),
    (2, 'Service', '2024-02-02 10:45:00', 2),
    (3, 'Equipment Purchase', '2024-02-03 13:15:00', 3),
    (4, 'Service', '2024-02-04 15:20:00', 4),
    (5, 'Equipment Sale', '2024-02-05 09:00:00', 5),
    (6, 'Service', '2024-02-06 11:30:00', 6),
    (7, 'Equipment Purchase', '2024-02-07 14:45:00', 7),
    (8, 'Service', '2024-02-08 16:00:00', 8),
    (9, 'Equipment Sale', '2024-02-09 10:15:00', 9),
    (10, 'Service', '2024-02-10 12:30:00', 10),
    (11, 'Service', '2024-02-11 08:30:00', 11),
    (12, 'Service', '2024-02-12 10:45:00', 12),
    (13, 'Equipment Purchase', '2024-02-13 13:15:00', 13),
    (14, 'Service', '2024-02-14 15:20:00', 14),
    (15, 'Equipment Sale', '2024-02-15 09:00:00', 15),
    (16, 'Service', '2024-02-16 11:30:00', 16),
    (17, 'Equipment Purchase', '2024-02-17 14:45:00', 17),
    (18, 'Service', '2024-02-18 16:00:00', 18),
    (19, 'Equipment Sale', '2024-02-19 10:15:00', 19),
    (20, 'Service', '2024-02-20 12:30:00', 20),
    (21, 'Service', '2024-02-21 08:30:00', 21),
    (22, 'Service', '2024-02-22 10:45:00', 22),
    (23, 'Equipment Purchase', '2024-02-23 13:15:00', 23),
    (24, 'Service', '2024-02-24 15:20:00', 24),
    (25, 'Equipment Sale', '2024-02-25 09:00:00', 25),
    (26, 'Service', '2024-02-26 11:30:00', 26),
    (27, 'Equipment Purchase', '2024-02-27 14:45:00', 27),
    (28, 'Service', '2024-02-28 16:00:00', 28),
    (29, 'Equipment Sale', '2024-02-29 10:15:00', 29),
    (30, 'Service', '2024-03-01 12:30:00', 30),
    (31, 'Service', '2024-03-02 08:30:00', 31),
    (32, 'Service', '2024-03-03 10:45:00', 32),
    (33, 'Equipment Purchase', '2024-03-04 13:15:00', 33),
    (34, 'Service', '2024-03-05 15:20:00', 34),
    (35, 'Equipment Sale', '2024-03-06 09:00:00', 35),
    (36, 'Service', '2024-03-07 11:30:00', 36),
    (37, 'Equipment Purchase', '2024-03-08 14:45:00', 37),
    (38, 'Service', '2024-03-09 16:00:00', 38),
    (39, 'Equipment Sale', '2024-03-10 10:15:00', 39),
    (40, 'Service', '2024-03-11 12:30:00', 40),
    (41, 'Service', '2024-03-12 08:30:00', 41),
    (42, 'Service', '2024-03-13 10:45:00', 42),
    (43, 'Equipment Purchase', '2024-03-14 13:15:00', 43),
    (44, 'Service', '2024-03-15 15:20:00', 44),
    (45, 'Equipment Sale', '2024-03-16 09:00:00', 45),
    (46, 'Service', '2024-03-17 11:30:00', 46),
    (47, 'Equipment Purchase', '2024-03-18 14:45:00', 47),
    (48, 'Service', '2024-03-19 16:00:00', 48),
    (49, 'Equipment Sale', '2024-03-20 10:15:00', 49),
    (50, 'Service', '2024-03-21 12:30:00', 50);

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM Transactions;
SELECT *
FROM Transactions;

-- Populate the Purchases table with sample data
INSERT INTO Purchases (PurchaseID, TransactionID, EquipmentID, Quantity, Price)
VALUES
    (1, 1, 1, 2, 100.00),
    (2, 2, 2, 1, 50.00),
    (3, 3, 3, 3, 300.00),
    (4, 4, 4, 1, 75.00),
    (5, 5, 5, 2, 200.00),
    (6, 6, 6, 1, 150.00),
    (7, 7, 7, 4, 400.00),
    (8, 8, 8, 1, 90.00),
    (9, 9, 9, 2, 180.00),
    (10, 10, 10, 1, 120.00),
    (11, 11, 11, 2, 100.00),
    (12, 12, 12, 1, 50.00),
    (13, 13, 13, 3, 300.00),
    (14, 14, 14, 1, 75.00),
    (15, 15, 15, 2, 200.00),
    (16, 16, 16, 1, 150.00),
    (17, 17, 17, 4, 400.00),
    (18, 18, 18, 1, 90.00),
    (19, 19, 19, 2, 180.00),
    (20, 20, 20, 1, 120.00),
    (21, 21, 21, 2, 100.00),
    (22, 22, 22, 1, 50.00),
    (23, 23, 23, 3, 300.00),
    (24, 24, 24, 1, 75.00),
    (25, 25, 25, 2, 200.00),
    (26, 26, 26, 1, 150.00),
    (27, 27, 27, 4, 400.00),
    (28, 28, 28, 1, 90.00),
    (29, 29, 29, 2, 180.00),
    (30, 30, 30, 1, 120.00),
    (31, 31, 31, 2, 100.00),
    (32, 32, 32, 1, 50.00),
    (33, 33, 33, 3, 300.00),
    (34, 34, 34, 1, 75.00),
    (35, 35, 35, 2, 200.00),
    (36, 36, 36, 1, 150.00),
    (37, 37, 37, 4, 400.00),
    (38, 38, 38, 1, 90.00),
    (39, 39, 39, 2, 180.00),
    (40, 40, 40, 1, 120.00),
    (41, 41, 41, 2, 100.00),
    (42, 42, 42, 1, 50.00),
    (43, 43, 43, 3, 300.00),
    (44, 44, 44, 1, 75.00),
    (45, 45, 45, 2, 200.00),
    (46, 46, 46, 1, 150.00),
    (47, 47, 47, 4, 400.00),
    (48, 48, 48, 1, 90.00),
    (49, 49, 49, 2, 180.00),
    (50, 50, 50, 1, 120.00);

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM Purchases;
SELECT *
FROM Purchases;


-- Populate the Resales table with sample data
INSERT INTO Resales (ResaleID, TransactionID, EquipmentID, Quantity, Price)
VALUES
    (1, 1, 1, 1, 80.00),
    (2, 2, 2, 1, 40.00),
    (3, 3, 3, 2, 200.00),
    (4, 4, 4, 1, 60.00),
    (5, 5, 5, 1, 150.00),
    (6, 6, 6, 2, 120.00),
    (7, 7, 7, 3, 300.00),
    (8, 8, 8, 1, 70.00),
    (9, 9, 9, 1, 160.00),
    (10, 10, 10, 2, 110.00),
    (11, 11, 11, 1, 80.00),
    (12, 12, 12, 1, 40.00),
    (13, 13, 13, 2, 200.00),
    (14, 14, 14, 1, 60.00),
    (15, 15, 15, 1, 150.00),
    (16, 16, 16, 2, 120.00),
    (17, 17, 17, 3, 300.00),
    (18, 18, 18, 1, 70.00),
    (19, 19, 19, 1, 160.00),
    (20, 20, 20, 2, 110.00),
    (21, 21, 21, 1, 80.00),
    (22, 22, 22, 1, 40.00),
    (23, 23, 23, 2, 200.00),
    (24, 24, 24, 1, 60.00),
    (25, 25, 25, 1, 150.00),
    (26, 26, 26, 2, 120.00),
    (27, 27, 27, 3, 300.00),
    (28, 28, 28, 1, 70.00),
    (29, 29, 29, 1, 160.00),
    (30, 30, 30, 2, 110.00),
    (31, 31, 31, 1, 80.00),
    (32, 32, 32, 1, 40.00),
    (33, 33, 33, 2, 200.00),
    (34, 34, 34, 1, 60.00),
    (35, 35, 35, 1, 150.00),
    (36, 36, 36, 2, 120.00),
    (37, 37, 37, 3, 300.00),
    (38, 38, 38, 1, 70.00),
    (39, 39, 39, 1, 160.00),
    (40, 40, 40, 2, 110.00),
    (41, 41, 41, 1, 80.00),
    (42, 42, 42, 1, 40.00),
    (43, 43, 43, 2, 200.00),
    (44, 44, 44, 1, 60.00),
    (45, 45, 45, 1, 150.00),
    (46, 46, 46, 2, 120.00),
    (47, 47, 47, 3, 300.00),
    (48, 48, 48, 1, 70.00),
    (49, 49, 49, 1, 160.00),
    (50, 50, 50, 2, 110.00);

-- Check the total number of records after insertion
SELECT COUNT(*) AS TotalRecords FROM Resales;
SELECT *
FROM Resales;

Drop Table Resales;
--Database options. 
--Backup: Take a backup of the database to ensure data integrity and disaster recovery.
-- Backup the database
BACKUP DATABASE ITConsultingDB TO DISK = 'C:\Users\n\Desktop\ITConsultingDB.bak';

--Step 4: SQL Logins and Users
--Create a SQL login with permissions to access and modify records:
CREATE LOGIN KaylaMcFarlane1 WITH PASSWORD = '@KaylaMcFarlane1';

--Create a user in the database associated with the login:
USE ITConsultingDB;
CREATE USER KaylaMcFarlane1 FOR LOGIN KaylaMcFarlane1;

--Grant appropriate permissions to the user:
-- Example: Grant SELECT, INSERT, UPDATE, DELETE permissions to the user
GRANT SELECT, INSERT, UPDATE, DELETE ON EquipmentTypes TO KaylaMcFarlane1;

--Create a SQL login with read-only access:
CREATE LOGIN KaylaMcFarlane2 WITH PASSWORD = '@KaylaMcFarlane2';

--Create a user in the database associated with the read-only login:
USE ITConsultingDB;
CREATE USER KaylaMcFarlane3 FOR LOGIN KaylaMcFarlane2;

--Grant read-only permissions to the user:
-- Example: Grant SELECT permissions to the user
GRANT SELECT ON Services TO KaylaMcFarlane3;

--Create a login for the app developer:
CREATE LOGIN KaylaMcFarlane4 WITH PASSWORD = '@KaylaMcFarlane4';

--Create a user in the database associated with the app developer login:
USE ITConsultingDB;
CREATE USER KaylaMcFarlane5 FOR LOGIN KaylaMcFarlane4;

--Step 9: Optional Bonus
-- Create Time Dimension
CREATE TABLE TimeDimension (
    DateKey INT PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT
);

-- Create Client Dimension
CREATE TABLE ClientDimension (
    ClientID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ContactInfo NVARCHAR(255),
    Address NVARCHAR(255)
);

-- Create Service Dimension
CREATE TABLE ServiceDimension (
    ServiceID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Description NVARCHAR(255)
);

-- Create Equipment Dimension
CREATE TABLE EquipmentDimension (
    EquipmentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Type NVARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Create Transaction Dimension
CREATE TABLE TransactionDimension (
    TransactionID INT PRIMARY KEY,
    TransactionType NVARCHAR(50),
    TransactionDate DATETIME,
    ClientID INT
);

-- Create Transactions Fact Table
CREATE TABLE TransactionsFact (
    TransactionID INT,
    ClientID INT,
    ServiceID INT,
    EquipmentID INT,
    TransactionDate DATETIME,
    Quantity INT,
    Price DECIMAL(10, 2)
);
