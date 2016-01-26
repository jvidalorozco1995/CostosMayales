CREATE TABLE [dbo].[Areas] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [Proyecto]           VARCHAR (6)     NULL,
    [NombreObra]         VARCHAR (250)   NULL,
    [CodigoObraInmueble] VARCHAR (20)    NULL,
    [CodigoBloque]       VARCHAR (20)    NULL,
    [NombreManzana]      VARCHAR (80)    NULL,
    [CodigoInmueble]     VARCHAR (20)    NULL,
    [ValorVenta]         DECIMAL (18, 2) NULL,
    [Area]               DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED ([Id] ASC)
);

