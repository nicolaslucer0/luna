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


