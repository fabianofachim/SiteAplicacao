USE [DbTeste]
GO
/****** Object:  Table [dbo].[Contato]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contato](
	[IdContato] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[Telefone] [varchar](150) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[TipoContato] [int] NOT NULL,
 CONSTRAINT [PK_Contato] PRIMARY KEY CLUSTERED 
(
	[IdContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoContato]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoContato](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoContato] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contato] ON 
GO
INSERT [dbo].[Contato] ([IdContato], [Nome], [Telefone], [Email], [TipoContato]) VALUES (22, N'teste', N'123', N'teste@gmail', 1)
GO
INSERT [dbo].[Contato] ([IdContato], [Nome], [Telefone], [Email], [TipoContato]) VALUES (24, N'fabiano2', N'(11) 98452-6565', N'fabiano@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Contato] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoContato] ON 
GO
INSERT [dbo].[TipoContato] ([Id], [Nome]) VALUES (1, N'Pai')
GO
INSERT [dbo].[TipoContato] ([Id], [Nome]) VALUES (2, N'Mae')
GO
INSERT [dbo].[TipoContato] ([Id], [Nome]) VALUES (3, N'Irmao')
GO
SET IDENTITY_INSERT [dbo].[TipoContato] OFF
GO
/****** Object:  StoredProcedure [dbo].[SPC_DEL_CONTATO]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_DEL_CONTATO]
(
	@IdContato	INT
)
AS
BEGIN TRY	
	DELETE FROM contato WHERE IdContato = @IdContato;
	SELECT @IdContato As Id, 'Registro excluído com sucesso.' As Nome;
END TRY    
BEGIN CATCH    
	SELECT -1 As Id, 'Erro ao excluír o Registro.' As Nome;
END CATCH    







GO
/****** Object:  StoredProcedure [dbo].[SPC_INS_CONTATO]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_INS_CONTATO]
(
		
	@Nome			VARCHAR(150)
,	@Telefone		VARCHAR(150)
,	@Email			VARCHAR(150)
,	@TipoContato	INT
)
AS
BEGIN TRY
	DECLARE @Id INT;
	
	INSERT INTO [dbo].[Contato]
           (
           [Nome]
           ,[Telefone]
           ,[Email]
           ,[TipoContato])
     VALUES
           (
           @Nome
           ,@Telefone
           ,@Email
           ,@TipoContato
	);
	
	SET @Id = @@IDENTITY;

	SELECT @Id As Id, 'Registro atualizado com sucesso.' As Nome;
END TRY    
BEGIN CATCH    
	SELECT -1 As Id, 'Erro ao atualizar o Registro.' As Nome;
END CATCH    







GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_CONTATO]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPC_LISTA_CONTATO]
(
	@IdContato		INT
   ,@TipoContato INT
,	@Nome	VARCHAR(150)
)
AS
	
	SELECT 
		IdContato
      ,Nome
      ,Telefone
      ,Email
      ,TipoContato as TpContato
  FROM DbTeste.dbo.Contato c WITH(NOLOCK)


	WHERE
		(@IdContato	 Is Null OR c.IdContato = @IdContato)
	AND	(@TipoContato Is Null OR c.TipoContato = @TipoContato)	
	AND	(@Nome   Is Null OR c.Nome LIKE '%' + @Nome + '%')
	ORDER BY
		c.Nome;
GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_CONTATO_VALIDA_TELEFONE]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[SPC_LISTA_CONTATO_VALIDA_TELEFONE]
(
	
	@Telefone	VARCHAR(150)
)
AS
	
	SELECT 
		IdContato
      ,Nome
      ,Telefone
      ,Email
      ,TipoContato
  FROM DbTeste.dbo.Contato c WITH(NOLOCK)


	WHERE
	c.telefone = @Telefone
	ORDER BY
		c.Nome;
GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_TIPO_CONTATO]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_LISTA_TIPO_CONTATO]
AS
	SELECT 
		Id
	,	nome 
	FROM 
		TIPOCONTATO
	ORDER BY
		nome ;
GO
/****** Object:  StoredProcedure [dbo].[SPC_UPD_CONTATO]    Script Date: 4/7/2021 4:50:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_UPD_CONTATO]
(
	@IdContato		INT
,	@Nome			VARCHAR(150)
,	@Telefone		VARCHAR(150)
,	@Email			VARCHAR(150)
,	@TipoContato	INT

)
AS
BEGIN TRY  
	UPDATE [dbo].[Contato]
   SET 
      [Nome] = @Nome
      ,[Telefone] = @Telefone
      ,[Email] = @Email
      ,[TipoContato] = @TipoContato
 WHERE IdContato = @IdContato;

	SELECT 1 As Id, 'Registro atualizado com sucesso.' As Nome;
END TRY    
BEGIN CATCH    
	SELECT -1 As Id, 'Erro ao atualizar o Registro.' As Nome;
END CATCH    







GO
