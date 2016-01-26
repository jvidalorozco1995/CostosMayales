CREATE TABLE [dbo].[InsumosIncluir] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [Presupuesto]       VARCHAR (50)  NULL,
    [NombrePresupuesto] VARCHAR (200) NULL,
    [Capitulo]          VARCHAR (50)  NULL,
    [NombreCapitulo]    VARCHAR (200) NULL,
    [Unitario]          VARCHAR (50)  NULL,
    [NombreUnitario]    VARCHAR (200) NULL,
    [Insumo]            VARCHAR (50)  NULL,
    [NombreInsumo]      VARCHAR (200) NULL,
    CONSTRAINT [PK_InsumosIncluir] PRIMARY KEY CLUSTERED ([Id] ASC)
);

