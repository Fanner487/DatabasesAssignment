DROP TABLE track;
DROP TABLE album;
DROP TABLE artist;

CREATE TABLE artist(
  artistID NUMBER(6) NOT NULL, --pk
  artistName VARCHAR2(30) NOT NULL,
  genre VARCHAR2(30) NOT NULL, --in genre list
  artistRating NUMBER(1), --<=5
  --albumSales NUMBER(9), --UPDATE STATEMENTS TO ADD UPP SALES
  
  CONSTRAINT artist_ID_pk PRIMARY KEY (artistID),
  
  CONSTRAINT artist_rating_chk CHECK (artistRating < 6)
  
);

CREATE TABLE album(
  
  albumID NUMBER(6) NOT NULL, --pk
  albumName VARCHAR2(40) NOT NULL,
  artistID NUMBER(6) NOT NULL, --fk
  releaseDate DATE NOT NULL,  
  price NUMBER(5,2) NOT NULL,
  albumRating NUMBER(1), -- <=5
  albumSales NUMBER(9) NOT NULL, --maybe add all of the columns up
  
  CONSTRAINT album_ID_pk PRIMARY KEY (albumID),
  
  CONSTRAINT album_rating_chk CHECK (albumRating < 6),
  
  CONSTRAINT album_artID_fk FOREIGN KEY (artistID)
  REFERENCES artist(artistID)
  
);

CREATE TABLE track(
  trackID NUMBER(6), --pk
  trackName VARCHAR2(50),
  trackNoOnDisc NUMBER(2),
  albumID NUMBER(6), --fk
  
  CONSTRAINT track_ID_pk PRIMARY KEY (trackID),
  
  CONSTRAINT track_albID_fk FOREIGN KEY (albumID)
  REFERENCES album(albumID)

);

INSERT INTO artist(artistID, artistName, genre, artistRating) VALUES (1, 'Queens of the Stone Age', 'Alternative', 5);
INSERT INTO artist(artistID, artistName, genre, artistRating) VALUES (2, 'Warpaint', 'Psychadelic', 4);
INSERT INTO artist(artistID, artistName, genre, artistRating) VALUES (3, 'Florence and the Machine', 'Pop', 3);

--Queens of the Stone Age albums
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (1, 'Queens of the Stone Age', 1, '22-SEP-1998', 8.99, 4, 60896);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (2, 'Rated R', 1, '06-JUN-2000', 10.99, 4, 160896);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (3, 'Songs for the Deaf', 1, '27-AUG-2002', 11.99, 5, 1245326);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (4, 'Lullabies to Paralyse', 1, '01-MAR-2005', 11.99, 3, 880451);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (5, 'Era Vulgaris', 1, '08-JUN-2007', 12.99, 4, 985864);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (6, '...Like Clockwork', 1, '31-MAY-2013', 14.99, 5, 1189653);

--Warpaint albums
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (7, 'Exquisite Corpse', 2, '06-OCT-2009', 7.99, 3, 78236);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (8, 'The Fool', 2, '25-OCT-2010', 10.99, 4, 311563);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (9, 'Warpaint', 2, '17-JAN-2014', 11.99, 5, 298911);

--Florence and the Machine albums
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (10, 'Lungs', 3, '03-JUL-2009', 9.99, 5, 800654);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (11, 'Ceremonials', 3, '08-OCT-2011', 12.99, 4, 865444);
INSERT INTO album(albumID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (12, 'How Big, How Blue, How Beautiful', 3, '01-JUN-2015', 14.99, 4, 500658);

--INSERT TRACKS. HERE WE GO...
--QUEENS OF THE STONE AGE
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (1, 'Regular John', 1, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (2, 'Avon', 2, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (3, 'If Only', 3, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (4, 'Walkin on the Sidewalks', 4, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (5, 'You Would Know', 5, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (6, 'How to Handle a Rope', 6, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (7, 'Mexicola', 7, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (8, 'Hispanic Impressions', 8, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (9, 'You Cant Quit Me Baby', 9, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (10, 'Give the Mule What He Wants', 10, 1);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (11, 'I Was a Teenage Hand', 11, 1);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (12, 'Feel Good Hit of the Summer', 1, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (13, 'The Lost Art of Keeping a Secret', 2, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (14, 'Leg Of Lamb', 3, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (15, 'Better Living Through Chemistry', 4, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (16, 'Monsters in the Parasol', 5, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (17, 'Quick and the Pointless', 6, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (18, 'In the Fade', 7, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (19, 'I Think I Lost My Headache', 8, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (20, 'Lightning Song', 9, 2);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (21, 'Tension Head', 10, 2);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (23, 'You Think I Aint Worth a Dollar', 1, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (24, 'No One Knows', 2, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (25, 'First It Giveth', 3, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (26, 'A Song for the Dead', 4, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (27, 'The Sky is Fallin', 5, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (28, 'Six Shooter', 6, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (29, 'Hangin Tree', 7, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (30, 'Go With The Flow', 8, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (31, 'God is in the Radio', 9, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (32, 'Another Love Song', 10, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (33, 'A Song for the Deaf', 11, 3);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (34, 'Mosquito Song', 12, 3);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (35, 'Lullaby', 1, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (36, 'Medication', 2, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (37, 'Everbody Knows That Youre Insane', 3, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (38, 'Tangled Up In Plaid', 4, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (39, 'Burn The Witch', 5, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (40, 'In My Head', 6, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (41, 'Little Sister', 7, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (42, 'I Never Came', 8, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (43, 'Someones in the Wolf', 9, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (44, 'The Blood is Love', 10, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (45, 'Broken Box', 11, 4);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (46, 'Like a Drug', 12, 4);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (47, 'Turnin on the Screw', 1, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (48, 'Sick, Sick, Sick', 2, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (49, 'Im Designer', 3, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (50, 'Into the Hollow', 4, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (51, 'Misfit Love', 5, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (52, 'Battery Acid', 6, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (53, 'Make It Wit Chu', 7, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (54, '3s and 7s', 8, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (55, 'Suture Up Your Future', 9, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (56, 'River in the Road', 10, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (57, 'Run, Pig, Run', 11, 5);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (58, 'The Fun Machine Took a Shit and Died', 12, 5);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (59, 'Keep Your Eyes Peeled', 1, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (60, 'I Sat by the Ocean', 2, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (61, 'The Vampyre of Time and Memory', 3, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (62, 'If I Had a Tail', 4, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (63, 'My God Is the Sun', 5, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (64, 'Kalopsia', 6, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (65, 'Fairweather Friends', 7, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (66, 'Smooth Sailing', 8, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (67, 'I Appear Missing', 9, 6);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (68, '…Like Clockwork', 10, 6);

--WARPAINT
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (69, 'Stars', 1, 7);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (70, 'Elephants', 2, 7);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (71, 'Billie Holiday', 3, 7);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (72, 'Beetles', 4, 7);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (73, 'Burgundy', 5, 7);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (74, 'Krimson', 6, 7);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (75, 'Set Your Arms Down', 1, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (76, 'Warpaint', 2, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (77, 'Undertow', 3, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (78, 'Bees', 4, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (79, 'Shadows', 5, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (80, 'Composure', 6, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (81, 'Baby', 7, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (82, 'Majesty', 8, 8);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (83, 'Lissies Heart Murmer', 9, 8);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (84, 'Intro', 1, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (85, 'Keep It Healthy', 2, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (86, 'Love is to Die', 3, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (87, 'Hi', 4, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (88, 'Biggy', 5, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (89, 'Teese', 6, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (90, 'Disco/Very', 7, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (91, 'Go In', 8, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (92, 'Feeling Alright', 9, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (93, 'CC', 10, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (94, 'Drive', 11, 9);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (95, 'Son', 12, 9);

--FLORENCE AND THE MACHINE
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (96, 'Dog Days Are Over', 1, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (97, 'Rabbit Heart (Raise It Up)', 2, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (98, 'I’m Not Calling You a Liar', 3, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (99, 'Howl', 4, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (100, 'Kiss With a Fist', 5, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (101, 'Girl With One Eye', 6, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (102, 'Drumming Song', 7, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (103, 'Between Two Lungs', 8, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (104, 'Cosmic Love', 9, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (105, 'My Boy Builds Coffins', 10, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (106, 'Hurricane Drunk', 11, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (107, 'Blinding', 12, 10);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (108, 'Youve Got The Love', 13, 10);

INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (109, 'Only If for a Night', 1, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (110, 'Shake It Out', 2, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (111, 'What the Water Gave Me', 3, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (112, 'Never Let Me Go', 4, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (113, 'Breaking Down', 5, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (114, 'Lover to Lover', 6, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (115, 'No Light No Light', 7, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (116, 'Seven Devils', 8, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (117, 'Heartlines', 9, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (118, 'Spectrum', 10, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (119, 'All This and Heaven Too', 11, 11);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (120, 'Leave My Body', 12, 11);


INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (121, 'Ship To Wreck', 1, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (122, 'What Kind Of Man', 2, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (123, 'How Big, How Blue, How Beautiful', 3, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (124, 'Queen Of Peace', 4, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (125, 'Various Storms and Saints', 5, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (126, 'Delilah', 6, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (127, 'Long and Lost', 7, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (128, 'Caught', 8, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (129, 'Third Eye', 9, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (130, 'St Jude', 10, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (131, 'Mother', 11, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (132, 'Hiding', 12, 12);
INSERT INTO track(trackID, trackName, TrackNoOnDisc, albumID) VALUES (133, 'Make Up Your Mind', 13, 12);

COMMIT;

--outer joins
SELECT track.trackName, album.albumID, album.albumName 
FROM track
RIGHT OUTER JOIN album
ON track.albumID = album.albumID
WHERE TrackNoOnDisc = 8;

--inner joins on two tables
SELECT TrackNoOnDisc, trackName, albumName FROM track t
JOIN album a 
ON t.albumID = a.albumID
WHERE TrackNoOnDisc = 5
ORDER BY trackName ASC;

SELECT artistName, albumName FROM artist a
JOIN album m 
ON a.artistID = m.artistID
WHERE (artistRating = 5 OR artistRating = 4)
AND  albumRating = 5;


--inner joins on three tables
SELECT TrackNoOnDisc, trackName, albumName, artistName FROM track
JOIN album USING (albumID)
JOIN artist USING (artistID)
WHERE albumName LIKE '...Like Clockwork'
ORDER BY trackNoOnDisc ASC;

--aggregate function
SELECT UPPER(trackName) "Track" 
FROM track;


--update
UPDATE artist
SET genre = 'Funk'
WHERE artistID = 2;

SELECT * FROM artist;

--Add column
ALTER TABLE artist
ADD albumSales NUMBER(10);
SELECT * FROM artist;

--Drop column
ALTER TABLE artist
DROP COLUMN albumSales;
SELECT * FROM artist;

--Modify column
ALTER TABLE album
ALTER albumSales NUMBER(10);

--Add constraint stuff
ALTER TABLE artist
ADD CONSTRAINT art_genre_chk 
CHECK (genre IN ('Alternative', 'Psychadelic', 'Funk', 'Pop'));

ALTER TABLE artist
DROP CONSTRAINT art_genre_chk;

ALTER TABLE artist
ADD CONSTRAINT art_genre_chk 
CHECK (genre IN ('Alternative', 'Psychadelic', 'Funk', 'Pop'));


SELECT SUM(album.albumSales) as Total
FROM album
WHERE artistID = 1;

