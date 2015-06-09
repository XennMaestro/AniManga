#Drop Table Comment_Write_Contain;
Drop Table Subtopic_Create_Subtopic_Have;
#Drop Table Created_Forum_Forum;
#Drop Table Voice;
#Drop Table Favored;
#Drop Table c_In_a;
#Drop Table Manga;
#Drop Table my_Character;
#Drop Table Voice_Actor;
#Drop Table Member;
#Drop Table Admin;
#Drop Table Anime;


CREATE TABLE Anime
(
Title   char(100),
Genre  char(255),
Rating  int,
Season  int,
a_Status  char(100),
Start_date  char(100),
Studio  char(100),
num_of_episodes  int,
Description  varchar(10000),
Primary key (Title, Season)
);

CREATE TABLE Manga
(Title   char(100),
Genre  char(200),
Rating   int,
Published_date char(100),
Volume  int,
Author   char (100),
Description  char(100),
Primary key (Title, Author)
);

CREATE TABLE Voice_Actor 
( Vname  char (100),
Birthday  char(100),
Gender  char(10),
Bio  varchar(10000),
Primary key (Birthday, Vname));

CREATE TABLE my_Character 
(Cname char(100),
 Description varchar(10000),
 Rating int,
Primary key (Cname));

CREATE TABLE Admin
(Email char (100),
r_Name char (100),
Admin_name char(100), 
a_Password char(20),
Primary key (Email));

CREATE TABLE Member
(Email char (100),
r_Name char (100),
Username  char (100), 
Password  char (20),
Primary key (Email));

#Tables for Relationship
CREATE TABLE Created_Forum_Forum
( 
Forum_ID int not null, 
Email char(100),
fName char (100),
Date_created char (100),
Primary key (Forum_ID),
Foreign key (Email) REFERENCES Admin(Email)
);

CREATE TABLE Favored
(Title char (100),
 Email char (100),
Primary key (Title, Email),
Foreign key (Email) REFERENCES Admin(Email),
Foreign key (Email) REFERENCES Member(Email),
Foreign key (Title) REFERENCES Anime(Title), 
Foreign key (Title) REFERENCES Manga(Title)
);


CREATE TABLE c_In_a
(Cname char(100),
Title char(100),
Primary key (Cname, Title),
Foreign key (Cname) REFERENCES my_Character(Cname),
Foreign key (Title) REFERENCES Anime(Title), 
Foreign key (Title) REFERENCES Manga(Title)
);

CREATE TABLE Voice
(Title char(100),
 Season int,
Birthday char(100), 
Vname char(100),
Cname char(100),
Primary key (Title,Season,Birthday,Vname,Cname),
Foreign key (Title,Season) REFERENCES Anime(Title,Season),
Foreign key (Birthday,Vname) REFERENCES Voice_Actor(Birthday,Vname),
Foreign key (Cname) REFERENCES my_Character(Cname)
);

CREATE TABLE Subtopic_Create_Subtopic_Have
(
Forum_ID int not null,
Date_created char (100),
Title char(100),
Email char(100),
Primary key (Title, Forum_ID),
Foreign key (Forum_ID) REFERENCES Created_Forum_Forum(Forum_ID) on delete cascade on update cascade,
Foreign key (Email) REFERENCES Admin(Email),
Foreign key (Email) REFERENCES Member(Email)
) ENGINE=InnoDB;




CREATE TABLE Comment_Write_Contain
( 
Forum_ID int, 
Title char (100),
Msg varchar (100),
Date_written char (100),
Email char (100),
Primary key (Forum_ID, Title, Msg, Date_written),
Foreign key (Title, Forum_ID) REFERENCES Subtopic_Create_Subtopic_Have(Title, Forum_ID) on delete cascade on update cascade,
Foreign key (Email) REFERENCES Admin(Email), 
Foreign key (Email) REFERENCES Member(Email)
);