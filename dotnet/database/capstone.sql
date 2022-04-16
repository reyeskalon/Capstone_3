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
	request_brewer bit, 
	CONSTRAINT PK_user PRIMARY KEY (user_id)
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
	is_open bit NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);

CREATE TABLE beers (
	beer_id int IDENTITY(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	description varchar (1500) NOT NULL,
	image varchar(500) NOT NULL,
	is_avaliable bit NOT NULL,
	abv decimal (18,2) NOT NULL,
	category varchar(25) NOT NULL,
	GF bit NOT NULL,
	brewery_id int NOT NULL,
	CONSTRAINT FK2_beers FOREIGN KEY (brewery_id) REFERENCES brewerys (brewery_id),
	CONSTRAINT PK_beer PRIMARY KEY (beer_id)
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

CREATE TABLE beeruserfav (
	beer_id int NOT NULL,
	user_id int NOT NULL,
	CONSTRAINT FK_beer FOREIGN KEY (beer_id) REFERENCES beers (beer_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT PK_beeruser PRIMARY KEY (beer_id, user_id)
);
--populate default data
INSERT INTO users (username, password_hash, salt, user_role, request_brewer) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 0);
INSERT INTO users (username, password_hash, salt, user_role, request_brewer) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 0);
INSERT INTO users (username, password_hash, salt, user_role, request_brewer) VALUES ('test','eKcFbIc7zUEceEIQ5cUNsbKPh6Y=', 'ZIbSPIEFUBg=','brewer', 0);

--populate breweries
INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES ('BrewDog Pittsburgh', 'Monday: 4:00PM - 10:00PM,
Tuesday: 4:00PM - 10:00PM,
Wednesday: 4:00PM - 10:00PM,
Thursday: 4:00PM - 10:00PM,
Friday: 12:00PM - 11:00PM,
Saturday: 12:00PM - 11:00PM,
Sunday: 12:00PM - 9:00PM',
'4126434471', 
'https://www.brewdog.com/usa/bars/usa/Pittsburgh',
'1958 Varley St, Pittsburgh, PA 15212',
40.460721,
-79.9224016,
 'Our founders James Watt and Martin Dickie decide they are fed up of the stuffy UK beer market� so, aged just 24, do something about it. Thanks to some very scary bank loans, the guys start making their own hardcore craft beers in Fraserburgh, a town in northeast Scotland. They brew tiny batches, fill bottles by hand, sell their first beers at local markets out of a beaten-up old van� and BrewDog is born.',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Gg6sx36gtcEjO9RwoLR1QtlXjEvIM4H-JTp2h03BTrU7ZHDlkHz3zVUYl643vlgI-O0&usqp=CAU', 1, 1, 1);


INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES ('Fat Heads Saloon', 
'Monday: closed,
Tuesday: closed,
Wednesday: 11:00AM - 10:00PM,
Thursday: 11:00AM - 10:00PM,
Friday: 11:00AM - 11:00PM,
Saturday: 11:00AM - 11:00PM,
Sunday: 11:00AM - 10:00PM', 
'4124317433', 
'http://fatheads.com/brewery.html',
'1805 E Carson St, Pittsburgh, PA 15203',
40.4289752,
-79.9801808,
'In 1992 Glenn & Michelle had this crazy idea that a craft beer bar & restaurant would be a great adventure. Fat Heads was born. A few years later Fat Heads doubled in size. One day Glenn and his friend Matt were sharing their dreams of brewing great beer and something clicked. They opened a brewpub and before you could blink an eye accolades were flowing along with their great beer. Just a couple of years passed before a full scale production brewery was opened and Fat Heads became available to the clamoring masses. Fast forward another few years and Matt, Glenn and their team took a deep breath and built a brewery twice as large with an amazing beer hall and restaurant. About a million details have been left out and twice as many Fat Heads beers have been poured but that pretty much brings us up to date.', 
'https://i0.wp.com/thefullpint.com/wp-content/uploads/2016/12/Fatheads-Logo.jpg', 1, 1, 1);


INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'Necromancer Brewing',
'Monday: closed,
Tuesday: closed,
Wednesday: closed,
Thursday: 4:00PM - 10:00PM,
Friday: 4:00PM - 10:00PM,
Saturday: 12:00AM - 10:00PM,
Sunday: 12:00AM - 4:00PM', 
'0',
'https://necromancer.beer/',
'2257 Babcock Blvd, Pittsburgh, PA 15237',
40.5129919,
-79.9994701,
'In 2021, Ben Butler and Aaron Easler plan to raise the dead. They opened  Necromancer Brewing Co. at 2257 Babcock Blvd. in Ross Township to resurrect forgotten beer styles. They won�t be summoning spirits, just historical knowledge and brewing know-how. When the 14,400-square-foot space, a former USA Baby and Spirit Halloween store with 36 parking spaces, debuts on March 1, it will be a pickup site for 16-ounce cans in four-packs and cases. Necromancer also will handle retail accounts for local bars and restaurants and will deliver beer to doorsteps within a 25-mile radius. There will be several core offerings, including a New England IPA, a Belgian witbier and a grisette, plus 15 other specialty beers in rotation. They�ve already released Square Dancing, a collaboration beer with Sharpsburg�s Dancing Gnome.',
'https://pittsburghbreweries.com/wp-content/uploads/2021/06/necromancer-full-black-1024x408.png',
1, 0, 1);

INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'Voodoo Brewing Co.',
'Monday: closed,
Tuesday: closed,
Wednesday: 4:00pm - 9:00pm,
Thursday: 4:00PM - 8:30PM,
Friday: 4:00PM - 8:30PM,
Saturday: 12:00pM - 9:00PM,
Sunday: 12:00AM - 4:00PM', 
'4123688973',
'https://www.voodoobrewery.com/locations/homestead',
'205 E 9th Ave, Homestead, PA 15120',
40.4066349,
-79.9100787,
'Located in Meadville, Pennsylvania, Voodoo was founded by Matt Allyn in 2005. While the beer officially began flowing a little over a year later, it wasnt until Matt enlisted two additional members to his team, Curt and Matteo Rachocki, that Voodoo began to take off.',
'https://media-exp1.licdn.com/dms/image/C560BAQG0nVUDeSsBKg/company-logo_200_200/0/1598475876636?e=2147483647&v=beta&t=N6tcu95Xb8TA4t0zAm8h24y1sXFutd9ejb8BlR1luP0',
1, 0, 1);

INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'East End Brewing Company',
'Monday: closed,
Tuesday: 5:00pm - 10:00pm,
Wednesday: 5:00pm - 10:00pm,
Thursday: 5:00pm - 10:00pm,
Friday: 5:00pm - 10:00pm,
Saturday: 12:00pM - 10:00PM,
Sunday: 12:00AM - 7:00PM', 
'4125372337',
'https://www.eastendbrewing.com/#freshlocalbeer',
'147 Julius St, Pittsburgh, PA 15206',
40.459257,
-79.9117928,
'East End Brewing Company is a Pittsburgh brewery. According to the Pittsburgh Post-Gazette, it is a "force in the local beer market."
Owner Scott Smith founded the brewery after quitting his job with a consumer products company. The brewery started selling beer in December 2004.
The brewery was originally located in a 4,000-square-foot (370 m2) brewery in the Homewood neighborhood of Pittsburghs East End. In 2011, the company began pursuing a move to a 17,000-square-foot building in the nearby Larimer neighborhood, and completed that move in November of 2012. In order to finance the move, Smith sold $1,000 vouchers to customers/investors, which will be redeemable for future beer, merchandise and special access to new brews. The move was completed in November 2012. The new location will allow production to increase from 2,500 barrels brewed per year to 5,000 barrels.',
'https://i0.wp.com/farmtotablepa.com/wp-content/uploads/2015/05/East-End-Brewing-Co..jpeg?fit=750%2C750&ssl=1',
1, 0, 1);

INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'Trace Brewing',
'Monday: 8:00am - 10:00pm,
Tuesday: 8:00am - 10:00pm,
Wednesday: 8:00am - 10:00pm,
Thursday: 8:00am - 10:00pm,
Friday: 8:00am - 10:00pm,
Saturday: 8:00am - 10:00pm,
Sunday: 8:00am - 8:00pm',
'4129043555',
'https://www.tracebloomfield.com/',
'4312 Main St, Pittsburgh, PA 15224',
40.4640902,
-79.9533368,
'�Every piece of wood or drip of paint tells a story,� says Dave Kushner, co-founder of Trace Brewing. �There�s even a set list written on the wall. They made industrial products here and later it served as a community space. We�re combining those two elements.� Guests will not only be able to see and smell the 10-barrel brewing system, they can chat with Head Brewer Brandon McCarthy while he works to churn out more beer.
�We�re more like a small-batch brewery,� McCarthy says. �If you like beer at all there will be at least one thing that is on your wavelength.�',
'https://images.squarespace-cdn.com/content/v1/5c6ad9dde666694eb6ec5c69/1598982388974-H615XYMJABAXEUIQND9R/Trace%2BLogo%2B2-10-20.jpeg',
1, 1, 1);


INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'The Church Brew Works',
'Monday: 4:00pm - 10:15pm,
Tuesday: 4:00pm - 10:15pm,
Wednesday: 4:00pm - 10:15pm,
Thursday: 4:00pm - 10:15pm,
Friday: 12:30pm - 11:00pm,
Saturday: 12:00pm - 11:00pm,
Sunday: 12:30pm - 9:00pm',
'4126888200',
'https://churchbrew.com/',
'3525 Liberty Ave, Pittsburgh, PA 15201',
40.4620676,
-79.9640833,
'In the days before industry invaded its boundaries or paved roads curled through its neighborhoods, when Pittsburgh was in its youth, there was a farm called �Good Liquor� outside of the city. Owned by Alexander Hill, part of the farm was located within the existing Lawrenceville border. Later on, in 1814, William B. Foster purchased a 133-acre tract of land outside of Pittsburgh along the Allegheny River. In that same year, he would sell 30 acres of that property to the Federal Government. While Allegheny Arsenal was being built to provide supplies to the warring Union Troops during the civil war, Foster was starting to establish a community called Lawrenceville. The picturesque area was named for Captain James Lawrence who gained fame in the war with Britain. He was captain of the Chesapeake and his famous saying �Don�t give up the ship!� was incorporated in the borough seal of Lawrenceville.',
'https://churchbrew.com/wp-content/themes/yeast/img/logo.png',
0, 1, 1);

INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'Hitchhiker Brewing',
'Monday: closed,
Tuesday: 4:00pm - 10:00pm,
Wednesday: 4:00pm - 10:00pm,
Thursday: 4:00pm - 10:00pm,
Friday: 4:00pm - 10:00pm,
Saturday: 12:00pm - 10:00pm,
Sunday: Closed Easter Sunday',
'4123431950',
'https://hitchhiker.beer/',
'1500 S Canal St #2541, Pittsburgh, PA 15215',
40.4962341,
-79.9262552,
'Hitchhiker Brewing started in May of 2014 in the Mt. Lebanon area of Pittsburgh by Gary Olden. Brewing a variety of styles on their 3 barrel system, they quickly grew to be a city favorite.',
'https://hitchhiker.beer/wp-content/uploads/hbbc-social-share-image.png',
1, 0, 1);

INSERT INTO brewerys (name, hours, phone_number, website, address, latitude, longitude, history, image, GF_beer, GF_food, is_open)
VALUES(
'Two Frays Brewery',
'Monday: closed,
Tuesday: 4:00pm - 9:00pm,
Wednesday: 4:00pm - 9:00pm,
Thursday: 4:00pm - 9:00pm,
Friday: 3:00pm - 10:00pm,
Saturday: 12:00pm - 10:00pm,
Sunday: 1:00pm - 8:00pm',
'7249023085',
'https://www.twofraysbrewery.com/',
'5113 Penn Ave, Pittsburgh, PA 15224',
40.4650862,
-79.9422204,
'Established in 2020; Jen and Mike met each other over a beer and have spent the last seven years engineering the path to bring great beer and fermented beverages to as many Pittsburghers as possible.',
'https://pittsburghbreweries.com/wp-content/uploads/2021/06/Asset-8-1-810x1024.png',
0, 0, 1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Spring Hill Brewing', 
'Monday: closed,
Tuesday: closed,
Wednesday: closed,
Thursday: closed,
Friday: 5:00PM - 9:00PM,
Saturday: 2:00PM - 9:00PM,
Sunday: 2:00PM - 6:00PM', 
'4126434471',
'https://www.springhillbrewing.com/',
'1958 Varley Street Pittsburgh, PA 15212',
-79.9915068,
40.4666285,
'...was started by Greg, who began brewing out of his kitchen in Bloomfield over 10 years ago.   After refining his recipes and finding the perfect location in Pittsburghs North Side, he decided to expand his brewing efforts to a full-time operation. Spring Hill Brewing opened July 2018, operating out of a former social club  that was founded in roughly 1900.  The Workingmens Beneficial Union (or WBU for short) was a community space for German immigrants and once housed a ballroom and a six-lane bowling alley.   It closed in 1999 and suffered a lot of damage while shuttered.   A three-year (and counting!) renovation has brought it back to life, and we are proud to be serving our fresh farmhouse ales out of the new taproom.',
'https://images.squarespace-cdn.com/content/v1/5b1fdbc4cc8fed7c56157c72/1606946846693-XXGG6O6Z7ZAH8VBDKO52/MEAD2.jpg?format=1500w',
0,0,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Eleventh Hour Brewing', 
'Monday: closed,
Tuesday: closed,
Wednesday: 5:00PM - 11:00PM,
Thursday: 5:00PM - 11:00PM,
Friday: 5:00PM - 11:00PM,
Saturday: 12:00PM - 11:00PM,
Sunday: 1:00PM - 7:00PM', 
'4126768034',
'https://www.11thhourbrews.com/',
'3711 Charlotte Street Pittsburgh, PA, 15201',
-79.9654959,
40.467035,
' opened in September of 2017 in the Lawrenceville neighborhood of Pittsburgh. Located in an old gas grill/gas light showroom, they operate a 20bbl brewhouse producing a wide variety of beer. From lagers to IPA�s, stouts, and sours, there is something for everyone. Owners Keana and Matt McMahon also work hard to integrate the community as well as many local charity events.',
'https://images.squarespace-cdn.com/content/v1/581b7f8f5016e11e7853bdb8/1621882414394-09CSLC50LHDWXFGVDMK0/DSC_0748.jpg?format=1500w',
0,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Allegheny City Brewing', 
'Monday: 4:00PM - 9:00PM,
Tuesday: closed,
Wednesday: 4:00PM - 9:00PM,
Thursday: 4:00PM - 9:00PM,
Friday: 4:00PM - 11:00PM,
Saturday: 12:00PM - 11:00PM,
Sunday: 12:00PM - 7:00PM', 
'4129043732',
'https://www.alleghenycitybrewing.com/',
'507 Foreland St Pittsburgh, PA 15212',
-80.0004093,
40.4542234,
'Allegheny City Brewing is an award-winning neighborhood brewery located in the Deutschtown neighborhood of Pittsburgh.
The idea for ACB was born years ago when the three of us (Al, Amy, and Matt), all hailing from Pittsburgh, moved to Colorado. It was during our time in Rocky Mountains that we fell in love with craft beer and the sense of community that small breweries provide. We loved every aspect of these places, from the brew house dogs to the commitment to their neighborhoods and sustainability.
After traveling to visit hundreds of breweries, and trying countless great craft beers, we began home brewing. Like most home brewers, we hatched a plan to open a brewery.
Looking to return to our native Pittsburgh, we all relocated back in 2013. On September 28, 2016 we officially opened our doors.
We are proud to be located in the North Side of Pittsburgh - formerly the City of Allegheny - hence our name. We are proud history of the area, and hope that our tap room pays homage properly.
We are proud to be a part of the neighborhood, and the Pittsburgh craft brewing community. Our goal to every one of our patrons is to provide great beer, a relaxing environment, and great service.
Cheers!',
'https://static.wixstatic.com/media/732d47_ee077b5c752540918f1ff73cb4232fd1~mv2.jpg/v1/fill/w_363,h_149,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/732d47_ee077b5c752540918f1ff73cb4232fd1~mv2.jpg',
0,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Grist House Craft Brewery', 
'Monday: closed,
Tuesday: closed,
Wednesday: 4:00PM - 10:00PM,
Thursday: 4:00PM - 10:00PM,
Friday: 12:00PM - 10:00PM,
Saturday: 12:00PM - 10:00PM,
Sunday: 1:00PM - 8:00PM', 
'4129135485',
'https://gristhouse.com/',
'10 E SHERMAN ST. PITTBURGH, PA 15209',
-79.9720203,
40.4788179,
'Grist House was started by Erie natives Kyle Mientkiewicz and Brian Eaton, childhood friends and now brothers-in-law. They pursued that now-familiar path of obsessed homebrewers-turned-professionals, and the brewing operation is now co-led up by another of their childhood friends, Sean Biby.',
'https://gristhouse.com/wp-content/uploads/elementor/thumbs/Icons-20-1-pki9mo1jg8qovr3z1uinfuuatq6kbla1h78kie8lik.png',
0,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Strange Roots Experimental Ales', 
'Monday: closed,
Tuesday: closed,
Wednesday: 4:00PM - 10:00PM,
Thursday: 4:00PM - 10:00PM,
Friday: 4:00PM - 10:00PM,
Saturday: 12:00PM - 10:00PM,
Sunday: closed', 
'4125899054',
'http://www.strangerootsbeer.com/',
'501 E Ohio St, Pittsburgh, PA 15209',
-79.9683263,
40.4787114,
'Strange Roots Experimental Ales is the evolution of Draai Laag Brewing Company, which was dedicated solely to spontaneously fermented sour and wild beer. The name change reflects the brewery�s diversification and creative expansion into a wider range of beer styles, while remaining committed to locally foraged and sourced ingredients and unique brews created from scratch. Their focus on terroir yields unique vintages in many of their beers, tied to a specific time, place, and the passionate people who bring their mission to life.',
'http://www.strangerootsbeer.com/wp-content/themes/strangeroots/assets/images/logo.png',
1,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('412 Brewery', 
'Monday: closed,
Tuesday: closed,
Wednesday: 5:00PM - 11:00PM,
Thursday: 5:00PM - 11:00PM,
Friday: 5:00PM - 11:00PM,
Saturday: 12:00PM - 11:00PM,
Sunday: 1:00PM - 7:00PM', 
'4121743034',
'http://www.412brews.com/home.html',
' 847 Western Ave, Pittsburgh, PA 15233',
-80.0159598,
40.4519513,
'We are a growing Burgh brewery located in McKees Rocks with a newly-opened taproom in the North Side. In 2016, our founder, Sam Mure, decided to start a brewery with his buddies after success in the restaurant industry. For two years, he and his team distributed the brew to local joints before making the jump to open a taproom. In 2019, in the space of an old laundromat at 847 Western Ave, the dream of having a place of their own came true.',
'http://nebula.wsimg.com/3be68c3dbbf0bb8fea35948ac5b364aa?AccessKeyId=B51CE73634C1019D38B2&disposition=0&alloworigin=1',
0,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Hop Farm Brewing Company', 
'Monday: 3:00PM - 10:00PM,
Tuesday: closed,
Wednesday: 4:00PM - 10:00PM,
Thursday: 4:00PM - 10:00PM,
Friday: 5:00PM - 11:00PM,
Saturday: 12:00PM - 11:00PM,
Sunday: 1:00PM - 7:00PM', 
'4127668894',
'https://www.hopfarmbrewingco.com/',
'5601 Butler St, Pittsburgh, PA 15201',
-79.9480807,
40.4846495,
' Hop Farm Brewing Company is a woman-owned, family-run brewery in the Lawrenceville neighborhood of Pittsburgh, Pa. At Hop Farm, we are dedicated to the responsible use of our natural resources, from production to packaging and everywhere in between. We grow our own hops organically and add some of them to every batch we brew. We are proud Pittsburghers who look to highlight and work with other local businesses for materials, ingredients and services wherever possible. Hop Farm opened its doors in 2013 as a growler shop, which quickly grew into a brewpub. We self-distribute our product in Allegheny County and look forward to adding cans back to our lineup.',
'https://www.hopfarmbrewingco.com/wp-content/uploads/2021/12/Home-Hop-Farm-Logo.png',
1,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Southern Tier Brewery Pittsburgh', 
'Monday: 11:00AM - 10:00PM,
Tuesday: 11:00AM - 10:00PM,
Wednesday: 11:00AM - 10:00PM,
Thursday: 11:00AM - 10:00PM,
Friday: 11:00AM - 10:00PM,
Saturday: 11:00AM - 12:00AM,
Sunday: 11:00AM - 12:00AM', 
'4123012337',
'https://taprooms.stbcbeer.com/southern-tier-brewery-pittsburgh-0c78961b7fd2',
'316 N Shore Dr, Pittsburgh, PA 15212',
-80.0104128,
40.4463787,
'The company was founded in 2001 by Phineas DeMink and Allen "Skip" Yahn. They purchased old equipment from the Old Saddleback Brewing Co. in Pittsfield, Massachusetts. By 2003, the brewery had expanded to multiple varieties of small batch ales distributed locally. By 2005, the company had expanded its distribution to cover the majority of New York State and Pennsylvania. In 2009, a new 20,000-sq-ft building was built to accommodate the companys expansion nationally and internationally.',
'https://dynl.mktgcdn.com/p/gP-w4szVsSQvBSXZKAcZInB7mcn7X2iq1phF7JecR6Q/224x126.png',
1,1,1);


INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Dancing Gnome Beer', 
'Monday: closed,
Tuesday: 4:00PM - 10:00PM,
Wednesday: 4:00PM - 10:00PM,
Thursday: 4:00PM - 10:00PM,
Friday: 4:00PM - 10:00PM,
Saturday: 12:00PM - 8:00PM,
Sunday: 11:00AM - 6:00PM', 
'4123012337',
'https://dancinggnomebeer.com/',
'1025 Main St, Pittsburgh, PA 15215',
-79.9315478,
40.4938628,
'Dancing Gnome opened in 2016 to foster the growth of our energetic community in Pittsburgh, PA by focusing on hop-forward styles and helping to carve out a new definition of American Ale. Pittsburgh is an industrial city that was built by community; driven by camaraderie, earnest work, and ebullient play.',
'https://craftpeak-cooler-images.imgix.net/dancing-gnome-brewery/Logo-Full-Frame-01_2x.png?auto=compress%2Cformat&ixlib=php-1.2.1',
1,1,1);

INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('Brew Gentlemen',
'Monday: closed,
Tuesday: closed,
Wednesday: 3:00PM - 8:00PM,
Thursday: 3:00PM - 8:00PM,
Friday: 3:00PM - 8:00PM,
Saturday: 12:00PM - 8:00PM,
Sunday: closed', 
' 4122123657',
'https://www.brewgentlemen.com/',
'512 Braddock Ave, Braddock, PA 15104',
-79.870300,
40.404110,
'Run by a small team with a devoted attention to detail, Brew Gentlemen is recognized as a leading brewery both locally and nationally. Founded by two college friends who dropped everything to carve their own path in the beer industry, Brew Gentlemen has developed their reputation within the Pittsburgh brewing scene for making soft, balanced beers - best exemplified by their flagship IPA, General Braddock�s. Based in the historic steel town of Braddock, twenty minutes east of downtown Pittsburgh, along the Monongahela River. Located in a renovated electrical supply storefront and warehouse in the shadow of the still-operating Edgar Thomson Works, the first Bessemer steel plant built by Andrew Carnegie.',
'https://cdn.shopify.com/s/files/1/0306/2467/8023/files/img_2095_1950x.jpg?v=1616531747',
0,0,1);
INSERT INTO brewerys (name, hours, phone_number, website, address, longitude, latitude, history, image, GF_food, GF_beer, is_open)
VALUES ('hofbrauhaus',
'Monday: 11:00AM - 10:00PM,
Tuesday: 11:00AM - 10:00PM,
Wednesday: 11:00AM - 10:00PM,
Thursday: 11:00AM - 11:00PM,
Friday: 11:00AM - 12:00PM,
Saturday: 11:00AM - 12:00PM,
Sunday: 11:00AM - 10:00PM',
'4122242328',
'https://www.hofbrauhauspittsburgh.com/',
'2705 S Water St, Pittsburgh, PA 15203',
-79.964500,
40.428780,
'Hofbr�uhaus was built on the love of beer. What started as a demand for better brew has turned into a 400-year tradition of pure flavor. We�ve taken four natural ingredients barley, yeast, hops and water from Munich, Germany to across the world in what has become a true bier revolution. You can carry on the tradition by bringing another Hofbr�uhaus location to beer lovers everywhere.',
'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Hb_muenchen_4c_pos_hoch.svg/1200px-Hb_muenchen_4c_pos_hoch.svg.png',
0,0,1);
GO




--Populate Beers

--Spring Hill Brewing



INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES ('Afternoon',
'mild farmhouse ale. After Work Beer with a straight forward noble and new world hop profile. Saison + monastery yeasts. Notes of lightly dried fruits, bright and spicy citrus, freshly baked bread',
'No image provided',
1,
4.5,
'mild',
0,
10);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Setting Sun',
'Hoppy red ale. Hopped assertively with cascade, centennial, and bravo. Monastery + English yeasts. smooth hop bitterness rounded out with refreshing citrusy and floral aromas',
'No image provided',
1,
5,
'mild',
0,
10);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Dusk',
'Belgian nut brown ale. Made from a sticky mash of oats and toasted barley. Saison + monastery yeasts. Extra malt texture, notes of slow roasted fruits and spice, everything nice',
'No image provided',
1,
4,
'mild',
0,
10);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Moonrise',
'Farmhouse porter. Roasted and cherrywood smoked malts. Notes of campfire brownies, roasted ripe plums, delicate fruit and smoke',
'No image provided',
1,
4.2,
'dark',
0,
10);

--Eleventh Hour Brewing

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Pinwheel',
'A bright and crisp Pale Ale that calls back to the beers that got us started loving craft. With Azacca, Sultana and Citra filling out the hop bill, we get orange rind, fresh pine needles and sweet pineapple with a fruit cup flavor intro. The malt base is present, giving a slight hint of light caramel along with a balancing bitterness to finish it out. The perfect beer to crush at an outdoor picnic, on the side of a pool or when youre hovering over that backyard grill.',
'https://untappd.akamaized.net/photos/2022_04_10/71e8759068a2c24a6eddb743ac99fe00_640x640.jpg',
1,
5.3,
'light',
0,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Burning Phoenix (Jalapeno)',
'The most polarizing beer we produce starts with a simple American Pale Ale hopped with Cascade. It is then aged on over 150 lbs of jalapenos in the fermenter giving it a nose like fresh cut jalapenos, a spicy burn as it goes down and an even finish as the heat hits a plateau. You will either love it or hate it.',
'https://untappd.akamaized.net/photos/2022_04_01/e0fb573155e82dbcf18a16d0af83de63_640x640.jpg',
1,
6.2,
'light',
0,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Lockdown Reserve',
'A HUGE Imperial Stout aged in Widow Jane Applewood Rye barrels. We brewed this beer before the lockdown and stashed it away in barrels right after. A two year stay in our barrel room, and its ready to come out and play. As much as we want to forget the lockdowns, this seems like a great way to make something out of a bad situation. No adjuncts, just a dreamy chocolate, marshmallow, vanilla, oak & rye behemoth that sticks to your glass and warms you to the core',
'https://untappd.akamaized.net/photos/2022_04_10/a84d21ef175350ab0936b4030bdaaf5b_640x640.jpg',
1,
12.5,
'dark',
0,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Makeshift Dynamite',
'Trouble in a glass, this beer explodes with aromatics of ripe strawberries, raspberries, pineapple, and guava. Double dry-hopped with delicate French Barbe Rouge and pungent Mosaic, the aroma and flavor are spread generously over the ever soft Golden Promise and Flaked oat landscape. Finishing with a smooth tropical flavor and gently disappearing bitterness you will definitely not see the 8% coming at you.',
'https://untappd.akamaized.net/photos/2022_04_10/719435304a578894d65dc6e626ea4676_640x640.jpg',
1,
8,
'light',
0,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Dream Cannon: No 12 Mega Berry Sorbet',
'We decided to stuff this one as full of berries as possible. We started with a soft base of German pilsner and malted wheat, then added a massive dose of raspberry, blackberry, blueberry, strawberry, cranberry and marionberry for a bursting juice flavor, complimentary tartness and a sweet finish from the lactose. This one keeps you on your toes!',
'https://untappd.akamaized.net/photos/2022_04_10/a1b482648c5d6b11b10a1becf7d17b4f_640x640.jpg',
1,
4.4,
'sour',
1,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Black Is Beautiful - 2022 - BA',
'The final entry in our Black is Beautiful is a bigger and bolder version with almost 2 years of aging in 4 Roses Barrels.  We then partnered with our friends over at Kelvin Coffee Labs (using their Las Luces blend) and a pile of Belgian chocolate.  The resulting beer has deep rich notes of coffee, rich chocolate, mild vanilla, and charred marshmallow.',
'https://untappd.akamaized.net/photos/2022_04_09/22ab274b51c1d7bf6ed279d62120420d_640x640.jpg',
1,
12,
'dark',
0,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FOSSL',
'For our version of the Steinbock,we tore the heads off a couple of our leftover barrels and installed sanitary fittings to allow for the transfer of the wort into and out of these makeshift kettles. We stoked a fire using additional deconstructed bourbon barrels and heated the rocks on the flames. With the stones reaching temperatures upwards of 500 degrees, they were added to the wort, caramelizing what they touched and adding a smoky layer. Once the boil was complete, we fermented the wort and then transferred it to neutral Pennsylvania white oak barrels where it lagered for 4 months in our cellar.',
'https://untappd.akamaized.net/photos/2022_04_10/1718a1772068efa08a1cb57b3ef63ef4_640x640.jpg',
1,
7,
'mild',
0,
11);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Doppelbock',
'A perfect companion on a cold winter night, we bring you our Doppelbock. A big bodied beer with notes of caramel and toffee, hints of raisin with mild bitterness and a crisp sweet finish. This one warms you up with every sip. Cheers',
'https://untappd.akamaized.net/photos/2022_04_10/c9e5365095f8bfb40775b4f369276383_640x640.jpg',
1,
8,
'mild',
0,
11);


INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Maibock',
'The Maibock is a seasonal tradition representing the smooth transition from cooler weather to the warmer spring months. This pale bock still has the higher alcohol content as the winter bocks, but a lighter coloring and flavor profile. A slightly sweet, caramel and toffee taste permeates this delightful lager. A crisp clean finish and a fading aftertaste brings you back for more and reminds you that Spring is here and summer is just around the corner.',
'https://untappd.akamaized.net/photos/2022_04_09/0e105e8341754ac4268966dad626af4c_640x640.jpg',
1,
7.1,
'mild',
0,
11);

--Allegheny City Brewing

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Oceanic',
'Hazy IPA with Citra, Galaxy and Motueka hops',
'https://untappd.akamaized.net/photos/2022_04_03/d5dcfdc64bd6d7804c3edb0fcfd8d92d_640x640.jpg',
1,
6.6,
'mild',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Nova Gose',
'Ale brewed with coriander and sea salt added to the boil with orange zest added during secondary fermentation.',
'https://untappd.akamaized.net/photo/2022_03_16/9e5064babdb01b5a160acff3a5e7e8be_c_1138485335_640x640.jpg',
1,
4.9,
'sour',
1,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Deutschtown Brown',
'this easy drinking brown ale, with a nutty finish, is named after the Historic Deutschtown neighborhood.',
'https://untappd.akamaized.net/photos/2022_04_04/14a6e081a73e59adb0293b3452533f7e_640x640.jpg',
1,
6.1,
'dark',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Beer Named Woo',
'The grain bill consists largely of golden promise, with carapils, white wheat, and oats to round it out. Water mineral adjustments to improve its softness, and some lactose for a creamy mouthfeel. A special yeast strain from our friends at Inland Island helps bring the whole recipe together. And, a double dry hopping of Mosaic and Vic Secret provide aroma and flavor of ripe tangerine and pineapple.',
'https://untappd.akamaized.net/photos/2022_04_10/924b950827e3305720ae3dd429789678_640x640.jpg',
1,
6.7,
'light',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Morning Dew IPA',
'Floral aroma - soft with tropical and citrus notes.',
'https://untappd.akamaized.net/photos/2018_09_15/3c9882ec65c1c4b4998cf6dabc52adeb_640x640.jpg',
1,
6.3,
'light',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Graham Cracker Porter',
'This bready porter has a sweet cinnamon nose and finish uses real graham crackers and cinnamon sticks',
'https://untappd.akamaized.net/photos/2022_02_28/5311eeab9d0b6a47c34befe0b3c651b7_640x640.jpg',
1,
6,
'dark',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Northside Buzz',
'IPA infused with coffee from La Prima Espresso',
'https://untappd.akamaized.net/photos/2021_05_26/14dc3c71e0cc5b70a30c0f2b2268a56d_640x640.jpg',
1,
6.2,
'mild',
0,
12);

INSERT INTO beers (name, description, image,is_avaliable, abv, category, GF, brewery_id)
VALUES('Most Dope',
'Award-winning NEIPA, featuring Galaxy and Strata hops.',
'https://untappd.akamaized.net/photos/2022_03_17/6cd59a04533683c31a3f03e8560f3469_640x640.jpg',
1,
6.3,
'light',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('GF DIPA',
'West coast style DIPA.',
'https://untappd.akamaized.net/photos/2020_03_25/4138063b902e79e349c6affe40463b18_640x640.jpg',
1,
8.2,
'light',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Going To the Sun',
'Golden ale with honey malt',
'https://untappd.akamaized.net/photos/2020_05_22/da1e49a9a9536948c7ef0b5401e9ac60_640x640.jpg',
1,
4.7,
'mild',
0,
12);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('1795 Stout',
'Thick and malty with notes of chocolate. Named after the year the first American-owned brewery opened at the Fort in downtown Pittsburgh.',
'https://untappd.akamaized.net/photo/2017_12_22/c7acdea8ebf46064f12a5f076b0abf22_320x320.jpeg',
1,
7.8,
'dark',
0,
12);

--Grist House Craft Brewery

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Clean Line',
'With big aroma and inviting bitterness, this West Coast IPA may rock the boat. Brewed with Ekuanot, Mosaic, and Simcoe, Canoe Rocker boasts delightful notes of tropical fruit and citrus.',
'https://untappd.akamaized.net/photos/2022_04_12/421a756c91daf41166166004a7da470e_640x640.jpg',
1,
7.3,
'light',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Double Vice',
'Brewed with Indian Mysore Coffee from Allegheny Coffee and Tea Exchange, this delicious porter opens with a full aroma of coffee and dark chocolate, then washes over you with hints of coconut and vanilla.',
'https://untappd.akamaized.net/photos/2022_04_09/5d068a94a7a335f4a0a40e0144c06972_640x640.jpg',
1,
6.6,
'dark',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Gots ta Gose',
'This gose includes one of the most delicious fruits in the world, Guava! Added during fermentation it dominates the nose and flavor. This beer finishes with a tongue lingering deliciousness that could only be provided by pink salt mined deep in the Himalayan mountains. Sometimes you just Gots Ta GOSE!',
'https://untappd.akamaized.net/photos/2022_04_10/b01d8680597cf0ca1d387d73198752c6_640x640.jpg',
1,
4.5,
'sour',
1,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('London Crawling',
'Refreshing, yet flavorful, with notes of caramel, chocolate, and dark fruit, this low-gravity, malt-focused British session ale is readily suited to drinking in quantity. Brewed with English Maris Otter, caramel, and specialty malts, as well as English hops and yeast, this beer is British in its bones.',
'https://untappd.akamaized.net/photos/2022_04_09/7839f919e5a7d3a3e0a26899048a644b_640x640.jpg',
1,
3.7,
'dark',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Many Faced Shaman',
'Tart and full of incredible flavor, this entry in the Shaman Series makes your whole mouth tingle in anticipation of the next sip. Guava, Mango, Blackberry and more blend in perfectly with juice from lemons and limes and Berry Berry Tea from Allegheny Coffee & Tea Exchange.',
'https://untappd.akamaized.net/photos/2022_04_10/e8425ccb4a15c7144a90c175a1c95682_640x640.jpg',
1,
5,
'sour',
1,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Phantom Drifter',
'his beer is scary good. Milk sugar adds tantalizing sweetness to the dark roasted character of the malt while chocolate, vanilla, and hazelnut star in this devilishly delicious stout.',
'https://untappd.akamaized.net/photos/2022_03_26/5e8bb440efba00c2d174a1aab65896b3_640x640.jpg',
1,
4.9,
'dark',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Creek Crusher',
'This lager-like ale is light, flavorful, and highly drinkable. Brewed with American barley and flaked maize to create a light, malty body with some residual sweetness and delicately hopped with NZ Motueka for a touch of citrus zest on the nose and palate. A true American classic!',
'https://untappd.akamaized.net/photos/2022_04_10/c814d14ed52ae667c3f48ef482ca4339_640x640.jpg',
1,
4.8,
'dark',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('French Toast Revolution',
'French Toast Revolution is here to bring breakfast to the beer game! Brewed with blueberry, a hint of raspberry, lactose and the prefect amount of maple syrup and brown sugar to give the impression of French toast, our first Breakfast Sour is sure to make you wish a beer was part of a "balanced breakfast".',
'https://untappd.akamaized.net/photos/2022_04_10/f600dddef59e8597f46a3ee54b60aac5_640x640.jpg',
1,
7,
'sour',
1,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Gristly Bear Brown',
'This ale�s chestnut hue is punctuated with a fluffy white head. Nutty, malty, full bodied, and silky smooth with hints of caramel and coffee.',
'https://untappd.akamaized.net/photos/2022_04_02/56ae2db75b160336f003ebf3d9162d69_640x640.jpg',
1,
5.3,
'mild',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Mad House 2',
'Our funky fresh collaboration with Mad Mex returns! In Vol 1 we explored South African hops and for this round we chose the unique flavors of New Zealand, featuring Nelson Sauvin, Riwaka, and Rakau hops. As we do more volumes we will choose different varieties from regions around the world to showcase each regions unique flavors. Opening with a distinct citrus aroma, this silky brew delights with notes of passionfruit and white grape. The soft, pillowy finish leaves your taste buds wanting more!',
'https://untappd.akamaized.net/photos/2022_04_12/13916ed4ff0049699ef16508082999a2_640x640.jpg',
1,
6.4,
'light',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Maximum Power',
'This brand new IPA takes hop flavor to the MAX! Brewed with Galaxy and Citra LupoMAX hops, a concentrated Lupulin hop pellet with much less hop vegetal matter for a cleaner, bright hop flavor.',
'https://untappd.akamaized.net/photos/2022_04_13/7ef449866fe21ee231421dc0fff5eee5_640x640.jpg',
1,
6.8,
'light',
0,
13);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Queens Wit',
'Brewed in celebration of Pink Boots collaboration Brew Day, this refreshing wit beer is as sessionable as they come! Brewed with orange peel, this zesty Belgian Witbier will have you coming back for more. The Pink Boots Society strives to assist, inspire, and encourage women and/or non-binary individuals in the fermented/alcoholic beverage profession through education.',
'https://untappd.akamaized.net/photos/2022_04_13/d5b51fd81c2964d1d027271796b9a77f_640x640.jpg',
1,
4.8,
'light',
1,
13);

--Strange Roots Experimental Ales

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Agent Orange',
'Mixed-Culture Wild Ale w/ Persimmons and Apricots. The core beer is a heftier version of their base saison, fermented with organisms the brewers harvested locally, with a secondary fermentation with fresh, whole apricots, followed by the persimmons. Brewed with malted barley and raw oats.',
'https://untappd.akamaized.net/photos/2021_06_05/f85fc22e5b9c5d3b6e22449302c76d64_640x640.jpg',
1,
9,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Biere de Coupage',
'Old sour blended with young dry hopped ale. Fruity and tart with a slight apple flavor finish.',
'https://untappd.akamaized.net/photos/2021_09_11/e00ea393ecafebd0b92267f66d207b1e_640x640.jpg',
1,
6.7,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Black Briar',
'Sour with a wonderful black berry taste',
'https://untappd.akamaized.net/photos/2022_02_27/86042564e6c2c9b36d23cf0ad01e188c_640x640.jpg',
1,
8,
'sour',
1,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Foraged Dandelion',
'Entirely delicious. Some wild fermentation tang with a nice sweet base from dandelion.',
'https://untappd.akamaized.net/photos/2021_08_08/43e20336648e5b3914041259bcee042b_640x640.jpg',
1,
5.4,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Davidian Haze',
'IPA',
'https://untappd.akamaized.net/photos/2022_01_07/631f8c917cb694e4dc41a51577f1af84_640x640.jpg',
1,
5.3,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Geestelijke',
'A lightly spiced apple bread runs along the backbone with tart lemon-lime, apricot, peach, grapefruit and a little hint of white wine vinegar. Wild herbs develop as it warms with something perfumey yet bitter. When it hits the palate there is a quickly developing fizzy froth, and it leaves with a semi-wet finish.',
'https://untappd.akamaized.net/photos/2022_04_09/c61caa213b857e73fe869c639472d6d0_640x640.jpg',
1,
9,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Gilded Pinnacle',
'Imperial IPA',
'https://untappd.akamaized.net/photos/2022_01_22/9c45bb6dda0d470b98ac2c0c5289273e_640x640.jpg',
1,
8.3,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Grand Blu',
'Collab with House 1K beers. Wild ale - fermented with peaches and roqueforti (organism used to make blue cheese)',
'https://untappd.akamaized.net/photos/2022_01_16/7c66a2d06c7b0dd06363634e8f4020df_640x640.jpg',
1,
8.1,
'light',
0,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Radiant Flush',
'Barrel-aged and conditioned on cherries',
'https://untappd.akamaized.net/photos/2022_03_31/af95998b35e17676dd56043ee0a4b9c6_640x640.jpg',
1,
7.4,
'sour',
1,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Orange Pineapple Banana Tartburst',
'BRAND NEW TARTBURST! Orange Pineapple Banana Tartburst is a fruited sour conditioned on HUGE amounts of oranges, pineapple, and bananas',
'https://untappd.akamaized.net/photos/2022_02_04/a12c7c77fcf56187c4df97e3fe358fa2_640x640.jpg',
1,
6.7,
'sour',
1,
14);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('The Omen',
'Imperial Stout (not sour!) aged in 3-year-old Wheat Whiskey casks conditioned on hand roasted Sonora Almonds. 12.0% abv.
Fruity soft aromas of Wheat Whisky and Amaretto, open into almond torte cake, biscottis and rich chocolate fudge brownies. The initial mouthfeel is full, comparable to melted ice cream, with flavors of roasted almonds and pastries (reminiscent of lady finger cookies), fading into malted toffee, hot cocoa, oaky vanilla and a bright caramel. The finish is spicy whiskey forward with a lingering chocolate liquor sweetness.',
'https://untappd.akamaized.net/photos/2022_02_13/e00de3f0a4cf05ecc4495e786f5580ec_640x640.jpg',
1,
12,
'dark',
0,
14);

--412 Brewery

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('R-U-Ready 4 One-Too',
'RU Ready 412 is a traditional English Bitter, but dont let that name fool you. There is nothing bitter about this beer.
The malt character of this beer exibits notes of biscuit, caramel, and toast with a touch of sweetness.
The hop character of this beer is subtle and balanced with the malts.',
'https://untappd.akamaized.net/photos/2020_01_12/2d57b644d7a8975cf164673d2947562f_640x640.jpg',
1,
5.5,
'mild',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Boats N Hops',
'Boats N Hops is a west coast style, hop bursted session IPA that uses multiple grains to add body and a unique twist on an easy-drinking session IPA.
Hopped with Cascade and Citra hops.',
'https://untappd.akamaized.net/photos/2020_06_07/93071123538f376e4db28941456c9a89_640x640.jpg',
1,
4.8,
'light',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Mo Hops Mo Problems',
'Mo Hops Mo Problems is a West Coast style hop bursted IPA. A clean and dry Malt profile allow generous quantities of Nugget, El Dorado, and Citra hops to be the main event.
This beer utilizes a technique called "hop bursting" in which the majority of the hops are added in the last 15 minutes of the boil as opposed to early in the boil like most styles of beer. The result is less bitter, grassy flavors, and more clean, fresh, citrus-like flavors and aromas.',
'https://untappd.akamaized.net/photos/2021_03_27/e6c782c7699c30ffb30de6d1b0f7129d_640x640.jpg',
1,
7.2,
'light',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('2 Hour Delay',
'Imperial brown ale brewed with honey',
'https://untappd.akamaized.net/photos/2020_04_17/79d41afea58361e7a5aec57f528c9499_640x640.jpg',
1,
8.6,
'mild',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hoodie Weather',
'Harvest amber ale with a bit of sweetness to it and a balanced hop character',
'https://untappd.akamaized.net/photo/2019_12_14/4c1cbace2f849af1959ffc4c1c06adb6_c_841015036_640x640.jpg',
1,
5.8,
'mild',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hazelicious',
'Cloudy beer brewed with notes of orange, pineapple, and grapefruit',
'https://untappd.akamaized.net/photos/2021_10_15/398535cb2a38bf5b883fbbe5daf2da2d_640x640.jpg',
1,
5.5,
'light',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Pour Me An Udder',
'Strong notes of roasted coffee with added lactose for sweet and smooth drinking',
'https://untappd.akamaized.net/photo/2020_11_22/c2091e12a844b540f3409a1b73027869_c_967272385_640x640.jpg',
1,
6,
'dark',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Dankity Dank',
'Earthy and dank tasting imperial brew with a high ABV',
'https://untappd.akamaized.net/photos/2020_07_24/0d9d0d705e096e96030460f11efd8090_640x640.jpg',
1,
9.5,
'mild',
0,
15);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Wrecreational Wheat',
'Slightly sweet summer beer with a banana and clove aroma. Hops are low character with wheat standing out',
'https://untappd.akamaized.net/photos/2019_04_13/17f4d512f4ad692bf5c048652cda0b3c_640x640.jpg',
1,
5.5,
'light',
0,
15);

--Hop Farm Brewing Company

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SAHR PAHR SERIES: GOMANGO',
'Delicious Mango flavors with a slightly tart finish. Sure to be a summer favorite� GO-MANGO!',
'https://untappd.akamaized.net/photos/2022_02_04/1687b1df2fafc880f6cde7410b61ecd9_640x640.jpg',
1,
6.2,
'sour',
1,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MAY QUEEN',
'Brewed with Local Honey and hand-blended Tea Collab with Pink Boots Society and North Country Brewing Co.',
'https://untappd.akamaized.net/photo/2021_09_05/270dabe03f1082bf64a7af7e3adb9026_c_1073920631_640x640.jpg',
1,
4.8,
'light',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('NEON TURTLES',
'Mosaic and Citivia hops create strong aromatics of Tropical fruit, ripe stone fruit, and soft peach.
"Sit on your imaginary beach and watch the Sea Turtles."',
'https://untappd.akamaized.net/photos/2022_02_11/b07d1f8e34385cca7c1183cf8a8153c1_640x640.jpg',
1,
7.6,
'light',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BERRY BUSH WHEAT',
'Fruited with A�a� and blackberries make this beer light and fruity.',
'https://untappd.akamaized.net/photos/2021_07_24/2166fd8654570ceeccc06a7f1dadaa59_640x640.jpg',
1,
5,
'light',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('KING LUMI',
'Mosaic and Strata hops form a smooth and tropical mouthfeel along with hints of mango and ripe pineapple. �Everything the light touches is Lumi�s��',
'https://untappd.akamaized.net/photos/2021_12_27/653e735373df20e6216f133694366b3c_640x640.jpg',
1,
6,
'light',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('PUB GAMES',
'English-style Mild Ale - Bready toasted malt base with hints of cocoa and sweet caramel.
Light to medium mouthfeel',
'https://untappd.akamaized.net/photos/2022_04_09/c9f14b139966a05502e2824bc84f9eeb_640x640.jpg',
1,
4,
'mild',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('GOAT FACE KILLA',
'Maibock � A strong malty German-style lager beer traditionally associated with the month of May. Crisp bittering maintains drinkability despite increased malt character.',
'https://untappd.akamaized.net/photos/2022_02_23/780c21a2df8c03b716d9be8d29417a33_640x640.jpg',
1,
7,
'light',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('PITTSBURGH PALE ALE',
' classic American Pale Ale. Ample hopping from El Dorado and Mosaic provide hop bitterness and a bouquet of mixed tropical fruits, berries, and a subtle note of pine.',
'https://untappd.akamaized.net/photos/2022_03_30/8a5305e3f85f2ba38d758033275dc8f3_640x640.jpg',
1,
5.1,
'light',
0,
16);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FIELD RATION',
'Belgian-style Farmhouse Ale � Combination of Belgian and French Farmhouse yeast provides complex flavors of crushed flowers, stone fruit, and hints of lemon. Finishes dry and delicate.',
'https://untappd.akamaized.net/photos/2021_07_31/faad430e1e5322934b2228c70b8b117a_640x640.jpg',
1,
5.2,
'light',
0,
16);

--Southern Tier Brewery Pittsburgh

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Across the Spectrum IPA',
'IPA - New England / Hazy',
'https://untappd.akamaized.net/photos/2022_04_11/4d67b8ea0b18954c1643bfa27b290ffd_640x640.jpg',
1,
6.5,
'light',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('the Duke Nitro Irish Stout',
'Dry, low ABV Irish-style stout served on a Nitro tap',
'https://untappd.akamaized.net/photos/2022_04_10/9c3113149ec6e901628ab33e1c9bc771_640x640.jpg',
1,
4.8,
'dark',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MacManus Irish Red',
'Dark Irish Red Ale brewed with traditional Irish Malts.',
'https://untappd.akamaized.net/photos/2022_04_11/b5daa656a88b8fca66510a523db76734_640x640.jpg',
1,
4.8,
'mild',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Dark City Lager',
'Dark roasted German Lager named after Pittsburghs efforts to decrease light pollution and be declared the nations first "dark city".',
'https://untappd.akamaized.net/photos/2022_04_11/2732e4bd9a84d4be89edd88a6eef54ad_640x640.jpg',
1,
4,
'dark',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Samoa This',
'Slightly Lower ABV version of the Southern Tier classic, brewed exclusively for Pittsburgh juts in time for Girl Scout Cookie Season!',
'https://untappd.akamaized.net/photos/2022_04_13/b8c132a25a3b3f1161c2762e265a3c2b_640x640.jpg',
1,
8.5,
'dark',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('8 Days A Week',
'With fruity notes, low bitterness and a clean finish, this refreshing beer is hard to put down. Take it with you on your infinite adventures. No matter the journey, this is an ale you can enjoy 8 Days a Week.',
'https://untappd.akamaized.net/photos/2022_04_12/b0f279db3501cf6e279a735976ca47a9_640x640.jpg',
1,
4.8,
'light',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('2XHAZE',
'2XHAZE is brewed to bold strength with an absurd amount of hops, three times a standard IPA, and then dry-hopped relentlessly on four different days.',
'https://untappd.akamaized.net/photos/2022_04_13/40efed05f743166700daffc9b73aa4b7_640x640.jpg',
1,
8.2,
'light',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('2XIPA',
'A massive dry hop brings a feverishly hoppy and well-balanced Double IPA. An enormous haul of hops deliver notes of grapefruit, lemon and doughy sweetness, for an ale that demands reverence.',
'https://untappd.akamaized.net/photos/2022_04_13/a8c98c0e1f584a5c4f9a3a8a75e7b8d0_640x640.jpg',
1,
8.2,
'light',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('IPA',
'Our IPA is timeless - brewed for those who give a damn about a well-crafted beer. As one of our original beers, its quality and consistency helped grow the popularity of IPAs from the ground up. The citrus and pine hop profile balanced by a subtle caramel sweetness are standard for a classic American IPA.',
'https://untappd.akamaized.net/photos/2022_04_10/516cf9e3761bbbb2407598751f2dc4c1_640x640.jpg',
1,
7,
'light',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Phin & Matts Extraordinary Ale',
'*Formerly PMX* - To label a beer as extraordinary is to have complete trust in its ingredients. Crystal filtered artesian water, whole hops, and the choicest malted barley create this American-style pale ale. The character of American pale ales varies from region to region and is dependent upon the ingredients used. In Phin
& Matt�s, one can expect harmony between malt and hops without dominating tastes of sweet
or bitter.',
'https://untappd.akamaized.net/photos/2022_04_09/da98e771fdc880172f52dff6325e715e_640x640.jpg',
1,
5.7,
'light',
0,
17);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Thick Mint',
'Inspired by the legendary cookie, Thick Mint joins our world-class rated Blackwater Series of dessert beers alongside Creme Br�l�e, Choklat Oranj, Salted Caramel & Choklat in 2017. This imperial stout is a mouthful of perfectly
balanced mint & chocolate. Roasty malts coalesce with notes of Belgian dark chocolate, sweet mint & just a touch of sweet caramel. So decadently delicious, you�ll wish you�d bought another box... er, bottle.',
'https://untappd.akamaized.net/photos/2022_04_12/f237da46f085a856622db74999a53159_640x640.jpg',
1,
10,
'dark',
0,
17);

--Dancing Gnome Beer

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FOURTEEN99',
'A 4% micro machine of an IPA loaded with Strata, Citra, and Amarillo hops. Its bursting with bright notes of lemonade, passionfruit, and dank clementine.',
'https://untappd.akamaized.net/photos/2022_04_13/a4daed962b624612fd4fbbacb26a9d20_640x640.jpg',
1,
4,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Wishbone',
'Originally brewed with Tiny Moving Parts for their latest album Swell, Wishbone is an absolute crusher at 5.0% with heavy citrus notes and slight floral tone to round things out. Extremely soft with a silky body means supremely high drinkability.',
'https://untappd.akamaized.net/photos/2022_04_12/e63d56f3b523a9f118ad191af1b5af1e_640x640.jpg',
1,
5,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('LUSTRA',
'An ode to the unity of malted barley, hops, yeast, water, and the brewer who prudently blends them. Intense tropical and citrus fruit aromas and a clean fruity bitterness work in harmony with the lightly toasted wheat bread flavors derived from the malt.',
'https://untappd.akamaized.net/photos/2022_04_12/7db4bb39f8a8a43d317ab8cba2c0d907_640x640.jpg',
1,
5.8,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('CABIN COLOR',
'An IPA for the impending equinox. Loaded with Simcoe and Mosaic hops. Super soft and creamy with big hits of sweet blueberry, graham cracker, orange marmalade, and fresh pine.',
'https://untappd.akamaized.net/photos/2022_04_10/f5dc569ad4b5a6f8035d7c07c23b433f_640x640.jpg',
1,
6.2,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('HORI HORI',
'his 6.2% IPA was brewed with healthy portions of three different types of rye to showcase the effect the grain has on this hazy IPA. Hopped with Mosaic, Enigma, Amarillo, and Columbus, you can expect a whirlwind of white peach, summer berry, sticky tangerine, and ultra dank resin.',
'https://untappd.akamaized.net/photos/2022_04_13/a4358fecd86fa56f0bff53ebc20f332e_640x640.jpg',
1,
6.2,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('GRAVEL GRINDER',
'IPA hopped with Simcoe, Citra and Mosaic. This beer was brewed in collaboration with Over the Bar Bicycle Cafe.',
'https://untappd.akamaized.net/photos/2022_04_10/497aeae937f97dc929cacaf037774d72_640x640.jpg',
1,
6.6,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('TENTACLE SQUAD',
'Hopped intensely with Vic Secret and Mosaic, Tentacle Squad has amplified flavors and aromas of tropical fruits, red berries, and sweet grapefruit, melding perfectly for an incredibly drinkable ale',
'https://untappd.akamaized.net/photos/2022_04_13/2c0fbacf2fa432087bd2494d74955541_640x640.jpg',
1,
7,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('EXQUISITE BEAST',
'Brewed with english malt and generously hopped with Denali, Mosaic, and Amarillo hops.',
'https://untappd.akamaized.net/photos/2022_04_09/d043925cc7bf3fae349742b29d77baf5_640x640.jpg',
1,
8.5,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('RIVERSCAPE',
'This 11% Triple IPA is fully saturated with oils from a blend of 8 choice hop varietals for a tsunami of ripe citrus, tropical paradise, and sticky resin.',
'https://untappd.akamaized.net/photos/2022_04_13/a9940d4fadebae1d901ee96bac55a6ba_640x640.jpg',
1,
11,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('NOT ALWAYS PRESENT',
'A traditional German Kolsch-style ale. It�s a crusher with sweet fruit character from the German Pilsner malt and variety of German Noble hops, and a perfect crackery, bready finish. A true all day drinker.',
'https://untappd.akamaized.net/photos/2022_04_09/a5c529653decfb2ecf17de81ca3d6e44_640x640.jpg',
1,
4.8,
'light',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('ALTBIER',
'A super flavorful, drinkable, dark session ale rich with malt but crisp and balanced.',
'https://untappd.akamaized.net/photos/2022_03_13/50afe2a411806f84f2b5eec16436f863_640x640.jpg',
1,
4.8,
'mild',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('DUNKEL',
'This German-style dunkel is a dark lager that drinks light and smooth with a soft and pleasant sweet caramel malt character and a fresh baked bread finish. 5.4% makes it perfect for mug service.',
'https://untappd.akamaized.net/photos/2022_04_10/b694b6818c8e9ba1b62cf2a5b6a64ba6_640x640.jpg',
1,
5.4,
'mild',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SCHWARZBIER',
'This German-style dark lager was brewed with the finest German sourced ingredients for a dry and crisp flavor of light sweet malts, slight roast, and low bitterness. Despite its color, Schwarzbiers are meant to be mild, easy drinking, and soft, flavorful lagers, and ours is no exception.',
'https://untappd.akamaized.net/photos/2022_03_30/ce1bec72192792c8f0b97da5af2f4028_640x640.jpg',
1,
4.6,
'mild',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('CALIGO',
'Our satin black offering is enriched with oats, giving a smooth, silky finish as the roasted notes of coffee and dark chocolate wane on your palate. Bright hints of berry, citrus, and pine, accompany this erudite substance to unify the cerebral experience.',
'https://untappd.akamaized.net/photos/2022_04_09/e2549a978eb044bc6bb0f871ac8c433c_640x640.jpg',
1,
7.5,
'dark',
0,
18);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BLACK CLOUDS - BREAKFAST',
'Coming in at 10%, Black Clouds is super thick and chewy, with a slight roasted dark chocolate character and a semi-sweet finish. Undetectable alcohol with a soft, warming sensation on the finish. Big coffee aroma and flavor with vanilla and slight maple seeping through at the end.',
'https://untappd.akamaized.net/photos/2022_04_13/50e05b8f392b7ab6bd59315da1ca055f_640x640.jpg',
1,
10,
'dark',
0,
18);

--Two Frays Brewery

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('2FB Pale Ale',
'Brewed for brewers, this West Coast IPA adds tropical flavors and aromas from healthy additions of Citra, Mosaic, and Galaxy Hops.',
'https://untappd.akamaized.net/photos/2021_10_22/eead7f627d3b279f639831109fd87a73_640x640.jpg',
1,
5.5,
'mild',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Burning Lips',
'Benefits the first women owned & operated brewery in rwanda! A crispy lager that�s a bit different. Clean drinking with Herbal notes from the hibiscus additions. Made with PA-sourced ingredients.',
'https://untappd.akamaized.net/photos/2022_03_31/cdbfbe9fc9710a217743f10daff89b09_640x640.jpg',
1,
5.6,
'mild',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('F Raise Her Up - Pink Boots Beer',
'Our first ever Black IPA! Brewed to be more malty and roast, then dry hopped with the Pink Boots Hops Blend for a tropical flavor and aroma addition. Benefits the Pittsburgh Chapter of the Pink Boots Society.',
'https://untappd.akamaized.net/photos/2022_04_11/074f56359f2d709fe2809dd73b12570f_640x640.jpg',
1,
6.8,
'dark',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hazzy Star Hazy IPA',
'Our juiciest, haziest NEIPA yet. Think orange juice -- but it is delicious beer. Brewed with Galaxy, El Dorado, and Mosaic hops. Lots of them.',
'No image provided',
1,
7.1,
'light',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hillcrest',
'Nice light lager',
'https://untappd.akamaized.net/photo/2022_03_24/e2b9bde0500609f3cdeb57fd2892bc32_c_1140962310_640x640.jpg',
1,
5.4,
'light',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hyphenated',
'A Belgiany-Americany IPA that brings the best of both styles together. Fermented with Belgian yeast and brewed with Crystal, El Dorado, and Loral hops, the result is a spicy yet floral and tropical fun beer.',
'https://untappd.akamaized.net/photos/2022_03_19/0ea34dc6f536b1945634d734e8c43674_640x640.jpg',
1,
8.1,
'light',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Its Always Sunny With A Beer',
'Its always sunny with a beer in your hand! This session IPA is hopped with El Dorado, Eukanot, Galaxy, and Kohatu hops. This hop blend contributes to an aroma that is reminiscent of freshly zested lime and crushed pine needles, with an underlying flavor of ripe melon. This is a little IPA that doesnt shortchange you on any hop flavor!',
'https://untappd.akamaized.net/photos/2022_04_09/f0ecbac184af2aff6060525dec395ef2_640x640.jpg',
1,
4.6,
'light',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Jen�s',
'This light-bodied, slightly roasty, easy drinking porter is available year round, as dictated by its namesake.',
'https://untappd.akamaized.net/photos/2022_03_25/039abb01bc2108851de61eb73d611704_640x640.jpg',
1,
5,
'mild',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Side By Side',
'Our juiciest, haziest NEIPA yet. Think orange juice -- but it is delicious beer. Brewed with Galaxy, El Dorado, and Mosaic hops. Lots of them.',
'https://untappd.akamaized.net/photos/2022_03_31/bb2acf7b8791babf89d43a8264046bff_640x640.jpg',
1,
7.1,
'light',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Sonrisa',
'Gose Spiced Sour Ale
A mildly spiced sweet and sour salty gose, we modeled this beer after the pulparindo Mexican candy! To put a smile on your face.',
'https://untappd.akamaized.net/photos/2022_04_02/83a47e334f7f1bab2b6d3b80432cdcfb_640x640.jpg',
1,
5.6,
'sour',
1,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Together Better',
'An easy drinking, crispy ale. Balanced bitterness and sweetness with slight hints of citrus on a bready malty backbone.',
'https://untappd.akamaized.net/photo/2022_03_24/c15a01305943f4c13e741dc8901fe200_c_1140946128_640x640.jpg',
1,
4.5,
'light',
0,
9);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Yinzling',
'American Amber ale',
'https://untappd.akamaized.net/photos/2022_03_12/0097bffbb4425560331d79bd65faef61_640x640.jpg',
1,
5.5,
'mild',
0,
9);

--Hitchhiker Brewing

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BANE OF EXISTENCE',
'Smells of citrus, biscuit and earthy hops. Flavor is of biscuit, orange, grapefruit, hemp and herbal hops. Medium body, tingly carbonation. Decent hazy IPA.',
'https://untappd.akamaized.net/photos/2022_04_12/b9d092dd06ca0fc08061046a4a634a40_640x640.jpg',
1,
6.6,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('OPPOSITE BANE',
'Brewed with Oats and Wheat. We flipped the hop additions to feature predominantly Simcoe versus Citra that normally dominates Bane.',
'https://untappd.akamaized.net/photos/2022_04_11/f055c5333519e4ef412ef5fa5527656e_640x640.jpg',
1,
6.6,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('DOUBLE DRY HOPPED DOUBLE BANE OF EXISTENCE',
'Brewed with Oats and Wheat. Hopped with Citra and Simcoe. Notes of tropical fruits, stone fruit, and mango.',
'https://untappd.akamaized.net/photos/2022_04_09/292c0eb0996ace628b723801aa378e83_640x640.jpg',
1,
6.6,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BABY BANE',
'Brewed with Oats and Wheat. Hopped with Citra and Simcoe',
'https://untappd.akamaized.net/photos/2022_04_12/520f71e3ac6b8dbc7072ddb70eb161f9_640x640.jpg',
1,
4.6,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FAUX REAL',
'Brewed with Wheat and Oats and hopped with Nelson Sauvin, Cashmere and Simcoe.',
'https://untappd.akamaized.net/photos/2022_04_14/9f21a6077284827914b6e254b95a38d6_640x640.jpg',
1,
5.5,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SO SOFT',
'American IPA w/ Cashmere Hops.',
'https://untappd.akamaized.net/photos/2022_04_10/32b1a72eb2f3ecf17e6c08afecc041f9_640x640.jpg',
1,
6.2,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('LOST THOUGHT',
'Brewed with Oats and Wheat. Hopped only with Mosaic. It showcases big notes of ripe peaches, citrus oil, pine, and mango.',
'https://untappd.akamaized.net/photos/2022_04_10/67377b5f864d55cdd5b3089de8853d66_640x640.jpg',
1,
8.3,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('True',
'Brewed with a blend of Pilsner malts and fermented with our house lager yeast. Bready, crisp, and bright.',
'https://untappd.akamaized.net/photos/2022_04_09/8ae50810c9571f6b41df64a2d27485ba_640x640.jpg',
1,
4.5,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Ramen Profit',
'West Coast IPA - Brewed with Crystal and Dextrine Malt, hopped with Simcoe, CTZ, Cascade, and Centennial.',
'https://untappd.akamaized.net/photos/2022_04_09/6d635fbac70b2feb3aff6cb1ed24e0a5_640x640.jpg',
1,
7,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('DEAD ZONE',
'Brewed with Munich, Crystal and Dark malts. Fermented with our house lager yeast.',
'https://untappd.akamaized.net/photos/2022_04_09/5ca1bd53bde5796513f22a3662a2299f_640x640.jpg',
1,
8.5,
'dark',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SUBSURFACE ALL BERRY',
'Brewed with Wheat. Conditioned on Blackberries, Blueberries, Raspberries, Boysenberries, and Strawberries.',
'https://untappd.akamaized.net/photos/2022_04_09/2a4888c49def9a63f81da620bc79d734_640x640.jpg',
1,
7,
'sour',
1,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('USUAL CHAOS',
'Kettle Sour brewed with Milk Sugar. Hopped with Citra and Amarillo and then conditioned on Blackberries, Raspberries, and Vanilla Beans.',
'https://untappd.akamaized.net/photos/2022_04_13/54c0ad7a7a5b630eda0bc58a9df20998_640x640.jpg',
1,
6.8,
'sour',
1,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MR. BITTER',
'Brewed with pale and caramel malts. Hopped with Fuggle. Lightly floral with notes of biscuit and caramel.',
'https://untappd.akamaized.net/photos/2022_04_09/d051a1a3cdd9c92ba0f2fd92fcc5c88c_640x640.jpg',
1,
5.2,
'light',
0,
8);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('THE SHAKES',
'Smells of fresh roasted coffee, biscuit, toasted bread and a hint of oak. Flavor is of caramel, toast, coffee and mesquite. Medium to full body with tingly carbonation on the tongue. Pretty good porter, good flavor and body.',
'https://untappd.akamaized.net/photos/2022_04_10/4a14fb67dd42b3205a3f5112b3ae6777_640x640.jpg',
1,
5.9,
'dark',
0,
8);

--The Church Brew Works

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FORTITUDE STOUT',
'A classic, traditional American stout. Dark barley produces a thick, dark brew with a light tan head. $1.00 from all sales will go to the World Central Kitchen to feed refugees fleeing the Russian War.',
'https://untappd.akamaized.net/photos/2022_04_09/fbf8f9041e67692acf234f43c6bd5dc0_640x640.jpg',
1,
6.1,
'dark',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('IRISH RED',
'A Classic March Ale with light malt sweetness perfect to celebrate in an erstwhile 120 year old Irish Church.',
'https://untappd.akamaized.net/photos/2022_04_09/dacfb5e5aa5eec5088f6e68da4a50485_640x640.jpg',
1,
5.9,
'mild',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('PIOUS MONK DUNKEL',
'Gold Medal Winner of the Great American Beer Festival. It is a perfect example that dark beers are not always strong beers. The body is surprisingly mellow, and the alcohol content is a bit lower than most people might think. It has a wonderfully clean and roasty aroma. Hop bitterness levels are kept in line, but is has a noticeable hop flavor.',
'https://untappd.akamaized.net/photos/2022_04_10/752e8e3b04ee356060483552e9253ecb_640x640.jpg',
1,
5.5,
'mild',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SPICED COCOA SOUR',
'A medium, dark amber ale with cinnamon, vanilla, and nibs of chocolate added.',
'https://untappd.akamaized.net/photos/2022_04_09/6c5eafc6220b8e1f584824def6368e68_640x640.jpg',
1,
4.8,
'mild',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('TART TABLE BEER',
'A lightly hopped session beer. Belgian yeast produces slight tastes of spiced bread with a hint of banana. It will finish with a pleasing sourness. ',
'https://untappd.akamaized.net/photos/2022_04_08/7ad964094acf1a7753019fc0ba894283_640x640.jpg',
1,
4.2,
'light',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('THUNDERHOP IPA',
'Our flagship IPA! Light body and color create a canvas for the hops to shine. Australian Galaxy, American Palisade and German Mandarina Bavaria hops lend juicy and tropical notes to the beers aroma. A balanced bitterness and ABV make this a sure go-to for any hop head!',
'https://untappd.akamaized.net/photos/2022_04_09/c50f3aeb0f64cfe47ce096efe7135d91_640x640.jpg',
1,
6.5,
'light',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BOURBON AGED RAUCHBIER',
'Made with beechwood smoked malt and aged in bourbon barrels. Noble hops were used to balance the sweet breadiness of the lager, but the smoke and bourbon win the day.',
'https://untappd.akamaized.net/photos/2022_04_08/74177016859bb8bf3ed7ec597756ed94_640x640.jpg',
1,
7.5,
'light',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BLACKBERRY QUAD',
'Dark amber color with huge caramel and malt aroma. The unique flavor of blackberries complement the darker malts.',
'https://untappd.akamaized.net/photos/2022_04_13/0e95a8adc6b54458d1840fea321a428e_640x640.jpg',
1,
10.4,
'mild',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('THUNDER HAZE �',
'this New England style ipa is loaded with lots of tropical and ripe fruit. Brewed with oats and wheat that give this brew a soft juicy mouthfeel with peach and citrus in the nose and pineapple and blueberry in the flavor. Enjoy!!',
'https://untappd.akamaized.net/photos/2022_04_10/e5715eadde9f5666d1201023ba3f12e4_640x640.jpg',
1,
6,
'light',
0,
7);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('CASK CONDITIONED THUNDERHOP IPA ',
'Excellent room-temperature brewski, fragrant with pine and Galaxy hops. Oak is subtle, yet influential.',
'https://untappd.akamaized.net/photos/2022_04_01/825e547c9a259c6d820362d4177eb50a_640x640.jpg',
1,
6.5,
'light',
0,
7);

--Trace Brewing

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('GRATEFUL GARDEN',
'Hazy pale ale with Citra and BRU-1 hops. Floral and tropical notes with a dry finish.',
'https://untappd.akamaized.net/photos/2022_04_13/272906f8d53eeeb00323a89d89dbccec_640x640.jpg',
1,
5.2,
'light',
0,
6);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SCIENCE RULES!',
'Double IPA brewed with Mosaic, Amarillo and Eureka hops. Notes of Blueberry and Honeydew Melon. Best consumed after a toast to medical science.',
'https://untappd.akamaized.net/photos/2022_04_13/5a1985aa6f3ddb4332d176bcacc3de17_640x640.jpg',
1,
8.2,
'light',
0,
6);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('KELLERBIER',
'Unfiltered German pale lager brewed with Spalter Select and Tettnanger hops. Clean and crisp with floral and citrus notes.',
'https://untappd.akamaized.net/photos/2022_04_10/943a1871c924c6848da93f75c28384bc_640x640.jpg',
1,
5.2,
'light',
0,
6);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MOVING CASTLE IV',
'IPA with Triumph and Zappa hops. Moving Castle is a series of one-off experimental beers. This IPA features two American hops, and has notes of fresh citrus and spicy herbal hops.',
'https://untappd.akamaized.net/photos/2022_04_10/129255596ad8f33ab84aae99a64f031a_640x640.jpg',
1,
7,
'light',
0,
6);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SURE, YOU�RE RIGHT',
'IPA brewed with Citra and Idaho 7 hops. Notes of Pineapple, Overripe Stone Fruit and Spicy Honey. Dedicated to the best MC with no chain you ever heard.',
'https://untappd.akamaized.net/photos/2022_04_14/0b6a5197cd245e436638bdfafd63d092_640x640.jpg',
1,
7.2,
'light',
0,
6);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FOEDER AGED COAL HILL',
'Dortmunder lager aged in an oak foeder for two months. Delicate floral and citrus undertones backed up by toasted marshmallow, caramel and oak.',
'https://untappd.akamaized.net/photos/2022_04_10/4b4acbdfae9c886cf91495f74d86f562_640x640.jpg',
1,
5.4,
'light',
0,
6);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('DOUBLE HEMISPHERE',
'Double IPA with Nelson Sauvin, Motueka, Citra and Cashmere. Notes of fresh citrus, white wine, and tropical fruit. Featuring hops from both halves of the Earth.',
'https://untappd.akamaized.net/photos/2022_04_14/71b8554857078073edc900ad44019e53_640x640.jpg',
1,
8.1,
'light',
0,
6);

--East End Brewing Company

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('STANTON HEIGHTS *',
'Big, bright floral/candy aroma draws you in to a sip of low-esther sweetness that quickly fades to a nice, dry finish that hides the hefty 9.2% abv stunningly well. Drink with care.',
'https://untappd.akamaized.net/photos/2022_04_10/09206690a3f6ec065ff651d81427d094_640x640.jpg',
1,
9.2,
'mild',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BIGGER HOP *',
'The granddaddy of our Hop line of beers, this Imperial IPA is for all you hop heads out there. Coming in at a robust 8.6%, we recommend sharing it with a GOOD FRIEND.',
'https://untappd.akamaized.net/photos/2022_04_09/a773ae9e00827dbf716e6ade845ed074_640x640.jpg',
1,
8.6,
'light',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FINEVIEW*',
'Mexican Chocolate Stout',
'https://untappd.akamaized.net/photos/2022_03_26/0ae1f8aad06ef14e28527433a482133c_640x640.jpg',
1,
9.1,
'dark',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('HAZELWOOD *',
'Scotch barrel-aged scotch ale',
'https://untappd.akamaized.net/photos/2022_04_09/25bc8fa6ac6b3b4d1e839ea118e1c0af_640x640.jpg',
1,
8.5,
'dark',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SNOW MELT *',
'A rich malty, deep ruby-red, lightly spiced (and I mean REALLY lightly) winter ale, best used for frost removal, holiday toasting, and guaranteed to clear the fog off your glasses. Released with the first snowflakes of the year,and lasting until it all melts in March...or April. Hopefully.',
'https://untappd.akamaized.net/photos/2022_04_09/3f3ac8b442acb372e7cf128dba6997ab_640x640.jpg',
1,
7,
'mild',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SQUIRREL HILL NORTH',
'A nice malty beer with a great finish',
'https://untappd.akamaized.net/photos/2022_04_09/a11ff43ccff9fd31039468bb05f89aae_640x640.jpg',
1,
5.7,
'mild',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BIG HOP',
'Centennial and Cascade hops make this a truly American Ale, brewed to be hoppy but not especially bitter, balanced with a solid Munich Malt backbone. Our flagship, and by far, our most popular beer. Cans, draft.',
'https://untappd.akamaized.net/photos/2022_04_12/00da9f6654e08534e836fef32526c9e2_640x640.jpg',
1,
5.8,
'mild',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('WHEAT HOP',
'This juicy, tropical-fruit-hop-loaded beer is just BURSTING with notes of peach, fresh melon, citrus, and passion fruit. And at a very "sessionable" 4.5%, you can really spend some quality time with it and not get hurt.',
'https://untappd.akamaized.net/photos/2022_04_02/fc57e97c29ddbc675e431418aaaea9d6_640x640.jpg',
1,
4.5,
'light',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('East End Witte',
'A "Belgian White" wheat beer, gently spiced with coriander and bitter orange peel. Light bodied with hints of orange and lemon. A great beer to have in hand as Spring arrives in Pittsburgh, which can take a while.',
'https://untappd.akamaized.net/photos/2022_04_09/1e00ef75efc94cc96271e1f575ce1e9e_640x640.jpg',
1,
5.2,
'light',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('NITRO STEEL CUT',
'his beer does not lack in hop or oat character. Lighter in alcohol, we hope you can enjoy more than one over some good conversation and not lose your place. Pairs nicely with cheese, meat, and chocolate. Cheers!',
'https://untappd.akamaized.net/photos/2022_03_20/a09010183a7cd8b1e6178e274900b57f_640x640.jpg',
1,
6.2,
'dark',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('ALONG CAME A CIDER',
'Brewed from 100% PA Apple Juice, various sources, depending on availability and desire.',
'https://untappd.akamaized.net/photos/2022_02_27/505fd7389cadffa7f9e97eb51640f53d_640x640.jpg',
1,
6.5,
'sour',
1,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('SHADYSIDE *',
'Imperial Brown Ale with Coffee',
'https://untappd.akamaized.net/photos/2022_04_09/af979a3ec6710846494e0292008bf85a_640x640.jpg',
1,
7,
'mild',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('EVERYDAY PILSNER',
'Crisp, refreshing, and perfect for everyday',
'https://untappd.akamaized.net/photos/2022_04_10/736cef8f683082713be7e38e76819fb6_640x640.jpg',
1,
4.4,
'light',
0,
5);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hefe Weizen',
'This fresh local hefeweizen carries a distinct banana ester profile, and crisp finish. No bananas were harmed or peeled in the brewing of this beer. Its just a little side benefit that our German yeast strain gives us.',
'https://untappd.akamaized.net/photos/2022_04_12/356373117546663d752749334d7edcd0_640x640.jpg',
1,
6.2,
'light',
0,
5);

--Voodoo Brewing Co.

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('good vibes',
'good vibes is the totally righteous IPA Curt has been dreaming of making for years. Hopped five times in the kettle & double dry hopped to produce bodacious dank fruit notes, we use gnarly amounts of Galaxy, Amarillo, Mosaic & Apollo in this West Coast-Style IPA. I made this beer on my time, you can drink it on your time, but really, shouldnt it be our time?',
'https://untappd.akamaized.net/photos/2022_04_14/f3c2e8272db9f72bd35035a59e613a06_640x640.jpg',
1,
7.3,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('HOODOO',
'Forged in the bowels of the Meadville bayou, this IPA ushers your soul down a twisted journey on the 7 Cs. This Voodoo brew will insight your dark side and open a portal to your hoppier senses. The 7 Cs alchemic concoction of 7 different hop varieties starting with the letter "C" conjures your taste buds into a piney-citrus paradise fit for a Hoodoo doctor. Youll love the spell this beer casts on you from the first sip',
'https://untappd.akamaized.net/photos/2022_04_10/7edee00483c7ee5d54699e9966e52b0f_640x640.jpg',
1,
7.3,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('VOODOO LOVE CHILD',
'Voodoo Love Child is our Gran Met aged on passion fruit, cherries, and raspberries. This ale is inspired by fun, flavor, and a passion for brewing.',
'https://untappd.akamaized.net/photos/2022_04_14/66c3470d3a2d9fc278adc424c2bd2001_640x640.jpg',
1,
9.2,
'sour',
1,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('WHITE MAGICK OF THE SUN',
'White Magick of the Sun is our Voodoo-ized version of a classic Belgian White Ale. This spiced wheat ale is fermented with our proprietary Belgian yeast, then conditioned on coriander, juniper berries, orange peel and a unique peppercorn blend, resulting in a spice-forward interpretation of a time-honored classic.',
'https://untappd.akamaized.net/photos/2022_04_12/0284a079b085e05e42c34da8a5c5f575_640x640.jpg',
1,
7.3,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('WYNONAS BIG BROWN ALE',
'Wynona�s Big Brown Ale is our big American Brown Ale. Generous amounts of Brown Malt coupled with our house ale yeast result in a robust and smooth ale with just enough bitterness to balance it out with a malty-rich backbone with notes of coffee, chocolate, and toffee.',
'https://untappd.akamaized.net/photos/2022_04_09/57c10c559c3e3e2bfb5bb4183c6eb35c_640x640.jpg',
1,
7.5,
'mild',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BACKPACK SALMON',
'Double NEIPA hopped with AU Vic Secret and Galaxy',
'https://untappd.akamaized.net/photos/2022_03_20/22cda37049ccef4647f008b46f454126_640x640.jpg',
1,
8,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BEACH GEAR',
'Blonde Ale brewed with Apricots',
'https://untappd.akamaized.net/photos/2022_04_10/ba2ec6fbf8e8dfa0455054b550d8b25b_640x640.jpg',
1,
5.6,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BIG BLACK VOODOO DADDY',
'The name says it all. BBVD is our big bad seasonal stout made with copious amounts of chocolate and roasted malts and topped off with the right amount of hops to make it taste like a chocolate bar au natural. Good to drink now or age it to award winning caliber.',
'https://untappd.akamaized.net/photos/2022_04_12/4f095c075e5c6963656c0fd2b6f751b5_640x640.jpg',
1,
12,
'dark',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BIG SECRET PIZZA PARTY',
'Brewed in admiration of one of Curts favorite beers with a nod to one of his favorite movies, Big Secret Pizza Party is a Golden Rye IPA brewed with Mosaic and Apollo with Rye from one of his favorite European Maltsters.',
'https://untappd.akamaized.net/photos/2022_04_07/21be8638ede760ca6b9a35b6d401171a_640x640.jpg',
1,
7.9,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('CALVES LIKES DIAMONDS',
'Calves Like Diamonds is a 9% Imperial IPA more West Coast in nature but brewed with a dash of Crystal malt for a touch of sweetness to balance the alcohol. We rounded this out with a huge dry hop of Australian Galaxy and US Citra and Sultana (formerly Denali) for huge notes of overripe pineapple, citrus, and tropical passion fruit.',
'https://untappd.akamaized.net/photos/2022_03_05/ae6f7d363e51b066da4d7d86e8bd0157_640x640.jpg',
1,
9,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('COWBELL',
'Our double chocolate oatmeal imperial milk stout delivers rich flavors of chocolate and roasty malt. With a big body and velvety chocolate goodness this beer will fulfill your prescription for �more cowbell�',
'https://untappd.akamaized.net/photos/2022_04_13/c816a442ece90b692b3afd9caf3d18ae_640x640.jpg',
1,
8.5,
'dark',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('EMPTY CALORIES',
'American Light Lager',
'https://untappd.akamaized.net/photos/2022_04_08/74e7bf9e5cec811acaba5de42723fd25_640x640.jpg',
1,
4.7,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FASHION KILLA',
'NEIPA dry hopped at over 5lb/bbl with YCH�s proprietary Cryo POP blend, Sultana and our hand-selected Mosaic',
'https://untappd.akamaized.net/photos/2022_04_07/3e363f00f39379b93aa18277683329b6_640x640.jpg',
1,
7.2,
'light',
0,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('GOLDEN SOUR',
'Golden Sour is our bright, crisp and tart golden ale. Brewed with wheat and spelt, this sessionable ale has notes of stone fruit, citrus and red apple with a pleasing underlying level of acidity.',
'https://untappd.akamaized.net/photos/2022_04_05/453a03902c45357e16af6ffa81798818_640x640.jpg',
1,
5.3,
'sour',
1,
4);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('HAZY AFTERNOON',
'Hazy Afternoon is our New England Style Pale Ale brewed with lavish amounts of Denali, El Dorado, Azacca and our hand selected Citra and Mosaic Hops. Rich in citrus and tropical fruit notes, this beer was designed to be bright, hoppy and sessionable. So, sit back, relax, and spend the rest of this Hazy Afternoon with us.',
'https://untappd.akamaized.net/photos/2022_04_10/e7d6e97880489d5b2e9fa64937b450f2_640x640.jpg',
1,
5.5,
'light',
0,
4);


--Necromancer Brewing

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Kill Switch',
'Kill the power. The flavor is coming from inside the can! A whiff of this lights-out brew packs a wallop of sticky, west-coast style hoppy goodness, but its deep amber hue alerts you to take notice. This is no everyday IPA. Earthy, fruity Simcoe and tropical, floral Amarillo are spiced up with a distinctive rye kick before caramel malts arrive to round the whole thing out.',
'https://untappd.akamaized.net/photos/2021_12_18/91dc72b16e9bd143b32f13afe476f09f_640x640.jpg',
1,
6.7,
'mild',
0,
3);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Capsized',
'This collaboration with New Jersey�s Ship Bottom Brewery begins with our crushable, lemony Grisette and ends with a pile of hibiscus flowers walking the plan into the tank. The addition provides subtle tartness with notes of berry, a tea-like herbal quality, and a brilliant color that�ll shiver all of your timbers. Whatever that means.',
'https://necromancer.beer/wp-content/uploads/2022/04/caspizedweb.png',
1,
4.5,
'mild',
0,
3);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Rag and Bone',
'Just the name suggests, however, the British Golden is pale in color, which is relatively unique from mainstream English beers. The resulting malt bill is kept light with flavors of fresh bread and a touch of biscuit, while putting the emphasis on a zippy hop quality.',
'https://untappd.akamaized.net/photos/2022_04_09/5f42ff899dc147bbff6c3fc72ff10bdb_640x640.jpg',
1,
4.5,
'light',
0,
3);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Valkyrie',
'A roasty, malty foundation, rich in notes of chocolate, burnt caramel, and smooth sweetness, meets robust locally-roasted coffee from our friends at Press House. It�s the perfect companion to whatever is fresh-made today.',
'https://untappd.akamaized.net/photos/2022_04_09/be57aa635f5220d0f2eb239b7fb31cb8_640x640.jpg',
1,
8.4,
'dark',
0,
3);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Keres',
'We brewed this one with Valkyrie�s beloved and delicious strawberry doughnuts in mind, but don�t be bashful with discovering your own favorite pairing. A quick dip into the underworld is a small price to pay to find the perfect match.',
'https://untappd.akamaized.net/photos/2022_04_08/0e17ed84ae6420708feec28a27ab3ff0_640x640.jpg',
1,
5.8,
'sour',
1,
3);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Pacific Gravity',
'Get amped up for some gnarly waves of hoppy goodness, as we paddle out to IPA�s other coast. The haze reigns these days, but this foam leads to a groundswell of complex balance that can only be found by boldly riding the bitter side of hops.',
'https://untappd.akamaized.net/photos/2022_04_09/1124d37d0352a798206daf386ea2b8bb_640x640.jpg',
1,
6.8,
'light',
0,
3);

--Fat Head's Saloon

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('HEAD HUNTER IPA',
'Head Hunter is an award-winning, aggressively dry-hopped, West Coast-Style IPA with a huge hop display of pine, grapefruit, citrus and pineapple. A punch-you-in-the-mouth brew for those who truly love their hops!',
'https://untappd.akamaized.net/photos/2022_04_13/983a4a37e1fe794903976596f21874b6_640x640.jpg',
1,
7.5,
'light',
0,
2);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Bumbleberry Honey Blueberry Ale',
'rewed with fresh harvested spring honey, stolen from some very angry bees (we have the welts to prove it) and infused with our own special painstakingly, handpicked blueberry essence. A light refreshing ale with a nice blueberry aroma, crackery malt flavors with a hint of sweetness and a light tart blueberry finish. "Most Refreshing Beer in America" 1st Place',
'https://untappd.akamaized.net/photos/2022_04_14/aedbfc26ababaf7acf5d9da5de48f73a_640x640.jpg',
1,
5.3,
'light',
0,
2);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Sunshine Daydream',
'Award-Winning Session IPA with big hop aromas, flavors of citrus, peach, orange and tropical fruit with a nice light malt backbone. This is a very drinkable session ale. (Our fans call it an obsession.) Peace, Love & Hoppiness!',
'https://untappd.akamaized.net/photos/2022_04_13/275ab3901fa76d0e6812dc3d34db7176_640x640.jpg',
1,
4.9,
'light',
0,
2);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Goggle Fogger',
'When this brew first came out of the tanks our brewer took a sip. Then downed some more. He put on his glasses, tilted his head and said "Damn, thats a Goggle Fogger!" The "Hefe" prefix means "with yeast" which gives this unfiltered wheat beer a somewhat cloudy or "foggy" appearance. Light aromas of wheat, bubblegum, clove and spice.',
'https://untappd.akamaized.net/photos/2022_04_13/3425cc4ef22c9563a62982cd4620615b_640x640.jpg',
1,
5.4,
'light',
0,
2);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Groovy Juice',
'Juicy. Hoppy. Groovy. Our hazy IPA gets your groove on the move and satisfies your haze craze for dayz. Light in color, with a luscious, soft body. Enormous juicy and tropical notes of passion fruit, melon and mango from Mosaic, Citra and Azzacca hops excite the palette to make this a dangerously drinkable Hazy IPA. Turn on, tune out, and sip the sky.',
'https://untappd.akamaized.net/photos/2022_04_13/fcb90c2f94c872f6684a595d00346522_640x640.jpg',
1,
7.1,
'light',
0,
2);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Fresh Hop Freddy',
'Juicy tropical notes of guava, passionfruit, pineapple, and melon are blended with bright citrus notes of lime, and grapefruit. The Fresh Frozen hops create a pretty spectacular hop flavor and aroma in this year-round fresh AF IPA.',
'https://untappd.akamaized.net/photos/2022_04_14/65d9a69825bb93e80e50911c27ddc74c_640x640.jpg',
1,
6,
'light',
1,
2);

--BrewDog Pittsburgh

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Cosmic Raspberry',
'This sour ale is fermented with wild yeast strains brettanomyces and Cher Ami, our house mixed culture, and refermented with raspberries followed by ageing in ex-Sangiovese red wine barrels sourced from Emilia Romagna in Northern Italy. Swathes of rich and juicy raspberry, delicately balanced amidst Brett funk, tartness and tannin, giving a subtle juicy fruit character from the barrels lingering vinous wood character and echoes of sweet Beaujolais',
'https://untappd.akamaized.net/photos/2022_04_10/ca966f537c2e6a6a82af3428393aaa27_640x640.jpg',
1,
4.5,
'sour',
1,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hazy Jane Alcohol Free',
'No alcohol just got juiced up. And Hazy Jane Alcohol Free lives up to the hype. All the attitude, all the flavour but none of the alcohol. Say hello to the juiciest alcohol free beer in town. Tropical fruits and grassy notes mix it up. Oats and wheat unite for a smoother ride. Full flavour, no alcohol, all out New England.',
'https://untappd.akamaized.net/photos/2022_04_12/b3bacb1768af634e260e827b4f9bad05_640x640.jpg',
1,
0.5,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Cold Beer',
'Cold Beer is everything you want in a summer beer; cold & crushable. This crisp golden is lightly hopped & malted ale is balanced on the palate with a crisp, clean finish. Sitting at an ABV of 4.7%, this easy-drinker is the perfect companion for a backyard barbecue, poolside sipping, and more.',
'https://untappd.akamaized.net/photos/2022_04_11/76844834dba826b1e8bc859f47b49e90_640x640.jpg',
1,
4.7,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Rojo Beero',
'Red Ale - American Amber / Red',
'https://untappd.akamaized.net/photos/2022_04_12/f445bd16bdebf8e280215bb80cd8f765_640x640.jpg',
1,
5.6,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('New Mexico Pale Ale',
'Pale Ale - American',
'https://untappd.akamaized.net/photos/2022_04_08/11940d006541f929ac451a9dfd684935_640x640.jpg',
1,
6.6,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('False Start',
'Hazy IPA with huge notes of pineapple and crazy hops from start to finish. Floral nose with a resinous bite, this is one brew you don�t want to miss',
'https://untappd.akamaized.net/photos/2022_04_10/e6f1ba3ad752c4be75e712a018c40839_640x640.jpg',
1,
6,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Lost Lager',
'Our new recipe Lost is here. This planet first German-style Pilsner is a 4.5% lager brewed using wind power, a third less water, and would-be waste bread in the malt bill. The addition of Select, Spalter and Saphir hops combine vibrant citrus and herbal notes for an iconic lager taste thats both crisp and refreshing.',
'https://untappd.akamaized.net/photos/2022_04_14/4bb8f18903c3145266ebeb820903b061_640x640.jpg',
1,
4.5,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Doghaus Irish Red',
'A slightly sweet and toast my traditional Irish style ale.',
'https://untappd.akamaized.net/photos/2022_04_02/82fd4c0cdb765fbe42ffc805c3f524b4_640x640.jpg',
1,
5.5,
'mild',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('I Would Walk 804.6Km',
'Just be the man that walks 1609.2 Kilometers and then you can fall down at our door',
'https://untappd.akamaized.net/photos/2022_04_09/2c48135f2331df05d003ccc75b947fc6_640x640.jpg',
1,
4.2,
'mild',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hazy Jane',
'The lower strength version of Hazy Jane which is now called Hazy O-G.',
'https://untappd.akamaized.net/photos/2022_04_14/87009474aeb03871257b31d565dd686a_640x640.jpg',
1,
5,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Elvis Juice',
'An American IPA with a bitter edge that will push your citrus tolerance to the brink and back; Elvis Juice is loaded with tart pithy grapefruit peel. This IPA has a caramel malt base, supporting a full frontal citrus overload - grapefruit peel piled on top of intense U.S. aroma hops. Waves of crashing pine, orange and grapefruit round out this citrus infused IPA.',
'https://untappd.akamaized.net/photos/2022_04_14/64f5968597cdb57926a61cdfd5e4b57d_640x640.jpg',
1,
6.5,
'mild',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Forest Hopper',
'Take a hop around the forest with this one.',
'https://untappd.akamaized.net/photos/2022_04_03/043d00c5511d84789b52830b2c2153f0_640x640.jpg',
1,
7.2,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Scruffator',
'A hearty traditional German style. The inspiration comes from a Hand from above.',
'https://untappd.akamaized.net/photos/2022_04_09/5d81f63bc0ec37747f1aa129f34c32d3_640x640.jpg',
1,
7,
'mild',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Punk IPA ',
'Punk IPA is the beer that kick-started it. This light, golden classic has been subverted with new world hops to create an explosion of flavour. Bursts of caramel and tropical fruit with an all-out riot of grapefruit, pineapple and lychee, precede a spiky bitter finish. This is the beer that started it all - and it�s not done yet...',
'https://untappd.akamaized.net/photos/2022_04_14/89f2d8245a7eac51e6085bff6cac3f6b_640x640.jpg',
1,
5.2,
'light',
0,
1);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Space Plans',
'Hopped with Galaxy and Comet on a malty backbone with an assertive bite. Outta this world.',
'https://untappd.akamaized.net/photos/2022_03_24/2a78aea3a72afd4e7bffc27440d081a8_640x640.jpg',
1,
8.2,
'light',
0,
1);

--brewGentlemen

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('GENERAL BRADDOCKS',
'Soft & balanced American IPA. A beer you can always come back to.',
'https://untappd.akamaized.net/photos/2022_04_13/78461bd66127ee8ae7ca8305008be1ef_640x640.jpg',
1,
6.8,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('DEEP BREAKFAST',
'Made with lactose sugar and Deeper Roots Losantiville Blend coffee. Reminds of us fudge brownies, espresso shots, and walking into class with �coffee� in your mug.',
'https://untappd.akamaized.net/photos/2022_04_09/c5ca69d1beaf7e829480337beb8cfcea_640x640.jpg',
1,
4.2,
'dark',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MUCHOS MAHALOS',
'American ale made with passionfruit, orange, and guava.',
'https://untappd.akamaized.net/photos/2022_04_10/f0a15fe0307f1c0e3575a50453d6f76a_640x640.jpg',
1,
5.2,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MOMO',
'AN AMERICAN IPA MADE WITH MOSAIC HOPS',
'https://untappd.akamaized.net/photos/2022_04_14/5ff59ccbec2e93831e0a764dce592c4c_640x640.jpg',
1,
5.8,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('MAMMOTH',
'A DOUBLE IPA MADE WITH A BLEND OF AMERICAN HOPS',
'https://untappd.akamaized.net/photos/2022_04_09/14684ee431fcbf8254202ddda054f41b_640x640.jpg',
1,
8.5,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('ALBATROSS',
'Our springtime double IPA, featuring nearly four pounds of Galaxy hops per barrel and prominent tropical flavors of pineapple and passionfruit.',
'https://untappd.akamaized.net/photos/2022_04_14/5c9aaf85728f8c2955601d09bf36a959_640x640.jpg',
1,
8,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('DOUBLE WEAPONS',
'A Double IPA made with Citra & Mosaic hops.',
'https://untappd.akamaized.net/photos/2022_04_10/e6419192a950a60a775ec591705dd988_640x640.jpg',
1,
8,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FOSHOMO',
'A DOUBLE IPA MADE WITH MOSAIC HOPS ',
'https://untappd.akamaized.net/photos/2022_04_12/8cec33634c85b436c0117b450c6e98d9_640x640.jpg',
1,
8.2,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('FINAL COLOSSUS',
'Final Colossus, an annually-released double IPA, returns once again, showcasing our favorite ingredients and practices of the year. Final Colossus 2022 is made with four types of New Zealand hops - Nelson Sauvin, Motueka, Rakau, and Wai-Iti - for a pronounced, fruit-forward flavor palette of white wine, apricot, lemon, lime, and peach.',
'https://untappd.akamaized.net/photos/2022_04_13/37f899490ba5c9e0d8542fe94b623fe9_640x640.jpg',
1,
8.2,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BG ALTBIER',
'Limited batch that the BG team loves.',
'https://untappd.akamaized.net/photos/2022_04_13/108053ad372bdfac6794516c21a3434d_640x640.jpg',
1,
5,
'mild',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BG CZECH DARK LAGER',
'Clean maltiness with notes of warm nuttiness, dark fruit, and chocolate.',
'https://untappd.akamaized.net/photos/2022_04_08/80b535a646530536e640c839e3283c98_640x640.jpg',
1,
5.5,
'dark',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BG HOPPY PILS',
'A dry-hopped Pilsner. Crisp, refreshing, slight and approachable hoppiness!',
'https://untappd.akamaized.net/photos/2022_04_01/60bd5ac06ba9c50c349c7114936a1f86_640x640.jpg',
1,
5.6,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('BLOOD LIGHT LIME',
'A citrus IPA made with fresh blood orange and lime juice and zest',
'https://untappd.akamaized.net/photos/2022_04_13/69ff77a9ed5a2d32a2c496bb36907e06_640x640.jpg',
1,
6,
'light',
0,
19);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Prototype 11',
'An IPA made with Neomexicanus hops',
'https://untappd.akamaized.net/photos/2022_04_10/ebff3d978c32abdad86d8855f24217fd_640x640.jpg',
1,
7.1,
'light',
0,
19);

--hofbrauhaus

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hofbr�u Original',
'Hofbr�uhaus is a symbol of Munich�s hospitality and the Bavarian gift for creating a snug and cosy atmosphere. Beer-lovers from all over the world come here to enjoy its famous beers. More than any other, Hofbr�u Original embodies the special atmosphere of the beer-making capital of Munich, and exports it to the four corners of the globe. Its refreshing, bitter flavour and alcoholic content of around 5.1% volume have made it famous worldwide. A Munich beer with character.',
'https://untappd.akamaized.net/photos/2022_04_14/8261323007ab525089a120e7bc454515_640x640.jpg',
1,
5.1,
'light',
0,
20);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hofbr�u Dunkel / Dunkel Gold',
'Dark beer existed in Bavaria long before light beer. This was the first type of beer to be brewed at Hofbr�uhaus when it was founded. Today, when beer-lovers all over the world talk about dark beer, they usually mean a Munich style beer. Today, Hofbr�u Dunkel - the archetypal Bavarian beer - is still as popular as ever. With its alcoholic content of around 5.5% volume and its spicy taste, it�s a refreshing beer that suits all kinds of occasions. A beer in the traditional Munich style!',
'https://untappd.akamaized.net/photos/2022_04_14/ba2a86c00a861ee60688b08203a96be8_640x640.jpg',
1,
5.5,
'dark',
0,
20);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('M�nchner Weisse',
'Once upon a time, Weissbier could only be brewed by ducal privilege. Hofbr�uhaus enjoyed this exclusive right for nearly 200 years, thus holding a monopoly on Weissbier in Bavaria. But even without a monopoly, M�nchner Weisse is a really special kind of beer. What could be more pleasurable than quenching your thirst with a deliciously yeasty Weissbier, and savouring the tingling, fizzy sensation in your mouth? With an alcoholic content of around 5,1% volume, its pure, refreshing enjoyment.',
'https://untappd.akamaized.net/photos/2022_04_13/1204ba6a6c5b7bd25b022ddf203c7b95_640x640.jpg',
1,
5.1,
'light',
0,
20);

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF, brewery_id)
VALUES('Hofbr�u Hopfen Spezial',
'An Amber Pale Lager with a slightly higher alcohol level and a rich amount of hops.',
'https://untappd.akamaized.net/photos/2022_04_12/f464cbb969d0cf0b1ad784a0af3efac3_640x640.jpg',
1,
5.8,
'mild',
0,
20);

SELECT *
FROM beers