CREATE TABLE [dbo].[Customers]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] TEXT NOT NULL, 
    [Phone] TEXT
);

CREATE TABLE [dbo].[Parcels]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Title] TEXT NOT NULL, 
    [Weight] FLOAT NOT NULL
);

CREATE TABLE [dbo].[Orders]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [CustomerId] INT NOT NULL, 
    [ParcelId] INT NOT NULL,
	FOREIGN KEY ([CustomerId]) REFERENCES [Customers]([Id]),
	FOREIGN KEY ([ParcelId]) REFERENCES [Parcels]([Id])


);
