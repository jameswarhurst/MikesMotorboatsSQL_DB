use .........;

DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS part_type;
DROP TABLE IF EXISTS rental_reservation;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS part_order;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS boat;
DROP TABLE IF EXISTS boat_type;
DROP TABLE IF EXISTS manufacturer_supplier;
DROP TABLE IF EXISTS boat_dealer;



CREATE TABLE boat_dealer(
dealerID INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
phoneNumber VARCHAR(25),
address VARCHAR(50),
email VARCHAR(50)
);



CREATE TABLE customers(
customerID INT PRIMARY KEY AUTO_INCREMENT,
forename VARCHAR(30),
surname VARCHAR(30),
phoneNumber VARCHAR(11),
address VARCHAR(100),
email VARCHAR(100)
);



CREATE TABLE manufacturer_supplier(
manufacturerID int PRIMARY KEY AUTO_INCREMENT,
name VARCHAR (40),
phoneNumber VARCHAR (20),
address VARCHAR (100),
email VARCHAR (50)
);



CREATE TABLE boat_type(
boatTypeID INT PRIMARY KEY AUTO_INCREMENT,
class VARCHAR(50),
size VARCHAR (50)
-- CONSTRAINT PRIMARY KEY (class, size)
);



CREATE TABLE boat(
boatID INT PRIMARY KEY AUTO_INCREMENT,
boatTypeID INT,
manufacturerID INT,
model VARCHAR(40),
purchaseDate DATE,
price VARCHAR(40),
dealerID INT,
warranty VARCHAR(40),
dateSold DATE,
sellPrice INT,



CONSTRAINT boatTypeID FOREIGN KEY(boatTypeID)
REFERENCES boat_type(boatTypeID),



CONSTRAINT manufacturerID FOREIGN KEY(manufacturerID)
REFERENCES manufacturer_supplier(manufacturerID),



CONSTRAINT dealerID FOREIGN KEY(dealerID)
REFERENCES boat_dealer(dealerID)
);



CREATE TABLE maintenance(
referenceNo INT AUTO_INCREMENT PRIMARY KEY,
boatID INT,
faultDetails VARCHAR(100),
faultDate DATE,
actionTaken VARCHAR(1000),
actionDate DATE,
lastCleanDate DATE,




CONSTRAINT boatID FOREIGN KEY(boatID)
REFERENCES boat(boatID)
);



CREATE TABLE part_order(
orderID INT PRIMARY KEY AUTO_INCREMENT,
referenceNo INT,
quantityOrdered INT,
quantityArrived INT,
deliveryDate DATE,



CONSTRAINT referenceNo FOREIGN KEY (referenceNo)
REFERENCES maintenance (referenceNo)
);



CREATE TABLE part_type(
size VARCHAR(25),
type VARCHAR(25),
orderID INT,



CONSTRAINT PRIMARY KEY (size, type, orderID),



CONSTRAINT orderID FOREIGN KEY (orderID)
REFERENCES part_order (orderID)
);



CREATE table part(
part_ID INT PRIMARY KEY AUTO_INCREMENT,
manufacturerID INT,
part VARCHAR (50),
size varchar (25),
type varchar (25),
orderID INT,



CONSTRAINT size FOREIGN KEY (size, type, orderID)
REFERENCES part_type (size, type, orderID)
);



CREATE TABLE rental_reservation(
rental_reservationID INT PRIMARY KEY AUTO_INCREMENT,
reservationDate DATE,
boatID INT,
customerID INT,
boatTypeID INT,
rentalDate DATE,
rentPeriod VARCHAR(20),
returnDate DATE,
actualReturn DATE,
price INT,
amountPaid INT,
fine INT,



-- CONSTRAINT PRIMARY KEY (reservationDate, boatID, customerID),



CONSTRAINT boatID2 FOREIGN KEY (boatID)
REFERENCES boat (boatID),



CONSTRAINT customerID FOREIGN KEY (customerID)
REFERENCES customers (customerID),



CONSTRAINT boatTypeID2 FOREIGN KEY (boatTypeID)
REFERENCES boat_type (boatTypeID)
);





INSERT INTO boat_dealer(name, phoneNumber, address, email)
VALUES ("Dalis Vannoort", 07574137463, "77 A828, Appin, AP7 6GU", "dvannoort0@salon.com"),
("Joe's Junk ", 07365534221, "15 Back Lane, Buxton, BX7 5FY ", "JoesJunk@zdnet.com"),
("Hoebart Kubera", 07874051869, "77 A828, Appin, AP7 6GU", "dvannoort0@salon.com"),
("Eva Iacomettii ", 07880072148, "9 Hartlands, Onslow Road, Newent, NW5 8TU", "eiacomettii3@admin.ch"),
("Alley Pate", 07822040557, "07610 Arizona Alley, A67 8GU", "apate4@gnu.org"),
("Korrie Legge", 07380018233, "1076 Evesham Road, Astwood Bank, DT5 8JO", "klegge5@reference.com"),
("Minne Hinkens", 07978390430, "53 Balby Road, Balby, B7 8HK", "mhinkens6@smh.com.au"),
("Inigo MacAllaster", 07893419552, "1910 Farwell Plaza, G56 9FT", "imacallaster7@blogspot.com"),
("Linell Skeeles", 07532931207, "57 Great Russell Street, London, NW1 8TU ", "lskeeles8@goo.gl"),
("Sioux Drogan", 07574137463, "75 Thomas Parsons Square, Ely, EL6 9GU ", "sdrogan9@dropbox.com"),
("Borat Deeler", 0754324137463, "14 You Rd, Cheshire, CW2 4JT", "boratdeeler9@gmail.com"),
("John Smyth", 07636382812, "15 Lyod Street, Manchester, M5 4XP", "JonnySmyth@gmail.com"),
("Janine Adele", 0766546543, "1 London Road, London L1 ASD", "jadz95@hotmail.com"),
("Ellie Crumpet", 07524365673, "Yak Road, Liverloop L1 MA1", "elliecrump@hotmail.com"),
("James Jamerson", 0731380032, "Thomas Square, Nice Street, Birmingham, B1 010A", "jj@biz.com");



INSERT INTO customers(forename, surname, phoneNumber, address, email)
VALUES ('Dion', 'Brodnecke', 07174826351, '9 Oak Street, Liverpool, L34 8DY', 'dbroes1d@who.int'),
('Scarlett', 'Galley', 03260476982, '886 Northport Parkway, Liverpool, L36DF', 'scargr1c@imgur.com'),
('Sissy', 'Gadson', 04924556740, '95 Putney Road, Liverpool, L2 7YG', 'sgadson1b@ucoz.com'),
('Tabby', 'Minichi', 07795213673, '6 Amoth Court, Warrington, WT6 8UY', 'minitabc@imgur.com'),
('Nellie', 'Greenmon', 03816078215, '40 Graceland Crossing, Liverpool, L23 8FY', 'nelliegreen12@patch.com'),
('Hanny', 'Marsters', 07075576685, '2 Almo Trail, Liverpool, L21 9FY', 'hmarsters@netlog.com'),
('Oswell', 'Aspinell', 09931348133, '64 Jackson Road, Liverpool, L5 6FH', 'OsAspinell@digg.com'),
('Florence', 'Baston', 07315082134, '40 Magdeline Lane, Warrington, WT5 8WK', 'FloBar@dirtg.com'),
('Candice', 'Tumilson', 01639824657, '1 Farragut Parkway, Liverpool, L75 8GJ', 'canditum15@bloomberg.com'),
('Clair', 'Bavin', 06245985897, '87 Toban Drive, Liverpool, L26 8GH', 'clairBav@sprog.it'),
('Jason', 'Karter', 07892562171, '19 Talbot Road, Manchester, M33 9AH', 'JasonK@inter.com'),
('Dennis', 'Decker', 07349216783, '42 Davidson Street, London, EC1X 2AV', 'Dennis12@email.com'),
('Martha', 'Morrison', 07893465891, '18 Carolton Road, Edinburgh, EH12 9BA', 'MMScience@labs.int'),
('Darren', 'Carter', 07453619341, '31 Dorrison Close, Stockport, SK7 3EY', 'DCarter@inter.com'),
('Karen', 'Michaels', 09745360742, '3 Coral Street, Liverpool, L17 2HY', 'KarenM@Skill.com');

INSERT INTO boat_type(class, size)
VALUES("motorBoat", "Small"),
("sailBoat", "Small"),
("rowingBoat", "Small"),
("motorBoat", "Standard"),
("sailBoat", "Standard"),
("rowingBoat", "Standard"),
("motorBoat", "Large"),
("sailBoat", "Large"),
("rowingBoat", "Large"),
("motorBoat", "Very Large"),
("sailBoat", "Very Large"),
("pedalo", "Very Large"),
("pedalo", "Large"),
("pedalo", "Standard"),
("pedalo", "Small"),
("speedBoat", "Very Large"),
("speedBoat", "Large");

INSERT INTO manufacturer_supplier (name, phoneNumber, address, email)
VALUES ("SuperBoat", "01772459666", "Unit 7 Centurion Court, Leyland, LE10 2DJ", "admin@superboat.co.uk"),
("Explorer Boats UK", "01704807654", "Meadow Lane, Burscough, BU56 8GH", "admin@explorerboats.co.uk"),
("The Northwich Boat Company", "01270160160", "Unit 1 Kings Lock Boatyard Booth Lane, Middlewich, MW67 7GY", "admin@northwichboats.co.uk"),
("Collingwood Boat Builders", "01513742985", "29 Townsend Street, Collingwood, CL27 2DU", "admin@collingwoodboats.co.uk"),
("Elton Moss Boat Builders", "01270760160", "Unit 4 Kings Lock Boatyard Booth Lane, Middlewich, MW63 8TY", "admin@eltonmossboats.co.uk"),
("Aintree Boat Company Ltd", "01515239000", "Brookfield Drive, Liverpool, L1 6GU", "admin@aintreeboats.co.uk"),
("Braidbar Boats Ltd", "01625873471", "Lord Vernons Wharf Lyme Road Higher, Poynton, PY12 9TS", "admin@braidbarboats.co.uk"),
("Bourne Boat Builders Ltd", "01785714692", "Teddesley Road, Penkridge, PE8 7SU", "admin@bourneboats.co.uk"),
("Stoke on Trent Boat Building Co Ltd", "01782813831", "Longport Wharf Station Street, Stoke-on-Trent, ST6 9GU", "admin@stokeboats.co.uk"),
("MGM Boats Narrowboat Builders", "01162640009", "27 Mill Lane, Leicester, LE6 9FY", "admin@mgmboats.co.uk"),
("Daves Pedalos", "0161992832", "14 Factory Street, Manchester", "admin@davesamazingpedalos.co.uk"),
("Sammy Speedboats", "0789456722", "14A, Industrial Estate, Liverpool, LA1 POL", "admin@mgmboats.co.uk"),
("Boat Builder UK", "0732789019072", "United Street, Ordsall, Salford, M5 6LL", "admin@bbuilder.co.uk"),
("Barry Boating Supplies", "0800001066", "Hastings Lane, 104 Milcroft, Hastings", "admin@barryboatman.co.uk"),
("Nick the Boat Man", "076321890321", "1 Niceiest Street, Flowerscroft, Glasgow GL1 GGA", "admin@nickmantheboat.co.uk");



INSERT INTO boat(boatTypeID, model, manufacturerID, purchaseDate, price, dealerID, warranty, dateSold, sellPrice)
VALUES(1 , "Explorer", 1, "2010-11-22", 3910, 2, "2 Years", "2020-01-02", 1500),
(11 , "TurboSail", 2, "2009-10-12", 3840, 2, "2 Years", "2019-10-10", 1600),
(8 , "MasterSail", 2, "2015-10-12", 3240, NULL, NULL, NULL, NULL),
(2 , "SmallSailor", 3, "2015-11-12", 2040, NULL, NULL, NULL, NULL),
(2 , "SmallSailor", 3, "2015-11-12", 2040, NULL, NULL, NULL, NULL),
(7 , "Grande", 5, "2015-01-14", 5440, NULL, NULL, NULL, NULL),
(7 , "Grande", 5, "2015-01-14", 5440, NULL, NULL, NULL, NULL),
(4 , "Turbo Mid", 2, "2015-01-14", 5440, NULL, NULL, NULL, NULL),
(9 , "RowStream", 3, "2015-01-12", 440, NULL, NULL, NULL, NULL),
(6 , "RowerX", 4, "2015-01-12", 320, NULL, NULL, NULL, NULL),
(8 , "Explorer", 1, "2016-01-10", 3320, NULL, NULL, NULL, NULL),
(5 , "Navigator", 1, "2016-01-10", 3320, NULL, NULL, NULL, NULL),
(4 , "Turbo Mid", 2, "2018-02-14", 4440, NULL, NULL, NULL, NULL),
(4 , "Turbo Mid", 2, "2018-02-14", 4440, NULL, NULL, NULL, NULL),
(7 , "MasterBlaster", 7, "2018-01-14", 5440, NULL, NULL, NULL, NULL),
(9 , "HappyRower", 8, "2018-01-10", 340, NULL, NULL, NULL, NULL),
(3 , "HappyRower", 8, "2018-01-10", 340, NULL, NULL, NULL, NULL),
(12 , "Streamer", 3, "2017-01-09", 640, NULL, NULL, NULL, NULL),
(12, "Great Row", 4, "2019-01-19", 650, NULL, NULL, NULL, NULL),
(10 , "SuperBlaster", 7, "2018-01-14", 7440, NULL, NULL, NULL, NULL),
(6 , "Lizard", 6, "2017-01-09", 340, NULL, NULL, NULL, NULL),
(7 , "Grande", 5, "2018-02-14", 5440, NULL, NULL, NULL, NULL),
(12 , "SailorX", 2, "2015-10-12", 3240, NULL, NULL, NULL, NULL),
(8 , "BoatyMcBoatFace", 2, "2017-10-12", 3900, NULL, NULL, NULL, NULL),
(8 , "Boatzilla", 2, "2015-10-12", 9999, NULL, NULL, NULL, NULL),
(13 , "Pedalo2000", 2, "2016-10-12", 354, NULL, NULL, NULL, NULL),
(14 , "Pedalo2000", 2, "2018-10-12", 323, NULL, NULL, NULL, NULL),
(15 , "Pedalo2000", 2, "2019-10-12", 310, NULL, NULL, NULL, NULL);



INSERT INTO maintenance(boatID, faultDetails, faultDate, actionTaken, actionDate, lastCleanDate)
VALUES(1,"Chipped propeller","2015-02-15","Replace Propeller","2015-02-27", NULL),
(1,"Bilge pumps gone","2015-07-10","New bilge pumps","2015-08-27", NULL),
(1,NULL, NULL,"New head pumps","2015-08-15", NULL),
(1, NULL, NULL ,"Service","2016-03-20", NULL),
(1,"Cutless bearing worn through","2016-12-02","Fit new bearing","2017-01-27", NULL),
(3,"Damaged mast","2016-04-17","Repair Mast","2016-04-27",NULL),
(3,"Bent forestay","2017-08-10","Replace forestay","2017-08-22", NULL),
(3,"Shot boom","2018-05-07","Replace boom","2018-06-06", NULL),
(3,"Rudderstock chipped","2019-07-07","Repair Rudderstock","2019-07-08", NULL),
(3, NULL, NULL,"Normal Service","2020-01-27", NULL),
(3,"Rudderblade busted", "2020-10-19", NULL, NULL, NULL),
(3,"Back of boat chipped","2019-07-07","filler","2019-07-08", NULL),
(3,"colour peeling","2019-07-09","paint","2019-07-08", NULL),
(3,"screws mssing","2019-07-09","ordered some screws","2019-07-08", NULL),
(3,"boat broken engine on fire","2019-07-08","engine replacement","2019-07-08", NULL),
(3,"Sail torn","2019-07-08","Repair sail","2019-07-08", NULL);




INSERT INTO part_order(referenceNo, quantityOrdered, quantityArrived, deliveryDate)
VALUES (1, 1000, 1000, "2022-01-12"),
(2, 50, 48, "2022-01-25"),
(3, 2, NULL, NULL),
(4, 1, 1, "2022-02-03"),
(5, 3000, 3000, "2022-02-07");

INSERT INTO part_type(size, type, orderID)
VALUES ('Tiny', 'Bolts', 1),
('Small', 'Plastic Sealant', 2),
('Large', 'Engine Replacements', 3),
('Medium', 'Steering Helm', 4),
('Tiny', 'General Supplies', 5);

INSERT INTO part(manufacturerID, part, size, type, orderID)
VALUES (4, "4.5mm Hex Bolts", "Tiny", "Bolts", 1),
(1, "Happy Rower Sealant", "Small", "Plastic Sealant", 2),
(3, "MasterSail Ignition Coil", "Large", "Engine Replacements", 3),
(4, "Northwich Boat Co Rudder", "Medium", "Steering Helm", 4),
(8, "Nylon 4.5mm Washers", "Tiny", "General Supplies", 5);

INSERT INTO rental_reservation(reservationDate, boatID, customerID, boatTypeID, rentalDate, rentPeriod, returnDate, actualReturn, price, amountPaid, fine)
VALUES ("2019-05-02", 1, 10, 4, "2019-05-02", "half day", "2019-05-02", "2019-05-02", 125, 125, NULL),
("2019-05-03", 1, 11, 4, "2019-05-03", "half day", "2019-05-03", "2019-05-03", 125, 125, NULL),
("2019-05-04", 1, 12, 4, "2019-05-04", "two day", "2019-05-05", "2019-05-06", 125, 125, 50 ),
("2019-05-06", 1, 13, 4, "2019-05-06", "full day", "2019-05-06", "2019-05-06", 125, 125, NULL),
("2020-10-20", 9, 9, 1, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 280, 280, NULL),
("2020-10-20", 16, 2, 3, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 220, 220, NULL),
("2020-10-20", 7, 9, 7, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, 240, NULL),
("2020-10-20", 6, 4, 7, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, 240, NULL),
("2020-10-20", 9, 7, 12, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 140, 140, NULL),
("2020-10-20", 15, 6, 10, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, 240, NULL),
("2020-10-20", 9, 2, 8, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 180, 180, NULL),
("2020-10-20", 17, 5, 3, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 110, 110, NULL),
("2020-10-20", 14, 9, 4, "2020-10-20", "two day", "2020-10-20", "2020-10-21", 400, 400, NULL),
("2020-10-20", 11, 2, 8, "2020-10-20", "full", "2020-10-20", "2020-10-20", 180, NULL, 50),
("2020-10-20", 4, 8, 2, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 110, 110, NULL),
("2020-10-20", 13, 9, 4, "2020-10-20", "two day", "2020-10-20", "2020-10-21", 400, 400, NULL),
("2020-10-20", 8, 1, 4, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 200, 200, NULL),
("2020-10-20", 1, 6, 4, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 200, 200, NULL),
("2020-10-20", 10, 7, 6, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 120, 120, NULL),
("2020-10-20", 21, 10, 6, "2020-10-20", "half day", "2020-10-20", "2020-10-20", 80, 80, NULL),
("2020-10-20", 20, 4, 10, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 280, 280, NULL),
("2020-10-20", 2, 8, 11, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, 240, NULL),
("2020-10-20", NULL, 10, 5, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 160, NULL, NULL),
("2020-10-20", NULL, 3, 12, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 100, NULL, NULL),
("2020-10-20", NULL, 3, 6, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 120, NULL, NULL),
("2020-10-20", NULL, 3, 12, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 100, NULL, NULL),
("2020-10-20", 16, 1, 8, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 180, 180, NULL),
("2020-10-20", 6, 4, 7, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, NULL, 50),
("2020-10-20", 6, 2, 7, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, 240, NULL),
("2020-10-20", NULL, 2, 3, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 240, NULL, NULL),
("2020-10-20", NULL, 2, 4, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 250, NULL, NULL),
("2020-10-20", NULL, 2, 5, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 260, NULL, NULL),
("2020-10-20", NULL, 2, 6, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 220, NULL, NULL),
("2020-10-20", NULL, 2, 7, "2020-10-20", "full day", "2020-10-20", "2020-10-20", 250, NULL, NULL);



SELECT * FROM part;
SELECT * FROM part_type;
SELECT * FROM rental_reservation;
SELECT * FROM customers;
SELECT * FROM part_order;
SELECT * FROM maintenance;
SELECT * FROM boat;
SELECT * FROM boat_type;
SELECT * FROM manufacturer_supplier;
SELECT * FROM boat_dealer;
