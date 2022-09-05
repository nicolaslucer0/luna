
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

insert into Usuario values ('Institución 1', 'Institución 1', '', '', '', 'ins1@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 4, 0, getdate(), 1)
go

update Usuario set Nombre = 'Usuario Institucion 1', Apellido = 'Usuario Institucion 1' where Email = 'ins1@gmail.com'

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

