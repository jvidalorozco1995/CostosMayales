CREATE TABLE [dbo].[Proyectos] (
    [Codigo]       VARCHAR (4)   NOT NULL,
    [Proyecto]     VARCHAR (250) NULL,
    [Filtro]       VARCHAR (100) NULL,
    [FechaIniObra] DATETIME      NULL,
    [FechaFinObra] DATETIME      NULL,
    CONSTRAINT [PK_Proyectos] PRIMARY KEY CLUSTERED ([Codigo] ASC)
);

