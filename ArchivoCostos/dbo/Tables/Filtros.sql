CREATE TABLE [dbo].[Filtros] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Presupuesto] VARCHAR (10) NULL,
    [Unitario]    VARCHAR (50) NULL,
    [Stated]      INT          NULL,
    CONSTRAINT [PK_Filtros] PRIMARY KEY CLUSTERED ([Id] ASC)
);

