USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 25-8-2015 20:09:18 ******/
CREATE DATABASE [RealEstate] ON  PRIMARY 
( NAME = N'RealEstate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RealEstate.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RealEstate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RealEstate_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RealEstate] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstate] SET RECOVERY FULL 
GO
ALTER DATABASE [RealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstate] SET DB_CHAINING OFF 
GO
USE [RealEstate]
GO
/****** Object:  Table [dbo].[Complexen]    Script Date: 25-8-2015 20:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complexen](
	[ComplexEigenaar] [nvarchar](4) NOT NULL,
	[ComplexNummer] [nvarchar](4) NOT NULL,
	[ComplexBeheerStatus] [nvarchar](max) NULL,
	[LastChanged] [datetime] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Complexes] PRIMARY KEY CLUSTERED 
(
	[ComplexEigenaar] ASC,
	[ComplexNummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subcomplexen]    Script Date: 25-8-2015 20:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcomplexen](
	[SubcomplexEigenaar] [nvarchar](4) NOT NULL,
	[SubcomplexComplex] [nvarchar](4) NOT NULL,
	[SubcomplexNummer] [nvarchar](3) NOT NULL,
	[SubcomplexOmschrijving] [nvarchar](max) NULL,
	[SubcomplexBouwjaar] [int] NULL,
	[SubcomplexStraat] [nvarchar](max) NULL,
	[SubcomplexPostcode] [nvarchar](max) NULL,
	[SubcomplexPlaats] [nvarchar](max) NULL,
	[BeheerFinan] [nvarchar](max) NULL,
	[BeheerTech] [nvarchar](max) NULL,
	[SubcomplexBeheerStatus] [nvarchar](max) NULL,
	[LastChanged] [datetime] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.SubComplexes] PRIMARY KEY CLUSTERED 
(
	[SubcomplexEigenaar] ASC,
	[SubcomplexComplex] ASC,
	[SubcomplexNummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Verhuureenheden]    Script Date: 25-8-2015 20:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verhuureenheden](
	[VheEigenaar] [nvarchar](4) NOT NULL,
	[VheComplex] [nvarchar](4) NOT NULL,
	[VheSubcomplex] [nvarchar](3) NOT NULL,
	[VheNummer] [nvarchar](3) NOT NULL,
	[Beheercode] [nvarchar](20) NOT NULL,
	[VheStraat] [nvarchar](max) NULL,
	[VheHuisnummer] [nvarchar](max) NULL,
	[VheToevoeging] [nvarchar](max) NULL,
	[VhePostcode] [nvarchar](max) NULL,
	[VhePlaats] [nvarchar](max) NULL,
	[VheType] [nvarchar](max) NULL,
	[VhePunten] [int] NULL,
	[VheOmgevingspunten] [decimal](18, 2) NULL,
	[VhePuntenHuurMax] [decimal](18, 2) NOT NULL,
	[VhePuntenDatumBerekening] [datetime] NOT NULL,
	[VhePuntenDatumHerberekening] [datetime] NOT NULL,
	[VheBeheerStatus] [nvarchar](max) NULL,
	[VheEtageAantal] [int] NULL,
	[VheKamersAantal] [int] NULL,
	[VheSlaapkamersAantal] [int] NULL,
	[VheOppervlakte] [int] NULL,
	[VheDwaType] [nvarchar](max) NULL,
	[VheDwaOmschrijving] [nvarchar](max) NULL,
	[VheWozWaarde] [decimal](18, 2) NULL,
	[VheBedragMarkthuur] [decimal](18, 2) NULL,
	[VheEnergielabel] [nvarchar](max) NULL,
	[VheLnpPublicatie] [nvarchar](max) NULL,
	[VheLnpType] [nvarchar](max) NULL,
	[VheLnpOmschrijving] [nvarchar](max) NULL,
	[VheLnpWoningSoort] [nvarchar](max) NULL,
	[VheLnpKavelOppervlakte] [nvarchar](max) NULL,
	[VheDatumBeschikbaar] [datetime] NOT NULL,
	[LastChanged] [datetime] NOT NULL,
	[VheBeheerType] [nvarchar](max) NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Vhes] PRIMARY KEY CLUSTERED 
(
	[VheEigenaar] ASC,
	[VheComplex] ASC,
	[VheSubcomplex] ASC,
	[VheNummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Subcomplexen]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubComplexes_dbo.Complexes_SubcomplexEigenaar_SubcomplexComplex] FOREIGN KEY([SubcomplexEigenaar], [SubcomplexComplex])
REFERENCES [dbo].[Complexen] ([ComplexEigenaar], [ComplexNummer])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subcomplexen] CHECK CONSTRAINT [FK_dbo.SubComplexes_dbo.Complexes_SubcomplexEigenaar_SubcomplexComplex]
GO
ALTER TABLE [dbo].[Verhuureenheden]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vhes_dbo.SubComplexes_VheEigenaar_VheComplex_VheSubcomplex] FOREIGN KEY([VheEigenaar], [VheComplex], [VheSubcomplex])
REFERENCES [dbo].[Subcomplexen] ([SubcomplexEigenaar], [SubcomplexComplex], [SubcomplexNummer])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Verhuureenheden] CHECK CONSTRAINT [FK_dbo.Vhes_dbo.SubComplexes_VheEigenaar_VheComplex_VheSubcomplex]
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
