CREATE TABLE [dbo].[Error] (
    [Codigo]  INT            IDENTITY (1, 1) NOT NULL,
    [Mensaje] VARCHAR (2000) NULL,
    [Fecha]   DATETIME       CONSTRAINT [DF_Error_Fecha] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED ([Codigo] ASC)
);

