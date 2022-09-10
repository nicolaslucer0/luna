
update EstadoNotificacion set Descripcion = 'Entregada' where IdEstadoNotificacion = 2
insert into EstadoNotificacion values('Respondida', 0, getdate(), 1)
insert into EstadoNotificacion values('Vencida', 0, getdate(), 1)