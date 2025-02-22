USE Assign;

CREATE TABLE Songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    length INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

-- Select only the names of all Bands from the songs table
SELECT DISTINCT Bands.name FROM Bands
JOIN Albums ON Bands.id = Albums.band_id
JOIN Songs ON Albums.id = Songs.album_id;

-- Select the oldest album
SELECT * FROM Albums ORDER BY release_year ASC LIMIT 1;

-- Get all the bands that have albums
SELECT DISTINCT Bands.name FROM Bands
JOIN Albums ON Bands.id = Albums.band_id;

-- Get all the bands that have no albums
SELECT Bands.name FROM Bands
LEFT JOIN Albums ON Bands.id = Albums.band_id
WHERE Albums.id IS NULL;

-- Get the longest album
SELECT Albums.title, SUM(Songs.length) AS total_length
FROM Albums
JOIN Songs ON Albums.id = Songs.album_id
GROUP BY Albums.id
ORDER BY total_length DESC LIMIT 1;

-- Insert a record for your favorite Band and one of their Albums
INSERT INTO Bands (name) VALUES ('Your Favorite Band');
INSERT INTO Albums (title, release_year, band_id) VALUES ('Favorite Album', 2023, LAST_INSERT_ID());

-- Delete the Band and Album you added in the previous question
DELETE FROM Albums WHERE title = 'Favorite Album';
DELETE FROM Bands WHERE name = 'Your Favorite Band';

-- Get the Average length of all songs
SELECT AVG(length) FROM Songs;

-- Select the longest song of each album
SELECT album_id, MAX(length) AS longest_song FROM Songs GROUP BY album_id;

-- Get the number of songs for each band
SELECT Bands.name, COUNT(Songs.id) AS number_of_songs
FROM Bands
JOIN Albums ON Bands.id = Albums.band_id
JOIN Songs ON Albums.id = Songs.album_id
GROUP BY Bands.id;

-- Create a decade column with dividing the year // 10 *10
SELECT Albums.*, FLOOR(release_year / 10) * 10 AS decade FROM Albums;

-- Filter the Albums which start with the word 'The'
SELECT * FROM Albums WHERE title LIKE 'The%';

-- Find the album which released in 2008 to 2013
SELECT * FROM Albums WHERE release_year BETWEEN 2008 AND 2013;
