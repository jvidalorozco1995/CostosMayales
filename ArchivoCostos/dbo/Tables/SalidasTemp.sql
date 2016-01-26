CREATE TABLE [dbo].[SalidasTemp] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [referencia]  VARCHAR (20)    NULL,
    [fecha]       DATETIME        NULL,
    [liquidacion] VARCHAR (8)     NULL,
    [valeconsumo] VARCHAR (8)     NULL,
    [salida]      VARCHAR (8)     NULL,
    [tiposa]      CHAR (1)        NULL,
    [codcapi]     VARCHAR (6)     NULL,
    [codunita]    VARCHAR (6)     NULL,
    [codinsum]    VARCHAR (6)     NULL,
    [insumo]      VARCHAR (250)   NULL,
    [cant]        DECIMAL (20, 2) NULL,
    [costsali]    DECIMAL (20, 2) NULL,
    [saliobse]    VARCHAR (250)   NULL,
    [saliusua]    VARCHAR (50)    NULL,
    [IdFecha]     INT             NULL,
    CONSTRAINT [PK_Salidas] PRIMARY KEY CLUSTERED ([Id] ASC)
);

