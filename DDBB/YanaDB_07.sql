

sp_rename 'RegistroDiario.EmocionesResultado', 'IdTipoEmocionResultado', 'COLUMN'
GO

ALTER TABLE [dbo].[RegistroDiario]  WITH CHECK ADD  CONSTRAINT [FK_RegistroDiario_TipoEmocionResultado] FOREIGN KEY([IdTipoEmocionResultado])
REFERENCES [dbo].[TipoEmocion] ([IdTipoEmocion])
GO

ALTER TABLE [dbo].[RegistroDiario] CHECK CONSTRAINT [FK_RegistroDiario_TipoEmocionResultado]
GO
