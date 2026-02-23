CREATE TABLE Teachers (
    Id INT NOT NULL  PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL, 
    CHECK (Name <> ''),
    Surname NVARCHAR(MAX) NOT NULL, 
    CHECK (Surname <> ''),
    Salary MONEY NOT NULL, 
    CHECK (Salary > 0)
);
