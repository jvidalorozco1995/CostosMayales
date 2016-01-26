CREATE TABLE [dbo].[Referencias] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Referencia] VARCHAR (200) NULL,
    CONSTRAINT [PK_Referencias] PRIMARY KEY CLUSTERED ([Id] ASC)
);

