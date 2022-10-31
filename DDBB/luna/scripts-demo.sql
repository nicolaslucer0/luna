-- Yana.dbo.EarlyAdopter definition

-- Drop table

-- DROP TABLE Yana.dbo.EarlyAdopter;

CREATE TABLE Yana.dbo.EarlyAdopter (
	IdEarlyAdopter int IDENTITY(1,1) NOT NULL,
	Email varchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TipoEarlyAdopter varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FechaAlta datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT PK_EarlyAdopter PRIMARY KEY (IdEarlyAdopter)
);


-- Yana.dbo.EstadoNotificacion definition

-- Drop table

-- DROP TABLE Yana.dbo.EstadoNotificacion;

CREATE TABLE Yana.dbo.EstadoNotificacion (
	IdEstadoNotificacion int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_EstadoNotificacion PRIMARY KEY (IdEstadoNotificacion)
);


-- Yana.dbo.EstadoProfesionalPaciente definition

-- Drop table

-- DROP TABLE Yana.dbo.EstadoProfesionalPaciente;

CREATE TABLE Yana.dbo.EstadoProfesionalPaciente (
	IdEstadoProfesionalPaciente int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_EstadoProfesionalPaciente PRIMARY KEY (IdEstadoProfesionalPaciente)
);


-- Yana.dbo.GrupoNotificacion definition

-- Drop table

-- DROP TABLE Yana.dbo.GrupoNotificacion;

CREATE TABLE Yana.dbo.GrupoNotificacion (
	IdGrupoNotificacion int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_GrupoNotificacion PRIMARY KEY (IdGrupoNotificacion)
);


-- Yana.dbo.GrupoPatologia definition

-- Drop table

-- DROP TABLE Yana.dbo.GrupoPatologia;

CREATE TABLE Yana.dbo.GrupoPatologia (
	IdGrupoPatologia int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_GrupoPatologia PRIMARY KEY (IdGrupoPatologia)
);


-- Yana.dbo.Institucion definition

-- Drop table

-- DROP TABLE Yana.dbo.Institucion;

CREATE TABLE Yana.dbo.Institucion (
	IdInstitucion int IDENTITY(1,1) NOT NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	Password varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Email varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MainColor varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SecondaryColor varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FontColor varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Logourl varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Institucion PRIMARY KEY (IdInstitucion)
);


-- Yana.dbo.Metrica definition

-- Drop table

-- DROP TABLE Yana.dbo.Metrica;

CREATE TABLE Yana.dbo.Metrica (
	IdMetrica int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Metrica PRIMARY KEY (IdMetrica)
);


-- Yana.dbo.Pais definition

-- Drop table

-- DROP TABLE Yana.dbo.Pais;

CREATE TABLE Yana.dbo.Pais (
	IdPais int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Pais PRIMARY KEY (IdPais)
);


-- Yana.dbo.Parentesco definition

-- Drop table

-- DROP TABLE Yana.dbo.Parentesco;

CREATE TABLE Yana.dbo.Parentesco (
	IdParentesco int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Parentesco PRIMARY KEY (IdParentesco)
);


-- Yana.dbo.Patologia definition

-- Drop table

-- DROP TABLE Yana.dbo.Patologia;

CREATE TABLE Yana.dbo.Patologia (
	IdPatologia int IDENTITY(1,1) NOT NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripcion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Patologia PRIMARY KEY (IdPatologia)
);


-- Yana.dbo.Perfil definition

-- Drop table

-- DROP TABLE Yana.dbo.Perfil;

CREATE TABLE Yana.dbo.Perfil (
	IdPerfil int IDENTITY(1,1) NOT NULL,
	Nombre varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Perfiles PRIMARY KEY (IdPerfil)
);


-- Yana.dbo.RegistroNewsletter definition

-- Drop table

-- DROP TABLE Yana.dbo.RegistroNewsletter;

CREATE TABLE Yana.dbo.RegistroNewsletter (
	IdRegistroNewsletter int IDENTITY(1,1) NOT NULL,
	Nombre varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Email varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Mensaje varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaAlta datetime DEFAULT getdate() NOT NULL,
	CONSTRAINT PK_RegistroNewsletter PRIMARY KEY (IdRegistroNewsletter)
);


-- Yana.dbo.TipoDomicilio definition

-- Drop table

-- DROP TABLE Yana.dbo.TipoDomicilio;

CREATE TABLE Yana.dbo.TipoDomicilio (
	IdTipoDomicilio int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_TipoDomicilio PRIMARY KEY (IdTipoDomicilio)
);


-- Yana.dbo.TipoEmocion definition

-- Drop table

-- DROP TABLE Yana.dbo.TipoEmocion;

CREATE TABLE Yana.dbo.TipoEmocion (
	IdTipoEmocion int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_TipoEmocion PRIMARY KEY (IdTipoEmocion)
);


-- Yana.dbo.MenuItem definition

-- Drop table

-- DROP TABLE Yana.dbo.MenuItem;

CREATE TABLE Yana.dbo.MenuItem (
	IdMenuItem int IDENTITY(1,1) NOT NULL,
	IdParent int NULL,
	Nivel int NULL,
	Orden int NULL,
	Descripcion varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Controller varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Accion varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Items PRIMARY KEY (IdMenuItem),
	CONSTRAINT FK_MenuItem_Parent FOREIGN KEY (IdParent) REFERENCES Yana.dbo.MenuItem(IdMenuItem)
);


-- Yana.dbo.PatologiaGrupoPatologia definition

-- Drop table

-- DROP TABLE Yana.dbo.PatologiaGrupoPatologia;

CREATE TABLE Yana.dbo.PatologiaGrupoPatologia (
	IdPatologiaGrupoPatologia int IDENTITY(1,1) NOT NULL,
	IdPatologia int NULL,
	IdGrupoPatologia int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_PatologiaGrupoPatologia PRIMARY KEY (IdPatologiaGrupoPatologia),
	CONSTRAINT FK_PatologiaGrupoPatologia_GrupoPatologia FOREIGN KEY (IdGrupoPatologia) REFERENCES Yana.dbo.GrupoPatologia(IdGrupoPatologia),
	CONSTRAINT FK_PatologiaGrupoPatologia_Patologia FOREIGN KEY (IdPatologia) REFERENCES Yana.dbo.Patologia(IdPatologia)
);


-- Yana.dbo.PerfilMenuItem definition

-- Drop table

-- DROP TABLE Yana.dbo.PerfilMenuItem;

CREATE TABLE Yana.dbo.PerfilMenuItem (
	IdPerfilMenuItem int IDENTITY(1,1) NOT NULL,
	IdPerfil int NOT NULL,
	IdMenuItem int NOT NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_PerfilesItems PRIMARY KEY (IdPerfilMenuItem),
	CONSTRAINT FK_PerfilMenuItem_MenuItem FOREIGN KEY (IdMenuItem) REFERENCES Yana.dbo.MenuItem(IdMenuItem),
	CONSTRAINT FK_PerfilMenuItem_Perfil FOREIGN KEY (IdPerfil) REFERENCES Yana.dbo.Perfil(IdPerfil)
);


-- Yana.dbo.Provincia definition

-- Drop table

-- DROP TABLE Yana.dbo.Provincia;

CREATE TABLE Yana.dbo.Provincia (
	IdProvincia int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdPais int NOT NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Provincia PRIMARY KEY (IdProvincia),
	CONSTRAINT FK_Provincia_Pais FOREIGN KEY (IdPais) REFERENCES Yana.dbo.Pais(IdPais)
);


-- Yana.dbo.Usuario definition

-- Drop table

-- DROP TABLE Yana.dbo.Usuario;

CREATE TABLE Yana.dbo.Usuario (
	IdUsuario int IDENTITY(1,1) NOT NULL,
	Nombre varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Apellido varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DNI int NULL,
	TelefonoParticular varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Celular varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Email varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Password varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdPerfil int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	FechaNacimiento datetime NULL,
	Sexo char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ImageUrl varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_Usuario PRIMARY KEY (IdUsuario),
	CONSTRAINT FK_Usuario_Perfil FOREIGN KEY (IdPerfil) REFERENCES Yana.dbo.Perfil(IdPerfil)
);


-- Yana.dbo.UsuarioInstitucion definition

-- Drop table

-- DROP TABLE Yana.dbo.UsuarioInstitucion;

CREATE TABLE Yana.dbo.UsuarioInstitucion (
	IdUsuarioInstitucion int IDENTITY(1,1) NOT NULL,
	IdUsuario int NULL,
	IdInstitucion int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_UsuarioInstitucion PRIMARY KEY (IdUsuarioInstitucion),
	CONSTRAINT FK_UsuarioInstitucion_Institucion FOREIGN KEY (IdInstitucion) REFERENCES Yana.dbo.Institucion(IdInstitucion),
	CONSTRAINT FK_UsuarioInstitucion_Usuario FOREIGN KEY (IdUsuario) REFERENCES Yana.dbo.Usuario(IdUsuario)
);


-- Yana.dbo.GrupoFamiliar definition

-- Drop table

-- DROP TABLE Yana.dbo.GrupoFamiliar;

CREATE TABLE Yana.dbo.GrupoFamiliar (
	IdGrupoFamiliar int IDENTITY(1,1) NOT NULL,
	IdPaciente int NULL,
	Nombre varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdParentesco int NULL,
	Observaciones varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_GrupoFamiliar PRIMARY KEY (IdGrupoFamiliar),
	CONSTRAINT FK_GrupoFamiliar_Paciente FOREIGN KEY (IdPaciente) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_GrupoFamiliar_Parentesco FOREIGN KEY (IdParentesco) REFERENCES Yana.dbo.Parentesco(IdParentesco)
);


-- Yana.dbo.Localidad definition

-- Drop table

-- DROP TABLE Yana.dbo.Localidad;

CREATE TABLE Yana.dbo.Localidad (
	IdLocalidad int IDENTITY(1,1) NOT NULL,
	Descripcion varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdProvincia int NOT NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_Localidad PRIMARY KEY (IdLocalidad),
	CONSTRAINT FK_Localidad_Provincia FOREIGN KEY (IdProvincia) REFERENCES Yana.dbo.Provincia(IdProvincia)
);


-- Yana.dbo.Notificacion definition

-- Drop table

-- DROP TABLE Yana.dbo.Notificacion;

CREATE TABLE Yana.dbo.Notificacion (
	IdNotificacion int IDENTITY(1,1) NOT NULL,
	IdProfesional int NULL,
	IdPaciente int NULL,
	Mensaje varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FechaHora datetime NULL,
	IdEstadoNotificacion int NULL,
	IdGrupoNotificacion int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	EsTipoEstadoEmocional bit DEFAULT 0 NOT NULL,
	CONSTRAINT PK_Notificacion PRIMARY KEY (IdNotificacion),
	CONSTRAINT FK_Notificacion_EstadoNotificacion FOREIGN KEY (IdEstadoNotificacion) REFERENCES Yana.dbo.EstadoNotificacion(IdEstadoNotificacion),
	CONSTRAINT FK_Notificacion_GrupoNotificacion FOREIGN KEY (IdGrupoNotificacion) REFERENCES Yana.dbo.GrupoNotificacion(IdGrupoNotificacion),
	CONSTRAINT FK_Notificacion_Paciente FOREIGN KEY (IdPaciente) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_Notificacion_Profesional FOREIGN KEY (IdProfesional) REFERENCES Yana.dbo.Usuario(IdUsuario)
);


-- Yana.dbo.NotificacionOpcion definition

-- Drop table

-- DROP TABLE Yana.dbo.NotificacionOpcion;

CREATE TABLE Yana.dbo.NotificacionOpcion (
	IdNotificacionOpcion int IDENTITY(1,1) NOT NULL,
	IdNotificacion int NULL,
	Descripcion varchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Orden int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_NotificacionOpcion PRIMARY KEY (IdNotificacionOpcion),
	CONSTRAINT FK_NotificacionOpcion_Notificacion FOREIGN KEY (IdNotificacion) REFERENCES Yana.dbo.Notificacion(IdNotificacion)
);


-- Yana.dbo.NotificacionRespuesta definition

-- Drop table

-- DROP TABLE Yana.dbo.NotificacionRespuesta;

CREATE TABLE Yana.dbo.NotificacionRespuesta (
	IdNotificacionRespuesta int IDENTITY(1,1) NOT NULL,
	IdNotificacion int NULL,
	IdNotificacionOpcion int NULL,
	Respuesta varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_NotificacionRespuesta PRIMARY KEY (IdNotificacionRespuesta),
	CONSTRAINT FK_NotificacionRespuesta_Notificacion FOREIGN KEY (IdNotificacion) REFERENCES Yana.dbo.Notificacion(IdNotificacion),
	CONSTRAINT FK_NotificacionRespuesta_NotificacionOpcion FOREIGN KEY (IdNotificacionOpcion) REFERENCES Yana.dbo.NotificacionOpcion(IdNotificacionOpcion)
);


-- Yana.dbo.PacientePatologia definition

-- Drop table

-- DROP TABLE Yana.dbo.PacientePatologia;

CREATE TABLE Yana.dbo.PacientePatologia (
	IdPacientePatologia int IDENTITY(1,1) NOT NULL,
	IdPaciente int NULL,
	IdPatologia int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_PacientePatologia PRIMARY KEY (IdPacientePatologia),
	CONSTRAINT FK_PacientePatologia_Paciente FOREIGN KEY (IdPaciente) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_PacientePatologia_Patologia FOREIGN KEY (IdPatologia) REFERENCES Yana.dbo.Patologia(IdPatologia)
);


-- Yana.dbo.ProfesionalInstitucion definition

-- Drop table

-- DROP TABLE Yana.dbo.ProfesionalInstitucion;

CREATE TABLE Yana.dbo.ProfesionalInstitucion (
	IdProfesionalInstitucion int IDENTITY(1,1) NOT NULL,
	IdProfesional int NULL,
	IdInstitucion int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_ProfesionalInstitucion PRIMARY KEY (IdProfesionalInstitucion),
	CONSTRAINT FK_ProfesionalInstitucion_Institucion FOREIGN KEY (IdInstitucion) REFERENCES Yana.dbo.Institucion(IdInstitucion),
	CONSTRAINT FK_ProfesionalInstitucion_Profesional FOREIGN KEY (IdProfesional) REFERENCES Yana.dbo.Usuario(IdUsuario)
);


-- Yana.dbo.ProfesionalPaciente definition

-- Drop table

-- DROP TABLE Yana.dbo.ProfesionalPaciente;

CREATE TABLE Yana.dbo.ProfesionalPaciente (
	IdProfesionalPaciente int IDENTITY(1,1) NOT NULL,
	IdProfesional int NULL,
	IdPaciente int NULL,
	IdEstadoProfesionalPaciente int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_ProfesionalPaciente PRIMARY KEY (IdProfesionalPaciente),
	CONSTRAINT FK_ProfesionalPaciente_EstadoProfesionalPaciente FOREIGN KEY (IdEstadoProfesionalPaciente) REFERENCES Yana.dbo.EstadoProfesionalPaciente(IdEstadoProfesionalPaciente),
	CONSTRAINT FK_ProfesionalPaciente_Paciente FOREIGN KEY (IdPaciente) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_ProfesionalPaciente_Profesional FOREIGN KEY (IdProfesional) REFERENCES Yana.dbo.Usuario(IdUsuario)
);


-- Yana.dbo.RegistroDiario definition

-- Drop table

-- DROP TABLE Yana.dbo.RegistroDiario;

CREATE TABLE Yana.dbo.RegistroDiario (
	IdRegistroDiario int IDENTITY(1,1) NOT NULL,
	IdPaciente int NULL,
	Situacion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MotivoSituacion varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdTipoEmocion int NULL,
	IntensidadEmocion int NULL,
	PensamientoAutomatico varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GradoCreenciaPensamientoAutomatico int NULL,
	RespuestaRacional varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GradoCreenciaRespuestaRacional int NULL,
	GradoCreenciaResultado int NULL,
	IdTipoEmocionResultado int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	seen bit NULL,
	CONSTRAINT PK_RegistroDiario PRIMARY KEY (IdRegistroDiario),
	CONSTRAINT FK_RegistroDiario_Paciente FOREIGN KEY (IdPaciente) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_RegistroDiario_TipoEmocion FOREIGN KEY (IdTipoEmocion) REFERENCES Yana.dbo.TipoEmocion(IdTipoEmocion)
);


-- Yana.dbo.RegistroDiarioRespuesta definition

-- Drop table

-- DROP TABLE Yana.dbo.RegistroDiarioRespuesta;

CREATE TABLE Yana.dbo.RegistroDiarioRespuesta (
	IdRegistroDiarioRespuesta int IDENTITY(1,1) NOT NULL,
	IdRegistroDiario int NULL,
	IdProfesional int NULL,
	Nota varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_RegistroDiarioRespuesta PRIMARY KEY (IdRegistroDiarioRespuesta),
	CONSTRAINT FK_RegistroDiarioRespuesta_Profesional FOREIGN KEY (IdProfesional) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_RegistroDiarioRespuesta_RegistroDiario FOREIGN KEY (IdRegistroDiario) REFERENCES Yana.dbo.RegistroDiario(IdRegistroDiario)
);


-- Yana.dbo.SeguimientoPaciente definition

-- Drop table

-- DROP TABLE Yana.dbo.SeguimientoPaciente;

CREATE TABLE Yana.dbo.SeguimientoPaciente (
	IdSeguimientoPaciente int IDENTITY(1,1) NOT NULL,
	IdProfesional int NULL,
	IdPaciente int NULL,
	Nota varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FechaAlta datetime NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_SeguimientoPaciente PRIMARY KEY (IdSeguimientoPaciente),
	CONSTRAINT FK_SeguimientoPaciente_Paciente FOREIGN KEY (IdPaciente) REFERENCES Yana.dbo.Usuario(IdUsuario),
	CONSTRAINT FK_SeguimientoPaciente_Profesional FOREIGN KEY (IdProfesional) REFERENCES Yana.dbo.Usuario(IdUsuario)
);


-- Yana.dbo.DomicilioUsuario definition

-- Drop table

-- DROP TABLE Yana.dbo.DomicilioUsuario;

CREATE TABLE Yana.dbo.DomicilioUsuario (
	IdDomicilioUsuario int IDENTITY(1,1) NOT NULL,
	IdUsuario int NULL,
	Calle varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Numero int NULL,
	Piso int NULL,
	Depto char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	EntreCalle1 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	EntreCalle2 varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Telefono1 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Telefono2 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Celular1 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Celular2 varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TelefonoEmergencia varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Observaciones varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	IdTipoDomicilio int NULL,
	IdLocalidad int NULL,
	BajaLogica bit DEFAULT 0 NOT NULL,
	FechaModificacion datetime DEFAULT getdate() NOT NULL,
	IdUsuarioModificacion int NOT NULL,
	CONSTRAINT PK_DomicilioUsuario PRIMARY KEY (IdDomicilioUsuario),
	CONSTRAINT FK_DomicilioUsuario_Localidad FOREIGN KEY (IdLocalidad) REFERENCES Yana.dbo.Localidad(IdLocalidad),
	CONSTRAINT FK_DomicilioUsuario_TipoDomicilio FOREIGN KEY (IdTipoDomicilio) REFERENCES Yana.dbo.TipoDomicilio(IdTipoDomicilio),
	CONSTRAINT FK_DomicilioUsuario_Usuario FOREIGN KEY (IdUsuario) REFERENCES Yana.dbo.Usuario(IdUsuario)
);



/* DATA */
INSERT INTO Yana.dbo.Perfil (Nombre,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Administrador',0,'2019-09-28 18:32:45.653',1),
	 (N'Profesional',0,'2019-09-28 18:32:45.653',1),
	 (N'Paciente',0,'2019-09-28 18:32:45.657',1),
	 (N'Institucion',0,'2022-09-10 15:08:29.827',1);

INSERT INTO Yana.dbo.Patologia (Nombre,Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Depresivos',N'Personas con depresividad crónica',0,'2022-10-20 21:59:38.08',1),
	 (N'Bipolares',N'Personas que cambian su humor constantemente de un momento a otro',0,'2022-10-20 22:00:45.193',1),
	 (N'Ciclotimicos',N'Es un trastorno mental. Es una forma leve del trastorno bipolar (enfermedad maniaco-depresiva), en la cual una persona tiene oscilaciones del estado de ánimo durante un período de años que van desde d',0,'2022-10-23 19:34:26.55',1),
	 (N'Trastornos de ansiedad',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos obseso-compulsivo',N'',1,'2022-10-20 22:07:07.317',1),
	 (N'Trastornos de ansiedad fobica',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos del animo',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos somatomorfos',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos disociativos',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos de la conducta alimentaria, sexuales, sue?o, etc',N'',0,'2022-09-10 15:10:47.863',1);
INSERT INTO Yana.dbo.Patologia (Nombre,Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Trastornos de ansiedad',N'',1,'2022-10-20 22:07:14.413',1),
	 (N'Ezquizofrenia',N'Es un trastorno mental que dificulta diferenciar lo que es real de lo que no. También dificulta pensar con claridad, tener respuestas emocionales normales y actuar de manera normal en situaciones soci',0,'2022-10-23 19:34:38.977',1),
	 (N'Trastornos ezquizofreniforme',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos ezquizoafectivo',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos delirante',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos psicotico breve',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos psicotico compartido (folie a deux)',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos psicotico por enfermedad medica',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos psicotico inducido por sustancias',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'Trastornos psicotico no especificado',N'',0,'2022-09-10 15:10:47.863',1);
INSERT INTO Yana.dbo.Patologia (Nombre,Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Trastornos paranoide de la personalidad',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'T.P. ezquizoide / ezquizotipico ',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'T.P. histrionico',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'T.P. narcisistica',N'El trastorno de personalidad narcisista (uno de varios tipos de trastornos de la personalidad) es un trastorno mental en el cual las personas tienen un sentido desmesurado de su propia importancia, un',0,'2022-10-23 19:35:24.623',1),
	 (N'T.P. antisocial',N'El trastorno de personalidad antisocial, a veces llamado sociopatía, es un trastorno mental en el cual una persona no demuestra discernimiento entre bien y mal e ignora los derechos y sentimientos de ',0,'2022-10-23 19:35:00.86',1),
	 (N'T.P. por evitacion / por dependencia',N'',0,'2022-09-10 15:10:47.863',1),
	 (N'T.P. obsesivo-compulsivo',N'El trastorno obsesivo-compulsivo (TOC) es una afección mental que consiste en presentar pensamientos (obsesiones) y rituales (compulsiones) una y otra vez. Estos interfieren con su vida, pero no puede',0,'2022-10-23 19:37:46.44',1),
	 (N'Depresivos',N'',1,'2022-10-20 22:03:48.483',1),
	 (N'Bipolares',N'',1,'2022-10-20 22:03:30.297',1),
	 (N'Ciclotimicos',N'',1,'2022-10-20 22:03:35.237',1);
INSERT INTO Yana.dbo.Patologia (Nombre,Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Trastornos de ansiedad',N'',1,'2022-10-20 22:08:12.92',1),
	 (N'Trastornos obsesivo-compulsivo',N'',0,'2022-09-10 15:11:16.6',1),
	 (N'Trastornos de ansiedad fobica',N'',1,'2022-10-20 22:05:14.71',1),
	 (N'Trastornos del animo',N'',1,'2022-10-20 22:06:18.13',1),
	 (N'Trastornos somatomorfos',N'',1,'2022-10-20 22:07:30.91',1),
	 (N'Trastornos disociativos',N'',1,'2022-10-20 22:06:41.5',1),
	 (N'Trastornos de la conducta alimentaria, sexuales, sue?o, etc',N'',1,'2022-10-20 22:05:54.913',1),
	 (N'Trastornos de ansiedad',N'',1,'2022-10-20 22:06:34.083',1),
	 (N'Ezquizofrenia',N'',1,'2022-10-20 22:03:53.297',1),
	 (N'Trastornos ezquizofreniforme',N'',0,'2022-09-10 15:11:16.6',1);
INSERT INTO Yana.dbo.Patologia (Nombre,Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Trastornos ezquizoafectivo',N'',1,'2022-10-20 22:07:20.68',1),
	 (N'Trastornos delirante',N'',1,'2022-10-20 22:06:24.417',1),
	 (N'Trastornos psicotico breve',N'',1,'2022-10-20 22:06:51.823',1),
	 (N'Trastornos psicotico compartido (folie a deux)',N'',1,'2022-10-20 22:07:56.273',1),
	 (N'Trastornos psicotico por enfermedad medica',N'',1,'2022-10-20 22:05:22.563',1),
	 (N'Trastornos psicotico inducido por sustancias',N'',1,'2022-10-20 22:07:39.047',1),
	 (N'Trastornos psicotico no especificado',N'',1,'2022-10-20 22:07:47.363',1),
	 (N'Trastornos paranoide de la personalidad',N'',1,'2022-10-20 22:07:00.52',1),
	 (N'T.P. ezquizoide / ezquizotipico ',N'',1,'2022-10-20 22:04:39.393',1),
	 (N'T.P. histrionico',N'',1,'2022-10-20 22:04:57.3',1);
INSERT INTO Yana.dbo.Patologia (Nombre,Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'T.P. narcisistica',N'',1,'2022-10-20 22:05:04.393',1),
	 (N'T.P. antisocial',N'',1,'2022-10-20 22:04:33.967',1),
	 (N'T.P. por evitacion / por dependencia',N'',0,'2022-09-10 15:11:16.6',1),
	 (N'T.P. obsesivo-compulsivo',N'',1,'2022-10-20 22:05:46.93',1),
	 (NULL,NULL,1,'2022-10-20 22:04:45.443',1),
	 (N'Hola',N'ajej',1,'2022-10-20 22:04:50.327',1),
	 (N'Patologia',N'Desripwer',1,'2022-10-20 22:05:40.56',1),
	 (NULL,NULL,1,'2022-10-20 22:04:15.383',1);

INSERT INTO Yana.dbo.Institucion (Nombre,BajaLogica,FechaModificacion,IdUsuarioModificacion,Password,Email,MainColor,SecondaryColor,FontColor,Logourl) VALUES
	 (N'UNLaM',0,'2022-10-20 18:27:16.073',1,NULL,NULL,N'#44b87e',N'#1eba79',N'#ffffff',N'https://seeklogo.com/images/U/unlam-universidad-nacional-de-la-matanza-logo-B665E562AA-seeklogo.com.png'),
	 (N'Insitucion de orden mental',0,'2022-10-19 16:47:35.997',1,NULL,NULL,N'#8a1616',N'#f5f5f5',N'#ffffff',N'https://upload.wikimedia.org/wikipedia/commons/1/1e/RPC-JP_Logo.png'),
	 (N'UAI',0,'2022-10-19 19:35:07.313',1,NULL,NULL,N'#ffffff',N'#f2f2f2',N'#850000',N'https://static.wixstatic.com/media/a7046d_8db80e67a33e4216bab447550167cb43~mv2.png/v1/fit/w_1000%2Ch_751%2Cal_c/file.png');

INSERT INTO Yana.dbo.Usuario (Nombre, Apellido, DNI, TelefonoParticular, Celular, Email, Password, IdPerfil, BajaLogica, FechaModificacion, IdUsuarioModificacion, FechaNacimiento, Sexo, ImageUrl)  VALUES 
	(N'Admin', N'Test', 32361717, N'1234-1234', N'1234-1234', N'admin@gmail.com', N'7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 0, '2019-09-28 18:32:45.693', 1, '2000-10-10 00:00:00.0', NULL, N'/img/user/female/1.png'), 
	(N'Nicolas', N'Lucero', 38026836, NULL, NULL, N'nicolas.lucero@redb.ee', N'24d31b360a6bb762d97d3d1d0daec3b6f8b229c8', 4, 0, '2022-10-19 16:27:58.247', 1, '2000-10-10 00:00:00.0', N'M', NULL), 
	(N'Ignacio', N'Baldo', 38026837, NULL, NULL, N'ignacio.baldo@gmail.com', N'4752acd659e7ed96ac617dc1e69a593051829995', 4, 0, '2022-10-24 09:58:17.82', 0, '2000-10-10 00:00:00.0', N'M', NULL), 
	(N'Camila', N'Minetti', 38026837, NULL, NULL, N'camila.minetti@gmail.com', N'4752acd659e7ed96ac617dc1e69a593051829995', 2, 0, '2022-10-20 22:23:30.967', 1, '2000-10-10 00:00:00.0', N'F', NULL), 
	(N'Sabrina', N'Casado', 38026836, NULL, NULL, N'sabrina.casado@gmail.com', N'24d31b360a6bb762d97d3d1d0daec3b6f8b229c8', 3, 0, '2022-10-23 18:16:15.273', 1, '2000-10-10 00:00:00.0', N'F', N'/img/user/female/2.png'), 
	(N'Gabriel', N'Cascallares', 38026835, NULL, NULL, N'gabriel.cascallares@gmail.com', N'd042ada3274e6434f9ed5448ad9dbd009b4587c3', 3, 0, '2022-10-20 00:40:15.423', 1049, '2000-10-10 00:00:00.0', N'M', N'/img/user/male/5.png'), 
	(N'Tomas', N'Nuñez', 11111111, NULL, NULL, N'tomas.nunez@gmail.com', N'a642a77abd7d4f51bf9226ceaf891fcbb5b299b8', 4, 0, '2022-10-19 19:36:47.12', 1, '2000-10-10 00:00:00.0', N'M', NULL), 
	(N'Juan', N'Perez', 22222222, NULL, NULL, N'juan.perez@gmail.com', N'f638e2789006da9bb337fd5689e37a265a70f359', 2, 0, '2022-10-19 19:38:18.49', 1052, '2000-10-10 00:00:00.0', N'M', NULL), 
	(N'Juan', N'Gomez', 12345678, NULL, NULL, N'asd@gmail.com', N'7c222fb2927d828af22f592134e8932480637c0d', 3, 0, '2022-10-23 19:33:31.097', 1, '2000-10-10 00:00:00.0', N'M', N'/img/user/male/3.png'), 
	(N'Federica', N'Vazquez', 12345679, NULL, NULL, N'fede.vaz@gmail.com', N'da39a3ee5e6b4b0d3255bfef95601890afd80709', 3, 0, '2022-10-23 18:16:26.82', 1, '1994-11-03 00:00:00.0', N'F', N'/img/user/female/4.png');

INSERT INTO Yana.dbo.EstadoProfesionalPaciente (Descripcion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (N'Activo',0,'2019-09-28 19:06:16.47',1),
	 (N'Inactivo',0,'2019-09-28 19:06:16.47',1);

INSERT INTO Yana.dbo.UsuarioInstitucion (IdUsuario,IdInstitucion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (1047,14,0,'2022-10-19 16:27:58.333',1),
	 (1048,15,0,'2022-10-24 09:58:17.913',0),
	 (1052,16,0,'2022-10-19 19:36:47.147',1);

INSERT INTO Yana.dbo.ProfesionalInstitucion (IdProfesional,IdInstitucion,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (1049,14,0,'2022-10-19 16:31:45.557',1047),
	 (1053,16,0,'2022-10-19 19:38:18.5',1052);

INSERT INTO Yana.dbo.ProfesionalPaciente (IdProfesional,IdPaciente,IdEstadoProfesionalPaciente,BajaLogica,FechaModificacion,IdUsuarioModificacion) VALUES
	 (1049,1050,1,0,'2022-10-19 17:00:14.64',1049),
	 (1049,1051,1,0,'2022-10-19 17:02:32.907',1049),
	 (1049,1054,1,0,'2022-10-20 01:23:49.477',1049);
