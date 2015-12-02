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

INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1001, 'B. Gibbles', 'BG@mail.com', '6 Red Road, Ballinteer');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1002, 'A. Ren', 'AR@gmail.com', 'Hilltop House, Middle of Nowhere');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1003, 'S. Timmons', 'ST@hotmail.com', 'Tir na Nog, Courtown Harbour');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1004, 'P. Redmond', 'PR@gmail.com', '49 Coolrua Drive');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1005, 'J. Bynes', 'JB@mail.com', '16 Dodgy Road, Ballyer');
INSERT INTO customer (customerID, customerName, customerEmail, customerAddress) VALUES(1006, 'E.Tizzle', 'ET@gmail.com', '6 GingerKillin Drive, Swagtown');


CREATE TABLE recordLabel
(
	recordLabelID        NUMBER(6) NOT NULL ,
	labelName            VARCHAR2(20) NULL ,
	labelDescription     VARCHAR2(500) NULL ,
CONSTRAINT  recLab_ID_PK PRIMARY KEY (recordLabelID)
);

INSERT INTO recordLabel(recordLabelID, labelName, labelDescription)VALUES(111, '', '');
INSERT INTO recordLabel(recordLabelID, labelName, labelDescription)VALUES(112, '', '');
INSERT INTO recordLabel(recordLabelID, labelName, labelDescription)VALUES(113, '', '');

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
CONSTRAINT  XPKproducer PRIMARY KEY (producerID)
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