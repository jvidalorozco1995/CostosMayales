CREATE TABLE [dbo].[Fechas] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [Fecha]    DATETIME     NULL,
    [Proyecto] VARCHAR (6)  NULL,
    [Tipo]     VARCHAR (20) NULL,
    CONSTRAINT [PK_Fechas] PRIMARY KEY CLUSTERED ([Id] ASC)
);

