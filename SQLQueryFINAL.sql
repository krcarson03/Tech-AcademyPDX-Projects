CREATE DATABASE db_ILL
USE db_ILL

CREATE TABLE PUBLISHER (--no foreign key
	publisherID VARCHAR(50) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL UNIQUE,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK (--1 foreign key
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(350) NOT NULL,
	publisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisherID FOREIGN KEY REFERENCES publisher(name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS (--1 foreign key
	book_authors_ID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	bookID INT NOT NULL CONSTRAINT fk_authors_bookID FOREIGN KEY REFERENCES book(bookID) ON UPDATE CASCADE ON DELETE CASCADE, 
		--fk_[] names things, so if multiple tables reference the same column, each fk_[] must have a unique name
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE LIBRARY_BRANCH (--no foreign key
	branchID INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	branchName VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (--2 foreign keys
	book_copies_ID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	bookID INT NOT NULL CONSTRAINT fk_copies_bookID FOREIGN KEY REFERENCES book(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_branchID FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	no_of_copies VARCHAR(50) NOT NULL
);

CREATE TABLE BORROWER (--no foreign key
	cardNo VARCHAR(50) PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_LOANS (--3 foreign keys
	book_loansID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	bookID INT NOT NULL CONSTRAINT fk_loans_bookID FOREIGN KEY REFERENCES book(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL CONSTRAINT fk_loans_branchID FOREIGN KEY REFERENCES library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	cardNo VARCHAR(50) NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES borrower(cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut VARCHAR(50) NOT NULL,
	dueDate VARCHAR(50) NOT NULL
);

SELECT * FROM BOOK
SELECT * FROM BOOK_COPIES
SELECT * FROM BORROWER
SELECT * FROM PUBLISHER
SELECT * FROM BOOK_LOANS
SELECT * FROM LIBRARY_BRANCH
/*************************** 
		Insert data 
****************************/

INSERT INTO PUBLISHER
	/*************
	 REQUIREMENTS:
	 *************/
	 (publisherID, name, address, phone)
	 VALUES
	 (1, 'Michael Joseph', 'London, England', '+44 (020) 1111 2222'),
	 (2, 'Hogarth Press', 'London, England', '+44 (020) 3333 4444'),
	 (3, 'Plaza & Janés, S.A.', 'Barcelona, Spain', '+34 930 555 666'),
	 (4, 'Alfred A. Knopf', 'New York, NY', '1 (929) 555 5309'),
	 (5, 'Bloomsbury Publishing', 'London, England', '+44 (020) 7777 8888'),
	 (6, 'Walker Books', 'Walker Books', '+44 (020) 9999 0000'),
	 (7, 'Viking Press', 'New York, NY', '1 (929) 000 9999'),
	 (8, 'Crown Books', 'Danvers, MA', '1 (978) 750 8400'),
	 (9, 'HarperCollins', 'New York, NY', '1 (929) 888 7777'),
	 (10, 'Shogakukan Co., Ltd.', 'Tokyo, Japan', '+81 03 6666 5555'),
	 (11, 'Columbia University Press', 'New York, NY', '1 (212) 444 3333'),
	 (12, 'Picador USA', 'New York, NY', '1 (929) 222 1111')
;

INSERT INTO BOOK 
	/*************
	 REQUIREMENTS:
	 20 book minimum
	 Book title "The Lost Tribe"
	 2 books by Stephen King
	 *************/
	 (title, publisherName)
	 VALUES
	 ('The Golden Notebook', 'Michael Joseph'),
	 ('To The Lighthouse', 'Hogarth Press'),
	 ('House of the Spirits', 'Plaza & Janés, S.A.'),
	 ('Davita''s Harp', 'Alfred A. Knopf'),
	 ('Harry Potter and the Sorcerer''s Stone', 'Bloomsbury Publishing'),
	 ('Harry Potter and the Chamber of Secrets', 'Bloomsbury Publishing'),
	 ('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury Publishing'),
	 ('Harry Potter and the Goblet of Fire', 'Bloomsbury Publishing'),
	 ('Harry Potter and the Order of the Phoenix', 'Bloomsbury Publishing'),
	 ('Harry Potter and the Half Blood Prince','Bloomsbury Publishing' ),
	 ('Harry Potter and the Deathly Hallows', 'Bloomsbury Publishing'),
	 ('The Knife of Never Letting Go', 'Walker Books'),
	 ('The Ask and the Answer', 'Walker Books'),
	 ('Monsters of Men', 'Walker Books'),
	 ('Different Seasons', 'Viking Press'),
	 ('Four Past Midnight', 'Viking Press'),
	 ('Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy', 'Crown Books'),
	 ('The Nordic Theory of Everything', 'HarperCollins'),
	 ('The Legend of Zelda: Hyrule Historia', 'Shogakukan Co., Ltd.'),
	 ('Why Civil Resistance Works: The Strategic Logic of Nonviolent Conflict', 'Columbia University Press'),
	 ('The Lost Tribe', 'Picador USA')
;
SELECT * FROM BOOK

INSERT INTO BOOK_AUTHORS
	/*************
	 REQUIREMENTS:
	 *************/
	 (bookID, AuthorName)
	 VALUES
	 (1, 'Lessing, Doris'),
	 (2, 'Woolf, Virginia'),
	 (3, 'Allende, Isabel'),
	 (4, 'Potok, Chaim'),
	 (5, 'Rowling, J. K.'),
	 (6, 'Rowling, J. K.'),
	 (7, 'Rowling, J. K.'),
	 (8, 'Rowling, J. K.'),
	 (9, 'Rowling, J. K.'),
	 (10, 'Rowling, J. K.'),
	 (11, 'Rowling, J. K.'),
	 (12, 'Ness, Patrick'),
	 (13, 'Ness, Patrick'),
	 (14, 'Ness, Patrick'),
	 (15, 'King, Stephen'),
	 (16, 'King, Stephen'),
	 (17, 'O''Neil, Cathy'),
	 (18, 'Partanen, Anu'),
	 (19, 'Himekawa, Akira and Nintendo'),
	 (20, 'Chenoweth, Erica and Maria J. Stephan'),
	 (21, 'Lee Mark')
;
SELECT * FROM BOOK_AUTHORS

INSERT INTO BOOK_COPIES
	/*************
	 REQUIREMENTS:
	 *************/
	 (bookID, branchID, no_of_copies)
	 VALUES
	 (1, 503, 4),
	 (2, 501, 3),
	 (3, 502, 3),
	 (4, 503, 2),
	 (5, 504, 14),
	 (6, 504, 6),
	 (7, 504, 10),
	 (8, 504, 8),
	 (9, 504, 12),
	 (10, 504, 14),
	 (11, 504, 13),
	 (12, 505, 3),
	 (13, 506, 3),
	 (14, 507, 4),
	 (15, 508, 5),
	 (16, 509, 3),
	 (17, 500, 2),
	 (18, 508, 2),
	 (19, 503, 1),
	 (20, 509, 1),
	 (21, 500, 1),
	 (21, 503, 1),
	 (11, 507, 1)
;
SELECT * FROM BOOK_COPIES

INSERT INTO BOOK_LOANS
	/*************
	 REQUIREMENTS:
	 *************/
	 (bookID, branchID, cardNo, dateOut, dueDate)
	 VALUES
	 (15, 501, 00490683, '2018-19-02', '2018-12-03'),
	 (21, 508, 00901008, '2018-10-02', '2018-03-03'),
	 (2, 502, 00106785, '2018-25-02', '2018-18-03'),
	 (5, 501, 00490683, '2018-19-02', '2018-12-03'),
	 (2, 501, 00100341, '2018-18-02', '2018-11-03'),
	 (10, 502, 00106785, '2018-25-02', '2018-18-03'),
	 (11, 505, 00200123, '2018-12-02', '2018 -05-03'),
	 (4, 508, 00901008, '2018-10-02', '2018-03-03'),
	 (18, 509, 00192837, '2018-25-02', '2018-18-03'),
	 (20, 509, 00192837, '2018-25-02', '2018-18-03'),
	 (19, 508, 00901008, '2018-10-02', '2018-03-03'),
	 (17, 506, 00200053, '2018-13-02', '2018-06-03'),
	 (6, 501, 00100341, '2018-18-02', '2018-11-03'),
	 (9, 505, 00200123, '2018-12-02', '2018 -05-03'),
	 (9, 508, 00901008, '2018-10-02', '2018-03-03'),
	 (15, 509, 00192837, '2018-25-02', '2018-18-03'),
	 (8, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (5, 506, 00200053, '2018-13-02', '2018-06-03'),
	 (14, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (6, 503, 00647638, '2018-17-02', '2018-10-03'),
	 (9, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (13, 501, 00490683, '2018-20-02', '2018-13-03'),
	 (6, 501, 00490683, '2018-20-02', '2018-13-03'),
	 (7, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (8, 503, 00647638, '2018-17-02', '2018-10-03'),
	 (5, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (7, 506, 00200053, '2018-13-02', '2018-06-03'),
	 (10, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (13, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (3, 509, 00192837, '2018-25-02', '2018-18-03'),
	 (12, 501, 00490683, '2018-19-02', '2018-12-03'),
	 (8, 502, 00106785, '2018-25-02', '2018-18-03'),
	 (16, 501, 00100341, '2018-18-02', '2018-11-03'),
	 (1, 508, 00901008, '2018-10-02', '2018-03-03'),
	 (12, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (1, 505, 00200123, '2018-12-02', '2018 -05-03'),
	 (19, 505, 00200123, '2018-12-02', '2018 -05-03'),
	 (6, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (17, 501, 00100341, '2018-18-02', '2018-11-03'),
	 (3, 500, 00390342, '2018-09-02', '2018-02-03'),
	 (12, 502, 00760599, '2018-24-02', '2018-17-03'),
	 (13, 502, 00760599, '2018-24-02', '2018-17-03'),
	 (14, 502, 00760599, '2018-24-02', '2018-17-03'),
	 (9, 503, 00647638, '2018-17-02', '2018-10-03'),
	 (10, 503, 00647638, '2018-17-02', '2018-10-03'),
	 (6, 504, 00390342, '2018-20-02', '2018-13-03'),
	 (7, 504, 00390342, '2018-20-02', '2018-13-03'),
	 (8, 504, 00390342, '2018-20-02', '2018-13-03'),
	 (1, 501, 00100341, '2018-18-02', '2018-11-03'),
	 (6, 506, 00200053, '2018-13-02', '2018-06-03')
;
SELECT * FROM BOOK_LOANS 

INSERT INTO BORROWER
	/*************
	 REQUIREMENTS:
	 *************/
	 (cardNo, name, address, phone)
	 VALUES
	 (00192837, 'Organa, Leia', '4 Privet Dr., A galaxy far far away', '2 (333) 78 98 768'),
	 (00106785, 'Dameron, Poe', '8 N 10th St., A galaxy far far away', '2 (333) 90 65 983'),
	 (00100341, 'Kanata, Maz', '98 Forest Ave., Takodana', '2 (090) 879 431'),
	 (00200053, 'Rey', '101 Desert Rd., Jakku', '2 (784) 7653 9806'),
	 (00200123, 'Finn', '9078 Birch Ave., A galaxy far far away', '2 (086) 55 35 8744'),
	 (00901008, 'Chewbacca', '87 Ash St., Kashyyyk', '2 (987) 654 321'),
	 (00760599, 'Tico, Rose', '8 E 6th St., A galaxy far far away', '2 (333) 78 43 901'),
	 (00490683, 'Skywalker, Luke', '21 Island Cr., Ahch-To', '2 (945) 3452 2543'),
	 (00647638, 'Solo, Han', '9 Mos Eisley Ct., Tatooine', '2 (098) 765 123'),
	 (00390342, 'Johnson, Marie', '1234 Wee Sing Ln., Any City, USA', '1 (001) 555 5555')
;
INSERT INTO BORROWER
	(cardNo, name, address, phone)
	VALUES
	(00202840, 'Doe, Jane', '1000 Wee Sing Ln., Any City, USA', '1 (001) 555 6666')
;
SELECT * FROM BORROWER 

INSERT INTO LIBRARY_BRANCH
	/*************
	 REQUIREMENTS:
	 *************/
	 (branchName, address)
	 VALUES
	 ('Sharpstown', '123 N ASLDER, Any City, USA'),
	 ('Central', '406 N BIRCH, Any City, USA'),
	 ('Lewis', '789 N CEDAR, Any City, USA'),
	 ('MacDonald', '101 N DOGWOOD, Any City, USA'),
	 ('Tolkein', '201 S ENGELMANN, Any City, USA'),
	 ('Butler', '303 S FIR, Any City, USA'),
	 ('Rushdie', '24 NE HAWTHORNE, Any City, USA'),
	 ('Hughes', '802 NW JUNIPER, Any City, USA'),
	 ('Le Guin', '5097 NW LODGEPOLE, Any City, USA'),
	 ('Baldwin', '321 W MAPLE, Any City, USA')
;
SELECT * FROM LIBRARY_BRANCH