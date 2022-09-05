USE [Yana]
GO
/****** Object:  Table [dbo].[DomicilioUsuario]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoNotificacion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoNotificacion](
	[IdEstadoNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_EstadoNotificacion_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_EstadoNotificacion_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_EstadoNotificacion] PRIMARY KEY CLUSTERED 
(
	[IdEstadoNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoProfesionalPaciente]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoProfesionalPaciente](
	[IdEstadoProfesionalPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](20) NULL,
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_EstadoProfesionalPaciente_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_EstadoProfesionalPaciente_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_EstadoProfesionalPaciente] PRIMARY KEY CLUSTERED 
(
	[IdEstadoProfesionalPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GrupoFamiliar]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GrupoNotificacion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GrupoPatologia]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Institucion](
	[IdInstitucion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[IdInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuItem](
	[IdMenuItem] [int] IDENTITY(1,1) NOT NULL,
	[IdParent] [int] NULL,
	[Nivel] [int] NULL,
	[Orden] [int] NULL,
	[Descripcion] [varchar](100) NULL,
	[Controller] [varchar](50) NULL,
	[Accion] [varchar](50) NULL,
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_MenuItem_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_MenuItem_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[IdMenuItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Metrica]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacion](
	[IdNotificacion] [int] IDENTITY(1,1) NOT NULL,
	[IdProfesional] [int] NULL,
	[IdPaciente] [int] NULL,
	[Mensaje] [nchar](10) NULL,
	[FechaHora] [datetime] NULL,
	[IdEstadoNotificacion] [int] NULL,
	[IdGrupoNotificacion] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Notificacion] PRIMARY KEY CLUSTERED 
(
	[IdNotificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificacionOpcion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotificacionRespuesta]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PacientePatologia]    Script Date: 28/9/2019 7:32:37 p. m. ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parentesco]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patologia]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatologiaGrupoPatologia]    Script Date: 28/9/2019 7:32:37 p. m. ******/
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
/****** Object:  Table [dbo].[Perfil]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_Perfil_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_Perfil_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PerfilMenuItem]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilMenuItem](
	[IdPerfilMenuItem] [int] IDENTITY(1,1) NOT NULL,
	[IdPerfil] [int] NOT NULL,
	[IdMenuItem] [int] NOT NULL,
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_PerfilMenuItem_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_PerfilMenuItem_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_PerfilesItems] PRIMARY KEY CLUSTERED 
(
	[IdPerfilMenuItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfesionalInstitucion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
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
/****** Object:  Table [dbo].[ProfesionalPaciente]    Script Date: 28/9/2019 7:32:37 p. m. ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroDiario]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[EmocionesResultado] [int] NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_RegistroDiario] PRIMARY KEY CLUSTERED 
(
	[IdRegistroDiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistroDiarioRespuesta]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeguimientoPaciente]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDomicilio]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDomicilio](
	[IdTipoDomicilio] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_TipoDomicilio_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_TipoDomicilio_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_TipoDomicilio] PRIMARY KEY CLUSTERED 
(
	[IdTipoDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEmocion]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[BajaLogica] [bit] NOT NULL CONSTRAINT [DF_Usuario_BajaLogica]  DEFAULT ((0)),
	[FechaModificacion] [datetime] NOT NULL CONSTRAINT [DF_Usuario_FechaModificacion]  DEFAULT (getdate()),
	[IdUsuarioModificacion] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF

/*
GO
SET IDENTITY_INSERT [dbo].[EstadoNotificacion] ON 

GO
INSERT [dbo].[EstadoNotificacion] ([IdEstadoNotificacion], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Pendiente', 0, CAST(N'2019-09-28 19:09:24.790' AS DateTime), 1)
GO
INSERT [dbo].[EstadoNotificacion] ([IdEstadoNotificacion], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Respondida', 0, CAST(N'2019-09-28 19:09:24.793' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[EstadoNotificacion] OFF
*/


/*
GO
SET IDENTITY_INSERT [dbo].[EstadoProfesionalPaciente] ON 

GO
INSERT [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Activo', 0, CAST(N'2019-09-28 19:06:16.470' AS DateTime), 1)
GO
INSERT [dbo].[EstadoProfesionalPaciente] ([IdEstadoProfesionalPaciente], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Inactivo', 0, CAST(N'2019-09-28 19:06:16.470' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[EstadoProfesionalPaciente] OFF
*/


GO
SET IDENTITY_INSERT [dbo].[MenuItem] ON 

GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, NULL, 0, 1, N'Inicio', N'Home', N'Default', 0, CAST(N'2019-09-28 18:32:45.623' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, NULL, 0, 2, N'Administracion', NULL, NULL, 0, CAST(N'2019-09-28 18:32:45.627' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, 2, 1, 1, N'Instituciones', N'Institucion', N'InstitucionList', 0, CAST(N'2019-09-28 18:32:45.630' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, 2, 1, 2, N'Patologias', N'Patologia', N'PatologiaList', 0, CAST(N'2019-09-28 18:32:45.633' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, 2, 1, 3, N'Psicólogos', N'Psicologos', N'PsicologosList', 0, CAST(N'2019-09-28 18:32:45.637' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (6, NULL, 0, 3, N'Seguimiento', NULL, NULL, 0, CAST(N'2019-09-28 18:32:45.637' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (7, 6, 1, 1, N'Pacientes', N'Paciente', N'PacienteList', 0, CAST(N'2019-09-28 18:32:45.640' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (8, 6, 1, 2, N'Notificaciones', N'Notificacion', N'NotificacionList', 0, CAST(N'2019-09-28 18:32:45.640' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (9, 6, 1, 3, N'Registro Diario', N'RegistroDiario', N'RegistroDiarioList', 0, CAST(N'2019-09-28 18:32:45.643' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (10, NULL, 0, 4, N'Estadísticas', NULL, NULL, 0, CAST(N'2019-09-28 18:32:45.643' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (11, 10, 1, 1, N'De Instituciones', NULL, NULL, 0, CAST(N'2019-09-28 18:32:45.647' AS DateTime), 1)
GO
INSERT [dbo].[MenuItem] ([IdMenuItem], [IdParent], [Nivel], [Orden], [Descripcion], [Controller], [Accion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (12, 10, 1, 2, N'De Pacientes', NULL, NULL, 0, CAST(N'2019-09-28 18:32:45.650' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[MenuItem] OFF


GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

GO
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Administrador', 0, CAST(N'2019-09-28 18:32:45.653' AS DateTime), 1)
GO
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Profesional', 0, CAST(N'2019-09-28 18:32:45.653' AS DateTime), 1)
GO
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, N'Paciente', 0, CAST(N'2019-09-28 18:32:45.657' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Perfil] OFF



GO
SET IDENTITY_INSERT [dbo].[PerfilMenuItem] ON 

GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, 1, 1, 0, CAST(N'2019-09-28 18:32:45.657' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, 1, 2, 0, CAST(N'2019-09-28 18:32:45.660' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, 1, 3, 0, CAST(N'2019-09-28 18:32:45.660' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (4, 1, 4, 0, CAST(N'2019-09-28 18:32:45.660' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (5, 1, 5, 0, CAST(N'2019-09-28 18:32:45.663' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (6, 1, 6, 0, CAST(N'2019-09-28 18:32:45.663' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (7, 1, 7, 0, CAST(N'2019-09-28 18:32:45.667' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (8, 1, 8, 0, CAST(N'2019-09-28 18:32:45.667' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (9, 1, 9, 0, CAST(N'2019-09-28 18:32:45.670' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (10, 1, 10, 0, CAST(N'2019-09-28 18:32:45.670' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (11, 1, 11, 0, CAST(N'2019-09-28 18:32:45.670' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (12, 1, 12, 0, CAST(N'2019-09-28 18:32:45.670' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (13, 2, 1, 0, CAST(N'2019-09-28 18:32:45.673' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (14, 2, 2, 0, CAST(N'2019-09-28 18:32:45.673' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (15, 2, 4, 0, CAST(N'2019-09-28 18:32:45.673' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (16, 2, 6, 0, CAST(N'2019-09-28 18:32:45.677' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (17, 2, 7, 0, CAST(N'2019-09-28 18:32:45.677' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (18, 2, 8, 0, CAST(N'2019-09-28 18:32:45.680' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (19, 2, 9, 0, CAST(N'2019-09-28 18:32:45.680' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (20, 2, 10, 0, CAST(N'2019-09-28 18:32:45.680' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (21, 2, 12, 0, CAST(N'2019-09-28 18:32:45.683' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (22, 3, 1, 0, CAST(N'2019-09-28 18:32:45.683' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (23, 3, 6, 0, CAST(N'2019-09-28 18:32:45.687' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (24, 3, 8, 0, CAST(N'2019-09-28 18:32:45.687' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (25, 3, 9, 0, CAST(N'2019-09-28 18:32:45.687' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (26, 3, 10, 0, CAST(N'2019-09-28 18:32:45.690' AS DateTime), 0)
GO
INSERT [dbo].[PerfilMenuItem] ([IdPerfilMenuItem], [IdPerfil], [IdMenuItem], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (27, 3, 12, 0, CAST(N'2019-09-28 18:32:45.690' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[PerfilMenuItem] OFF

/*
GO
SET IDENTITY_INSERT [dbo].[TipoDomicilio] ON 

GO
INSERT [dbo].[TipoDomicilio] ([IdTipoDomicilio], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Particular', 0, CAST(N'2019-09-28 17:51:54.937' AS DateTime), 1)
GO
INSERT [dbo].[TipoDomicilio] ([IdTipoDomicilio], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Comercial', 0, CAST(N'2019-09-28 17:51:54.963' AS DateTime), 1)
GO
INSERT [dbo].[TipoDomicilio] ([IdTipoDomicilio], [Descripcion], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, N'Laboral', 0, CAST(N'2019-09-28 17:51:54.963' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[TipoDomicilio] OFF

*/


/*
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (1, N'Admin', N'Test', 32361717, N'1234-1234', N'1234-1234', N'admin@gmail.com', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 0, CAST(N'2019-09-28 18:32:45.693' AS DateTime), 1)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (2, N'Pro', N'Test', 12312311, N'1234-1234', N'15-1234-1234', N'pro1@gmail.com', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 0, CAST(N'2019-09-28 18:32:45.693' AS DateTime), 1)
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [DNI], [TelefonoParticular], [Celular], [Email], [Password], [IdPerfil], [BajaLogica], [FechaModificacion], [IdUsuarioModificacion]) VALUES (3, N'Pac', N'Test', 1212312, N'1234-1234', N'15-1234-1234', N'pac1@gmail.com', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 3, 0, CAST(N'2019-09-28 18:32:45.693' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF

*/


GO
ALTER TABLE [dbo].[DomicilioUsuario] ADD  CONSTRAINT [DF_DomicilioUsuario_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[DomicilioUsuario] ADD  CONSTRAINT [DF_DomicilioUsuario_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[GrupoFamiliar] ADD  CONSTRAINT [DF_GrupoFamiliar_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[GrupoFamiliar] ADD  CONSTRAINT [DF_GrupoFamiliar_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[GrupoNotificacion] ADD  CONSTRAINT [DF_GrupoNotificacion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[GrupoNotificacion] ADD  CONSTRAINT [DF_GrupoNotificacion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[GrupoPatologia] ADD  CONSTRAINT [DF_GrupoPatologia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[GrupoPatologia] ADD  CONSTRAINT [DF_GrupoPatologia_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [DF_Institucion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Institucion] ADD  CONSTRAINT [DF_Institucion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Localidad] ADD  CONSTRAINT [DF_Localidad_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Localidad] ADD  CONSTRAINT [DF_Localidad_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Metrica] ADD  CONSTRAINT [DF_Metrica_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Metrica] ADD  CONSTRAINT [DF_Metrica_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Notificacion] ADD  CONSTRAINT [DF_Notificacion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Notificacion] ADD  CONSTRAINT [DF_Notificacion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[NotificacionOpcion] ADD  CONSTRAINT [DF_NotificacionOpcion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[NotificacionOpcion] ADD  CONSTRAINT [DF_NotificacionOpcion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[NotificacionRespuesta] ADD  CONSTRAINT [DF_NotificacionRespuesta_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[NotificacionRespuesta] ADD  CONSTRAINT [DF_NotificacionRespuesta_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[PacientePatologia] ADD  CONSTRAINT [DF_PacientePatologia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PacientePatologia] ADD  CONSTRAINT [DF_PacientePatologia_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Pais] ADD  CONSTRAINT [DF_Pais_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Pais] ADD  CONSTRAINT [DF_Pais_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Parentesco] ADD  CONSTRAINT [DF_Parentesco_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Parentesco] ADD  CONSTRAINT [DF_Parentesco_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Patologia] ADD  CONSTRAINT [DF_Patologia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Patologia] ADD  CONSTRAINT [DF_Patologia_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia] ADD  CONSTRAINT [DF_PatologiaGrupoPatologia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PatologiaGrupoPatologia] ADD  CONSTRAINT [DF_PatologiaGrupoPatologia_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[ProfesionalInstitucion] ADD  CONSTRAINT [DF_ProfesionalInstitucion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ProfesionalInstitucion] ADD  CONSTRAINT [DF_ProfesionalInstitucion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[ProfesionalPaciente] ADD  CONSTRAINT [DF_ProfesionalPaciente_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ProfesionalPaciente] ADD  CONSTRAINT [DF_ProfesionalPaciente_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF_Provincia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF_Provincia_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[RegistroDiario] ADD  CONSTRAINT [DF_RegistroDiario_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[RegistroDiario] ADD  CONSTRAINT [DF_RegistroDiario_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta] ADD  CONSTRAINT [DF_RegistroDiarioRespuesta_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[RegistroDiarioRespuesta] ADD  CONSTRAINT [DF_RegistroDiarioRespuesta_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[SeguimientoPaciente] ADD  CONSTRAINT [DF_SeguimientoPaciente_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[SeguimientoPaciente] ADD  CONSTRAINT [DF_SeguimientoPaciente_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
GO
ALTER TABLE [dbo].[TipoEmocion] ADD  CONSTRAINT [DF_TipoEmocion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TipoEmocion] ADD  CONSTRAINT [DF_TipoEmocion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
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
/****** Object:  StoredProcedure [dbo].[GetMenuItemsByIdUsuario]    Script Date: 28/9/2019 7:32:37 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[GetMenuItemsByIdUsuario]
	@IdUsuario INT
AS

SELECT i.IdMenuItem, i.Orden, i.IdParent, i.Nivel, i.Descripcion, i.Controller, i.Accion,
	case 
		when nivel = 0 then CONVERT(VARCHAR, i.Orden)
		when nivel = 1 then CONVERT(VARCHAR, (SELECT Orden FROM MenuItem WHERE IdMenuItem = i.IdParent)) + '-' + CONVERT(VARCHAR, i.Orden)
	end Orden2
FROM Usuario u 
	INNER JOIN Perfil p ON p.IdPerfil = u.IdPerfil AND p.BajaLogica = 0
	INNER JOIN PerfilMenuItem perfitems ON p.IdPerfil = perfitems.IdPerfil AND perfitems.BajaLogica = 0
	INNER JOIN MenuItem i ON i.IdMenuItem = perfitems.IdMenuItem AND i.BajaLogica = 0
WHERE u.IdUsuario = @IdUsuario
	 AND u.BajaLogica = 0
ORDER BY IdMenuItem ASC
GO



/* SCRIPT 2 */

--Agregado de relación para obtener datos del parent para orden

ALTER TABLE [dbo].[MenuItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuItem_Parent] FOREIGN KEY([IdParent])
REFERENCES [dbo].[MenuItem] ([IdMenuItem])
GO

ALTER TABLE [dbo].[MenuItem] CHECK CONSTRAINT [FK_MenuItem_Parent]
GO

--------------------------------------------------------------------------------------------------------------

/****** Object:  Table [dbo].[EarlyAdopter]    Script Date: 13/10/2019 11:54:55 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
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

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[EarlyAdopter] ADD  CONSTRAINT [DF_EarlyAdopter_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO



/* SCRIPT 3 */

ALTER TABLE EarlyAdopter ALTER COLUMN TipoEarlyAdopter INT NOT NULL
GO


/* SCRIPT 6 */

alter table Notificacion alter column Mensaje varchar(max)
go


/* SCRIPT 7 */

sp_rename 'RegistroDiario.EmocionesResultado', 'IdTipoEmocionResultado', 'COLUMN'
GO

ALTER TABLE [dbo].[RegistroDiario]  WITH CHECK ADD  CONSTRAINT [FK_RegistroDiario_TipoEmocionResultado] FOREIGN KEY([IdTipoEmocionResultado])
REFERENCES [dbo].[TipoEmocion] ([IdTipoEmocion])
GO

ALTER TABLE [dbo].[RegistroDiario] CHECK CONSTRAINT [FK_RegistroDiario_TipoEmocionResultado]
GO


/* SCRIPT 8 */

/****** Object:  Table [dbo].[RegistroNewsletter]    Script Date: 28/10/2019 1:04:59 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
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

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RegistroNewsletter] ADD  CONSTRAINT [DF_RegistroNewsletter_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO



/* SCRIPT 9 */
update MenuItem set Descripcion = 'Listado de Instituciones' where IdMenuItem = 3
GO

insert into Perfil values ('Institución', 0, getdate(), 1)
go

insert into PerfilMenuItem values (4, 1, 0, getdate(), 1)
go

insert into PerfilMenuItem values (4, 2, 0, getdate(), 1)
go

insert into PerfilMenuItem values (4, 5, 0, getdate(), 1)
go

insert into MenuItem values (10, 1, 3, 'De Psicólogos', null, null, 0, getdate(), 1)
go

insert into PerfilMenuItem values (1, 13, 0, getdate(), 1)
go

insert into PerfilMenuItem values (4, 13, 0, getdate(), 1)
go

insert into MenuItem values (2, 1, 4, 'Instituciones', 'InstitucionUser', 'InstitucionUserList', 0, getdate(), 1)
go

insert into PerfilMenuItem values (1, 14, 0, getdate(), 1)
go


update MenuItem set Descripcion = 'Usuarios Psicólogos' where IdMenuItem = 5
GO

update MenuItem set Descripcion = 'Usuarios Institución' where IdMenuItem = 14
GO

delete from PerfilMenuItem where IdPerfilMenuItem in (14, 15)
go

insert into PerfilMenuItem values (4, 10, 0, getdate(), 1)
go

insert into PerfilMenuItem values (4, 12, 0, getdate(), 1)
go

insert into PerfilMenuItem values (4, 13, 0, getdate(), 1)
go

insert into MenuItem values (6, 1, 4, 'Panel Notificaciones', 'Home', 'DashboardPaciente', 0, getdate(), 1)
go

insert into PerfilMenuItem values (3, 15, 0, getdate(), 1)
go

delete from PerfilMenuItem where IdPerfil = 3 and IdMenuItem = 8
GO

update MenuItem set Descripcion = 'Instituciones' where IdMenuItem = 3
go

update MenuItem set Controller = 'Psicologo', Accion = 'PsicologoList' where IdMenuItem = 5
go

update MenuItem set Controller = 'UsuarioInstitucion', Accion = 'UsuarioInstitucionList' where IdMenuItem = 14
go

update MenuItem set Controller = 'Home', Accion = 'DashboardProfesional' where IdMenuItem IN (11, 12, 13)
go


/* SCRIPT 10 */
/****** Object:  Table [dbo].[UsuarioInstitucion]    Script Date: 25/11/2019 10:22:45 p. m. ******/
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

ALTER TABLE [dbo].[UsuarioInstitucion] ADD  CONSTRAINT [DF_UsuarioInstitucion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO

ALTER TABLE [dbo].[UsuarioInstitucion] ADD  CONSTRAINT [DF_UsuarioInstitucion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]
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



/* SCRIPT 11 */
delete from PerfilMenuItem where IdMenuItem = 8


/* SCRIPT 12 */
update MenuItem set Controller = 'Paciente' where IdMenuItem = 15


/* SCRIPT 13 */

/*insert into EstadoNotificacion values('Respondida', 0, getdate(), 1)
go

insert into EstadoNotificacion values('Vencida', 0, getdate(), 1)
go*/


/* SCRIPT 14 */

alter table Notificacion add EsTipoEstadoEmocional BIT NOT NULL DEFAULT(0)
GO

alter table Usuario add FechaNacimiento datetime null
GO

alter table Usuario add Sexo CHAR(1) NULL
GO

/* SCRIPT 15 */


delete from PerfilMenuItem where IdMenuItem = 9 and IdPerfil in (1, 2)

update MenuItem set Descripcion = 'Gráficos Seguimiento' where IdMenuItem = 12
go

delete from PerfilMenuItem where IdMenuItem in (11, 13)
go

update MenuItem set Accion = 'GraficosSeguimiento' where IdMenuItem = 12
go
