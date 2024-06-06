USE [master]
GO

/****** Object:  Database [jrosales_confiamed]    Script Date: 6/6/2024 9:22:39 ******/
CREATE DATABASE [jrosales_confiamed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jrosales_confiamed', FILENAME = N'/var/opt/mssql/data/jrosales_confiamed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jrosales_confiamed_log', FILENAME = N'/var/opt/mssql/data/jrosales_confiamed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jrosales_confiamed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [jrosales_confiamed] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET ARITHABORT OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [jrosales_confiamed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [jrosales_confiamed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET  DISABLE_BROKER 
GO

ALTER DATABASE [jrosales_confiamed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [jrosales_confiamed] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET RECOVERY FULL 
GO

ALTER DATABASE [jrosales_confiamed] SET  MULTI_USER 
GO

ALTER DATABASE [jrosales_confiamed] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [jrosales_confiamed] SET DB_CHAINING OFF 
GO

ALTER DATABASE [jrosales_confiamed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [jrosales_confiamed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [jrosales_confiamed] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [jrosales_confiamed] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [jrosales_confiamed] SET QUERY_STORE = ON
GO

ALTER DATABASE [jrosales_confiamed] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

ALTER DATABASE [jrosales_confiamed] SET  READ_WRITE 
GO


USE [jrosales_confiamed]
GO

/****** Object:  Table [dbo].[Formularios]    Script Date: 6/6/2024 9:30:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Formularios](
	[idFormulario] [int] IDENTITY(1,1) NOT NULL,
	[nombreFormulario] [varchar](50) NOT NULL,
	[estadoFormulario] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[idFormulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Formularios] ADD  CONSTRAINT [DF_Formularios_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO

CREATE INDEX indexFormularios1 ON [dbo].[Formularios] ([nombreFormulario]);
GO


USE [jrosales_confiamed]
GO

/****** Object:  Table [dbo].[Campos]    Script Date: 6/6/2024 9:31:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Campos](
	[idCampos] [int] IDENTITY(1,1) NOT NULL,
	[idFormulario] [int] NOT NULL,
	[nombreCampo] [varchar](50) NOT NULL,
	[tipoDatoCampo] [varchar](50) NOT NULL,
	[longitudCampo] [int] NOT NULL,
	[ordenCampo] [int] NOT NULL,
	[estadoCampo] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Campos] PRIMARY KEY CLUSTERED 
(
	[idCampos] ASC,
	[idFormulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Campos] ADD  CONSTRAINT [DF_Campos_fechaCreacion]  DEFAULT (getdate()) FOR [fechaCreacion]
GO

ALTER TABLE [dbo].[Campos]  WITH CHECK ADD  CONSTRAINT [FK_Campos_Formularios] FOREIGN KEY([idFormulario])
REFERENCES [dbo].[Formularios] ([idFormulario])
GO

ALTER TABLE [dbo].[Campos] CHECK CONSTRAINT [FK_Campos_Formularios]
GO
	
CREATE INDEX indexCampos1 ON [dbo].[Campos] ([nombreCampo]);
GO
