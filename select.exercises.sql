SHOW DATABASES;
USE albums_db;
SHOW tables;
DESCRIBE TABLE albums;
-- how many rows are in the albums table? 1
SELECT * FROM albums;
-- b. How many unique artist names are in the albums table?
SELECT DISTINCT artist FROM albums;
-- Actions output says 23 rows, so answer is 23.

-- c. What is the primary key for the albums table?
DESCRIBE TABLE albums;
SHOW CREATE TABLE albums;
-- this pulled up the code that shows the first column 'id' not null, auto increment so this is the primary key

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
/* tapping the the column header that contains album release dates with the cursor automatically will put the rows in ascending or descending order chronologically. 
by using this feature we learn the oldest release is sgt pepper's lonly hearts club band by the beatles. the most recent is 21 by Adele*/

/*Write queries to find the following information:

a. The name of all albums by Pink Floyd*/

SELECT * FROM  albums WHERE artist = 'Pink Floyd';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released. based on search below date was 1967

SELECT * FROM  albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- C.The genre for the album Nevermind? from the query below the answer is grunge, alternative rock

SELECT * FROM  albums WHERE name = 'nevermind';

-- d. Which albums were released in the 1990s

SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;

-- e. Which albums had less than 20 million certified sales

SELECT * FROM albums WHERE sales < 20;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? 

-- the query below did not return the hard or progressive rock genres because it is looking for rock and rock alone 

SELECT * FROM albums WHERE genre = 'rock';

