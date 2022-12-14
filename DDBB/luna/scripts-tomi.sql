USE [master]
GO
/****** Object:  Database [Luna]    Script Date: 1/11/2022 20:41:42 ******/
CREATE DATABASE [Luna]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Luna', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Luna.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Luna_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Luna_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Luna] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Luna].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Luna] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Luna] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Luna] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Luna] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Luna] SET ARITHABORT OFF 
GO
ALTER DATABASE [Luna] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Luna] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Luna] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Luna] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Luna] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Luna] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Luna] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Luna] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Luna] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Luna] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Luna] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Luna] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Luna] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Luna] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Luna] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Luna] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Luna] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Luna] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Luna] SET  MULTI_USER 
GO
ALTER DATABASE [Luna] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Luna] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Luna] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Luna] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Luna] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Luna', N'ON'
GO
USE [Luna]
GO
/****** Object:  Table [dbo].[DomicilioUsuario]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomicilioUsuario](
	[IdDomicilioUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[Calle] [varchar](200) NULL,
	[Numero] [int] NULL,
	[Piso] [int] NULL,
	[Depto] [char](3) NULL,
	[EntreCalle1] [varchar](200) NULL,
	[EntreCalle2] [varchar](200) NULL,
	[Telefono1] [varchar](100) NULL,
	[Telefono2] [varchar](100) NULL,
	[Celular1] [varchar](100) NULL,
	[Celular2] [varchar](100) NULL,
	[TelefonoEmergencia] [varchar](100) NULL,
	[Observaciones] [varchar](max) NULL,
	[IdTipoDomicilio] [int] NULL,
	[IdLocalidad] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_DomicilioUsuario] PRIMARY KEY CLUSTERED 
(
	[IdDomicilioUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EarlyAdopter]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EarlyAdopter](
	[IdEarlyAdopter] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](150) NULL,
	[TipoEarlyAdopter] [varchar](30) NULL,
	[FechaAlta] [datetime] NOT NULL,
 CONSTRAINT [PK_EarlyAdopter] PRIMARY KEY CLUSTERED 
(
	[IdEarlyAdopter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoNotificacion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoNotificacion](
	[IdEstadoNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_EstadoNotificacion] PRIMARY KEY CLUSTERED 
(
	[IdEstadoNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoProfesionalPaciente]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoProfesionalPaciente](
	[IdEstadoProfesionalPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](20) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_EstadoProfesionalPaciente] PRIMARY KEY CLUSTERED 
(
	[IdEstadoProfesionalPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoFamiliar]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoFamiliar](
	[IdGrupoFamiliar] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NULL,
	[Nombre] [varchar](300) NULL,
	[IdParentesco] [int] NULL,
	[Observaciones] [varchar](max) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_GrupoFamiliar] PRIMARY KEY CLUSTERED 
(
	[IdGrupoFamiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoNotificacion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoNotificacion](
	[IdGrupoNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_GrupoNotificacion] PRIMARY KEY CLUSTERED 
(
	[IdGrupoNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoPatologia]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoPatologia](
	[IdGrupoPatologia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_GrupoPatologia] PRIMARY KEY CLUSTERED 
(
	[IdGrupoPatologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[IdInstitucion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[MainColor] [varchar](10) NULL,
	[SecondaryColor] [varchar](10) NULL,
	[FontColor] [varchar](10) NULL,
	[Logourl] [varchar](200) NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[IdInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[IdLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[IdProvincia] [int] NOT NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[IdMenuItem] [int] IDENTITY(1,1) NOT NULL,
	[IdParent] [int] NULL,
	[Nivel] [int] NULL,
	[Orden] [int] NULL,
	[Descripcion] [varchar](100) NULL,
	[Controller] [varchar](50) NULL,
	[Accion] [varchar](50) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[IdMenuItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metrica]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metrica](
	[IdMetrica] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Metrica] PRIMARY KEY CLUSTERED 
(
	[IdMetrica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacion](
	[IdNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesional] [int] NULL,
	[IdPaciente] [int] NULL,
	[Mensaje] [varchar](max) NULL,
	[FechaHora] [datetime] NULL,
	[IdEstadoNotificacion] [int] NULL,
	[IdGrupoNotificacion] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[EsTipoEstadoEmocional] [bit] NOT NULL,
 CONSTRAINT [PK_Notificacion] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificacionOpcion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionOpcion](
	[IdNotificacionOpcion] [int] IDENTITY(1,1) NOT NULL,
	[IdNotificacion] [int] NULL,
	[Descripcion] [varchar](300) NULL,
	[Orden] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_NotificacionOpcion] PRIMARY KEY CLUSTERED 
(
	[IdNotificacionOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificacionRespuesta]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionRespuesta](
	[IdNotificacionRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdNotificacion] [int] NULL,
	[IdNotificacionOpcion] [int] NULL,
	[Respuesta] [varchar](max) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_NotificacionRespuesta] PRIMARY KEY CLUSTERED 
(
	[IdNotificacionRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacientePatologia]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacientePatologia](
	[IdPacientePatologia] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NULL,
	[IdPatologia] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_PacientePatologia] PRIMARY KEY CLUSTERED 
(
	[IdPacientePatologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parentesco]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parentesco](
	[IdParentesco] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Parentesco] PRIMARY KEY CLUSTERED 
(
	[IdParentesco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patologia]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patologia](
	[IdPatologia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Descripcion] [varchar](max) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Patologia] PRIMARY KEY CLUSTERED 
(
	[IdPatologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatologiaGrupoPatologia]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatologiaGrupoPatologia](
	[IdPatologiaGrupoPatologia] [int] IDENTITY(1,1) NOT NULL,
	[IdPatologia] [int] NULL,
	[IdGrupoPatologia] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_PatologiaGrupoPatologia] PRIMARY KEY CLUSTERED 
(
	[IdPatologiaGrupoPatologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilMenuItem]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilMenuItem](
	[IdPerfilMenuItem] [int] IDENTITY(1,1) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[IdMenuItem] [int] NOT NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_PerfilesItems] PRIMARY KEY CLUSTERED 
(
	[IdPerfilMenuItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfesionalInstitucion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfesionalInstitucion](
	[IdProfesionalInstitucion] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesional] [int] NULL,
	[IdInstitucion] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_ProfesionalInstitucion] PRIMARY KEY CLUSTERED 
(
	[IdProfesionalInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfesionalPaciente]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfesionalPaciente](
	[IdProfesionalPaciente] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesional] [int] NULL,
	[IdPaciente] [int] NULL,
	[IdEstadoProfesionalPaciente] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_ProfesionalPaciente] PRIMARY KEY CLUSTERED 
(
	[IdProfesionalPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[IdPais] [int] NOT NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDiario]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDiario](
	[IdRegistroDiario] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NULL,
	[Situacion] [varchar](max) NULL,
	[MotivoSituacion] [varchar](max) NULL,
	[IdTipoEmocion] [int] NULL,
	[IntensidadEmocion] [int] NULL,
	[PensamientoAutomatico] [varchar](max) NULL,
	[GradoCreenciaPensamientoAutomatico] [int] NULL,
	[RespuestaRacional] [varchar](max) NULL,
	[GradoCreenciaRespuestaRacional] [int] NULL,
	[GradoCreenciaResultado] [int] NULL,
	[IdTipoEmocionResultado] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[seen] [bit] NULL,
 CONSTRAINT [PK_RegistroDiario] PRIMARY KEY CLUSTERED 
(
	[IdRegistroDiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDiarioRespuesta]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDiarioRespuesta](
	[IdRegistroDiarioRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdRegistroDiario] [int] NULL,
	[IdProfesional] [int] NULL,
	[Nota] [varchar](max) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_RegistroDiarioRespuesta] PRIMARY KEY CLUSTERED 
(
	[IdRegistroDiarioRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroNewsletter]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroNewsletter](
	[IdRegistroNewsletter] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
 CONSTRAINT [PK_RegistroNewsletter] PRIMARY KEY CLUSTERED 
(
	[IdRegistroNewsletter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeguimientoPaciente]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeguimientoPaciente](
	[IdSeguimientoPaciente] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesional] [int] NULL,
	[IdPaciente] [int] NULL,
	[Nota] [varchar](max) NULL,
	[FechaAlta] [datetime] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_SeguimientoPaciente] PRIMARY KEY CLUSTERED 
(
	[IdSeguimientoPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDomicilio]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDomicilio](
	[IdTipoDomicilio] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_TipoDomicilio] PRIMARY KEY CLUSTERED 
(
	[IdTipoDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmocion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmocion](
	[IdTipoEmocion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_TipoEmocion] PRIMARY KEY CLUSTERED 
(
	[IdTipoEmocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Apellido] [varchar](200) NULL,
	[DNI] [int] NULL,
	[TelefonoParticular] [varchar](20) NULL,
	[Celular] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](max) NULL,
	[IdPerfil] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[Sexo] [char](1) NULL,
	[ImageUrl] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioInstitucion]    Script Date: 1/11/2022 20:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioInstitucion](
	[IdUsuarioInstitucion] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdInstitucion] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_UsuarioInstitucion] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EstadoProfesionalPaciente] ON 

INSERT [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Activo', 0, CAST(N'2019-09-28T19:06:16.470' AS DateTime), 1)
INSERT [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Inactivo', 0, CAST(N'2019-09-28T19:06:16.470' AS DateTime), 1)
INSERT [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, N'Activo', 0, CAST(N'2019-09-28T19:06:16.470' AS DateTime), 1)
INSERT [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, N'Inactivo', 0, CAST(N'2019-09-28T19:06:16.470' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[EstadoProfesionalPaciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Institucion] ON 

INSERT [dbo].[Institucion] ([IdInstitucion], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [Password], [Email], [MainColor], [SecondaryColor], [FontColor], [Logourl]) VALUES (1, N'UNLaM', 0, CAST(N'2022-10-20T18:27:16.073' AS DateTime), 1, NULL, NULL, N'#44b87e', N'#1eba79', N'#ffffff', N'https://seeklogo.com/images/U/unlam-universidad-nacional-de-la-matanza-logo-B665E562AA-seeklogo.com.png')
INSERT [dbo].[Institucion] ([IdInstitucion], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [Password], [Email], [MainColor], [SecondaryColor], [FontColor], [Logourl]) VALUES (2, N'Insitucion de orden mental', 0, CAST(N'2022-10-19T16:47:35.997' AS DateTime), 1, NULL, NULL, N'#8a1616', N'#f5f5f5', N'#ffffff', N'https://upload.wikimedia.org/wikipedia/commons/1/1e/RPC-JP_Logo.png')
INSERT [dbo].[Institucion] ([IdInstitucion], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [Password], [Email], [MainColor], [SecondaryColor], [FontColor], [Logourl]) VALUES (3, N'UAI', 0, CAST(N'2022-10-19T19:35:07.313' AS DateTime), 1, NULL, NULL, N'#ffffff', N'#f2f2f2', N'#850000', N'https://static.wixstatic.com/media/a7046d_8db80e67a33e4216bab447550167cb43~mv2.png/v1/fit/w_1000%2Ch_751%2Cal_c/file.png')
SET IDENTITY_INSERT [dbo].[Institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[Patologia] ON 

INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Depresivos', N'Personas con depresividad crónica', 0, CAST(N'2022-10-20T21:59:38.080' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Bipolares', N'Personas que cambian su humor constantemente de un momento a otro', 0, CAST(N'2022-10-20T22:00:45.193' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, N'Ciclotimicos', N'Es un trastorno mental. Es una forma leve del trastorno bipolar (enfermedad maniaco-depresiva), en la cual una persona tiene oscilaciones del estado de ánimo durante un período de años que van desde d', 0, CAST(N'2022-10-23T19:34:26.550' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, N'Trastornos de ansiedad', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, N'Trastornos obseso-compulsivo', N'', 1, CAST(N'2022-10-20T22:07:07.317' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (6, N'Trastornos de ansiedad fobica', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (7, N'Trastornos del animo', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (8, N'Trastornos somatomorfos', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (9, N'Trastornos disociativos', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (10, N'Trastornos de la conducta alimentaria, sexuales, sue?o, etc', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (11, N'Trastornos de ansiedad', N'', 1, CAST(N'2022-10-20T22:07:14.413' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (12, N'Ezquizofrenia', N'Es un trastorno mental que dificulta diferenciar lo que es real de lo que no. También dificulta pensar con claridad, tener respuestas emocionales normales y actuar de manera normal en situaciones soci', 0, CAST(N'2022-10-23T19:34:38.977' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (13, N'Trastornos ezquizofreniforme', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (14, N'Trastornos ezquizoafectivo', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (15, N'Trastornos delirante', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (16, N'Trastornos psicotico breve', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (17, N'Trastornos psicotico compartido (folie a deux)', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (18, N'Trastornos psicotico por enfermedad medica', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (19, N'Trastornos psicotico inducido por sustancias', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (20, N'Trastornos psicotico no especificado', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (21, N'Trastornos paranoide de la personalidad', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (22, N'T.P. ezquizoide / ezquizotipico ', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (23, N'T.P. histrionico', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (24, N'T.P. narcisistica', N'El trastorno de personalidad narcisista (uno de varios tipos de trastornos de la personalidad) es un trastorno mental en el cual las personas tienen un sentido desmesurado de su propia importancia, un', 0, CAST(N'2022-10-23T19:35:24.623' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (25, N'T.P. antisocial', N'El trastorno de personalidad antisocial, a veces llamado sociopatía, es un trastorno mental en el cual una persona no demuestra discernimiento entre bien y mal e ignora los derechos y sentimientos de ', 0, CAST(N'2022-10-23T19:35:00.860' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (26, N'T.P. por evitacion / por dependencia', N'', 0, CAST(N'2022-09-10T15:10:47.863' AS DateTime), 1)
INSERT [dbo].[Patologia] ([IdPatologia], [Nombre], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (27, N'T.P. obsesivo-compulsivo', N'El trastorno obsesivo-compulsivo (TOC) es una afección mental que consiste en presentar pensamientos (obsesiones) y rituales (compulsiones) una y otra vez. Estos interfieren con su vida, pero no puede', 0, CAST(N'2022-10-23T19:37:46.440' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Patologia] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Administrador', 0, CAST(N'2019-09-28T18:32:45.653' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Profesional', 0, CAST(N'2019-09-28T18:32:45.653' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, N'Paciente', 0, CAST(N'2019-09-28T18:32:45.657' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, N'Institucion', 0, CAST(N'2022-09-10T15:08:29.827' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, N'Administrador', 0, CAST(N'2019-09-28T18:32:45.653' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (6, N'Profesional', 0, CAST(N'2019-09-28T18:32:45.653' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (7, N'Paciente', 0, CAST(N'2019-09-28T18:32:45.657' AS DateTime), 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (8, N'Institucion', 0, CAST(N'2022-09-10T15:08:29.827' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[ProfesionalInstitucion] ON 

INSERT [dbo].[ProfesionalInstitucion] ([IdProfesionalInstitucion], [IdProfesional], [IdInstitucion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, 4, 1, 0, CAST(N'2022-10-19T16:31:45.557' AS DateTime), 1047)
INSERT [dbo].[ProfesionalInstitucion] ([IdProfesionalInstitucion], [IdProfesional], [IdInstitucion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, 8, 2, 0, CAST(N'2022-10-19T19:38:18.500' AS DateTime), 1052)
SET IDENTITY_INSERT [dbo].[ProfesionalInstitucion] OFF
GO
SET IDENTITY_INSERT [dbo].[ProfesionalPaciente] ON 

INSERT [dbo].[ProfesionalPaciente] ([IdProfesionalPaciente], [IdProfesional], [IdPaciente], [IdEstadoProfesionalPaciente], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, 4, 5, 1, 0, CAST(N'2022-10-19T17:00:14.640' AS DateTime), 1049)
INSERT [dbo].[ProfesionalPaciente] ([IdProfesionalPaciente], [IdProfesional], [IdPaciente], [IdEstadoProfesionalPaciente], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, 8, 6, 1, 0, CAST(N'2022-10-19T17:02:32.907' AS DateTime), 1049)
INSERT [dbo].[ProfesionalPaciente] ([IdProfesionalPaciente], [IdProfesional], [IdPaciente], [IdEstadoProfesionalPaciente], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, 8, 9, 1, 0, CAST(N'2022-10-20T01:23:49.477' AS DateTime), 1049)
SET IDENTITY_INSERT [dbo].[ProfesionalPaciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (1, N'Admin', N'Test', 32361717, N'1234-1234', N'1234-1234', N'admin@gmail.com', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 0, CAST(N'2019-09-28T18:32:45.693' AS DateTime), 1, CAST(N'2000-10-10T00:00:00.000' AS DateTime), NULL, N'/img/user/female/1.png')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (2, N'Nicolas', N'Lucero', 38026836, NULL, NULL, N'nicolas.lucero@redb.ee', N'24d31b360a6bb762d97d3d1d0daec3b6f8b229c8', 4, 0, CAST(N'2022-10-19T16:27:58.247' AS DateTime), 1, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'M', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (3, N'Ignacio', N'Baldo', 38026837, NULL, NULL, N'ignacio.baldo@gmail.com', N'4752acd659e7ed96ac617dc1e69a593051829995', 4, 0, CAST(N'2022-10-24T09:58:17.820' AS DateTime), 0, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'M', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (4, N'Camila', N'Minetti', 38026837, NULL, NULL, N'camila.minetti@gmail.com', N'4752acd659e7ed96ac617dc1e69a593051829995', 2, 0, CAST(N'2022-10-20T22:23:30.967' AS DateTime), 1, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'F', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (5, N'Sabrina', N'Casado', 38026836, NULL, NULL, N'sabrina.casado@gmail.com', N'24d31b360a6bb762d97d3d1d0daec3b6f8b229c8', 3, 0, CAST(N'2022-10-23T18:16:15.273' AS DateTime), 1, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'F', N'/img/user/female/2.png')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (6, N'Gabriel', N'Cascallares', 38026835, NULL, NULL, N'gabriel.cascallares@gmail.com', N'd042ada3274e6434f9ed5448ad9dbd009b4587c3', 3, 0, CAST(N'2022-10-20T00:40:15.423' AS DateTime), 1049, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'M', N'/img/user/male/5.png')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (7, N'Tomas', N'Nuñez', 11111111, NULL, NULL, N'tomas.nunez@gmail.com', N'a642a77abd7d4f51bf9226ceaf891fcbb5b299b8', 4, 0, CAST(N'2022-10-19T19:36:47.120' AS DateTime), 1, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'M', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (8, N'Juan', N'Perez', 22222222, NULL, NULL, N'juan.perez@gmail.com', N'f638e2789006da9bb337fd5689e37a265a70f359', 2, 0, CAST(N'2022-10-19T19:38:18.490' AS DateTime), 1052, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'M', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (9, N'Juan', N'Gomez', 12345678, NULL, NULL, N'asd@gmail.com', N'7c222fb2927d828af22f592134e8932480637c0d', 3, 0, CAST(N'2022-10-23T19:33:31.097' AS DateTime), 1, CAST(N'2000-10-10T00:00:00.000' AS DateTime), N'M', N'/img/user/male/3.png')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion], [FechaNacimiento], [Sexo], [ImageUrl]) VALUES (10, N'Federica', N'Vazquez', 12345679, NULL, NULL, N'fede.vaz@gmail.com', N'da39a3ee5e6b4b0d3255bfef95601890afd80709', 3, 0, CAST(N'2022-10-23T18:16:26.820' AS DateTime), 1, CAST(N'1994-11-03T00:00:00.000' AS DateTime), N'F', N'/img/user/female/4.png')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioInstitucion] ON 

INSERT [dbo].[UsuarioInstitucion] ([IdUsuarioInstitucion], [IdUsuario], [IdInstitucion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, 2, 1, 0, CAST(N'2022-10-19T16:27:58.333' AS DateTime), 1)
INSERT [dbo].[UsuarioInstitucion] ([IdUsuarioInstitucion], [IdUsuario], [IdInstitucion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (6, 3, 2, 0, CAST(N'2022-10-24T09:58:17.913' AS DateTime), 0)
INSERT [dbo].[UsuarioInstitucion] ([IdUsuarioInstitucion], [IdUsuario], [IdInstitucion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (7, 7, 3, 0, CAST(N'2022-10-19T19:36:47.147' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UsuarioInstitucion] OFF
GO
ALTER TABLE [dbo].[DomicilioUsuario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[DomicilioUsuario] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[EarlyAdopter] ADD  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[EstadoNotificacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[EstadoNotificacion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[EstadoProfesionalPaciente] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[EstadoProfesionalPaciente] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[GrupoFamiliar] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[GrupoFamiliar] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[GrupoNotificacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[GrupoNotificacion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[GrupoPatologia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[GrupoPatologia] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Institucion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Institucion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Localidad] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Localidad] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[MenuItem] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[MenuItem] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Metrica] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Metrica] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Notificacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Notificacion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Notificacion] ADD  DEFAULT ((0)) FOR [EsTipoEstadoEmocional]
GO
ALTER TABLE [dbo].[NotificacionOpcion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[NotificacionOpcion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[NotificacionRespuesta] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[NotificacionRespuesta] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[PacientePatologia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PacientePatologia] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Pais] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Pais] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Parentesco] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Parentesco] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Patologia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Patologia] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Perfil] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Perfil] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[PerfilMenuItem] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PerfilMenuItem] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[ProfesionalInstitucion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ProfesionalInstitucion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[ProfesionalPaciente] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ProfesionalPaciente] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Provincia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Provincia] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[RegistroDiario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[RegistroDiario] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[RegistroNewsletter] ADD  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[SeguimientoPaciente] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[SeguimientoPaciente] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[TipoDomicilio] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TipoDomicilio] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[TipoEmocion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TipoEmocion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[UsuarioInstitucion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[UsuarioInstitucion] ADD  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[DomicilioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DomicilioUsuario_Localidad] FOREIGN KEY([IdLocalidad])
REFERENCES [dbo].[Localidad] ([IdLocalidad])
GO
ALTER TABLE [dbo].[DomicilioUsuario] CHECK CONSTRAINT [FK_DomicilioUsuario_Localidad]
GO
ALTER TABLE [dbo].[DomicilioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DomicilioUsuario_TipoDomicilio] FOREIGN KEY([IdTipoDomicilio])
REFERENCES [dbo].[TipoDomicilio] ([IdTipoDomicilio])
GO
ALTER TABLE [dbo].[DomicilioUsuario] CHECK CONSTRAINT [FK_DomicilioUsuario_TipoDomicilio]
GO
ALTER TABLE [dbo].[DomicilioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_DomicilioUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[DomicilioUsuario] CHECK CONSTRAINT [FK_DomicilioUsuario_Usuario]
GO
ALTER TABLE [dbo].[GrupoFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_GrupoFamiliar_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[GrupoFamiliar] CHECK CONSTRAINT [FK_GrupoFamiliar_Paciente]
GO
ALTER TABLE [dbo].[GrupoFamiliar]  WITH CHECK ADD  CONSTRAINT [FK_GrupoFamiliar_Parentesco] FOREIGN KEY([IdParentesco])
REFERENCES [dbo].[Parentesco] ([IdParentesco])
GO
ALTER TABLE [dbo].[GrupoFamiliar] CHECK CONSTRAINT [FK_GrupoFamiliar_Parentesco]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincia] ([IdProvincia])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Parent] FOREIGN KEY([IdParent])
REFERENCES [dbo].[MenuItem] ([IdMenuItem])
GO
ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Parent]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_EstadoNotificacion] FOREIGN KEY([IdEstadoNotificacion])
REFERENCES [dbo].[EstadoNotificacion] ([IdEstadoNotificacion])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_EstadoNotificacion]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_GrupoNotificacion] FOREIGN KEY([IdGrupoNotificacion])
REFERENCES [dbo].[GrupoNotificacion] ([IdGrupoNotificacion])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_GrupoNotificacion]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Paciente]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK_Notificacion_Profesional] FOREIGN KEY([IdProfesional])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK_Notificacion_Profesional]
GO
ALTER TABLE [dbo].[NotificacionOpcion]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionOpcion_Notificacion] FOREIGN KEY([IdNotificacion])
REFERENCES [dbo].[Notificacion] ([IdNotificacion])
GO
ALTER TABLE [dbo].[NotificacionOpcion] CHECK CONSTRAINT [FK_NotificacionOpcion_Notificacion]
GO
ALTER TABLE [dbo].[NotificacionRespuesta]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionRespuesta_Notificacion] FOREIGN KEY([IdNotificacion])
REFERENCES [dbo].[Notificacion] ([IdNotificacion])
GO
ALTER TABLE [dbo].[NotificacionRespuesta] CHECK CONSTRAINT [FK_NotificacionRespuesta_Notificacion]
GO
ALTER TABLE [dbo].[NotificacionRespuesta]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionRespuesta_NotificacionOpcion] FOREIGN KEY([IdNotificacionOpcion])
REFERENCES [dbo].[NotificacionOpcion] ([IdNotificacionOpcion])
GO
ALTER TABLE [dbo].[NotificacionRespuesta] CHECK CONSTRAINT [FK_NotificacionRespuesta_NotificacionOpcion]
GO
ALTER TABLE [dbo].[PacientePatologia]  WITH CHECK ADD  CONSTRAINT [FK_PacientePatologia_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[PacientePatologia] CHECK CONSTRAINT [FK_PacientePatologia_Paciente]
GO
ALTER TABLE [dbo].[PacientePatologia]  WITH CHECK ADD  CONSTRAINT [FK_PacientePatologia_Patologia] FOREIGN KEY([IdPatologia])
REFERENCES [dbo].[Patologia] ([IdPatologia])
GO
ALTER TABLE [dbo].[PacientePatologia] CHECK CONSTRAINT [FK_PacientePatologia_Patologia]
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia]  WITH CHECK ADD  CONSTRAINT [FK_PatologiaGrupoPatologia_GrupoPatologia] FOREIGN KEY([IdGrupoPatologia])
REFERENCES [dbo].[GrupoPatologia] ([IdGrupoPatologia])
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia] CHECK CONSTRAINT [FK_PatologiaGrupoPatologia_GrupoPatologia]
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia]  WITH CHECK ADD  CONSTRAINT [FK_PatologiaGrupoPatologia_Patologia] FOREIGN KEY([IdPatologia])
REFERENCES [dbo].[Patologia] ([IdPatologia])
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia] CHECK CONSTRAINT [FK_PatologiaGrupoPatologia_Patologia]
GO
ALTER TABLE [dbo].[PerfilMenuItem]  WITH CHECK ADD  CONSTRAINT [FK_PerfilMenuItem_MenuItem] FOREIGN KEY([IdMenuItem])
REFERENCES [dbo].[MenuItem] ([IdMenuItem])
GO
ALTER TABLE [dbo].[PerfilMenuItem] CHECK CONSTRAINT [FK_PerfilMenuItem_MenuItem]
GO
ALTER TABLE [dbo].[PerfilMenuItem]  WITH CHECK ADD  CONSTRAINT [FK_PerfilMenuItem_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[PerfilMenuItem] CHECK CONSTRAINT [FK_PerfilMenuItem_Perfil]
GO
ALTER TABLE [dbo].[ProfesionalInstitucion]  WITH CHECK ADD  CONSTRAINT [FK_ProfesionalInstitucion_Institucion] FOREIGN KEY([IdInstitucion])
REFERENCES [dbo].[Institucion] ([IdInstitucion])
GO
ALTER TABLE [dbo].[ProfesionalInstitucion] CHECK CONSTRAINT [FK_ProfesionalInstitucion_Institucion]
GO
ALTER TABLE [dbo].[ProfesionalInstitucion]  WITH CHECK ADD  CONSTRAINT [FK_ProfesionalInstitucion_Profesional] FOREIGN KEY([IdProfesional])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ProfesionalInstitucion] CHECK CONSTRAINT [FK_ProfesionalInstitucion_Profesional]
GO
ALTER TABLE [dbo].[ProfesionalPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ProfesionalPaciente_EstadoProfesionalPaciente] FOREIGN KEY([IdEstadoProfesionalPaciente])
REFERENCES [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente])
GO
ALTER TABLE [dbo].[ProfesionalPaciente] CHECK CONSTRAINT [FK_ProfesionalPaciente_EstadoProfesionalPaciente]
GO
ALTER TABLE [dbo].[ProfesionalPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ProfesionalPaciente_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ProfesionalPaciente] CHECK CONSTRAINT [FK_ProfesionalPaciente_Paciente]
GO
ALTER TABLE [dbo].[ProfesionalPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ProfesionalPaciente_Profesional] FOREIGN KEY([IdProfesional])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ProfesionalPaciente] CHECK CONSTRAINT [FK_ProfesionalPaciente_Profesional]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Pais]
GO
ALTER TABLE [dbo].[RegistroDiario]  WITH CHECK ADD  CONSTRAINT [FK_RegistroDiario_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[RegistroDiario] CHECK CONSTRAINT [FK_RegistroDiario_Paciente]
GO
ALTER TABLE [dbo].[RegistroDiario]  WITH CHECK ADD  CONSTRAINT [FK_RegistroDiario_TipoEmocion] FOREIGN KEY([IdTipoEmocion])
REFERENCES [dbo].[TipoEmocion] ([IdTipoEmocion])
GO
ALTER TABLE [dbo].[RegistroDiario] CHECK CONSTRAINT [FK_RegistroDiario_TipoEmocion]
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta]  WITH CHECK ADD  CONSTRAINT [FK_RegistroDiarioRespuesta_Profesional] FOREIGN KEY([IdProfesional])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta] CHECK CONSTRAINT [FK_RegistroDiarioRespuesta_Profesional]
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta]  WITH CHECK ADD  CONSTRAINT [FK_RegistroDiarioRespuesta_RegistroDiario] FOREIGN KEY([IdRegistroDiario])
REFERENCES [dbo].[RegistroDiario] ([IdRegistroDiario])
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta] CHECK CONSTRAINT [FK_RegistroDiarioRespuesta_RegistroDiario]
GO
ALTER TABLE [dbo].[SeguimientoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_SeguimientoPaciente_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[SeguimientoPaciente] CHECK CONSTRAINT [FK_SeguimientoPaciente_Paciente]
GO
ALTER TABLE [dbo].[SeguimientoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_SeguimientoPaciente_Profesional] FOREIGN KEY([IdProfesional])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[SeguimientoPaciente] CHECK CONSTRAINT [FK_SeguimientoPaciente_Profesional]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([IdPerfil])
REFERENCES [dbo].[Perfil] ([IdPerfil])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
ALTER TABLE [dbo].[UsuarioInstitucion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioInstitucion_Institucion] FOREIGN KEY([IdInstitucion])
REFERENCES [dbo].[Institucion] ([IdInstitucion])
GO
ALTER TABLE [dbo].[UsuarioInstitucion] CHECK CONSTRAINT [FK_UsuarioInstitucion_Institucion]
GO
ALTER TABLE [dbo].[UsuarioInstitucion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioInstitucion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioInstitucion] CHECK CONSTRAINT [FK_UsuarioInstitucion_Usuario]
GO
USE [master]
GO
ALTER DATABASE [Luna] SET  READ_WRITE 
GO
