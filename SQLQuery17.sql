CREATE TABLE Department (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Financing MONEY NOT NULL DEFAULT 0, 
    CHECK(Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE, 
    CHECK(Name <> ''),
    FacultyId INT NOT NULL,
    FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);
