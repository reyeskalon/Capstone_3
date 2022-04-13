USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(100) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE beers (
	beer_id int IDENTITY(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	description varchar (250) NOT NULL,
	image varchar(500) NOT NULL,
	abv decimal NOT NULL,
	category int NOT NULL,
	CONSTRAINT PK_beer PRIMARY KEY (beer_id)
);

CREATE TABLE beeruserfav (
	beer_id int NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_beer FOREIGN KEY (beer_id) REFERENCES beers (beer_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT PK_beeruser PRIMARY KEY (beer_id, user_id)
);

CREATE TABLE brewerys (
	brewery_id int IDENTITY(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	hours varchar(1000),
	phone_number varchar(50),
	website varchar(320),
	address varchar(100),
	longitude decimal(18,10) NOT NULL,
	latitude decimal(18,10) NOT NULL,
	history varchar(1500),
	image varchar(2000),
	GF_food bit NOT NULL,
	GF_beer bit NOT NULL,
	activitylevel bit NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);

CREATE TABLE userbrewery (
	user_id int NOT NULL,
	brewery_id int NOT NULL,
	CONSTRAINT FK_brewery FOREIGN KEY (brewery_id) REFERENCES brewerys (brewery_id),
	CONSTRAINT FK_users FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT PK_breweryuser PRIMARY KEY (brewery_id, user_id)
	
);

CREATE TABLE reviews (
	review_id int IDENTITY(1,1) NOT NULL,
	rating decimal NOT NULL,
	review_body varchar(250)
	CONSTRAINT PK_review PRIMARY KEY (review_id)
);

CREATE TABLE reviewbeer (
	review_id int NOT NULL,
	beer_id int NOT NULL,
	CONSTRAINT FK_review FOREIGN KEY (review_id) REFERENCES reviews (review_id),
	CONSTRAINT FK_beers FOREIGN KEY (beer_id) REFERENCES beers (beer_id),
	CONSTRAINT PK_reviewbeer PRIMARY KEY (review_id, beer_id)
);

CREATE TABLE reviewuser (
	review_id int NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_reviews FOREIGN KEY (review_id) REFERENCES reviews (review_id),
	CONSTRAINT FK_userss FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT PK_reviewuser PRIMARY KEY (review_id, user_id)
);
--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

GO

