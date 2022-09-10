USE [Yana]

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
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


ALTER TABLE [dbo].[UsuarioInstitucion] ADD  CONSTRAINT [DF_UsuarioInstitucion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]

ALTER TABLE [dbo].[UsuarioInstitucion] ADD  CONSTRAINT [DF_UsuarioInstitucion_FechaModificacion]  DEFAULT (getdate()) FOR [FechaModificacion]

ALTER TABLE [dbo].[UsuarioInstitucion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioInstitucion_Institucion] FOREIGN KEY([IdInstitucion])
REFERENCES [dbo].[Institucion] ([IdInstitucion])

ALTER TABLE [dbo].[UsuarioInstitucion] CHECK CONSTRAINT [FK_UsuarioInstitucion_Institucion]

ALTER TABLE [dbo].[UsuarioInstitucion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioInstitucion_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])

ALTER TABLE [dbo].[UsuarioInstitucion] CHECK CONSTRAINT [FK_UsuarioInstitucion_Usuario]


