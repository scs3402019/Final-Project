/*
-- CS 340 SPRING 2019 --
-- Final project SQL Table setups --
-- Group:                         -- 
-- Arin Reinsch                   --
-- Justin Vaughn                  --
-- Anthony Plant                  --
-- Modified 5/23                  --
*/


-- Make sure that null values are not allowed for important fields
-- Create All Tables for the music database.  --
CREATE TABLE Artist (
    Name  VARCHAR(64),
    Street VARCHAR(64) NULL,
    City VARCHAR(64),
    State VARCHAR(16),
    Genre VARCHAR(16)
    PRIMARY KEY (NAME)
);

CREATE TABLE Users (
    Username VARCHAR(64) NOT NULL,
    Fname VARCHAR(64) NOT NULL,
    Password VARCHAR(128) NOT NULL
    PRIMARY KEY (Username)
    FOREIGN KEY (Username) REFERENCES User_Friend(Username)
);

CREATE TABLE Alblum (
      Cover VARBINARY(MAX),
      Writer VARCHAR(64),
      Release_Date DATE,
      Name VARCHAR(64) NOT NULL 
      PRIMARY KEY (Name)
      FOREIGN KEY (Writer) REFERENCES Artist(Name)
);

CREATE TABLE Song (
    Title VARCHAR(64) NOT NULL,
    Length VARCHAR(16),
    Release_Date DATE,
    Performer VARCHAR(64) 
    FOREIGN KEY (Performer) REFERENCES Alblum(Writer)
);

CREATE TABLE PlayList (
    Playlist_name VARCHAR(64),
    Arist VARCHAR(64),
    Alblum VARCHAR(64),
    Title VARCHAR(64)
    UNIQUE (Playlist_name)
    FOREIGN KEY (Artist, Alblum,Title) REFERENCES Alblum(Writer, Name, Tilte)
);

CREATE TABLE User_Friend (
    Username VARCHAR(64),
    FriendName VARCHAR(64)
    PRIMARY KEY (Username) 
);

-- Insert Values into Users Table                --

INSERT INTO Users (Username, Fname, Password)
VALUES("Zerodashzero", "Bob","Password");
INSERT INTO Users (Username, Fname, Password)
VALUES("loialest", "Jimmothy","1234");
INSERT INTO Users (Username, Fname, Password)
VALUES("atlas884", "Sara","SuperSecretKey");
INSERT INTO Users (Username, Fname, Password)
VALUES("few_lor", "Karol","asdf32345sd*7");
INSERT INTO Users (Username, Fname, Password)
VALUES("Minithra", "Tony","CheeseIsGood");
INSERT INTO Users (Username, Fname, Password)
VALUES("lowko", "Tim","PleaseDontHackMe");
INSERT INTO Users (Username, Fname, Password)
VALUES("Swordie100", "Nancy","SQLBeCool");
INSERT INTO Users (Username, Fname, Password)
VALUES("gaurav104", "Neil","LetmeInnnnn");
INSERT INTO Users (Username, Fname, Password)
VALUES("bookershune", "Bella","Dodge:5:");
INSERT INTO Users (Username, Fname, Password)
VALUES("v3rononx", "Zach","RayIsaCuteDoge");

-- Insert Values into User_Friends Table        --

INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");
INSERT INTO User_Friend (Username, FriendName)
VALUES(" "," ");

-- Insert Values into Playsist                  -- 


-- Insert Values into the Alblum Table.         --

INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('DC Talk', 11/21/1995 , 'Jesus Freak');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Skillet', 01/24/2017, 'Unleashed');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Lifehouse', 03/22/2005, 'Who We Are');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Eagele Eye Cherry', 08/16/2008, 'Desireless');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Matchbox 20', 11/19/2002, 'More Than You Think You Are');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Nena', 04/08/1984, '99 Luftballons');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Thousand Foot Krutch', 06/17/2016, 'Exhale');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Counting Crows', 07/05/2004, 'Shre 2(soundtrack)');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Goo Goo Dolls', 04/07/1998, 'City of Angels');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Garth Brooks', 09/02/1991, 'Ropin the Wind');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('P.O.D', 09/11/2001, 'Satellite');

INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Eminem', 08/31/2018, 'Kamikazie');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Logic', 05/01/2019, 'Confessions of A Dangerous Mind');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Tyler The Creator', 03/21/0000, 'OKRA');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Ces Cru', 10/30/2015, 'Catestrophic Event Specilaists');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('MGK', 10/05/2012, 'Lace Up');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Jedi Mind Tricks', 12/22/2011, 'Violence Begets Violence');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Tech N9ne', 00/00/0000, 'Something Else');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Odd Future', 03/20/2012, 'The OF Tape Vol 2');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Pusha T', 10/07/2013, 'Spotify Sessions');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Mac Lethal', 09/06/2016, 'Congratulations');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Jarren Benton', 10/03/2014, 'Skitzo - Single');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('Logic?', 05/05/2015, 'My Movie');

INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');

-- Testing Image storage here, may need some php to access --
INSERT INTO Alblum (Writer, Release_Date, Name, Cover)
VALUES ('', 00/00/0000, '', (SELECT * FROM OPENROWSET(BULK N'%CD%\AlblumCovers\<albname>', SINGLE_BLOB)));


-- Insert values into Artist                     --

INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('DC Talk',NULL,'Lynchburg','Virgina','Christian Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Skillet',NULL,'Memphis','Tennessee','Chirstina Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Lifehouse',NULL,'Los Angeles','California','Alternative Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Eagel Eye Cherry',NULL,'Sockholm','Sweden','Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Matchbox 20',NULL,'Orlando','Florida','Alternative Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Barenaked Ladies',NULL,'Ontaria','Canada','Alternative Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Nena',NULL,'West Berlin','Germany','Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Thousand Foot Krutch',NULL,'Ontario','Canada','Christian Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Counting Crows',NULL,'Berkeley','California','Alternative Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Goo Goo Dolls',NULL,'Buffalo','New York','Alternative Rock');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Garth Brooks',NULL,'Tusla','Oklahoma','Country');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('P.O.D',NULL,'San Diego','California','Christian Metal');




INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Logic',NULL,'Beverly Hills','California','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Eminem',NULL,'Clinton Township','Michigan','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Tyler the Creator',NULL,'Ladera Heights','California','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Ces Cru',NULL,'Kansas City','Missouri','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('MGK',NULL,'Houston','Texas','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Jedi Mind Tricks',NULL,'Philadelphia','Pennsylvania','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Tech N9ne',NULL,'Kasas City','Missouri','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Odd Future',NULL,'Los Angeles','California','Alternative Hip Hop');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Push T',NULL,'New York City','New York','Hip Hop');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Mac Lethal',NULL,'Kansas City','Missouri','Rap');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Jarren Benton',NULL,'Decatur','Georgia','Hip Hop');
INSERT INTO Artist (Name, Street, City, State, Genre)
VALUES ('Logic?',NULL,NULL,NULL,'Hip Hop');

-- Insert values into Song                       --

INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('DC Talk', 'Jesus Freak', '4:50', 11/21/1995);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Skillet', 'Resistance', '3:08', 08/05/2016);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Lifehouse', 'Clocks', '4:24', 11/20/2007);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Eagel Eye Cherry', 'Save Tonght', '3:11', 10/06/1997);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Matchbox 20', 'Unwell', '3:48', 10/26/2009);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Barenaked Ladies', 'Pinch Me', '3:49', 10/26/2009);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Nena', '99 Luftballons', '3:49', 07/29/2006);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Thousand Foot Krutch', 'Running With Giants', '4:09', 02/25/2016);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Counting Crows', 'Accidentally in Love', '3:08', 10/13/2010);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Goo Goo Dolls', 'Iris', '3:36', 02/26/2010);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('Garth Brooks', 'Against the Grain', '2:23', 06/16/2016);
INSERT INTO Song (Tilte, Performer, Length, Release_Date)
VALUES ('P.O.D', 'Alive', '3:39', 02/13/2011);

INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Fall','Eminem','4:22', 08/31/2018);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Homicide','Logic','4:05',05/01/2019);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('OKRA','Tyler the Creator','2:31',03/21/2018);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Recession Proof','Ces Cru','4:06',10/30/2015);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Edge of Destruction','MGK','5:07',10/05/2012);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Design in Malilce','Jedi Mind Tricks','3:56',12/22/2011);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('So Dope','Tech N9ne','4:26',07/25/2013);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Oldie','Odd Future','10:38',03/20/2012);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Sweet Serenade','Pusha T','3:59',10/07/2013);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Angel of Death','Mac Lethal','3:09',09/06/2016);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Skitzo','Jarren Benton','3:38',10/03/2014);
INSERT INTO Song (Performer, Name, Length, Release_Date)
VALUES ('Hello World','Logic?','4:14',05/05/2015);
