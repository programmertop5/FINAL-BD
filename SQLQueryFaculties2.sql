CREATE TABLE Faculties(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Dean] NVARCHAR(MAX) NOT NULL
        CHECK(Dean <> ''),
    [Name] NVARCHAR(100) NOT NULL UNIQUE
        CHECK(Name <> '')
)
