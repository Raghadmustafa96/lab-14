-- to create AUTHORS table
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- to select DISTINCT author FROM books table without repetition and insert them into name column in the author's table
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

-- to add new column in books table called author_id
ALTER TABLE books ADD COLUMN author_id INT;

-- where the author in books table equal the name in the author table, update the author_id column in books table to equal  author id value
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

-- remove the author table from the books table
ALTER TABLE books DROP COLUMN author;

-- set the author_id in books table as FOREIGN KEY 
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);