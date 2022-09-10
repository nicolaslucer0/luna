
update MenuItem set Descripcion = 'Listado de Instituciones' where IdMenuItem = 3
insert into Perfil values ('Instituci�n', 0, getdate(), 1)
insert into PerfilMenuItem values (4, 1, 0, getdate(), 1)
insert into PerfilMenuItem values (4, 2, 0, getdate(), 1)
insert into PerfilMenuItem values (4, 5, 0, getdate(), 1)
insert into MenuItem values (10, 1, 3, 'De Psic�logos', null, null, 0, getdate(), 1)
insert into PerfilMenuItem values (1, 13, 0, getdate(), 1)
insert into PerfilMenuItem values (4, 13, 0, getdate(), 1)
insert into MenuItem values (2, 1, 4, 'Instituciones', 'InstitucionUser', 'InstitucionUserList', 0, getdate(), 1)
insert into PerfilMenuItem values (1, 14, 0, getdate(), 1)
insert into Usuario values ('Instituci�n 1', 'Instituci�n 1', '', '', '', 'ins1@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 4, 0, getdate(), 1)
update Usuario set Nombre = 'Usuario Institucion 1', Apellido = 'Usuario Institucion 1' where Email = 'ins1@gmail.com'
update MenuItem set Descripcion = 'Usuarios Psic�logos' where IdMenuItem = 5
update MenuItem set Descripcion = 'Usuarios Instituci�n' where IdMenuItem = 14
delete from PerfilMenuItem where IdPerfilMenuItem in (14, 15)
insert into PerfilMenuItem values (4, 10, 0, getdate(), 1)
insert into PerfilMenuItem values (4, 12, 0, getdate(), 1)
insert into PerfilMenuItem values (4, 13, 0, getdate(), 1)
insert into MenuItem values (6, 1, 4, 'Panel Notificaciones', 'Home', 'DashboardPaciente', 0, getdate(), 1)
insert into PerfilMenuItem values (3, 15, 0, getdate(), 1)
delete from PerfilMenuItem where IdPerfil = 3 and IdMenuItem = 8
update MenuItem set Descripcion = 'Instituciones' where IdMenuItem = 3
update MenuItem set Controller = 'Psicologo', Accion = 'PsicologoList' where IdMenuItem = 5
update MenuItem set Controller = 'UsuarioInstitucion', Accion = 'UsuarioInstitucionList' where IdMenuItem = 14
update MenuItem set Controller = 'Home', Accion = 'DashboardProfesional' where IdMenuItem IN (11, 12, 13)

