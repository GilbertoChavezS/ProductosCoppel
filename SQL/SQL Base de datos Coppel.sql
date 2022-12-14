USE [master]
GO
/****** Object:  Database [coppel]    Script Date: 19/11/2022 09:58:45 p. m. ******/
CREATE DATABASE [coppel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coppel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\coppel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'coppel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\coppel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [coppel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coppel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [coppel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [coppel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [coppel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [coppel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [coppel] SET ARITHABORT OFF 
GO
ALTER DATABASE [coppel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [coppel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [coppel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [coppel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [coppel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [coppel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [coppel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [coppel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [coppel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [coppel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [coppel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [coppel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [coppel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [coppel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [coppel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [coppel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [coppel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [coppel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [coppel] SET  MULTI_USER 
GO
ALTER DATABASE [coppel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [coppel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [coppel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [coppel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [coppel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [coppel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [coppel] SET QUERY_STORE = OFF
GO
USE [coppel]
GO
/****** Object:  Table [dbo].[clase]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_clase] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamentos]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_departamentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[familia]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[familia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_familia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[sku] [varchar](6) NOT NULL,
	[articulo] [varchar](15) NOT NULL,
	[marca] [varchar](15) NOT NULL,
	[modelo] [varchar](20) NOT NULL,
	[departamento] [int] NOT NULL,
	[clase] [int] NOT NULL,
	[familia] [int] NOT NULL,
	[f_alta] [datetime] NOT NULL,
	[stock] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[descontinuado] [bit] NULL,
	[f_baja] [datetime] NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_descontinuado]  DEFAULT ((0)) FOR [descontinuado]
GO
/****** Object:  StoredProcedure [dbo].[C_Producto]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<GIL>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[C_Producto]
	@Sku varchar(6), 
	@Articulo varchar(15),
	@Marca varchar(15),
	@Modelo varchar(20),
	@Departamento int,
	@Clase int,
	@Familia int,
	@F_alta datetime,
	@Stock int,
	@Cantidad int,
	@Descontinuado bit,
	@F_baja datetime


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO productos (sku, articulo, marca, modelo, departamento, clase, familia, f_alta, stock, cantidad, descontinuado, f_baja)
	values (@Sku, @Articulo, @Marca, @Modelo,@Departamento, @Clase ,@Familia ,@F_alta , @Stock , @Cantidad , @Descontinuado, @F_baja);


END
GO
/****** Object:  StoredProcedure [dbo].[R_Clases]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[R_Clases]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, nombre 
	FROM clase
END
GO
/****** Object:  StoredProcedure [dbo].[R_Departamentos]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[R_Departamentos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, nombre 
	FROM departamentos
END
GO
/****** Object:  StoredProcedure [dbo].[R_Familias]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[R_Familias]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, nombre 
	FROM familia
END
GO
/****** Object:  StoredProcedure [dbo].[SDR_Clase]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<GIL>
-- Create date: <19/NOV>
-- Description:	<COPPEL>
-- =============================================
CREATE PROCEDURE [dbo].[SDR_Clase]
	@LimpiarTabla bit = false
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@LimpiarTabla = 1)
	BEGIN 
		TRUNCATE TABLE clase;
	END

	INSERT INTO clase (nombre)
	VALUES ('LICUADORAS');

	INSERT INTO clase (nombre)
	VALUES ('BATIDORAS');

	INSERT INTO clase (nombre)
	VALUES ('CAFETERAS');

END
GO
/****** Object:  StoredProcedure [dbo].[SDR_Departamentos]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<GIL>
-- Create date: <19/NOV>
-- Description:	<COPPEL>
-- =============================================
CREATE PROCEDURE [dbo].[SDR_Departamentos]
	@LimpiarTabla bit = false
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@LimpiarTabla = 1)
	BEGIN 
		TRUNCATE TABLE departamentos;
	END

	INSERT INTO departamentos (nombre)
	VALUES ('DOMESTICOS');

	INSERT INTO departamentos (nombre)
	VALUES ('ELECTRONICA');

	INSERT INTO departamentos (nombre)
	VALUES ('MUEBLES');

END
GO
/****** Object:  StoredProcedure [dbo].[SDR_Familia]    Script Date: 19/11/2022 09:58:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<GIL>
-- Create date: <19/NOV>
-- Description:	<COPPEL>
-- EXEC SDR_Familia 1
-- =============================================
CREATE PROCEDURE [dbo].[SDR_Familia]
	@LimpiarTabla bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@LimpiarTabla = 1)
	BEGIN 
		TRUNCATE TABLE familia;
	END

	INSERT INTO familia (nombre)
	VALUES ('LICUADORAS');

	INSERT INTO familia (nombre)
	VALUES ('BATIDORA');

	INSERT INTO familia (nombre)
	VALUES ('CAFETERAS');

END
GO
USE [master]
GO
ALTER DATABASE [coppel] SET  READ_WRITE 
GO
