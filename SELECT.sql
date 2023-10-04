--задание №2
SELECT name, duration
FROM track
ORDER BY duration DESC 
LIMIT 1;

SELECT name, duration
FROM Track 
WHERE duration >= 3.5;

SELECT name 
FROM Collection
WHERE EXTRACT(YEAR FROM collection_release) BETWEEN 2018 AND 2020;

SELECT name 
FROM Performer 
WHERE name NOT LIKE '% %';

SELECT name 
FROM Track 
WHERE name LIKE '%My%';

--задание №3
SELECT G.name AS genre, COUNT(P.id) AS number_of_performers
FROM Genre G
LEFT JOIN genreperformer gp ON G.id = gp.genreid 
LEFT JOIN performer p ON gp.performerid = p.id 
GROUP BY G.name;

SELECT COUNT(t.id) AS number_of_tracks
FROM track t
INNER JOIN albums a ON t.album_id = a.id 
WHERE a.release BETWEEN 2019 AND 2020;

SELECT a.name AS album_name, AVG(t.duration) AS average_duration
FROM track t 
INNER JOIN albums a ON t.album_id = a.id 
GROUP BY a.name ;

SELECT p.name AS performer_name
FROM performer p
LEFT JOIN performeralbums pa ON p.id = pa.performerid
LEFT JOIN albums a ON pa.albumid = a.id
WHERE a.release IS NULL OR a.release < 2020 OR a.release >= 2021;


SELECT c.name AS collection_name
FROM collection c 
INNER JOIN collectiontrack ct ON c.id = ct.collectionid 
INNER JOIN track t ON ct.trackid = t.id 
INNER JOIN albums a ON t.album_id = a.id 
INNER JOIN performeralbums pa ON a.id = pa.albumid 
INNER JOIN performer p ON pa.performerid = p.id 
WHERE p.name = 'Michael Jackson';

--задание №4
SELECT DISTINCT a.name AS album_name
FROM albums a 
INNER JOIN performeralbums pa ON a.id = pa.albumid 
INNER JOIN performer p ON pa.performerid = p.id 
INNER JOIN genreperformer gp ON p.id = gp.performerid 
GROUP BY a.name 
HAVING COUNT(DISTINCT gp.genreid) > 1;

SELECT t.name AS track_name
FROM track t 
LEFT JOIN collectiontrack ct ON t.id = ct.trackid 
WHERE ct.trackid IS NULL;

SELECT p.name AS performer_name, t.name AS track_name, t.duration
FROM performer p
INNER JOIN performeralbums pa ON p.id = pa.performerid 
INNER JOIN albums a ON pa.albumid = a.id 
INNER JOIN track t ON a.id = t.album_id 
WHERE t.duration = (SELECT MIN(duration) FROM track t2 );

