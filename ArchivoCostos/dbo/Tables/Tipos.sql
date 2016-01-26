CREATE TABLE [dbo].[Tipos] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Tipo] VARCHAR (150) NULL,
    CONSTRAINT [PK_Tipos] PRIMARY KEY CLUSTERED ([Id] ASC)
);

