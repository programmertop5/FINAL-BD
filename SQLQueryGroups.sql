CREATE TABLE Groups(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(10) NOT NULL UNIQUE
        CHECK(Name <> ''),
    [Rating] INT NOT NULL
        CHECK(Rating >= 0 AND Rating <= 5),
    [Year] INT NOT NULL
        CHECK(Year >= 1 AND Year <= 5)
)
