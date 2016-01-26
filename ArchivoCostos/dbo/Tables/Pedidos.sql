CREATE TABLE [dbo].[Pedidos] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [referencia1] VARCHAR (20)    NULL,
    [codcapi]     VARCHAR (8)     NULL,
    [codunit]     VARCHAR (8)     NULL,
    [codinsu]     VARCHAR (8)     NULL,
    [fecha]       DATETIME        NULL,
    [pedido]      VARCHAR (8)     NULL,
    [ped]         DECIMAL (20, 2) NULL,
    [aprob]       DECIMAL (20, 2) NULL,
    [comp]        DECIMAL (20, 2) NULL,
    [xgenorden]   DECIMAL (20, 2) NULL,
    [orden]       VARCHAR (8)     NULL,
    [usuario]     VARCHAR (8)     NULL,
    [IdFecha]     INT             NULL,
    CONSTRAINT [PK_Pedidos2] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Pedidos_Fechas1] FOREIGN KEY ([IdFecha]) REFERENCES [dbo].[Fechas] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);

