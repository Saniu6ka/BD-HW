INSERT INTO Genre(name)
VALUES('Pop Music'),
('Rap'),
('Jazz'),
('Blues'),
('Rock');

INSERT INTO Performer(name)
VALUES('Michael Jackson'),
('Drake'),
('Norah Jones'),
('Tom Waits'),
('Metalliсa');

INSERT INTO Albums(name, release)
VALUES ('This is it', 2009),
('Views', 2016),
('ReLoad', 1997);

INSERT INTO Track (name, duration, album_id)
VALUES ('Bad seed', 4.05, 3),
('Better Then You', 5.22, 3),
('With You', 3.15, 2),
('Faithful', 4.44, 2),
('Jam', 5.39, 1),
('Man In The Mirror', 5.19, 1);

INSERT INTO Collection(name, collection_release)
VALUES ('Best Heats', '2022-06-11'),
('Best 90s', '2000-10-10');

INSERT INTO Genreperformer(performerid, genreid)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 5);

INSERT INTO Performeralbums(albumid, performerid)
VALUES (1,1),
(2, 2),
(3, 5);

INSERT INTO Collectiontrack(collectionid, trackid)
VALUES (1, 3),
(1, 5),
(1, 2),
(2, 1),
(2, 2);

UPDATE Track 
SET name = 'You Rock My World'
WHERE id = 6;

UPDATE Collection 
SET collection_release = '2019-06-11'
WHERE id = 1;

UPDATE albums 
SET release = '2019'
WHERE id = 1;
