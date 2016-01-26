CREATE TABLE [dbo].[CapitulosIncluir] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Presupuesto]       VARCHAR (50)  NULL,
    [NombrePresupuesto] VARCHAR (200) NULL,
    [Capitulo]          VARCHAR (50)  NULL,
    [NombreCapitulo]    VARCHAR (200) NULL,
    CONSTRAINT [PK_CapitulosIncluir] PRIMARY KEY CLUSTERED ([Id] ASC)
);

