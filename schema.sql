CREATE TABLE Users (UserId SERIAL PRIMARY KEY, Username varchar(32) UNIQUE, Password varchar);
CREATE TABLE Match (MatchId SERIAL PRIMARY KEY, Matchsize integer, User_id integer, FOREIGN KEY (User_id) REFERENCES Users(UserId));
CREATE TABLE Army (ArmyId SERIAL PRIMARY KEY, Armyname varchar(64), Armysize integer);
CREATE TABLE Unit (UnitId SERIAL PRIMARY KEY, Unitname varchar(64), Points integer);

CREATE TABLE MatchArmy (Match_id integer, Army_id integer, 
                        FOREIGN KEY (Match_id) REFERENCES Match(MatchId),
                        FOREIGN KEY (Army_id) REFERENCES Army(ArmyId));
CREATE TABLE ArmyUnit (Army_id integer, Unit_id integer,
                        FOREIGN KEY (Army_id) REFERENCES Army(ArmyId),
                        FOREIGN KEY (Unit_id) REFERENCES Unit(UnitId));