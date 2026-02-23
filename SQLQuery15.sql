CREATE TABLE Groups (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name NVARCHAR(10) NOT NULL UNIQUE, 
    CHECK (Name <> ''),
    Year INT NOT NULL,
    CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
