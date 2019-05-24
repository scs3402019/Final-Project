/*
-- CS 340 SPRING 2019 --
-- Final project SQL Table setups --
-- Group:                         -- 
-- Arin Reinsch                   --
-- Justin Vaughn                  --
-- Anthony Plant                  --
-- Modified 5/23                  --
*/

CREATE TABLE Artist (
    Name VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(15),
    Genre VARCHAR(15),
    UNIQUE (Name)
);

CREATE TABLE Users (
    Username VARCHAR(64),
    Password VARCHAR(128),
    Username VARCHAR(64)
    UNIQUE (Username)
    FOREIGN KEY (Username) REFERENCES User_Friend(Username)
);

CREATE TABLE Alblum (
      Writer VARCHAR(64),
      Release_Date DATE,
      Name VARCHAR(64)
      UNIQUE (Name)
      FOREIGN KEY (Writer) REFERENCES Artist(Name)
);

CREATE TABLE Song (
    Title VARCHAR(64),
    Length INT,
    Release_Date DATE,
    Performer VARCHAR(64), 
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
    UNIQUE (Username)
    FOREIGN KEY (Username) REFERENCES Users(Username) 
);