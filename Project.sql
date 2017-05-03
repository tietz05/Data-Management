-- James Tietz
-- Final Project
-- April 20, 2017

DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Sponsors;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Helmet;
DROP TABLE IF EXISTS ShoulderPads;
DROP TABLE IF EXISTS ElbowPads;
DROP TABLE IF EXISTS Skates;
DROP TABLE IF EXISTS Girdle;
DROP TABLE IF EXISTS ShinGuards;
DROP TABLE IF EXISTS Gloves;
DROP TABLE IF EXISTS Stick;
DROP TABLE IF EXISTS Jocks;


--- Player ---
CREATE TABLE NHLplayer (
  Player_id text Not null,
  First_Name text,
  Last_Name text,
  Height numeric,
  Weight numeric,
  Team text,
  Brand text,
  Equipment text,
  PRIMARY KEY (Player_id)
  );

--- Brands ---
CREATE TABLE Brands (
  BrandName text not null,
  Bauer text,
  Easton text,
  CCM text,
  Player_id text not null references NHLplayer(Player_id),
  PRIMARY KEY (BrandName) 
);

--- Teams ---
Create Table Teams (
  TeamName text not null,
  Player_id text not null references NHLplayer(Player_id),
  primary key (TeamName)
); 

--- The Equipment that the Player has --- 
--- Helmet ---
Create table Helmet (
  Helmet_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(Helmet_id)
);

--- Shoulder Pads ---
Create table ShoulderPads (
  shoulderPad_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(shoulderPad_id)
);

--- Elbow Pads ---
Create table ElbowPads (
   elbowPad_id text not null,
   BrandName text not null references Brands(BrandName),
   Player_id text not null references NHLplayer(Player_id),
  primary key(elbowPad_id)
);

--- Skates ---
Create table Skates (
  Skate_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(Skate_id)
);

--- Girlde/ Pants ---
Create table Girdle (
  Girdle_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(Girdle_id)
);

--- Shin Guards ---
Create table ShinGuards (
  shinGuard_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(shinGuard_id)
);

--- Gloves ---
Create table Gloves (
  Glove_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(Glove_id)
);

--- Stick ---
Create table Stick (
  Stick_id char not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(Stick_id)
);

--- Jocks ---
Create table Jocks (
  Jock_id text not null,
  BrandName text not null references Brands(BrandName),
  Player_id text not null references NHLplayer(Player_id),
  primary key(Jock_id)
);

--- Equiment ---
create table Equipment (
  Equipment_id text not null,
  Player_id text not null references NHLplayer(Player_id),
  Helmet_id text not null references Helmet(Helmet_id),
  shoulderPad_id text not null references ShoulderPads(shoulderPad_id),
  elbowPad_id text not null references ElbowPads(elbowPad_id),
  Skate_id text not null references Skates(Skate_id),
  Girdle_id text not null references Girdle(Girdle_id),
  shinGuard_id text not null references ShinGuards(shinGuard_id),
  Glove_id text not null references Gloves(Glove_id),
  Stick_id text not null references Stick(Stick_id),
  Jock_id text not null references Jocks(Jock_id),
  primary key (Equipment_id)
);


--- Players ---
insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p01', 'Mats', 'Zuccarello', 67, 179, 'New York Rangers', 'Bauer');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p02', 'Derick', 'Brassard', 73, 202, 'Ottawa Senators', 'Bauer');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p03', 'Alex', 'Ovechkin', 75, 239, 'Washington Capitols', 'CCM');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p04', 'Sidney', 'Crosby', 71, 200, 'Pittsburgh Penguins', 'CCM');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p05', 'P.K.', 'Subban', 72, 210, 'Nashville Predators', 'CCM');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p06', 'Alex', 'Pietrangelo', 75, 205, 'St. Louis Blues', 'Easton');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p07', 'Ryan', 'Getzlaf', 76, 221, 'Anaheim Ducks', 'Bauer');

insert into NHLPlayer(Player_id, First_Name, Last_Name, Height, Weight, Team, Brand)
  values('p08', 'Connor', 'McDavid', 74, 200, 'Edmonton Oilers', 'Easton');
  
--- Brands ---

insert into Brands(Bauer)
 values('RE-AKT 200', 'RE-AKT 75', 'IMS 11.0 Custom', 'S190', 'S170', 'S150', 'S170', 'Supreme 1S', 'S190',
        'Supreme 1S', 'Nexus N9000', 'Nexus N8000', 'Supreme 1S', 'Vapor 1X', 'S190', 'Supreme 1S', 'Vapor 1X', 'Nexus 1N',
        'Vapor 1X', 'Nexus 1N', 'Supreme 1S', 'Vapor 1X', 'Vapor X900', 'Nexus 1N', 'Nexus N9000', 
        'Premium Lockjock', 'Elite', 'NG Premium');
        
insert into Brands(Easton)
 values('E200', 'E600', 'E700', 'RG', 'Pro 10', 'Stealth C9.0', 'RG', 'C5.0', 'Stealth CX', 'Stealth 85S', 'Mako M7', 'Mako II',
        'S190', 'Stealth 9.0', 'Pro 10', 'Synergy HSX', 'Stealth C9.0', 'Stealth 7.0', 'Pro 10', 'Stealth C7.0', 'Synergy 80',
        'Synergy GX', 'V9', 'Synergy HTX', 'Motion Board');
        
insert into Brands(CCM)
 values('Fitlite 3DS', 'Resistance', 'RES 300', 'Tacks 5092', 'Super Tacks', 'Tacks 7092', 'Tacks 3092', 'Tacks 7092', 'Super Tacks',
        'Super Tacks', 'Jetspeed FT1', 'Ultra Tacks', 'Super Tacks', 'Tacks 7092', 'Quicklite 290', 'Super Tacks', 'Quicklite', 'Ultra Tacks',
        'Quicklite 290', 'Super Tacks', 'Ultra Tacks', 'RBZ Revolution', 'Ribcor Trigger ASY', 'Super Tack', 'Pro Cut', 'Compression'); 

--- Brand Equipment ---

insert into Helmet(Bauer)
  values('RE-AKT 200', 'RE-AKT 75', 'IMS 11.0 Custom');

insert into Helmet(Easton)
  values('E200', 'E600', 'E700');

insert into Helmet(CCM)
  values('Fitlite 3DS', 'Resistance', 'RES 300');

insert into ShoulderPads(Bauer)
  values('S190', 'S170', 'S150');

insert into ShoulderPads(Easton)
  values('RG', 'Pro 10', 'Stealth C9.0');

insert into ShoulderPads(CCM)
  values('Tacks 5092', 'Super Tacks', 'Tacks 7092');

insert into ElbowPads(Bauer)
  values('S170', 'Supreme 1S', 'S190');

insert into ElbowPads(Easton)
  values('RG', 'C5.0', 'Stealth CX');

insert into ElbowPads(CCM)
  values('Tacks 3092', 'Tacks 7092', 'Super Tacks');

insert into Skates(Bauer)
  values('Supreme 1S', 'Nexus N9000', 'Nexus N8000');

insert into Skates(Easton)
  values('Stealth 85S', 'Mako M7', 'Mako II');

insert into Skates(CCM)
  values('Super Tacks', 'Jetspeed FT1', 'Ultra Tacks');

insert into Girdle(Bauer)
  values('Supreme 1S', 'Vapor 1X', 'S190');

insert into Girdle(Easton)
  values('S190', 'Stealth 9.0', 'Pro 10');

insert into Girdle(CCM)
  values('Super Tacks', 'Tacks 7092', 'Quicklite 290');

insert into ShinGuards(Bauer)
  values('Supreme 1S', 'Vapor 1X', 'Nexus 1N');

insert into ShinGuards(Easton)
  values('Synergy HSX', 'Stealth C9.0', 'Stealth 7.0');

insert into ShinGuards(CCM)
  values('Super Tacks', 'Quicklite', 'Ultra Tacks');

insert into Gloves(Bauer)
  values('Vapor 1X', 'Nexus 1N', 'Supreme 1S');

insert into Gloves(Easton)
  values('Pro 10', 'Stealth C7.0', 'Synergy 80');

insert into Gloves(CCM)
  values('Quicklite 290', 'Super Tacks', 'Ultra Tacks');

insert into Stick(Bauer)
  values('Vapor 1X', 'Vapor X900', 'Nexus 1N', 'Nexus N9000');

insert into Stick(Easton)
  values('Synergy GX', 'V9', 'Synergy HTX');

insert into Stick(CCM)
  values('RBZ Revolution', 'Ribcor Trigger ASY', 'Super Tack');

insert into Jocks(Bauer)
  values ('Premium Lockjock', 'Elite', 'NG Premium');

insert into Jocks(Easton)
  values ('Motion Board');

insert into Jocks(CCM)
  values ('Pro Cut', 'Compression');













