DROP TABLE track CASCADE CONSTRAINTS PURGE;
DROP TABLE purchase CASCADE CONSTRAINTS PURGE;
DROP TABLE album CASCADE CONSTRAINTS PURGE;
DROP TABLE producer CASCADE CONSTRAINTS PURGE;
DROP TABLE artist CASCADE CONSTRAINTS PURGE;
DROP TABLE recordLabel CASCADE CONSTRAINTS PURGE;
DROP TABLE customer CASCADE CONSTRAINTS PURGE;

CREATE TABLE customer
(
	customerID           NUMBER(6) NOT NULL ,
	customerName         VARCHAR2(20) NULL ,
	customerEmail        VARCHAR2(30) NULL  CONSTRAINT  customer_email_chk CHECK (customerEmail LIKE '%@%'),
	customerAddress      VARCHAR2(50) NULL ,
CONSTRAINT cust_ID_PK PRIMARY KEY (customerID)
);


CREATE TABLE recordLabel
(
	recordLabelID        NUMBER(6) NOT NULL ,
	labelName            VARCHAR2(20) NULL ,
	labelDescription     VARCHAR2(500) NULL ,
CONSTRAINT  recLab_ID_PK PRIMARY KEY (recordLabelID)
);


CREATE TABLE artist
(
	artistID             NUMBER(6) NOT NULL ,
	recordLabelID        NUMBER(6) NOT NULL ,
	artistName           VARCHAR2(30) NULL ,
	genre                VARCHAR2(30) NULL ,
	artistRating         NUMBER(1) NULL  CONSTRAINT  artist_rating_chk CHECK (artistRating < 6),
CONSTRAINT  artist_ID_PK PRIMARY KEY (artistID),
CONSTRAINT artist_RecLab_FK FOREIGN KEY (recordLabelID) REFERENCES recordLabel (recordLabelID)
);

CREATE TABLE producer
(
	producerID           NUMBER(6) NOT NULL ,
	producerName         VARCHAR2(20) NULL ,
	producerEmail        VARCHAR2(30) NULL  CONSTRAINT  producer_email_chk CHECK (producerEmail LIKE '%@%'),
	producerRating       NUMBER(1) NULL  CONSTRAINT  producer_rating_chk CHECK (producerRating < 6),
CONSTRAINT  producer_ID_PK PRIMARY KEY (producerID)
);

CREATE TABLE album
(
	albumID              NUMBER(6) NOT NULL ,
	artistID             NUMBER(6) NOT NULL ,
	producerID           NUMBER(6) NOT NULL ,
	albumName            VARCHAR2(40) NULL ,
	albumRating          NUMBER(1) NULL  CONSTRAINT  album_rating_chk CHECK (albumRating < 6),
	releaseDate          DATE NULL ,
	price                NUMBER(5,2) NULL ,
	albumSales           NUMBER(9) NULL ,
CONSTRAINT  album_ID_PK PRIMARY KEY (albumID),
CONSTRAINT album_artID_FK FOREIGN KEY (artistID) REFERENCES artist (artistID),
CONSTRAINT album_prod_FK FOREIGN KEY (producerID) REFERENCES producer (producerID)
);

CREATE TABLE purchase
(
	purchaseID           NUMBER(6) NOT NULL ,
	albumID              NUMBER(6) NOT NULL ,
	customerID           NUMBER(6) NOT NULL ,
	purchaseDate         DATE NULL ,
CONSTRAINT  purchase_ID_PK PRIMARY KEY (purchaseID),
CONSTRAINT purchase_custID_FK FOREIGN KEY (customerID) REFERENCES customer (customerID),
CONSTRAINT purchase_albID_FK FOREIGN KEY (albumID) REFERENCES album (albumID)
);


CREATE TABLE track
(
	trackID              NUMBER(6) NOT NULL ,
	albumID              NUMBER(6) NOT NULL ,
	trackName            VARCHAR2(50) NULL ,
CONSTRAINT  track_trackAlbum_PK PRIMARY KEY (trackID,albumID),
CONSTRAINT track_albID_FK FOREIGN KEY (albumID) REFERENCES album (albumID)
);


INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1001, 'B. Gibbles', 'BG@mail.com', '6 Red Road, Ballinteer');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1002, 'A. Ren', 'AR@gmail.com', 'Hilltop House, Middle of Nowhere');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1003, 'S. Timmons', 'ST@hotmail.com', 'Tir na Nog, Courtown Harbour');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1004, 'P. Redmond', 'PR@gmail.com', '49 Coolrua Drive');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1005, 'J. Bynes', 'JB@mail.com', '16 Dodgy Road, Ballyer');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1006, 'E.Tizzle', 'ET@gmail.com', '6 GingerKillin Drive, Swagtown');

INSERT INTO recordLabel(recordLabelID, labelName, labelDescription)VALUES(111, 'Interscope', 'Created in 1990');
INSERT INTO recordLabel(recordLabelID, labelName, labelDescription)VALUES(112, 'Universal Music', 'Been around since the eighties');
INSERT INTO recordLabel(recordLabelID, labelName, labelDescription)VALUES(113, 'Rough Trade', 'Created in 1965');

INSERT INTO artist(artistID, recordLabelID, artistName, genre, artistRating) VALUES (1, 111, 'Queens of the Stone Age', 'Alternative', 5);
INSERT INTO artist(artistID, recordLabelID, artistName, genre, artistRating) VALUES (2, 112, 'Warpaint', 'Psychadelic', 4);
INSERT INTO artist(artistID, recordLabelID, artistName, genre, artistRating) VALUES (3, 113, 'Florence and the Machine', 'Pop', 3);

INSERT INTO producer(producerID, producerName, producerEmail, producerRating) VALUES(1, 'Rick Rubin', 'RR@gmail.com', 5);
INSERT INTO producer(producerID, producerName, producerEmail, producerRating) VALUES(2, 'Alain Johannes', 'AJ@gmail.com', 4);
INSERT INTO producer(producerID, producerName, producerEmail, producerRating) VALUES(3, 'Butch Vig', 'BV@gmail.com', 4);
INSERT INTO producer(producerID, producerName, producerEmail, producerRating) VALUES(4, 'Chris Goss', 'GC@gmail.com', 3);
 

INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (1111, 4, 'Queens of the Stone Age', 1, '22-SEP-1998', 8.99, 4, 60896);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (2111, 3, 'Rated R', 1, '06-JUN-2000', 10.99, 4, 160896);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (3111, 2,'Songs for the Deaf', 1, '27-AUG-2002', 11.99, 5, 1245326);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (4111, 2, 'Lullabies to Paralyse', 1, '01-MAR-2005', 11.99, 3, 880451);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (5111, 2, 'Era Vulgaris', 1, '08-JUN-2007', 12.99, 4, 985864);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (6111, 1, '...Like Clockwork', 1, '31-MAY-2013', 14.99, 5, 1189653);

INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (1222, 1, 'Exquisite Corpse', 2, '06-OCT-2009', 7.99, 3, 78236);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (2222, 2, 'The Fool', 2, '25-OCT-2010', 10.99, 4, 311563);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (3222, 2, 'Warpaint', 2, '17-JAN-2014', 11.99, 5, 298911);

INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (1333, 1, 'Lungs', 3, '03-JUL-2009', 9.99, 5, 800654);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (2333, 1, 'Ceremonials', 3, '08-OCT-2011', 12.99, 4, 865444);
INSERT INTO album(albumID, producerID, albumName, artistID, releaseDate, price, albumRating, albumSales) VALUES (3333, 1, 'How Big, How Blue, How Beautiful', 3, '01-JUN-2015', 14.99, 4, 500658);

INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1101, 6111, 1004, '12-DEC-2014');
INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1102, 2333, 1006, '05-NOV-2015');
INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1103, 3222, 1001, '18-JUL-2012');
INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1104, 1333, 1004, '21-APR-2015');
INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1105, 3111, 1003, '31-OCT-2013');
INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1106, 1333, 1002, '19-JAN-2014');
INSERT INTO purchase (purchaseID, albumID, customerID, purchaseDate) VALUES(1107, 3222, 1005, '07-DEC-2015');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 1111, 'Regular John');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 1111, 'Avon');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 1111, 'If Only');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 1111, 'Walkin on the Sidewalks');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 1111, 'You Would Know');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 1111, 'How to Handle a Rope');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 1111, 'Mexicola');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 1111, 'Hispanic Impressions');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 1111, 'You Cant Quit Me Baby');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 1111, 'Give the Mule What He Wants');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 1111, 'I Was a Teenage Hand');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 2111, 'Feel Good Hit of the Summer');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 2111, 'The Lost Art of Keeping a Secret');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 2111, 'Leg Of Lamb');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 2111, 'Better Living Through Chemistry');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 2111, 'Monsters in the Parasol');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 2111, 'Quick and the Pointless');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 2111, 'In the Fade');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 2111, 'I Think I Lost My Headache');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 2111, 'Lightning Song');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 2111, 'Tension Head');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 3111, 'You Think I Aint Worth a Dollar');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 3111, 'No One Knows');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 3111, 'First It Giveth');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 3111, 'A Song for the Dead');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 3111, 'The Sky is Fallin');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 3111, 'Six Shooter');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 3111, 'Hangin Tree');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 3111, 'Go With The Flow');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 3111, 'God is in the Radio');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 3111, 'Another Love Song');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 3111, 'A Song for the Deaf');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 3111, 'Mosquito Song');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 4111, 'Lullaby');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 4111, 'Medication');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 4111, 'Everbody Knows That Youre Insane');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 4111, 'Tangled Up In Plaid');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 4111, 'Burn The Witch');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 4111, 'In My Head');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 4111, 'Little Sister');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 4111, 'I Never Came');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 4111, 'Someones in the Wolf');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 4111, 'The Blood is Love');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 4111, 'Broken Box');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 4111, 'Like a Drug');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 5111, 'Turnin on the Screw');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 5111, 'Sick, Sick, Sick');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 5111, 'Im Designer');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 5111, 'Into the Hollow');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 5111, 'Misfit Love');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 5111, 'Battery Acid');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 5111, 'Make It Wit Chu');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 5111, '3s and 7s');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 5111, 'Suture Up Your Future');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 5111, 'River in the Road');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 5111, 'Run, Pig, Run');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 5111, 'The Fun Machine Took a Shit and Died');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 6111, 'Keep Your Eyes Peeled');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 6111, 'I Sat by the Ocean');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 6111, 'The Vampyre of Time and Memory');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 6111, 'If I Had a Tail');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 6111, 'My God Is the Sun');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 6111, 'Kalopsia');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 6111, 'Fairweather Friends');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 6111, 'Smooth Sailing');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 6111, 'I Appear Missing');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 6111, '…Like Clockwork');

--WARPAINT
INSERT INTO track(trackID, albumID, trackName) VALUES (1, 1222, 'Stars');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 1222, 'Elephants');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 1222, 'Billie Holiday');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 1222, 'Beetles');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 1222, 'Burgundy');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 1222, 'Krimson');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 2222, 'Set Your Arms Down');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 2222, 'Warpaint');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 2222, 'Undertow');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 2222, 'Bees');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 2222, 'Shadows');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 2222, 'Composure');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 2222, 'Baby');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 2222, 'Majesty');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 2222, 'Lissies Heart Murmer');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 3222, 'Intro');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 3222, 'Keep It Healthy');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 3222, 'Love is to Die');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 3222, 'Hi');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 3222, 'Biggy');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 3222, 'Teese');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 3222, 'Disco/Very');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 3222, 'Go In');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 3222, 'Feeling Alright');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 3222, 'CC');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 3222, 'Drive');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 3222, 'Son');

--FLORENCE AND THE MACHINE
INSERT INTO track(trackID, albumID, trackName) VALUES (1, 1333, 'Dog Days Are Over');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 1333, 'Rabbit Heart (Raise It Up)');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 1333, 'I’m Not Calling You a Liar');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 1333, 'Howl');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 1333, 'Kiss With a Fist');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 1333, 'Girl With One Eye');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 1333, 'Drumming Song');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 1333, 'Between Two Lungs');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 1333, 'Cosmic Love');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 1333, 'My Boy Builds Coffins');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 1333, 'Hurricane Drunk');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 1333, 'Blinding');
INSERT INTO track(trackID, albumID, trackName) VALUES (13, 1333, 'Youve Got The Love');

INSERT INTO track(trackID, albumID, trackName) VALUES (1, 2333, 'Only If for a Night');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 2333, 'Shake It Out');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 2333, 'What the Water Gave Me');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 2333, 'Never Let Me Go');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 2333, 'Breaking Down');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 2333, 'Lover to Lover');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 2333, 'No Light No Light');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 2333, 'Seven Devils');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 2333, 'Heartlines');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 2333, 'Spectrum');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 2333, 'All This and Heaven Too');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 2333, 'Leave My Body');


INSERT INTO track(trackID, albumID, trackName) VALUES (1, 3333, 'Ship To Wreck');
INSERT INTO track(trackID, albumID, trackName) VALUES (2, 3333, 'What Kind Of Man');
INSERT INTO track(trackID, albumID, trackName) VALUES (3, 3333, 'How Big, How Blue, How Beautiful');
INSERT INTO track(trackID, albumID, trackName) VALUES (4, 3333, 'Queen Of Peace');
INSERT INTO track(trackID, albumID, trackName) VALUES (5, 3333, 'Various Storms and Saints');
INSERT INTO track(trackID, albumID, trackName) VALUES (6, 3333, 'Delilah');
INSERT INTO track(trackID, albumID, trackName) VALUES (7, 3333, 'Long and Lost');
INSERT INTO track(trackID, albumID, trackName) VALUES (8, 3333, 'Caught');
INSERT INTO track(trackID, albumID, trackName) VALUES (9, 3333, 'Third Eye');
INSERT INTO track(trackID, albumID, trackName) VALUES (10, 3333, 'St Jude');
INSERT INTO track(trackID, albumID, trackName) VALUES (11, 3333, 'Mother');
INSERT INTO track(trackID, albumID, trackName) VALUES (12, 3333, 'Hiding');
INSERT INTO track(trackID, albumID, trackName) VALUES (13, 3333, 'Make Up Your Mind');


