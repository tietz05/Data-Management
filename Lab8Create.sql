Create Table Actor
(
    Pid character(4) NOT NULL references People(Pid),
    HairColor text,
    EyeColor text,
    FavoriteColor text,
    Height integer,
    Weight integer,
    Birthday date,
    ActorAnniversaryDate date,
    Primary Key (Pid)
);

Create Table Director
(
    Pid character(4) NOT NULL references People(Pid),
    FilmSchool text,
    FavoriteLensMaker text,
    DirectorAnniversaryDate date,
    Primary Key (Pid)
);

Create Table Movie
(
    Mid Character(4) NOT NULL,
    Name text,
    Year integer,
    MPAA integer,
    DomesticSales integer,
    ForeignSales integer,
    DiscSales integer,
    Primary Key (Mid)
);

Create Table Spouse
(
    Pid character(4) NOT NULL references People(Pid),
    partner text,
    Primary Key (Pid)
);

Create Table Positions
(
    Pid character(4) NOT NULL references People(Pid),
    Mid character(4) NOT NULL references Movie(Mid),
    Positions text,
    Primary Key (Mid, Pid)
);

Create Table public.Address
(
    Address integer NOT NULL,
    City text,
    State text,
    Zip text,
    Primary Key (Address)
);

Create Table public.People
(
    Pid character(4) NOT NULL,
    name text,
    address text,
    Address integer references Address(Address),
    Primary Key (Pid)
);