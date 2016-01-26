CREATE TABLE [dbo].[ParametrizacionGrupos] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [Insutipo] VARCHAR (30) NULL,
    [Proyecto] VARCHAR (6)  NULL,
    CONSTRAINT [PK_ParametrizacionGrupos] PRIMARY KEY CLUSTERED ([Id] ASC)
);

