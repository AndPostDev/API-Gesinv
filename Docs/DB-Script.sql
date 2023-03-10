USE [master]
GO
/****** Object:  Database [DbInventario]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE DATABASE [DbInventario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbInventario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbInventario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbInventario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbInventario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbInventario] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbInventario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbInventario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbInventario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbInventario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbInventario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbInventario] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbInventario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbInventario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbInventario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbInventario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbInventario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbInventario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbInventario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbInventario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbInventario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbInventario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbInventario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbInventario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbInventario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbInventario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbInventario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbInventario] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DbInventario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbInventario] SET RECOVERY FULL 
GO
ALTER DATABASE [DbInventario] SET  MULTI_USER 
GO
ALTER DATABASE [DbInventario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbInventario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbInventario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbInventario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbInventario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbInventario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbInventario', N'ON'
GO
ALTER DATABASE [DbInventario] SET QUERY_STORE = OFF
GO
USE [DbInventario]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Codigo] [int] NOT NULL,
	[LineaId] [int] NULL,
	[TipoId] [int] NULL,
	[Unidad] [int] NOT NULL,
	[Caja] [int] NULL,
	[GrupoId] [int] NULL,
	[Activo] [bit] NULL,
	[Iva] [bit] NULL,
	[Perecible] [bit] NULL,
	[Comentario] [nvarchar](max) NULL,
	[FechaCaducidad] [datetime2](7) NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[ProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[EmpresaId] [int] NULL,
	[RazonSocial] [nvarchar](max) NOT NULL,
	[Codigo] [int] NOT NULL,
	[Contacto] [nvarchar](max) NOT NULL,
	[TipoProveedorId] [int] NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[Telefono] [nvarchar](max) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Plazo] [datetime2](7) NULL,
	[Ruc] [nvarchar](max) NOT NULL,
	[ProvinciaId] [int] NULL,
	[EstadoId] [int] NULL,
	[TipoPersona] [int] NULL,
	[PaginaWeb] [nvarchar](max) NULL,
	[TipoPersonaNavigationTipoPersonaId] [int] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[BodegaId] [int] IDENTITY(1,1) NOT NULL,
	[EmpresaId] [int] NULL,
	[Direccion] [nvarchar](max) NOT NULL,
	[ProvinciaId] [int] NULL,
	[EstadoId] [int] NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[BodegaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[ProductoId] [int] NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CondicionPago]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CondicionPago](
	[CondicionPagoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CondicionPago] PRIMARY KEY CLUSTERED 
(
	[CondicionPagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[EmpresaId] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[EstadoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[EstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Existencia]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Existencia](
	[ExistenciaId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [int] NULL,
	[BodegaId] [int] NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Existencia] PRIMARY KEY CLUSTERED 
(
	[ExistenciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[GrupoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[GrupoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[IngresoId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoIngreso] [int] NOT NULL,
	[ProveedorId] [int] NULL,
	[MotivoId] [int] NULL,
	[BodegaId] [int] NULL,
	[TipoIngresoId] [int] NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Descuento] [float] NOT NULL,
	[Impuestos] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[OrdenCompraId] [int] NOT NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[IngresoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngresoDetalle]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngresoDetalle](
	[IngresoDetalleId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [int] NULL,
	[IngresoId] [int] NULL,
	[PrecioBruto] [float] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Caja] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_IngresoDetalle] PRIMARY KEY CLUSTERED 
(
	[IngresoDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Linea]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Linea](
	[LineaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Linea] PRIMARY KEY CLUSTERED 
(
	[LineaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaCompra]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaCompra](
	[LineaCompraId] [int] IDENTITY(1,1) NOT NULL,
	[OrdenCompraId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[DepartamentoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Caja] [int] NULL,
	[Precio] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_LineaCompra] PRIMARY KEY CLUSTERED 
(
	[LineaCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaSalida]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaSalida](
	[LineaSalidaId] [int] IDENTITY(1,1) NOT NULL,
	[SalidaId] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[CostoSalida] [float] NOT NULL,
	[ProductoId] [int] NULL,
 CONSTRAINT [PK_LineaSalida] PRIMARY KEY CLUSTERED 
(
	[LineaSalidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[MarcaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[ProductoId] [int] NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[MarcaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medida]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medida](
	[MedidaId] [int] IDENTITY(1,1) NOT NULL,
	[Dimension] [nvarchar](max) NOT NULL,
	[ProductoId] [int] NULL,
 CONSTRAINT [PK_Medida] PRIMARY KEY CLUSTERED 
(
	[MedidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motivo]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motivo](
	[MotivoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Motivo] PRIMARY KEY CLUSTERED 
(
	[MotivoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenCompra]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenCompra](
	[OrdenCompraId] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[Referencia] [nvarchar](max) NULL,
	[CondicionPagoId] [int] NOT NULL,
	[Observacion] [nvarchar](max) NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Impuestos] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[BodegaId] [int] NOT NULL,
 CONSTRAINT [PK_OrdenCompra] PRIMARY KEY CLUSTERED 
(
	[OrdenCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[ProvinciaId] [int] IDENTITY(1,1) NOT NULL,
	[EstadoId] [int] NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requisicion]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisicion](
	[RequisicionId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoRequisicion] [nvarchar](max) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[OrdenCompraId] [int] NULL,
	[Comentario] [nvarchar](max) NULL,
 CONSTRAINT [PK_Requisicion] PRIMARY KEY CLUSTERED 
(
	[RequisicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salida]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida](
	[SalidaId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](max) NOT NULL,
	[MotivoId] [int] NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Comentario] [nvarchar](max) NULL,
	[RequisicionId] [int] NULL,
	[BodegaId] [int] NULL,
 CONSTRAINT [PK_Salida] PRIMARY KEY CLUSTERED 
(
	[SalidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[TipoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[TipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIngreso]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIngreso](
	[TipoIngresoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoIngreso] PRIMARY KEY CLUSTERED 
(
	[TipoIngresoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoPersona]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPersona](
	[TipoPersonaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoPersona] PRIMARY KEY CLUSTERED 
(
	[TipoPersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProveedor]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProveedor](
	[TipoProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoProveedor] PRIMARY KEY CLUSTERED 
(
	[TipoProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/2/2023 3:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[EmpresaId] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Producto_GrupoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Producto_GrupoId] ON [dbo].[Producto]
(
	[GrupoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Producto_LineaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Producto_LineaId] ON [dbo].[Producto]
(
	[LineaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Producto_TipoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Producto_TipoId] ON [dbo].[Producto]
(
	[TipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proveedor_EmpresaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proveedor_EmpresaId] ON [dbo].[Proveedor]
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proveedor_EstadoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proveedor_EstadoId] ON [dbo].[Proveedor]
(
	[EstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proveedor_ProvinciaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proveedor_ProvinciaId] ON [dbo].[Proveedor]
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proveedor_TipoPersonaNavigationTipoPersonaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proveedor_TipoPersonaNavigationTipoPersonaId] ON [dbo].[Proveedor]
(
	[TipoPersonaNavigationTipoPersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proveedor_TipoProveedorId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Proveedor_TipoProveedorId] ON [dbo].[Proveedor]
(
	[TipoProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bodega_EmpresaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bodega_EmpresaId] ON [dbo].[Bodega]
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bodega_EstadoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bodega_EstadoId] ON [dbo].[Bodega]
(
	[EstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bodega_ProvinciaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bodega_ProvinciaId] ON [dbo].[Bodega]
(
	[ProvinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Color_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Color_ProductoId] ON [dbo].[Color]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Existencia_BodegaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Existencia_BodegaId] ON [dbo].[Existencia]
(
	[BodegaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Existencia_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Existencia_ProductoId] ON [dbo].[Existencia]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingreso_BodegaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ingreso_BodegaId] ON [dbo].[Ingreso]
(
	[BodegaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingreso_MotivoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ingreso_MotivoId] ON [dbo].[Ingreso]
(
	[MotivoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingreso_OrdenCompraId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ingreso_OrdenCompraId] ON [dbo].[Ingreso]
(
	[OrdenCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingreso_ProveedorId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ingreso_ProveedorId] ON [dbo].[Ingreso]
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingreso_TipoIngresoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ingreso_TipoIngresoId] ON [dbo].[Ingreso]
(
	[TipoIngresoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IngresoDetalle_IngresoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_IngresoDetalle_IngresoId] ON [dbo].[IngresoDetalle]
(
	[IngresoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IngresoDetalle_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_IngresoDetalle_ProductoId] ON [dbo].[IngresoDetalle]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LineaCompra_DepartamentoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_LineaCompra_DepartamentoId] ON [dbo].[LineaCompra]
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LineaCompra_OrdenCompraId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_LineaCompra_OrdenCompraId] ON [dbo].[LineaCompra]
(
	[OrdenCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LineaCompra_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_LineaCompra_ProductoId] ON [dbo].[LineaCompra]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LineaSalida_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_LineaSalida_ProductoId] ON [dbo].[LineaSalida]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LineaSalida_SalidaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_LineaSalida_SalidaId] ON [dbo].[LineaSalida]
(
	[SalidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marca_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Marca_ProductoId] ON [dbo].[Marca]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Medida_ProductoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Medida_ProductoId] ON [dbo].[Medida]
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenCompra_BodegaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrdenCompra_BodegaId] ON [dbo].[OrdenCompra]
(
	[BodegaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenCompra_CondicionPagoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrdenCompra_CondicionPagoId] ON [dbo].[OrdenCompra]
(
	[CondicionPagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrdenCompra_ProveedorId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrdenCompra_ProveedorId] ON [dbo].[OrdenCompra]
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provincia_EstadoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Provincia_EstadoId] ON [dbo].[Provincia]
(
	[EstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requisicion_OrdenCompraId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Requisicion_OrdenCompraId] ON [dbo].[Requisicion]
(
	[OrdenCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Salida_BodegaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Salida_BodegaId] ON [dbo].[Salida]
(
	[BodegaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Salida_MotivoId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Salida_MotivoId] ON [dbo].[Salida]
(
	[MotivoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Salida_RequisicionId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Salida_RequisicionId] ON [dbo].[Salida]
(
	[RequisicionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuario_EmpresaId]    Script Date: 3/2/2023 3:27:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_Usuario_EmpresaId] ON [dbo].[Usuario]
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ingreso] ADD  DEFAULT ((0)) FOR [OrdenCompraId]
GO
ALTER TABLE [dbo].[LineaCompra] ADD  DEFAULT ((0)) FOR [OrdenCompraId]
GO
ALTER TABLE [dbo].[LineaCompra] ADD  DEFAULT ((0)) FOR [ProductoId]
GO
ALTER TABLE [dbo].[LineaCompra] ADD  DEFAULT ((0)) FOR [DepartamentoId]
GO
ALTER TABLE [dbo].[OrdenCompra] ADD  DEFAULT ((0)) FOR [ProveedorId]
GO
ALTER TABLE [dbo].[OrdenCompra] ADD  DEFAULT ((0)) FOR [CondicionPagoId]
GO
ALTER TABLE [dbo].[OrdenCompra] ADD  DEFAULT ((0)) FOR [BodegaId]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Grupo_GrupoId] FOREIGN KEY([GrupoId])
REFERENCES [dbo].[Grupo] ([GrupoId])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Grupo_GrupoId]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Linea_LineaId] FOREIGN KEY([LineaId])
REFERENCES [dbo].[Linea] ([LineaId])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Linea_LineaId]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Tipo_TipoId] FOREIGN KEY([TipoId])
REFERENCES [dbo].[Tipo] ([TipoId])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Tipo_TipoId]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Empresa_EmpresaId] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([EmpresaId])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_Empresa_EmpresaId]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Estado_EstadoId] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Estado] ([EstadoId])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_Estado_EstadoId]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Provincia_ProvinciaId] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincia] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_Provincia_ProvinciaId]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_TipoPersona_TipoPersonaNavigationTipoPersonaId] FOREIGN KEY([TipoPersonaNavigationTipoPersonaId])
REFERENCES [dbo].[TipoPersona] ([TipoPersonaId])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_TipoPersona_TipoPersonaNavigationTipoPersonaId]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_TipoProveedor_TipoProveedorId] FOREIGN KEY([TipoProveedorId])
REFERENCES [dbo].[TipoProveedor] ([TipoProveedorId])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_TipoProveedor_TipoProveedorId]
GO
ALTER TABLE [dbo].[Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Bodega_Empresa_EmpresaId] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([EmpresaId])
GO
ALTER TABLE [dbo].[Bodega] CHECK CONSTRAINT [FK_Bodega_Empresa_EmpresaId]
GO
ALTER TABLE [dbo].[Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Bodega_Estado_EstadoId] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Estado] ([EstadoId])
GO
ALTER TABLE [dbo].[Bodega] CHECK CONSTRAINT [FK_Bodega_Estado_EstadoId]
GO
ALTER TABLE [dbo].[Bodega]  WITH CHECK ADD  CONSTRAINT [FK_Bodega_Provincia_ProvinciaId] FOREIGN KEY([ProvinciaId])
REFERENCES [dbo].[Provincia] ([ProvinciaId])
GO
ALTER TABLE [dbo].[Bodega] CHECK CONSTRAINT [FK_Bodega_Provincia_ProvinciaId]
GO
ALTER TABLE [dbo].[Color]  WITH CHECK ADD  CONSTRAINT [FK_Color_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Color] CHECK CONSTRAINT [FK_Color_Producto_ProductoId]
GO
ALTER TABLE [dbo].[Existencia]  WITH CHECK ADD  CONSTRAINT [FK_Existencia_Bodega_BodegaId] FOREIGN KEY([BodegaId])
REFERENCES [dbo].[Bodega] ([BodegaId])
GO
ALTER TABLE [dbo].[Existencia] CHECK CONSTRAINT [FK_Existencia_Bodega_BodegaId]
GO
ALTER TABLE [dbo].[Existencia]  WITH CHECK ADD  CONSTRAINT [FK_Existencia_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Existencia] CHECK CONSTRAINT [FK_Existencia_Producto_ProductoId]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Bodega_BodegaId] FOREIGN KEY([BodegaId])
REFERENCES [dbo].[Bodega] ([BodegaId])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Bodega_BodegaId]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Motivo_MotivoId] FOREIGN KEY([MotivoId])
REFERENCES [dbo].[Motivo] ([MotivoId])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Motivo_MotivoId]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_OrdenCompra_OrdenCompraId] FOREIGN KEY([OrdenCompraId])
REFERENCES [dbo].[OrdenCompra] ([OrdenCompraId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_OrdenCompra_OrdenCompraId]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Proveedor_ProveedorId] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([ProveedorId])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Proveedor_ProveedorId]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_TipoIngreso_TipoIngresoId] FOREIGN KEY([TipoIngresoId])
REFERENCES [dbo].[TipoIngreso] ([TipoIngresoId])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_TipoIngreso_TipoIngresoId]
GO
ALTER TABLE [dbo].[IngresoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_IngresoDetalle_Ingreso_IngresoId] FOREIGN KEY([IngresoId])
REFERENCES [dbo].[Ingreso] ([IngresoId])
GO
ALTER TABLE [dbo].[IngresoDetalle] CHECK CONSTRAINT [FK_IngresoDetalle_Ingreso_IngresoId]
GO
ALTER TABLE [dbo].[IngresoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_IngresoDetalle_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[IngresoDetalle] CHECK CONSTRAINT [FK_IngresoDetalle_Producto_ProductoId]
GO
ALTER TABLE [dbo].[LineaCompra]  WITH CHECK ADD  CONSTRAINT [FK_LineaCompra_Departamento_DepartamentoId] FOREIGN KEY([DepartamentoId])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LineaCompra] CHECK CONSTRAINT [FK_LineaCompra_Departamento_DepartamentoId]
GO
ALTER TABLE [dbo].[LineaCompra]  WITH CHECK ADD  CONSTRAINT [FK_LineaCompra_OrdenCompra_OrdenCompraId] FOREIGN KEY([OrdenCompraId])
REFERENCES [dbo].[OrdenCompra] ([OrdenCompraId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LineaCompra] CHECK CONSTRAINT [FK_LineaCompra_OrdenCompra_OrdenCompraId]
GO
ALTER TABLE [dbo].[LineaCompra]  WITH CHECK ADD  CONSTRAINT [FK_LineaCompra_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LineaCompra] CHECK CONSTRAINT [FK_LineaCompra_Producto_ProductoId]
GO
ALTER TABLE [dbo].[LineaSalida]  WITH CHECK ADD  CONSTRAINT [FK_LineaSalida_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[LineaSalida] CHECK CONSTRAINT [FK_LineaSalida_Producto_ProductoId]
GO
ALTER TABLE [dbo].[LineaSalida]  WITH CHECK ADD  CONSTRAINT [FK_LineaSalida_Salida_SalidaId] FOREIGN KEY([SalidaId])
REFERENCES [dbo].[Salida] ([SalidaId])
GO
ALTER TABLE [dbo].[LineaSalida] CHECK CONSTRAINT [FK_LineaSalida_Salida_SalidaId]
GO
ALTER TABLE [dbo].[Marca]  WITH CHECK ADD  CONSTRAINT [FK_Marca_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Marca] CHECK CONSTRAINT [FK_Marca_Producto_ProductoId]
GO
ALTER TABLE [dbo].[Medida]  WITH CHECK ADD  CONSTRAINT [FK_Medida_Producto_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Producto] ([ProductoId])
GO
ALTER TABLE [dbo].[Medida] CHECK CONSTRAINT [FK_Medida_Producto_ProductoId]
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCompra_Bodega_BodegaId] FOREIGN KEY([BodegaId])
REFERENCES [dbo].[Bodega] ([BodegaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenCompra] CHECK CONSTRAINT [FK_OrdenCompra_Bodega_BodegaId]
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCompra_CondicionPago_CondicionPagoId] FOREIGN KEY([CondicionPagoId])
REFERENCES [dbo].[CondicionPago] ([CondicionPagoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenCompra] CHECK CONSTRAINT [FK_OrdenCompra_CondicionPago_CondicionPagoId]
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCompra_Proveedor_ProveedorId] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedor] ([ProveedorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenCompra] CHECK CONSTRAINT [FK_OrdenCompra_Proveedor_ProveedorId]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Estado_EstadoId] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Estado] ([EstadoId])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Estado_EstadoId]
GO
ALTER TABLE [dbo].[Requisicion]  WITH CHECK ADD  CONSTRAINT [FK_Requisicion_Departamento_OrdenCompraId] FOREIGN KEY([OrdenCompraId])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
GO
ALTER TABLE [dbo].[Requisicion] CHECK CONSTRAINT [FK_Requisicion_Departamento_OrdenCompraId]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Bodega_BodegaId] FOREIGN KEY([BodegaId])
REFERENCES [dbo].[Bodega] ([BodegaId])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Bodega_BodegaId]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Motivo_MotivoId] FOREIGN KEY([MotivoId])
REFERENCES [dbo].[Motivo] ([MotivoId])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Motivo_MotivoId]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Requisicion_RequisicionId] FOREIGN KEY([RequisicionId])
REFERENCES [dbo].[Requisicion] ([RequisicionId])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Requisicion_RequisicionId]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empresa_EmpresaId] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([EmpresaId])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empresa_EmpresaId]
GO
USE [master]
GO
ALTER DATABASE [DbInventario] SET  READ_WRITE 
GO
