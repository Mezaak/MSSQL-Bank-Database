
CREATE TABLE [dbo].[Account](
	[AccountId] INT IDENTITY(1,1) NOT NULL,
	[CustomerId] INT NOT NULL,
	[AccountTypeId] INT NOT NULL,
	[Balance] MONEY NOT NULL,
	[Status] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([AccountId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AccountType](
	[AccountTypeId] INT IDENTITY(1,1) NOT NULL,
	[AccountTypeName] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED ([AccountTypeId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Branches](
	[BranchId] INT IDENTITY(1,1) NOT NULL,
	[BranchName] NVARCHAR(50) NOT NULL,
	[BranchAddress] NVARCHAR(50) NOT NULL,
	[BranchPhone] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED ([BranchId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Card](
	[CardId] INT IDENTITY(1,1) NOT NULL,
	[CustomerId] INT NOT NULL,
	[CardType] NVARCHAR(50) NOT NULL,
	[ExpirationDate] DATE NOT NULL,
	[Status] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED ([CardId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CardTransaction](
	[CardTransactionId] INT IDENTITY(1,1) NOT NULL,
	[AccountId] INT NOT NULL,
	[Amount] MONEY NOT NULL,
	[TransactionDate] DATE NOT NULL,
	[TransactionType] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	[CardId] INT NOT NULL,
	CONSTRAINT [PK_CardTransaction] PRIMARY KEY CLUSTERED ([CardTransactionId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Customer](
	[CustomerId] INT IDENTITY(1,1) NOT NULL,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[Email] NVARCHAR(50) NOT NULL,
	[Phone] NVARCHAR(50) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[BranchId] INT NOT NULL,
	CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Employees](
	[EmployeeId] INT IDENTITY(1,1) NOT NULL,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[Position] NVARCHAR(50) NOT NULL,
	[Salary] NVARCHAR(50) NOT NULL,
	[BranchId] INT NOT NULL,
	CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Fees](
	[FeeId] INT IDENTITY(1,1) NOT NULL,
	[AccountId] INT NOT NULL,
	[FeeType] NVARCHAR(50) NOT NULL,
	[FeeAmount] NVARCHAR(50) NOT NULL,
	[FeeDate] DATE NOT NULL,
	CONSTRAINT [PK_Fees] PRIMARY KEY CLUSTERED ([FeeId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Loans](
	[LoanId] INT IDENTITY(1,1) NOT NULL,
	[CustomerId] INT NOT NULL,
	[LoanAmount] MONEY NOT NULL,
	[LoanType] NVARCHAR(50) NOT NULL,
	[InterestRate] INT NOT NULL,
	[LoanStartDate] DATE NOT NULL,
	[LoanEndDate] DATE NOT NULL,
	CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED ([LoanId] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Transactions](
	[TransactionId] INT IDENTITY(1,1) NOT NULL,
	[AccountId] INT NOT NULL,
	[TransactionType] NVARCHAR(50) NOT NULL,
	[Amount] MONEY NOT NULL,
	[TransactionDate] DATE NOT NULL,
	[Description] NVARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED ([TransactionId] ASC)
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Account] ([CustomerId], [AccountTypeId], [Balance], [Status]) 
VALUES (1, 1, 500.00, N'Paid'), 
       (2, 2, 100000.00, N'Unpaid');
       
INSERT INTO [dbo].[AccountType] ([AccountTypeName], [Description]) 
VALUES (N'Vadeli', N'Interest-free'), 
       (N'Vadesiz', N'Interest-bearing'),
       (N'Birikim', N'Interest-bearing');

INSERT INTO [dbo].[Branches] ([BranchName], [BranchAddress], [BranchPhone]) 
VALUES (N'Garanti', N'Avcılar', N'0212 647 75 98'),
       (N'Akbank', N'Küçükçekmece', N'0212 734 09 06');

INSERT INTO [dbo].[Card] ([CustomerId], [CardType], [ExpirationDate], [Status]) 
VALUES (1, N'Banka', CAST(N'2027-05-05' AS DATE), N'Active'),
       (2, N'Kredi', CAST(N'2028-06-06' AS DATE), N'Cancelled');

INSERT INTO [dbo].[CardTransaction] ([AccountId], [Amount], [TransactionDate], [TransactionType], [Description], [CardId]) 
VALUES (1, 5000.00, CAST(N'2025-02-02' AS DATE), N'Transfer', N'Rent payment', 4),
       (2, 10000.00, CAST(N'2026-03-03' AS DATE), N'EFT', N'Debt payment', 5);

INSERT INTO [dbo].[Customer] ([FirstName], [LastName], [Email], [Phone], [Address], [BranchId]) 
VALUES (N'Deniz', N'Bitmez', N'den@gmail.com', N'056445434', N'Avcılar', 1),
       (N'Yağmur', N'Yavuzer', N'yag@gmail.com', N'06749580384', N'Sefaköy', 2),
       (N'Mehmet', N'Akkus', N'mehmet@', N'054624214', N'Şirinevler', 1);

INSERT INTO [dbo].[Employees] ([FirstName], [LastName], [Position], [Salary], [BranchId]) 
VALUES (N'Boran', N'Akkaya', N'Manager', N'50000', 1),
       (N'Yağmur', N'Yavuzer', N'Branch Head', N'70000', 2);

INSERT INTO [dbo].[Fees] ([AccountId], [FeeType], [FeeAmount], [FeeDate]) 
VALUES (1, N'Tax', N'500.00', CAST(N'2024-02-26' AS DATE)),
       (2, N'Tax Fee', N'1000', CAST(N'2025-01-01' AS DATE));

INSERT INTO [dbo].[Loans] ([CustomerId], [LoanAmount], [LoanType], [InterestRate], [LoanStartDate], [LoanEndDate]) 
VALUES (1, 50.00, N'Production loan', 3, CAST(N'1997-01-01' AS DATE), CAST(N'1997-06-06' AS DATE)),
       (2, 500.00, N'Investment loan', 4, CAST(N'2000-03-03' AS DATE), CAST(N'2003-04-04' AS DATE));

INSERT INTO [dbo].[Transactions] ([AccountId], [TransactionType], [Amount], [TransactionDate], [Description]) 
VALUES (1, N'Transfer', 500.00, CAST(N'2025-03-03' AS DATE), N'Completed'),
       (2, N'EFT', 100000.00, CAST(N'2025-04-04' AS DATE), N'Pending');
GO
