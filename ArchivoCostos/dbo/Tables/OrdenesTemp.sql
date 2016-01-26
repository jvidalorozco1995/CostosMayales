CREATE TABLE [dbo].[OrdenesTemp] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [Referencia1] VARCHAR (20)    NULL,
    [Presupuesto] VARCHAR (100)   NULL,
    [Cod_Unit]    VARCHAR (6)     NULL,
    [Unitario]    VARCHAR (100)   NULL,
    [Cod_Insumo]  VARCHAR (6)     NULL,
    [Insumo]      VARCHAR (100)   NULL,
    [Und]         VARCHAR (4)     NULL,
    [Comp]        DECIMAL (18, 8) NULL,
    [Ent]         DECIMAL (18, 8) NULL,
    [PorEnt]      DECIMAL (19, 8) NULL,
    [Fecha]       DATETIME        NULL,
    [Orden]       VARCHAR (8)     NULL,
    [Tipo]        CHAR (1)        NULL,
    [Cod_Prov]    VARCHAR (6)     NULL,
    [Proveedor]   VARCHAR (100)   NULL,
    [VlrUnita]    DECIMAL (20, 2) NULL,
    [CostEnt]     DECIMAL (20, 2) NULL,
    [Usuario]     VARCHAR (50)    NULL,
    [IdFecha]     INT             NULL,
    CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

