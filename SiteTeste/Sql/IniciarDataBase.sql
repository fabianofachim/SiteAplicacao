USE [master]
GO
/****** Object:  Database [DbTeste]    Script Date: 04/04/2021 18:21:17 ******/
CREATE DATABASE [DbTeste]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbTeste', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbTeste.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbTeste_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbTeste_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbTeste] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbTeste].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbTeste] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbTeste] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbTeste] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbTeste] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbTeste] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbTeste] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbTeste] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbTeste] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbTeste] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbTeste] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbTeste] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbTeste] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbTeste] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbTeste] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbTeste] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbTeste] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbTeste] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbTeste] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbTeste] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbTeste] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbTeste] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbTeste] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbTeste] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbTeste] SET  MULTI_USER 
GO
ALTER DATABASE [DbTeste] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbTeste] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbTeste] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbTeste] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbTeste] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbTeste] SET QUERY_STORE = OFF
GO
USE [DbTeste]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](2) NULL,
	[Nome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logradouro]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logradouro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Logradouro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](200) NULL,
	[IdSexo] [int] NULL,
	[IdLogradouro] [int] NULL,
	[Endereco] [varchar](200) NULL,
	[Bairro] [varchar](50) NULL,
	[Cidade] [varchar](50) NULL,
	[IdUF] [int] NULL,
	[Rg] [varchar](50) NULL,
	[CPF] [varchar](50) NULL,
	[Telefone] [varchar](50) NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (2, N'AC', N'Acre')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (3, N'AL', N'Alagoas')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (4, N'AP', N'Amapá')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (5, N'AM', N'Amazonas')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (6, N'BA', N'Bahia')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (7, N'CE', N'Ceará')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (8, N'DF', N'Distrito Federal')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (9, N'ES', N'Espírito Santo')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (10, N'GO', N'Goiás')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (11, N'MA', N'Maranhão')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (12, N'MT', N'Mato Grosso')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (13, N'MS', N'Mato Grosso do Sul')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (14, N'MG', N'Minas Gerais')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (15, N'PA', N'Pará')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (16, N'PB', N'Paraíba')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (17, N'PR', N'Paraná')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (18, N'PE', N'Pernambuco')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (19, N'PI', N'Piauí')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (20, N'RJ', N'Rio de Janeiro')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (21, N'RN', N'Rio Grande do Norte')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (22, N'RS', N'Rio Grande do Sul')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (23, N'RO', N'Rondônia')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (24, N'RR', N'Roraima')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (25, N'SC', N'Santa Catarina')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (26, N'SP', N'São Paulo')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (27, N'SE', N'Sergipe')
GO
INSERT [dbo].[Estado] ([Id], [Codigo], [Nome]) VALUES (28, N'TO', N'Tocantins')
GO
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Logradouro] ON 
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (1, N'Acesso')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (2, N'Aeroporto')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (3, N'Alameda')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (4, N'Área Verde')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (5, N'Avenida')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (6, N'Balneário')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (7, N'Calçada')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (8, N'Chácara')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (9, N'Conjunto')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (10, N'Estrada')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (11, N'Elevada')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (12, N'Galeria')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (13, N'Granja')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (14, N'Jardim')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (15, N'Lagoa')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (16, N'Lago')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (17, N'Loteamento')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (18, N'Lote')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (19, N'Mercado')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (20, N'Praça')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (21, N'Parque')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (22, N'Porto')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (23, N'Quadra')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (24, N'Rua')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (25, N'Recreio')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (26, N'Recanto')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (27, N'Retiro')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (28, N'Rodovia')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (29, N'Sitio')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (30, N'Terminal')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (31, N'Travessa')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (32, N'Viaduto')
GO
INSERT [dbo].[Logradouro] ([Id], [Nome]) VALUES (33, N'Viela')
GO
SET IDENTITY_INSERT [dbo].[Logradouro] OFF
GO
SET IDENTITY_INSERT [dbo].[Sexo] ON 
GO
INSERT [dbo].[Sexo] ([Id], [Nome]) VALUES (1, N'Feminino')
GO
INSERT [dbo].[Sexo] ([Id], [Nome]) VALUES (2, N'Masculino')
GO
SET IDENTITY_INSERT [dbo].[Sexo] OFF
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_Estado] FOREIGN KEY([IdUF])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_Estado]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_Logradouro] FOREIGN KEY([IdLogradouro])
REFERENCES [dbo].[Logradouro] ([Id])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_Logradouro]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_Sexo] FOREIGN KEY([IdSexo])
REFERENCES [dbo].[Sexo] ([Id])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_Sexo]
GO
/****** Object:  StoredProcedure [dbo].[SPC_DEL_PESSOA]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_DEL_PESSOA]
(
	@Id	INT
)
AS
BEGIN TRY	
	DELETE FROM Pessoa WHERE Id = @Id;
	SELECT @Id As Id, 'Registro excluído com sucesso.' As Nome;
END TRY    
BEGIN CATCH    
	SELECT -1 As Id, 'Erro ao excluír o Registro.' As Nome;
END CATCH    







GO
/****** Object:  StoredProcedure [dbo].[SPC_INS_PESSOA]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_INS_PESSOA]
(
	@Nome			VARCHAR(200)
,	@IdSexo			INT
,	@IdLogradouro	INT	
,	@Endereco		VARCHAR(200)
,	@Bairro			VARCHAR(50)
,	@Cidade			VARCHAR(50)
,	@IdUF			INT
,	@Rg				VARCHAR(50)
,	@CPF			VARCHAR(50)
,	@Telefone		VARCHAR(50)
,	@Email			VARCHAR(150)
)
AS
BEGIN TRY
	DECLARE @Id INT;
	
	INSERT INTO
		Pessoa
	(
		Nome		
	,	IdSexo			
	,	IdLogradouro
	,	Endereco	
	,	Bairro			
	,	Cidade			
	,	IdUF		
	,	Rg				
	,	CPF				
	,	Telefone	
	,	Email		
	)
	VALUES
	(
		@Nome			
	,	@IdSexo			
	,	@IdLogradouro	
	,	@Endereco		
	,	@Bairro			
	,	@Cidade			
	,	@IdUF			
	,	@Rg				
	,	@CPF				
	,	@Telefone		
	,	@Email	
	);
	
	SET @Id = @@IDENTITY;

	SELECT @Id As Id, 'Registro atualizado com sucesso.' As Nome;
END TRY    
BEGIN CATCH    
	SELECT -1 As Id, 'Erro ao atualizar o Registro.' As Nome;
END CATCH    







GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_ESTADO]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_LISTA_ESTADO]
AS
	SELECT 
		Id
	,	Codigo + '-' + Nome  As Nome 
	FROM 
		Estado
	ORDER BY
		Nome;
GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_LOGRADOURO]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_LISTA_LOGRADOURO]
AS
	SELECT 
		Id
	,	Nome 
	FROM 
		Logradouro
	ORDER BY
		Nome;
GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_PESSOA]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_LISTA_PESSOA]
(
	@Id		INT
,	@IdSexo INT
,	@IdUF	INT
,	@Nome	VARCHAR(150)
)
AS
	SELECT 
		P.Id
	,	P.Nome
	,	P.IdSexo
	,	S.Nome			As NomeSexo
	,	P.IdLogradouro
	,	L.Nome			As NomeLogradouro
	,	P.Endereco
	,	P.Bairro
	,	P.Cidade
	,	P.IdUF
	,	E.Codigo	As SiglaEstado
	,	E.Nome		As NomeEstado
	,	P.Rg
	,	P.CPF
	,	P.Telefone
	,	P.Email
	FROM 
		Pessoa P WITH(NOLOCK)
	INNER JOIN
		Sexo S WITH(NOLOCK)
	ON	P.IdSexo = S.Id
	INNER JOIN
		Logradouro L WITH(NOLOCK)
	ON	P.IdLogradouro = L.Id
	INNER JOIN
		Estado E WITH(NOLOCK)
	ON	P.IdUF = E.Id
	WHERE
		(@Id	 Is Null OR P.Id = @Id)
	AND	(@IdSexo Is Null OR S.Id = @IdSexo)
	AND	(@IdUF   Is Null OR E.Id = @IdUF)
	AND	(@Nome   Is Null OR P.Nome LIKE '%' + @Nome + '%')
	ORDER BY
		P.Nome;
GO
/****** Object:  StoredProcedure [dbo].[SPC_LISTA_SEXO]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_LISTA_SEXO]
AS
	SELECT 
		Id
	,	Nome 
	FROM 
		Sexo
	ORDER BY
		Nome;
GO
/****** Object:  StoredProcedure [dbo].[SPC_UPD_PESSOA]    Script Date: 04/04/2021 18:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPC_UPD_PESSOA]
(
	@Id				INT
,	@Nome			VARCHAR(200)
,	@IdSexo			INT
,	@IdLogradouro	INT	
,	@Endereco		VARCHAR(200)
,	@Bairro			VARCHAR(50)
,	@Cidade			VARCHAR(50)
,	@IdUF			INT
,	@Rg				VARCHAR(50)
,	@CPF			VARCHAR(50)
,	@Telefone		VARCHAR(50)
,	@Email			VARCHAR(150)
)
AS
BEGIN TRY  
	UPDATE
		Pessoa
	SET
		Nome			= @Nome			
	,	IdSexo			= @IdSexo			
	,	IdLogradouro	= @IdLogradouro	
	,	Endereco		= @Endereco		
	,	Bairro			= @Bairro			
	,	Cidade			= @Cidade			
	,	IdUF			= @IdUF		
	,	Rg				= @Rg
	,	CPF				= @CPF
	,	Telefone		= @Telefone		
	,	Email			= @Email			
	WHERE
		Id = @Id;

	SELECT 1 As Id, 'Registro atualizado com sucesso.' As Nome;
END TRY    
BEGIN CATCH    
	SELECT -1 As Id, 'Erro ao atualizar o Registro.' As Nome;
END CATCH    







GO
USE [master]
GO
ALTER DATABASE [DbTeste] SET  READ_WRITE 
GO
