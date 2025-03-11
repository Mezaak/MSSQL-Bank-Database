
USE [Bank]
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bank] SET QUERY_STORE = ON
GO
ALTER DATABASE [Bank] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AccountTypeId] [int] NOT NULL,
	[Balance] [money] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account Type]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account Type](
	[AccountTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AccountTypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Account Type] PRIMARY KEY CLUSTERED 
(
	[AccountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[BranchAdress] [nvarchar](50) NOT NULL,
	[BranchPhone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CardType] [nvarchar](50) NOT NULL,
	[ExpressionDate] [date] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card Transaction]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card Transaction](
	[CardTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[TransactionType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CardId] [int] NOT NULL,
 CONSTRAINT [PK_Card Transaction] PRIMARY KEY CLUSTERED 
(
	[CardTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[BranchId] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Salary] [nvarchar](50) NOT NULL,
	[BranchId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[FeeId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[FeeType] [nvarchar](50) NOT NULL,
	[FeeAmount] [nvarchar](50) NOT NULL,
	[FeeDate] [date] NOT NULL,
 CONSTRAINT [PK_Fees] PRIMARY KEY CLUSTERED 
(
	[FeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[LoanId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[LoanAmount] [money] NOT NULL,
	[LoanType] [nvarchar](50) NOT NULL,
	[InterestRate] [int] NOT NULL,
	[LoanStartDate] [date] NOT NULL,
	[LoanEndDate] [date] NOT NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[LoanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 26.02.2025 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[TransactionType] [nvarchar](50) NOT NULL,
	[Amount] [money] NOT NULL,
	[TransactionDate] [date] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [CustomerId], [AccountTypeId], [Balance], [Status]) VALUES (1, 1, 1, 500.0000, N'Ödendi')
INSERT [dbo].[Account] ([AccountId], [CustomerId], [AccountTypeId], [Balance], [Status]) VALUES (2, 2, 2, 100000.0000, N'Ödenmedi')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Account Type] ON 

INSERT [dbo].[Account Type] ([AccountTypeId], [AccountTypeName], [Description]) VALUES (1, N'Vadeli', N'Faizsiz')
INSERT [dbo].[Account Type] ([AccountTypeId], [AccountTypeName], [Description]) VALUES (2, N'Vadesiz', N'Faizli')
INSERT [dbo].[Account Type] ([AccountTypeId], [AccountTypeName], [Description]) VALUES (3, N'Birikim', N'Faizli')
SET IDENTITY_INSERT [dbo].[Account Type] OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAdress], [BranchPhone]) VALUES (1, N'Garanti', N'Avcılar', N'0212 647 75 98')
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAdress], [BranchPhone]) VALUES (2, N'Akbank', N'Küçükçekmece', N'0212 734 09 06')
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardId], [CustomerId], [CardType], [ExpressionDate], [Status]) VALUES (4, 1, N'Banka', CAST(N'2027-05-05' AS Date), N'Güncel')
INSERT [dbo].[Card] ([CardId], [CustomerId], [CardType], [ExpressionDate], [Status]) VALUES (5, 2, N'Kredi', CAST(N'2028-06-06' AS Date), N'İptal')
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
SET IDENTITY_INSERT [dbo].[Card Transaction] ON 

INSERT [dbo].[Card Transaction] ([CardTransactionId], [AccountId], [Amount], [TransactionDate], [TransactionType], [Description], [CardId]) VALUES (5, 1, 5000.0000, CAST(N'2025-02-02' AS Date), N'Havale', N'kira ödemesi', 4)
INSERT [dbo].[Card Transaction] ([CardTransactionId], [AccountId], [Amount], [TransactionDate], [TransactionType], [Description], [CardId]) VALUES (6, 2, 10000.0000, CAST(N'2026-03-03' AS Date), N'eft', N'borç ödemesi', 5)
SET IDENTITY_INSERT [dbo].[Card Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Email], [Phone], [Adress], [BranchId]) VALUES (1, N'Deniz', N'Bitmez', N'den@gmail.com', N'056445434', N'Avcılar', 1)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Email], [Phone], [Adress], [BranchId]) VALUES (2, N'Yağmur', N'Yavuzer', N'yag@gmail.com', N'06749580384', N'Sefaköy', 2)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Email], [Phone], [Adress], [BranchId]) VALUES (4, N'Mehmet', N'Akkus', N'mehmet@', N'054624214', N'Şirinevler', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Position], [Salary], [BranchId]) VALUES (1, N'Boran', N'Akkaya', N'Yönetici', N'50000', 1)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Position], [Salary], [BranchId]) VALUES (2, N'Yağmur', N'Yavuzer', N'Baş Müdür', N'70000', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Fees] ON 

INSERT [dbo].[Fees] ([FeeId], [AccountId], [FeeType], [FeeAmount], [FeeDate]) VALUES (1, 1, N'Vergi', N'500.00', CAST(N'2024-02-26' AS Date))
INSERT [dbo].[Fees] ([FeeId], [AccountId], [FeeType], [FeeAmount], [FeeDate]) VALUES (2, 2, N'Vergi Ücreti', N'1000', CAST(N'2025-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Fees] OFF
GO
SET IDENTITY_INSERT [dbo].[Loans] ON 

INSERT [dbo].[Loans] ([LoanId], [CustomerId], [LoanAmount], [LoanType], [InterestRate], [LoanStartDate], [LoanEndDate]) VALUES (1, 1, 50.0000, N'üretim kredisi', 3, CAST(N'1997-01-01' AS Date), CAST(N'1997-06-06' AS Date))
INSERT [dbo].[Loans] ([LoanId], [CustomerId], [LoanAmount], [LoanType], [InterestRate], [LoanStartDate], [LoanEndDate]) VALUES (3, 2, 500.0000, N'yatırım kredisi', 4, CAST(N'2000-03-03' AS Date), CAST(N'2003-04-04' AS Date))
SET IDENTITY_INSERT [dbo].[Loans] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionId], [AccountId], [TransactionType], [Amount], [TransactionDate], [Description]) VALUES (1, 1, N'Havale', 500.0000, CAST(N'2025-03-03' AS Date), N'Gerçekleşti')
INSERT [dbo].[Transactions] ([TransactionId], [AccountId], [TransactionType], [Amount], [TransactionDate], [Description]) VALUES (2, 2, N'EFT', 100000.0000, CAST(N'2025-04-04' AS Date), N'Onaylanmadı')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account Type] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[Account Type] ([AccountTypeId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account Type]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_Customer]
GO
ALTER TABLE [dbo].[Card Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Card Transaction_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Card Transaction] CHECK CONSTRAINT [FK_Card Transaction_Account]
GO
ALTER TABLE [dbo].[Card Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Card Transaction_Card] FOREIGN KEY([CardId])
REFERENCES [dbo].[Card] ([CardId])
GO
ALTER TABLE [dbo].[Card Transaction] CHECK CONSTRAINT [FK_Card Transaction_Card]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Branches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Branches]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Branches] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Branches]
GO
ALTER TABLE [dbo].[Fees]  WITH CHECK ADD  CONSTRAINT [FK_Fees_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Fees] CHECK CONSTRAINT [FK_Fees_Account]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Customer]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Account1] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Account1]
GO
/****** Object:  StoredProcedure [dbo].[ElemanEkle]    Script Date: 26.02.2025 00:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ElemanEkle]
(
@Ad nvarchar(50),
@Soyad nvarchar(50),
@Pozisyon nvarchar(50),
@Maas int,
@SubeNo int
)
as
begin
insert Employees values(@Ad,@Soyad,@Pozisyon,@Maas,@SubeNo)
end
GO
/****** Object:  StoredProcedure [dbo].[ElemanSil]    Script Date: 26.02.2025 00:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ElemanSil]
(
@Ad nvarchar(50),
@Soyad nvarchar(50),
@Pozisyon nvarchar(50),
@Maas int,
@SubeNo int
)
as
BEGIN
    DELETE FROM Employees 
    WHERE FirstName = @Ad 
      AND LastName = @Soyad
      AND Position = @Pozisyon
      AND Salary = @Maas
      AND BranchId = @SubeNo;
END
GO
/****** Object:  StoredProcedure [dbo].[KesintiUcreti]    Script Date: 26.02.2025 00:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KesintiUcreti]
(
@HesapId int,
@KesintiTipi nvarchar(50),
@Tutar money,
@KesintiTarihi date
)
as
begin
Update Fees
SET 
        FeeType = @KesintiTipi,
        FeeAmount = @Tutar,
        FeeDate = @KesintiTarihi
    WHERE AccountId = @HesapId
end
GO
/****** Object:  StoredProcedure [dbo].[MusteriEkle]    Script Date: 26.02.2025 00:14:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriEkle]
(
@Ad nvarchar(50),
@Soyad nvarchar(50),
@Mail nvarchar(50),
@Telefon nvarchar(50),
@Adres nvarchar(50),
@SubeNo int
)
as
begin
insert Customer values(@Ad,@Soyad,@Mail,@Telefon,@Adres,@SubeNo)
end
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
