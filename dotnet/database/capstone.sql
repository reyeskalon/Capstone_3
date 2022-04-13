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
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');


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
 'Our founders James Watt and Martin Dickie decide they are fed up of the stuffy UK beer market… so, aged just 24, do something about it. Thanks to some very scary bank loans, the guys start making their own hardcore craft beers in Fraserburgh, a town in northeast Scotland. They brew tiny batches, fill bottles by hand, sell their first beers at local markets out of a beaten-up old van… and BrewDog is born.',
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
'In 2021, Ben Butler and Aaron Easler plan to raise the dead. They opened  Necromancer Brewing Co. at 2257 Babcock Blvd. in Ross Township to resurrect forgotten beer styles. They won’t be summoning spirits, just historical knowledge and brewing know-how. When the 14,400-square-foot space, a former USA Baby and Spirit Halloween store with 36 parking spaces, debuts on March 1, it will be a pickup site for 16-ounce cans in four-packs and cases. Necromancer also will handle retail accounts for local bars and restaurants and will deliver beer to doorsteps within a 25-mile radius. There will be several core offerings, including a New England IPA, a Belgian witbier and a grisette, plus 15 other specialty beers in rotation. They’ve already released Square Dancing, a collaboration beer with Sharpsburg’s Dancing Gnome.',
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
'“Every piece of wood or drip of paint tells a story,” says Dave Kushner, co-founder of Trace Brewing. “There’s even a set list written on the wall. They made industrial products here and later it served as a community space. We’re combining those two elements.” Guests will not only be able to see and smell the 10-barrel brewing system, they can chat with Head Brewer Brandon McCarthy while he works to churn out more beer.
“We’re more like a small-batch brewery,” McCarthy says. “If you like beer at all there will be at least one thing that is on your wavelength.”',
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
'In the days before industry invaded its boundaries or paved roads curled through its neighborhoods, when Pittsburgh was in its youth, there was a farm called “Good Liquor” outside of the city. Owned by Alexander Hill, part of the farm was located within the existing Lawrenceville border. Later on, in 1814, William B. Foster purchased a 133-acre tract of land outside of Pittsburgh along the Allegheny River. In that same year, he would sell 30 acres of that property to the Federal Government. While Allegheny Arsenal was being built to provide supplies to the warring Union Troops during the civil war, Foster was starting to establish a community called Lawrenceville. The picturesque area was named for Captain James Lawrence who gained fame in the war with Britain. He was captain of the Chesapeake and his famous saying “Don’t give up the ship!” was incorporated in the borough seal of Lawrenceville.',
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
' opened in September of 2017 in the Lawrenceville neighborhood of Pittsburgh. Located in an old gas grill/gas light showroom, they operate a 20bbl brewhouse producing a wide variety of beer. From lagers to IPA’s, stouts, and sours, there is something for everyone. Owners Keana and Matt McMahon also work hard to integrate the community as well as many local charity events.',
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
'https://images.squarespace-cdn.com/content/v1/581b7f8f5016e11e7853bdb8/1621882414394-09CSLC50LHDWXFGVDMK0/DSC_0748.jpg?format=1500w',
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
'Brewery Did Not Supply Image',
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
'Strange Roots Experimental Ales is the evolution of Draai Laag Brewing Company, which was dedicated solely to spontaneously fermented sour and wild beer. The name change reflects the brewery’s diversification and creative expansion into a wider range of beer styles, while remaining committed to locally foraged and sourced ingredients and unique brews created from scratch. Their focus on terroir yields unique vintages in many of their beers, tied to a specific time, place, and the passionate people who bring their mission to life.',
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
'https://images.squarespace-cdn.com/content/v1/581b7f8f5016e11e7853bdb8/1621882414394-09CSLC50LHDWXFGVDMK0/DSC_0748.jpg?format=1500w',
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
GO




--Populate Beers

--Spring Hill Brewing

INSERT INTO beers (name, description, image, is_avaliable, abv, category, GF,  brewery_id)
VALUES ('Sunrise',
'Fluffy and light ale. Brewed with lots of wheat and rye. Spiced with coriander, chamomile, and a smidgen of caraway. Saison + wit yeasts. Notes of rye bread, clove, and ripe yellow fruits',
'No image provided',
1,
3.2,
'dark',
0,
10);

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
'This ale’s chestnut hue is punctuated with a fluffy white head. Nutty, malty, full bodied, and silky smooth with hints of caramel and coffee.',
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

SELECT *
FROM beers