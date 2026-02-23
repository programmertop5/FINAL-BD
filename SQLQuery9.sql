CREATE TABLE Faculties (
    Id INT NOT NULL PRIMARY KEY IDENTITY ,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    CHECK (Name <> '')
);

CREATE TABLE Departments (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Building INT NOT NULL,
    CHECK (Building BETWEEN 1 AND 5),
    Financing MONEY NOT NULL DEFAULT 0,
    CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    CHECK (Name <> ''),
    FacultyId INT NOT NULL,
    FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
);

CREATE TABLE Groups (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name NVARCHAR(10) NOT NULL UNIQUE,
    CHECK (Name <> ''),
    Year INT NOT NULL,
    CHECK (Year BETWEEN 1 AND 5),
    DepartmentId INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

CREATE TABLE Curators (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    CHECK (Name <> ''),
    Surname NVARCHAR(MAX) NOT NULL,
    CHECK (Surname <> '')
);

CREATE TABLE Students (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    CHECK (Name <> ''),
    Rating INT NOT NULL,
    CHECK (Rating BETWEEN 0 AND 5),
    Surname NVARCHAR(MAX) NOT NULL,
    CHECK (Surname <> '')
);

CREATE TABLE Subjects (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    CHECK (Name <> '')
);

CREATE TABLE Teachers (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    IsProfessor BIT NOT NULL DEFAULT 0,
    Name NVARCHAR(MAX) NOT NULL,
    CHECK (Name <> ''),
    Salary MONEY NOT NULL,
    CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL,
    CHECK (Surname <> '')
);

CREATE TABLE Lectures (
    Id INT NOT NULL PRIMARY KEY IDENTITY ,
    Date DATE NOT NULL,
    CHECK (Date <= GETDATE()),
    SubjectId INT NOT NULL,
    TeacherId INT NOT NULL,
    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
    FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
);

CREATE TABLE GroupsCurators (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    CuratorId INT NOT NULL,
    GroupId INT NOT NULL,
    FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

CREATE TABLE GroupsLectures (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    GroupId INT NOT NULL,
    LectureId INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
);

CREATE TABLE GroupsStudents (
    Id INT NOT NULL PRIMARY KEY IDENTITY,
    GroupId INT NOT NULL,
    StudentId INT NOT NULL,
    FOREIGN KEY (GroupId) REFERENCES Groups(Id),
    FOREIGN KEY (StudentId) REFERENCES Students(Id)
);
