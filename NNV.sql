USE [master]
GO
/****** Object:  Database [NNV]    Script Date: 30-Aug-18 10:49:18 ******/
CREATE DATABASE [NNV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NNV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NNV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NNV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NNV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NNV] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NNV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NNV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NNV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NNV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NNV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NNV] SET ARITHABORT OFF 
GO
ALTER DATABASE [NNV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NNV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NNV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NNV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NNV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NNV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NNV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NNV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NNV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NNV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NNV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NNV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NNV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NNV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NNV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NNV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NNV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NNV] SET RECOVERY FULL 
GO
ALTER DATABASE [NNV] SET  MULTI_USER 
GO
ALTER DATABASE [NNV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NNV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NNV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NNV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NNV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NNV', N'ON'
GO
ALTER DATABASE [NNV] SET QUERY_STORE = OFF
GO
USE [NNV]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NNV]
GO
/****** Object:  Table [dbo].[Clanovi]    Script Date: 30-Aug-18 10:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clanovi](
	[ClanID] [int] IDENTITY(1,1) NOT NULL,
	[Ime_Prezime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[KorisnickoIme] [nvarchar](30) NOT NULL,
	[Status] [bit] NOT NULL,
	[Sifra] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Clanovi] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prilozi]    Script Date: 30-Aug-18 10:49:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prilozi](
	[SednicaID] [int] NOT NULL,
	[PrilogID] [int] NOT NULL,
	[DukumentID] [int] NOT NULL,
	[Poslato] [bit] NULL,
	[DatumSlanja] [date] NULL,
	[PrilogPutanja] [nvarchar](50) NULL,
	[NazivPriloga] [nchar](10) NULL,
 CONSTRAINT [PK_Prilozi_1] PRIMARY KEY CLUSTERED 
(
	[PrilogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisustvo]    Script Date: 30-Aug-18 10:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisustvo](
	[ClanID] [int] NOT NULL,
	[SednicaID] [int] NOT NULL,
	[Prisutan] [bit] NOT NULL,
	[Opravdano] [bit] NULL,
 CONSTRAINT [PK_Prisustvo] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC,
	[SednicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sednice]    Script Date: 30-Aug-18 10:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sednice](
	[SednicaID] [int] NOT NULL,
	[DatumVreme] [datetime] NOT NULL,
	[Ucionica] [nvarchar](20) NULL,
	[TipSednice] [nvarchar](20) NOT NULL,
	[Zapisnik] [nvarchar](max) NULL,
	[Poziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sednice] PRIMARY KEY CLUSTERED 
(
	[SednicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaDokumenata]    Script Date: 30-Aug-18 10:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaDokumenata](
	[DokumentID] [int] NOT NULL,
	[NazivDokumenta] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VrstaDokumenata] PRIMARY KEY CLUSTERED 
(
	[DokumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clanovi] ON 

INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [Email], [KorisnickoIme], [Status], [Sifra]) VALUES (1, N'Nebojsa Lukacev', N'nebojsalukacev@gmail.com', N'Nebojsa', 1, N'cetobuke  ')
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [Email], [KorisnickoIme], [Status], [Sifra]) VALUES (2, N'Jelena Sundek', N'jelena.sundek@gmail.com', N'Jeca', 1, N'jecasund  ')
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [Email], [KorisnickoIme], [Status], [Sifra]) VALUES (3, N'Milan Stevanovic', N'milan.stevanovic@yahoo.com', N'Chemilan', 1, N'cetcet    ')
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [Email], [KorisnickoIme], [Status], [Sifra]) VALUES (1001, N'Marko Pantelic', N'marko.pantelic@gmail.com', N'Janko', 0, N'marecare  ')
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [Email], [KorisnickoIme], [Status], [Sifra]) VALUES (1006, N'Filipo Inzagi', N'filipopipo@gmail.com', N'Fica', 1, N'filipopipo')
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [Email], [KorisnickoIme], [Status], [Sifra]) VALUES (1007, N'Erik Kantona', N'erickanta@gmail.com', N'Kantona', 0, N'erickanta ')
SET IDENTITY_INSERT [dbo].[Clanovi] OFF
INSERT [dbo].[Prilozi] ([SednicaID], [PrilogID], [DukumentID], [Poslato], [DatumSlanja], [PrilogPutanja], [NazivPriloga]) VALUES (1, 1, 2, 1, CAST(N'1982-01-15' AS Date), NULL, NULL)
INSERT [dbo].[Prilozi] ([SednicaID], [PrilogID], [DukumentID], [Poslato], [DatumSlanja], [PrilogPutanja], [NazivPriloga]) VALUES (2, 2, 3, 1, CAST(N'1982-02-08' AS Date), N'C:\Users\Obuka\Desktop\Nebojsa', NULL)
INSERT [dbo].[Prisustvo] ([ClanID], [SednicaID], [Prisutan], [Opravdano]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanID], [SednicaID], [Prisutan], [Opravdano]) VALUES (3, 2, 0, 1)
INSERT [dbo].[Prisustvo] ([ClanID], [SednicaID], [Prisutan], [Opravdano]) VALUES (1001, 3, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanID], [SednicaID], [Prisutan], [Opravdano]) VALUES (1006, 2, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanID], [SednicaID], [Prisutan], [Opravdano]) VALUES (1007, 1, 0, 1)
INSERT [dbo].[Sednice] ([SednicaID], [DatumVreme], [Ucionica], [TipSednice], [Zapisnik], [Poziv]) VALUES (1, CAST(N'1982-01-21T00:45:00.000' AS DateTime), N'RAF1', N'Redovna', N'Sednica je uspesno odrzana', N'Позив за 1. СЕДНИЦУ НАСТАВНО-НАУЧНОГ ВЕЋА
Седница ће се одржати у четвртак, 17.05.2018.године у 13 часова у учионици РАФ 1')
INSERT [dbo].[Sednice] ([SednicaID], [DatumVreme], [Ucionica], [TipSednice], [Zapisnik], [Poziv]) VALUES (2, CAST(N'1986-02-13T17:00:00.000' AS DateTime), N'RAF3', N'Redovna', N'Sednica je uspesno odrzana', N'Позив за 2. СЕДНИЦУ НАСТАВНО-НАУЧНОГ ВЕЋА
Седница ће се одржати у четвртак, 17.05.2018.године у 13 часова у учионици РАФ 1')
INSERT [dbo].[Sednice] ([SednicaID], [DatumVreme], [Ucionica], [TipSednice], [Zapisnik], [Poziv]) VALUES (3, CAST(N'2000-01-01T21:00:00.000' AS DateTime), N'RAF5', N'Vanredna', N'Sednica je uspesno odrzana', N'Позив за 3. СЕДНИЦУ НАСТАВНО-НАУЧНОГ ВЕЋА
Седница ће се одржати у четвртак, 17.05.2018.године у 13 часова у учионици РАФ 1')
INSERT [dbo].[VrstaDokumenata] ([DokumentID], [NazivDokumenta]) VALUES (1, N'Diplomski rad')
INSERT [dbo].[VrstaDokumenata] ([DokumentID], [NazivDokumenta]) VALUES (2, N'Finansijski izvestaj')
INSERT [dbo].[VrstaDokumenata] ([DokumentID], [NazivDokumenta]) VALUES (3, N'Doktorska disertacija')
ALTER TABLE [dbo].[Prilozi]  WITH CHECK ADD  CONSTRAINT [FK_Prilozi_Sednice] FOREIGN KEY([SednicaID])
REFERENCES [dbo].[Sednice] ([SednicaID])
GO
ALTER TABLE [dbo].[Prilozi] CHECK CONSTRAINT [FK_Prilozi_Sednice]
GO
ALTER TABLE [dbo].[Prilozi]  WITH CHECK ADD  CONSTRAINT [FK_Prilozi_VrstaDokumenata] FOREIGN KEY([DukumentID])
REFERENCES [dbo].[VrstaDokumenata] ([DokumentID])
GO
ALTER TABLE [dbo].[Prilozi] CHECK CONSTRAINT [FK_Prilozi_VrstaDokumenata]
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD  CONSTRAINT [FK_Prisustvo_Clanovi] FOREIGN KEY([ClanID])
REFERENCES [dbo].[Clanovi] ([ClanID])
GO
ALTER TABLE [dbo].[Prisustvo] CHECK CONSTRAINT [FK_Prisustvo_Clanovi]
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD  CONSTRAINT [FK_Prisustvo_Sednice] FOREIGN KEY([SednicaID])
REFERENCES [dbo].[Sednice] ([SednicaID])
GO
ALTER TABLE [dbo].[Prisustvo] CHECK CONSTRAINT [FK_Prisustvo_Sednice]
GO
ALTER TABLE [dbo].[Clanovi]  WITH CHECK ADD  CONSTRAINT [Sifra] CHECK  ((len([Sifra])>=(6)))
GO
ALTER TABLE [dbo].[Clanovi] CHECK CONSTRAINT [Sifra]
GO
USE [master]
GO
ALTER DATABASE [NNV] SET  READ_WRITE 
GO
