DROP TABLE Books;

USE mydatabase;
 -- CREATE TABLE
 CREATE TABLE Books(
  book_id INT UNIQUE AUTO_INCREMENT,
  title VARCHAR(70) NOT NULL,
  isbn VARCHAR(100) UNIQUE ,
  price DECIMAL(10,2),
  published_date DATE,
  in_stock INT DEFAULT 1,
  PRIMARY KEY(book_id));
  
  DESC Books;
  
  -- INSERTING DATA

INSERT INTO Books
   (title , isbn , price , published_date , in_stock)
VALUES
   ('OS' , '3266273' , 580 , '2020-10-26' , 07),
   ('CN' , '65361863' , 700 , '2005-05-14' , 03),
   ('DBNS' , '348345' , 234 , '2021-03-05' , 16),
   ('CCS' , '64723' , 398 , '2003-11-25' , 02),
   ('FDS' , '37218' , 438 , '2001-02-28' , 18);
   
   SELECT *
   from Books;
   -- changing title to booktitle
   
  ALTER TABLE Books   
 CHANGE COLUMN title book_title VARCHAR(70); 
   
   
   -- changing datatype
  ALTER TABLE Books
  MODIFY COLUMN price float;
  
  -- adding new values in container
  
  ALTER TABLE Books
  ADD COLUMN author_name VARCHAR(30) NOT NULL DEFAULT 'Unknown';
  
  -- updating existing data
  
SET SQL_SAFE_UPDATES = 0;

UPDATE Books 
SET price = price * 0.9
WHERE published_date < '2020-01-01';

SET SQL_SAFE_UPDATES = 1;

-- DELETE SPECIFIC RECORD

DELETE FROM Books
WHERE in_stock = 0;

SET SQL_SAFE_UPDATES = 0;

-- AUTO INCREMENT values

ALTER TABLE Books
AUTO_INCREMENT = 101;

INSERT INTO Books (book_title, isbn, price, published_date, in_stock, author_name)
VALUES ('Science', '12356', 2000, '2002-11-17',23, 'chaithra');

  DESC Books;
  
  -- SELECT WITH PATTERN MATCHING
  
  SELECT book_title, price, published_date
FROM Books
WHERE book_title LIKE '%History%'
AND price > 300
ORDER BY price DESC;

-- 2ND TABLE 

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);
 
DESC Members;
INSERT INTO Members (member_name, join_date)
VALUES
('chaithra', '2002-11-17'),
('pooja', '2006-12-14'),
('lucky', '2008-06-16'),
('hema', '2006-07-08'),
('sowji', '2004-12-16');


SELECT member_name, join_date
FROM Members
WHERE YEAR(join_date) = 2024
ORDER BY member_name ASC;
  
SELECT * FROM Members;