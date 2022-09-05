
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
