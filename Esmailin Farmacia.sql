
/*Nombre:Esmailin Suero Matricula:16-MIIT-1-019 Secccion:0541*/


USE [master]
GO
/****** Object:  Database [FarmaciaES]    Script Date: 17/12/2020 1:29:41 ******/
CREATE DATABASE [FarmaciaDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmaciaES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FarmaciaDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FarmaciaES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FarmaciaDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FarmaciaES] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmaciaES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmaciaES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmaciaES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmaciaES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmaciaES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmaciaES] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmaciaES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmaciaES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmaciaES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmaciaES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmaciaES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmaciaES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmaciaES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmaciaES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmaciaES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmaciaES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmaciaES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmaciaES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmaciaES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmaciaES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmaciaES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmaciaES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmaciaES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmaciaES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmaciaES] SET  MULTI_USER 
GO
ALTER DATABASE [FarmaciaES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmaciaES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmaciaES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmaciaES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FarmaciaES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FarmaciaES] SET QUERY_STORE = OFF
GO
USE [FarmaciaES]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [FarmaciaES]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 17/12/2020 1:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Clienteid] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](90) NULL,
	[Direccion] [varchar](250) NULL,
	[Telefono] [varchar](13) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 17/12/2020 1:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Facturaid] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[NombreMedicamento] [varchar](150) NULL,
	[Cantidad] [nvarchar](max) NULL,
	[Precio] [float] NULL,
	[Clienteid] [int] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Facturaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmaceutico]    Script Date: 17/12/2020 1:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmaceutico](
	[Farmaceuticoid] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](90) NULL,
	[Telefono] [varchar](13) NULL,
	[Direccion] [varchar](250) NULL,
	[Sexo] [char](1) NULL,
	[Ventaid] [int] NULL,
 CONSTRAINT [PK_Farmaceutico] PRIMARY KEY CLUSTERED 
(
	[Farmaceuticoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 17/12/2020 1:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[Medicamentoid] [int] NOT NULL,
	[NombreMedicamento] [varchar](150) NULL,
	[Precio] [float] NULL,
	[Caracteristicas] [varchar](150) NULL,
	[Provedorid] [int] NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[Medicamentoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provedor]    Script Date: 17/12/2020 1:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedor](
	[Provedorid] [int] NOT NULL,
	[Nombre] [varchar](150) NULL,
	[Direccion] [varchar](250) NULL,
	[Telefono] [varchar](13) NULL,
 CONSTRAINT [PK_Provedor] PRIMARY KEY CLUSTERED 
(
	[Provedorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 17/12/2020 1:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Ventasid] [int] NOT NULL,
	[Facturaid] [int] NULL,
	[Medicamentoid] [int] NULL,
	[Cantidad] [nvarchar](max) NULL,
	[Precio] [float] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Ventasid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (1, N'Juan', N'Santos', N'San Cristobal', N'8096999006')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (2, N'Pedro', N'Perez', N'Los Alcarisos', N'8096999008')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (3, N'Norca', N'Abreu', N'Santo Domingo Norte', N'8096999005')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (4, N'Jessica', N'Frias ', N'Herrera', N'8096999001')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (5, N'Angel', N'Abreu', N'Santo Domingo Norte', N'8295666778')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (6, N'Katherine', N'Medina', N'Sabana Perdida', N'8292825309')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (7, N'Jhonaury', N'Aguirre', N'Zona Oriental', N'8293349836')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (8, N'Angela', N'de la Cruz', N'Los Mina', N'8293151275')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (9, N'Santos', N'Rosario', N'Andres Boca Chica', N'8094558765')
INSERT [dbo].[Clientes] ([Clienteid], [Nombre], [Apellido], [Direccion], [Telefono]) VALUES (10, N'Rosa', N'Duarte', N'Los Guaricanos', N'8099988990')
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (1, CAST(N'2019-07-05T16:19:00.000' AS DateTime), N'Acetaminofen', N'10', 50, 1)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (2, CAST(N'2019-07-05T16:18:00.000' AS DateTime), N'Alcanfor', N'10', 100, 2)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (3, CAST(N'2019-07-06T20:10:00.000' AS DateTime), N'Ceterizina', N'30', 500, 2)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (4, CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'Alka Seltzer', N'10', 200, 3)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (5, CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'Monte Lucas', N'2', 50, 4)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (6, CAST(N'2019-07-08T00:00:00.000' AS DateTime), N'Frenador complex', N'5', 350, 5)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (7, CAST(N'2019-07-08T00:00:00.000' AS DateTime), N'Desenfriol', N'4', 300, 6)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (8, CAST(N'2019-07-08T00:00:00.000' AS DateTime), N'Bisolgrip', N'4', 250, 7)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (9, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Ibuprofeno Gental', N'2', 1400, 8)
INSERT [dbo].[Facturas] ([Facturaid], [Fecha], [NombreMedicamento], [Cantidad], [Precio], [Clienteid]) VALUES (10, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Nurofen', N'4', 800, 9)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (1, N'Edgar Jose', N'Sandoval', N'8095663442', N'Los mina Norte', N'M', 1)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (2, N'Jose', N'Peña', N'8095663444', N'Los Mina Nore', N'M', 2)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (3, N'Erica ', N'Duran', N'8297654334', N'Sabana Perdida', N'F', 3)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (4, N'Emerson', N'Vargas', N'8095389756', N'Los Praditos', N'M', 4)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (5, N'Juan', N'Medina', N'8096537809', N'av.Venezuela #56', N'M', 5)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (6, N'Rosalina', N'Mejia', N'8094367895', N'c/Jose Feliu #29 Los mina', N'F', 6)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (7, N'Carlos ', N'Almanzar', N'8293677896', N'calle 6 #5 Los Mina Sur', N'M', 7)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (8, N'Emeralda', N'Pimentel', N'8095665467', N'Sabana Perdida', N'F', 8)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (9, N'Amelia', N'Vegas', N'8095447899', N'Los Frailes 2', N'F', 9)
INSERT [dbo].[Farmaceutico] ([Farmaceuticoid], [Nombre], [Apellido], [Telefono], [Direccion], [Sexo], [Ventaid]) VALUES (10, N'Ramon ', N'Torres', N'8297454637', N'Los Alcarisos', N'M', 10)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (1, N'Acetaminofen', 5, N'Dolor de Cabeza', 1)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (2, N'Alcanfor', 10, N'Dolor de Barriga', 1)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (3, N'Ceterizina', 17, N'Tratamiento Alergia', 2)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (4, N'Alka Seltzer', 20, N'Molestias Gastricas', 3)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (5, N'Monte Lucas', 25, N'Tratamiento de Asma Bronquial', 4)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (6, N'Frenador complex', 70, N'Resfriado', 5)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (7, N'Desenfrior', 75, N'Doloe,Fiebre', 6)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (8, N'Bisolgrip', 63, N'Secrecion y Congestion Nasal', 7)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (9, N'Ibuprofeno', 700, N'Antiflamatorio', 8)
INSERT [dbo].[Medicamentos] ([Medicamentoid], [NombreMedicamento], [Precio], [Caracteristicas], [Provedorid]) VALUES (10, N'Nurofen', 200, N'Analgesico', 10)
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Distribuidora de Sosa', N'av.Maximo GOMEZ #35', N'8098765443')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (2, N'Productos Quimicos Difer', N'av.Maximo Gomez #117', N'8096543478')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (3, N'Protokimica', N'av.Hermanas Mirabal #142', N'8091234567')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (4, N'Fargraquin', N'av. Mexico esq. 30 de Marzo', N'8097654576')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (5, N'Monfel', N'Carretera Mella #12', N'8095437854')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (6, N'Provequim', N'av.Jose Contreras #23', N'8098374678')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (7, N'Astroquim', N'av. Duarte Santiago', N'8096457876')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (8, N'Biogen', N'av.Charles Summer #178', N'8094397624')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (9, N'Resiquim', N'Alma rosa 2 #3', N'8096438753')
INSERT [dbo].[Provedor] ([Provedorid], [Nombre], [Direccion], [Telefono]) VALUES (10, N'Helm', N'Padre Castellanos #56', N'8091239876')
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (1, 1, 1, N'10', 50)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (2, 2, 2, N'10', 100)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (3, 3, 3, N'30', 500)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (4, 4, 4, N'10', 200)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (5, 5, 5, N'2', 50)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (6, 6, 6, N'5', 350)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (7, 7, 7, N'4', 300)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (8, 8, 8, N'4', 250)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (9, 9, 9, N'2', 1400)
INSERT [dbo].[Ventas] ([Ventasid], [Facturaid], [Medicamentoid], [Cantidad], [Precio]) VALUES (10, 10, 10, N'4', 800)
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([Clienteid])
REFERENCES [dbo].[Clientes] ([Clienteid])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
ALTER TABLE [dbo].[Farmaceutico]  WITH CHECK ADD  CONSTRAINT [FK_Farmaceutico_Ventas] FOREIGN KEY([Ventaid])
REFERENCES [dbo].[Ventas] ([Ventasid])
GO
ALTER TABLE [dbo].[Farmaceutico] CHECK CONSTRAINT [FK_Farmaceutico_Ventas]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Provedor] FOREIGN KEY([Provedorid])
REFERENCES [dbo].[Provedor] ([Provedorid])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Provedor]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Facturas1] FOREIGN KEY([Facturaid])
REFERENCES [dbo].[Facturas] ([Facturaid])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Facturas1]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Medicamentos] FOREIGN KEY([Medicamentoid])
REFERENCES [dbo].[Medicamentos] ([Medicamentoid])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Medicamentos]
GO
USE [master]
GO
ALTER DATABASE [FarmaciaES] SET  READ_WRITE 
GO
