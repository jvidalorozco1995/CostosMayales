CREATE TABLE [dbo].[ParametrizacionExcluida] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [Proyecto]           VARCHAR (6)     NULL,
    [NombreObra]         VARCHAR (250)   NULL,
    [CodigoObraInmueble] VARCHAR (20)    NULL,
    [Nviviendas]         INT             NULL,
    [Vlrproy]            DECIMAL (18, 2) NULL,
    [Area]               DECIMAL (18, 2) NULL,
    [Clasificacion]      INT             NULL,
    [Estado]             INT             NULL,
    CONSTRAINT [PK_Parametrizacion_Exclusiva] PRIMARY KEY CLUSTERED ([Id] ASC)
);

