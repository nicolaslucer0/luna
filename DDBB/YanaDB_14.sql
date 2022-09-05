
alter table Notificacion add EsTipoEstadoEmocional BIT NOT NULL DEFAULT(0)
GO

alter table Usuario add FechaNacimiento datetime null
GO

alter table Usuario add Sexo CHAR(1) NULL
GO

