
CREATE TABLE Directories (
  Id NVARCHAR(5000) NOT NULL,
  parent_Id NVARCHAR(5000),
  sequence INTEGER,
  type NVARCHAR(5000),
  description NVARCHAR(5000),
  PRIMARY KEY(Id)
);
