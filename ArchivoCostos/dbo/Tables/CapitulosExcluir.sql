CREATE TABLE [dbo].[CapitulosExcluir] (
    [Capitulo]          VARCHAR (50)  NULL,
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Presupuesto]       VARCHAR (50)  NULL,
    [NombrePresupuesto] VARCHAR (200) NULL,
    [NombreCapitulo]    VARCHAR (200) NULL,
    CONSTRAINT [PK_CapitulosExcluir] PRIMARY KEY CLUSTERED ([Id] ASC)
);

