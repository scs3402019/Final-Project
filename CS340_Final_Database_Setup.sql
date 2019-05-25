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
    Name  VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(15),
    Genre VARCHAR(15)
    PRIMARY KEY (NAME)
);

CREATE TABLE Users (
    Username VARCHAR(64) NOT NULL,
    Password VARCHAR(128) NOT NULL,
    F_Username VARCHAR(64) NOT NULL  
    PRIMARY KEY (Username)
    FOREIGN KEY (F_Username) REFERENCES User_Friend(Username)
);

CREATE TABLE Alblum (
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
    Friend VARCHAR(64)
    PRIMARY KEY (Username)
    FOREIGN KEY (Username) REFERENCES Users(Username) 
);

-- Insert Values into the Alblum Table.         --

INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 11/21/1995 , 'Jesus Freak');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');
INSERT INTO Alblum (Writer, Release_Date, Name)
VALUES ('', 00/00/0000, '');


-- Insert values into Artist                     --

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
VALUES ('Nena', '99 Luftballoons', '3:49', 07/29/2006);
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
VALUES ('So Dope','Tehc N9ne','4:26',07/25/2013);
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