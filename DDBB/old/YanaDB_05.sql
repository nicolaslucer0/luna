

update RegistroDiario set BajaLogica = 1, FechaModificacion = getdate() where IdRegistroDiario in (6, 8, 9)
GO