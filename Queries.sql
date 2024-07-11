Q1
SELECT * FROM Material
WHERE Material_ID NOT IN (SELECT Material_ID FROM Borrow WHERE Return_Date IS NULL);

Q2
SELECT m.title, b.borrow_date, b.due_date
FROM material m
INNER JOIN borrow b ON m.material_id = b.material_id
WHERE b.return_date IS NULL
AND b.due_date < '2023-04-01';


Q3
SELECT m.title, COUNT(*) AS available_count
FROM material m
JOIN borrow b ON m.material_id = b.material_id
GROUP BY m.title
ORDER BY available_count DESC
LIMIT 10;



Q4
Select COUNT(*) AS Books_Written
FROM material m, authorship a, author b 
where (b.author_id= a.author_id) AND (m.material_Id=a.material_Id) AND (b.name='Lucas Piki');


Q5
SELECT COUNT(material_id) As Num_of_Books_Writtenby_2_or_more_Authors
FROM (
  SELECT material_id, COUNT(DISTINCT author_id) AS Books
  FROM authorship
  GROUP BY material_id
  HAVING COUNT(DISTINCT Authorship.Author_ID) >= 2
) AS Books;

Displaying title & number of 2 or more authors
SELECT m.title, COUNT(DISTINCT a.author_id) AS Authors
FROM material m
JOIN authorship a ON m.material_id = a.material_id
GROUP BY m.material_id, m.title
HAVING COUNT(DISTINCT a.author_id) >= 2;


Q6
SELECT Genre.Name, COUNT(*) AS popular_genres
FROM Genre
INNER JOIN Material ON Material.Genre_ID = Genre.Genre_ID
GROUP BY Genre.Name
ORDER BY popular_genres DESC;


Q7
SELECT COUNT(*) AS Borrowed_Materials
FROM Borrow 
WHERE borrow_date BETWEEN '2020-09-01' AND '2020-10-31';


Q8
UPDATE borrow
SET return_date = '2023-04-01'
WHERE material_id = (SELECT material_id FROM material WHERE title = 'Harry Potter and the Philosophers Stone');
select * from borrow;


Q9
DELETE FROM borrow
WHERE member_id IN (SELECT member_id FROM member WHERE name = 'Emily Miller');
DELETE FROM member WHERE name = 'Emily Miller';
Select * from borrow;

Q10
INSERT INTO material (material_ID,Title, Publication_Date, catalog_ID, genre_ID)
VALUES (32,'New book', '2020-08-01', 
		(SELECT catalog_ID FROM Catalog WHERE Name = 'E-Books'),
		(SELECT genre_ID FROM Genre WHERE Name = 'Mystery & Thriller'));
INSERT INTO author (author_id, name, birth_date, nationality) VALUES (21,'Lucas Pipi', null, null);
Select * from material;
Select * from author;

--Here I try to retrive the material which was added earlier

SELECT m.title, m.Publication_Date, c.name, g.name
FROM material m
INNER JOIN catalog c ON c.catalog_ID = m.catalog_ID
INNER JOIN Genre g ON g.genre_ID = m.genre_ID
where title='New book';