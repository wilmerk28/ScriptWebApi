USE [master]
GO
/****** Object:  Database [BDClase]    Script Date: 03/03/2022 0:07:40 ******/
CREATE DATABASE [BDClase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDClase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EQUIPO\MSSQL\DATA\BDClase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDClase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.EQUIPO\MSSQL\DATA\BDClase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDClase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDClase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDClase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDClase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDClase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDClase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDClase] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDClase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDClase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDClase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDClase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDClase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDClase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDClase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDClase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDClase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDClase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDClase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDClase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDClase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDClase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDClase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDClase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDClase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDClase] SET RECOVERY FULL 
GO
ALTER DATABASE [BDClase] SET  MULTI_USER 
GO
ALTER DATABASE [BDClase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDClase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDClase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDClase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDClase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDClase', N'ON'
GO
ALTER DATABASE [BDClase] SET QUERY_STORE = OFF
GO
USE [BDClase]
GO
/****** Object:  User [desarrollo]    Script Date: 03/03/2022 0:07:40 ******/
CREATE USER [desarrollo] FOR LOGIN [desarrollo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[Ciclo] [char](2) NULL,
	[CreditosAprobados] [int] NULL,
	[CreditosDesaprobados] [int] NULL,
	[Situacion] [varchar](50) NULL,
	[Especialidad] [varchar](100) NULL,
	[IdEstado] [char](1) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumnoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoSeccion](
	[IdAlumnoSeccion] [int] IDENTITY(1,1) NOT NULL,
	[IdAlumno] [int] NULL,
	[IdSeccion] [int] NULL,
 CONSTRAINT [PK_CursoAlumno] PRIMARY KEY CLUSTERED 
(
	[IdAlumnoSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[NombreCurso] [varchar](100) NULL,
	[NumeroCreditos] [tinyint] NULL,
	[Condicion] [varchar](20) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoSeccion](
	[IdCursoSeccion] [int] IDENTITY(1,1) NOT NULL,
	[IdCurso] [int] NULL,
	[IdSeccion] [int] NULL,
	[IdProfesor] [int] NULL,
	[HoraInicio] [varchar](10) NULL,
	[HoraFin] [varchar](10) NULL,
 CONSTRAINT [PK_CursoSeccion] PRIMARY KEY CLUSTERED 
(
	[IdCursoSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[ApellidoPaterno] [varchar](100) NULL,
	[ApellidoMaterno] [varchar](100) NULL,
	[Nombres] [varchar](150) NULL,
	[IdDocumento] [char](1) NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Telefono] [varchar](20) NULL,
	[Correo] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[IdTipoPersona] [char](2) NULL,
	[IdEstado] [char](1) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NULL,
	[IdGrado] [char](3) NULL,
	[IdTipoContrato] [char](2) NULL,
	[Sueldo] [decimal](18, 2) NULL,
	[IdEstado] [char](1) NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seccion](
	[IdSeccion] [int] IDENTITY(1,1) NOT NULL,
	[NombreSeccion] [varchar](10) NULL,
	[CantidadAlumnos] [tinyint] NULL,
 CONSTRAINT [PK_Seccion] PRIMARY KEY CLUSTERED 
(
	[IdSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Persona]
GO
ALTER TABLE [dbo].[AlumnoSeccion]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoSeccion_Alumno] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumno] ([IdAlumno])
GO
ALTER TABLE [dbo].[AlumnoSeccion] CHECK CONSTRAINT [FK_AlumnoSeccion_Alumno]
GO
ALTER TABLE [dbo].[AlumnoSeccion]  WITH CHECK ADD  CONSTRAINT [FK_AlumnoSeccion_Seccion] FOREIGN KEY([IdSeccion])
REFERENCES [dbo].[Seccion] ([IdSeccion])
GO
ALTER TABLE [dbo].[AlumnoSeccion] CHECK CONSTRAINT [FK_AlumnoSeccion_Seccion]
GO
ALTER TABLE [dbo].[CursoSeccion]  WITH CHECK ADD  CONSTRAINT [FK_CursoSeccion_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[CursoSeccion] CHECK CONSTRAINT [FK_CursoSeccion_Curso]
GO
ALTER TABLE [dbo].[CursoSeccion]  WITH CHECK ADD  CONSTRAINT [FK_CursoSeccion_Profesor] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([IdProfesor])
GO
ALTER TABLE [dbo].[CursoSeccion] CHECK CONSTRAINT [FK_CursoSeccion_Profesor]
GO
ALTER TABLE [dbo].[CursoSeccion]  WITH CHECK ADD  CONSTRAINT [FK_CursoSeccion_Seccion] FOREIGN KEY([IdSeccion])
REFERENCES [dbo].[Seccion] ([IdSeccion])
GO
ALTER TABLE [dbo].[CursoSeccion] CHECK CONSTRAINT [FK_CursoSeccion_Seccion]
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Profesor_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [FK_Profesor_Persona]
GO
/****** Object:  StoredProcedure [dbo].[EditarAlumno]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarAlumno](
	@IdAlumno INT,
	@Ciclo CHAR(2),
	@CreditosAprobados INT,
	@CreditosDesaprobados INT,
	@Situacion VARCHAR(50),
	@Especialidad VARCHAR(100),
	@ApellidoPaterno VARCHAR(100),
	@ApellidoMaterno VARCHAR(100),
	@Nombres VARCHAR(150),
	@IdDocumento CHAR(1),
	@NumeroDocumento VARCHAR(20),
	@Telefono VARCHAR(20),
	@Correo VARCHAR(100),
	@Direccion VARCHAR(200),
	@IdTipoPersona char(2)
)
AS
BEGIN

		DECLARE @IdPersona INT

		SET @IdPersona = (SELECT IdPersona FROM Alumno WHERE IdAlumno = @IdAlumno)

		UPDATE Alumno
		SET
		Ciclo = @Ciclo,
		CreditosAprobados = @CreditosAprobados,
		CreditosDesaprobados = @CreditosDesaprobados,
		Situacion = @Situacion,
		Especialidad = @Especialidad
		WHERE IdAlumno = @IdAlumno

		UPDATE Persona
		SET 
			ApellidoPaterno = @ApellidoPaterno,
			ApellidoMaterno = @ApellidoMaterno,
			Nombres = @Nombres,
			IdDocumento = @IdDocumento,
			NumeroDocumento = @NumeroDocumento,
			Telefono = @Telefono,
			Direccion = @Direccion,
			IdTipoPersona = @IdTipoPersona
		WHERE IdPersona = @IdPersona


		IF @@ROWCOUNT = 1
		BEGIN
			SELECT 1 AS IdResultado,
			'El Alumno se actualizó con éxito' AS NombreResultado
		END	
		ELSE
		BEGIN
			SELECT 0 AS IdResultado,
			'Se generó un error' AS NombreResultado
		END

END
GO
/****** Object:  StoredProcedure [dbo].[EditarAlumnoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarAlumnoSeccion]
(
	@IdAlumnoSeccion INT,
	@IdAlumno INT,
	@IdSeccion INT

)

AS
BEGIN

	UPDATE AlumnoSeccion
	SET IdAlumno = @IdAlumno,
	    IdSeccion = @IdSeccion
	WHERE IdAlumnoSeccion = @IdAlumnoSeccion

	IF @@ROWCOUNT = 1
	BEGIN
		SELECT 1 IdResultado,
		'Se registró correctamente' AS NombreResultado
	END
	ELSE
	BEGIN
		SELECT 0 IdResultado,
		'Ocurrió un error' AS NombreResultado
	END

END
GO
/****** Object:  StoredProcedure [dbo].[EditarCursoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarCursoSeccion](
@IdCursoSeccion INT,
@IdCurso	INT,
@IdSeccion INT,
@IdProfesor INT,
@HoraInicio VARCHAR(10),
@HoraFin VARCHAR(10)

)
AS 
BEGIN

		UPDATE CursoSeccion
			SET
				IdCurso =  @IdCurso,           
				IdSeccion = @IdSeccion,
				IdProfesor  = @IdProfesor,
				HoraInicio = @HoraInicio,
				HoraFin = @HoraFin
			
			WHERE IdCursoSeccion = @IdCursoSeccion

		IF @@ROWCOUNT = 1
		BEGIN
			SELECT 1 AS IdResultado,
			'El Curso seccion se actualizó correctamente' AS NombreResultado,
			CONVERT(INT,@@IDENTITY) AS Id
		END	
		ELSE
		BEGIN
			SELECT 0 AS IdResultado,
			'Se generó un error' AS NombreResultado
		END
		 
END
GO
/****** Object:  StoredProcedure [dbo].[EditarProfesor]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EditarProfesor](
	@IdProfesor INT,
	@ApellidoPaterno VARCHAR(100),
	@ApellidoMaterno VARCHAR(100),
	@Nombres VARCHAR(150),
	@IdDocumento CHAR(1),
	@NumeroDocumento VARCHAR(20),
	@Telefono VARCHAR(20),
	@Correo VARCHAR(100),
	@Direccion VARCHAR(200),
	@IdTipoPersona CHAR(2),
	@IdGrado CHAR(3),
	@IdTipoContrato CHAR(2),
	@Sueldo DECIMAL(18,2)
)
AS
BEGIN

		DECLARE @IdPersona INT

		SET @IdPersona = (SELECT IdPersona FROM Profesor WHERE IdProfesor = @IdProfesor)

		UPDATE Profesor
		SET
		IdGrado = @IdGrado,
		IdTipoContrato = @IdTipoContrato,
		Sueldo = @Sueldo
		WHERE IdProfesor = @IdProfesor

		UPDATE Persona
		SET 
			ApellidoPaterno = @ApellidoPaterno,
			ApellidoMaterno = @ApellidoMaterno,
			Nombres = @Nombres,
			IdDocumento = @IdDocumento,
			NumeroDocumento = @NumeroDocumento,
			Telefono = @Telefono,
			Direccion = @Direccion,
			IdTipoPersona = @IdTipoPersona
		WHERE IdPersona = @IdPersona


		IF @@ROWCOUNT = 1
		BEGIN
			SELECT 1 AS IdResultado,
			'El profesor se actualizó con éxito' AS NombreResultado
		END	
		ELSE
		BEGIN
			SELECT 0 AS IdResultado,
			'Se generó un error' AS NombreResultado
		END

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarAlumno]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminarAlumno](
	@IdAlumno INT
)
AS
BEGIN
	
	DECLARE @IdPersona INT

	SET @IdPersona = (SELECT IdPersona FROM Alumno WHERE IdAlumno = @IdAlumno)

	DELETE FROM Alumno
	WHERE IdAlumno = @IdAlumno

	DELETE FROM Persona
	WHERE IdPersona = @IdPersona

	IF @@ROWCOUNT > 0
	BEGIN
		SELECT 1 AS IdResultado,
		'El alumno se eliminó con éxito' AS NombreResultado
	END	
	ELSE
	BEGIN
		SELECT 0 AS IdResultado,
		'Se generó un error' AS NombreResultado
	END


END
GO
/****** Object:  StoredProcedure [dbo].[EliminarAlumnoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminarAlumnoSeccion]
(

	@IdAlumnoSeccion INT
)
AS
BEGIN

	DELETE FROM AlumnoSeccion
	WHERE IdAlumnoSeccion = @IdAlumnoSeccion

	IF @@ROWCOUNT = 1
	BEGIN
		SELECT 1 IdResultado,
		'Se eliminó correctamente' AS NombreResultado
	END
	ELSE
	BEGIN
		SELECT 0 IdResultado,
		'Ocurrió un error' AS NombreResultado
	END

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCursoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminarCursoSeccion]
(
	@IdCursoSeccion INT
)
AS
BEGIN

	DELETE FROM CursoSeccion
	where IdCursoSeccion = @IdCursoSeccion

	IF @@ROWCOUNT = 1
	BEGIN
		SELECT 1 AS IdResultado,
		'El Curso seccion se eliminó correctamente' AS NombreResultado,
		CONVERT(INT,@@IDENTITY) AS Id
	END	
	ELSE
	BEGIN
		SELECT 0 AS IdResultado,
		'Se generó un error' AS NombreResultado
	END

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProfesor]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EliminarProfesor](
	@IdProfesor INT
)
AS
BEGIN
	
	DECLARE @IdPersona INT

	SET @IdPersona = (SELECT IdPersona FROM Profesor WHERE IdProfesor = @IdProfesor)

	DELETE FROM Profesor
	WHERE IdProfesor = @IdProfesor

	DELETE FROM Persona
	WHERE IdPersona = @IdPersona

	IF @@ROWCOUNT > 0
	BEGIN
		SELECT 1 AS IdResultado,
		'El profesor se eliminó con éxito' AS NombreResultado
	END	
	ELSE
	BEGIN
		SELECT 0 AS IdResultado,
		'Se generó un error' AS NombreResultado
	END


END
GO
/****** Object:  StoredProcedure [dbo].[GuardarAlumno]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GuardarAlumno](
	@Ciclo CHAR(2),
	@CreditosAprobados INT,
	@CreditosDesaprobados INT,
	@Situacion VARCHAR(50),
	@Especialidad VARCHAR(100),
	@ApellidoPaterno VARCHAR(100),
	@ApellidoMaterno VARCHAR(100),
	@Nombres VARCHAR(150),
	@IdDocumento CHAR(1),
	@NumeroDocumento VARCHAR(20),
	@Telefono VARCHAR(20),
	@Correo VARCHAR(100),
	@Direccion VARCHAR(200),
	@IdTipoPersona char(2)
)
AS
BEGIN
	
	IF not EXISTS(
	
	SELECT * FROM Persona
	WHERE NumeroDocumento = @NumeroDocumento and IdEstado = 1
	
	)
	BEGIN
			INSERT INTO Persona
			(   
				ApellidoPaterno,
				ApellidoMaterno,
				Nombres,
				IdDocumento,
				NumeroDocumento,
				Telefono,
				Correo,
				Direccion,
				IdTipoPersona,
				IdEstado
			)
			VALUES
			(
				@ApellidoPaterno,
				@ApellidoMaterno,
				@Nombres,
				@IdDocumento,
				@NumeroDocumento,
				@Telefono,
				@Correo,
				@Direccion,
				@IdTipoPersona,
				1
			)

		DECLARE @IdPersona INT


		SELECT @IdPersona = @@IDENTITY 

	END
	ELSE
	BEGIN
			SELECT @IdPersona = IdPersona FROM Persona
			where NumeroDocumento = @NumeroDocumento and IdEstado = 1


			UPDATE Persona
			SET
			ApellidoPaterno=@ApellidoPaterno,
			ApellidoMaterno=@ApellidoMaterno,
			Nombres=@Nombres,
			IdDocumento=@IdDocumento,
			NumeroDocumento=@NumeroDocumento,
			Telefono=@Telefono,
			Correo=@Correo,
			Direccion=@Direccion,
			IdTipoPersona=@IdTipoPersona
			WHERE IdPersona = @IdPersona and IdEstado = 1
		 
	END
		
		--==INSERTANDO DATOS A LA TABLA ALUMNO ==

	IF NOT EXISTS(
	
			SELECT * FROM Alumno
			WHERE IdPersona  = @IdPersona and IdEstado = 1
	
		)
		BEGIN
				INSERT INTO Alumno
				(
					IdPersona,
					Ciclo,
					CreditosAprobados,
					CreditosDesaprobados,
					Situacion,
					Especialidad,
					IdEstado
				)
				VALUES
				(
					@IdPersona,
					@Ciclo,
					@CreditosAprobados,
					@CreditosDesaprobados,
					@Situacion,
					@Especialidad,
					1
				)
		END
		ELSE
		BEGIN

	 
				UPDATE Alumno
				set IdPersona=@IdPersona,
				Ciclo=@Ciclo,
				CreditosAprobados=@CreditosAprobados,
				CreditosDesaprobados=@CreditosDesaprobados,
				Situacion=@Situacion,
				Especialidad=@Especialidad
				where IdPersona = @IdPersona and IdEstado =  1
		END
	
		IF @@ROWCOUNT > 0
		BEGIN
			SELECT 1 AS IdResultado,
			'El Alumno se registró correctamente' AS NombreResultado,
			CONVERT(INT,@@IDENTITY) AS Id
		END	
		ELSE
		BEGIN
			SELECT 0 AS IdResultado,
			'Se generó un error' AS NombreResultado
		END

END
GO
/****** Object:  StoredProcedure [dbo].[GuardarAlumnoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GuardarAlumnoSeccion]
(
	@IdAlumno INT,
	@IdSeccion INT

)

AS
BEGIN

	IF NOT EXISTS(
		SELECT *FROM AlumnoSeccion
		WHERE IdAlumno = @IdAlumno AND IdSeccion = @IdSeccion
	)

	BEGIN

		INSERT INTO AlumnoSeccion
		(
			IdAlumno,
			IdSeccion
		)
		VALUES
		(
			@IdAlumno,
			@IdSeccion
		)

	END
	ELSE
	BEGIN

		DECLARE @IdAlumnoSeccion int
		SELECT @IdAlumnoSeccion = 	(SELECT IdAlumnoSeccion FROM AlumnoSeccion
										WHERE IdAlumno = @IdAlumno AND IdSeccion = @IdSeccion
									)

		  UPDATE AlumnoSeccion
		  SET 	IdAlumno = @IdAlumno,
				IdSeccion = @IdSeccion
		  WHERE IdAlumnoSeccion = @IdAlumnoSeccion

	END


	
	IF @@ROWCOUNT = 1
	BEGIN
		SELECT 1 IdResultado,
		'Se registró correctamente' AS NombreResultado
	END
	ELSE
	BEGIN
		SELECT 0 IdResultado,
		'Ocurrió un error' AS NombreResultado
	END

END
GO
/****** Object:  StoredProcedure [dbo].[GuardarCursoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GuardarCursoSeccion](
@IdCurso	INT,
@IdSeccion INT,
@IdProfesor INT,
@HoraInicio VARCHAR(10),
@HoraFin VARCHAR(10)

)
AS
BEGIN

	IF not EXISTS(
	
	SELECT * FROM CursoSeccion
	WHERE IdSeccion = @IdSeccion and 
		  IdProfesor = @IdProfesor and
		  HoraInicio = @HoraInicio and
		  HoraFin = @HoraFin
	)
	BEGIN
			INSERT INTO CursoSeccion
			(   
				IdCurso,
				IdSeccion,
				IdProfesor ,
				HoraInicio,
				HoraFin 
			)
			VALUES
			(
				@IdCurso,
				@IdSeccion,
				@IdProfesor ,
				@HoraInicio,
				@HoraFin 
			)


	END
	ELSE
	BEGIN

			   DECLARE @IdCursoSeccion INT 

		       SET @IdCursoSeccion = ( SELECT  IdCursoSeccion FROM CursoSeccion
				WHERE IdSeccion = @IdSeccion and 
					  IdProfesor = @IdProfesor and
					  HoraInicio = @HoraInicio and
					  HoraFin = @HoraFin)

			UPDATE CursoSeccion
			SET
				IdCurso =  @IdCurso,           
				IdSeccion = @IdSeccion,
				IdProfesor  = @IdProfesor,
				HoraInicio = @HoraInicio,
				HoraFin = @HoraFin
			
			WHERE IdCursoSeccion = @IdCursoSeccion

		IF @@ROWCOUNT = 1
		BEGIN
			SELECT 1 AS IdResultado,
			'El Curso seccion se registró correctamente' AS NombreResultado,
			CONVERT(INT,@@IDENTITY) AS Id
		END	
		ELSE
		BEGIN
			SELECT 0 AS IdResultado,
			'Se generó un error' AS NombreResultado
		END
		 
	END
		

END
GO
/****** Object:  StoredProcedure [dbo].[GuardarProfesor]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GuardarProfesor](
	@ApellidoPaterno VARCHAR(100),
	@ApellidoMaterno VARCHAR(100),
	@Nombres VARCHAR(150),
	@IdDocumento CHAR(1),
	@NumeroDocumento VARCHAR(20),
	@Telefono VARCHAR(20),
	@Correo VARCHAR(100),
	@Direccion VARCHAR(200),
	@IdTipoPersona CHAR(2),
	@IdGrado CHAR(3),
	@IdTipoContrato CHAR(2),
	@Sueldo DECIMAL(18,2)

)
AS
BEGIN
	
	IF not EXISTS(
	
	SELECT * FROM Persona
	WHERE NumeroDocumento = @NumeroDocumento and IdEstado = 1
	
	)
	BEGIN
			INSERT INTO Persona
			(   
				ApellidoPaterno,
				ApellidoMaterno,
				Nombres,
				IdDocumento,
				NumeroDocumento,
				Telefono,
				Correo,
				Direccion,
				IdTipoPersona,
				IdEstado
			)
			VALUES
			(
				@ApellidoPaterno,
				@ApellidoMaterno,
				@Nombres,
				@IdDocumento,
				@NumeroDocumento,
				@Telefono,
				@Correo,
				@Direccion,
				@IdTipoPersona,
				1
			)

		DECLARE @IdPersona INT


		SELECT @IdPersona = @@IDENTITY 

	END
	ELSE
	BEGIN
			SELECT @IdPersona = IdPersona FROM Persona
			where NumeroDocumento = @NumeroDocumento and IdEstado = 1


			UPDATE Persona
			SET
			ApellidoPaterno=@ApellidoPaterno,
			ApellidoMaterno=@ApellidoMaterno,
			Nombres=@Nombres,
			IdDocumento=@IdDocumento,
			NumeroDocumento=@NumeroDocumento,
			Telefono=@Telefono,
			Correo=@Correo,
			Direccion=@Direccion,
			IdTipoPersona=@IdTipoPersona
			WHERE IdPersona = @IdPersona and IdEstado = 1
		 
	END
		
		--==INSERTANDO DATOS A LA TABLA PROFESOR ==

	IF NOT EXISTS(
	
			SELECT * FROM Profesor
			WHERE IdPersona  = @IdPersona and IdEstado = 1
	
		)
		BEGIN
				INSERT INTO Profesor
				(
					IdPersona,
					IdGrado,
					IdTipoContrato,
					Sueldo,
					IdEstado
				)
				VALUES
				(
					@IdPersona,
					@IdGrado,
					@IdTipoContrato,
					@Sueldo,
					1
					
				)
		END
		ELSE
		BEGIN

	 
				UPDATE Profesor
				set
					IdGrado=@IdGrado,
					IdTipoContrato=@IdTipoContrato,
					Sueldo=@Sueldo
				where IdPersona = @IdPersona and IdEstado =  1
		END
	
		IF @@ROWCOUNT > 0
		BEGIN
			SELECT 1 AS IdResultado,
			'El Prpfesor se registró correctamente' AS NombreResultado,
			CONVERT(INT,@@IDENTITY) AS Id
		END	
		ELSE
		BEGIN
			SELECT 0 AS IdResultado,
			'Se generó un error' AS NombreResultado
		END

END
GO
/****** Object:  StoredProcedure [dbo].[ListarAlumnos]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListarAlumnos]
AS
BEGIN

		SELECT 
			 IdAlumno,
			 P.IdPersona,
			 P.ApellidoPaterno,
			 P.ApellidoMaterno,
			 P.Nombres,
			 CASE WHEN P.IdDocumento = '1' THEN 'DNI' ELSE 'Carnet Extranjeria' END AS Documento,
			 P.NumeroDocumento,
			 P.Telefono,
			 P.Correo,
			 P.Direccion,
			 CASE WHEN P.IdTipoPersona = 'AL' THEN 'ALUMNO' ELSE 'PROFESOR' END AS TipoPersona,
			 Ciclo,
			 CreditosAprobados,
			 CreditosDesaprobados,
			 Situacion,
			 Especialidad
		FROM Alumno A INNER JOIN Persona P
		ON P.IdPersona = A.IdPersona
		
END

GO
/****** Object:  StoredProcedure [dbo].[ListarAlumnoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListarAlumnoSeccion]
AS
BEGIN
	
	SELECT 
		ASE.IdAlumno,
		ASE.IdSeccion,
		P.ApellidoPaterno + ' ' + P.ApellidoMaterno + ' ' + P.Nombres AS Alumno
	FROM AlumnoSeccion ASE INNER JOIN Alumno A
	ON A.IdAlumno = ASE.IdAlumno INNER JOIN Persona P
	ON P.IdPersona = A.IdPersona

END


GO
/****** Object:  StoredProcedure [dbo].[ListarCursoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListarCursoSeccion]
AS
BEGIN

	SELECT
		CS.IdCursoSeccion,
		CS.HoraFin,
		CS.HoraInicio,
		C.NombreCurso,
		PE.ApellidoMaterno + ' ' + PE.ApellidoMaterno + ' ' + PE.Nombres AS Profesor,
		S.NombreSeccion
	FROM CursoSeccion CS INNER JOIN Curso C
	ON C.IdCurso = CS.IdCurso INNER JOIN Profesor P
	ON P.IdProfesor = CS.IdProfesor INNER JOIN Persona PE
	ON PE.IdPersona = P.IdPersona INNER JOIN Seccion S
	ON S.IdSeccion = CS.IdSeccion

END
GO
/****** Object:  StoredProcedure [dbo].[ListarProfesores]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListarProfesores]
AS
BEGIN

		SELECT 
			 IdProfesor,
			 PE.IdPersona,
			 PE.ApellidoPaterno,
			 PE.ApellidoMaterno,
			 PE.Nombres,
			 CASE WHEN PE.IdDocumento = '1' THEN 'DNI' ELSE 'Carnet Extranjeria' END AS Documento,
			 PE.NumeroDocumento,
			 PE.Telefono,
			 PE.Correo,
			 PE.Direccion,
			 CASE WHEN  P.IdGrado = '1' THEN  'Magister'
			      WHEN  P.IdGrado = '2' THEN  'Doctor'
				  WHEN  P.IdGrado = '3' THEN  'Ingeniero'
			 ELSE 'Licenciado' END AS Grado,
			 CASE WHEN  P.IdTipoContrato = '1' THEN  'TIEMPO COMPLETO'
			      WHEN  P.IdTipoContrato = '2' THEN  'TIEMPO PARCIAL'
				  WHEN  P.IdTipoContrato = '3' THEN  'ESTABLE'
			 ELSE 'POR CONTRATO' END AS TipoContrato,
			 P.Sueldo
		FROM Profesor P INNER JOIN Persona PE
		ON PE.IdPersona = P.IdPersona
		
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerAlumno]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ObtenerAlumno](
	@IdAlumno INT
)
AS
BEGIN

		SELECT 
			 IdAlumno,
			 P.IdPersona,
			 P.ApellidoPaterno,
			 P.ApellidoMaterno,
			 P.Nombres,
			 CASE WHEN P.IdDocumento = '1' THEN 'DNI' ELSE 'Carnet Extranjeria' END AS Documento,
			 P.NumeroDocumento,
			 P.Telefono,
			 P.Correo,
			 P.Direccion,
			 CASE WHEN P.IdTipoPersona = 'AL' THEN 'ALUMNO' ELSE 'PROFESOR' END AS TipoPersona,
			 Ciclo,
			 CreditosAprobados,
			 CreditosDesaprobados,
			 Situacion,
			 Especialidad
		FROM Alumno A INNER JOIN Persona P
		ON P.IdPersona = A.IdPersona
		WHERE IdAlumno = @IdAlumno

END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerAlumnosSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ObtenerAlumnosSeccion]
(
	@IdSeccion INT
)
AS
BEGIN
	
	SELECT 
		ASE.IdAlumno,
		ASE.IdSeccion,
		P.ApellidoPaterno + ' ' + P.ApellidoMaterno + ' ' + P.Nombres AS Alumno
	FROM AlumnoSeccion ASE INNER JOIN Alumno A
	ON A.IdAlumno = ASE.IdAlumno INNER JOIN Persona P
	ON P.IdPersona = A.IdPersona
	WHERE ASE.IdSeccion = @IdSeccion
END


GO
/****** Object:  StoredProcedure [dbo].[ObtenerCursoSeccion]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ObtenerCursoSeccion](
	@IdCursoSeccion INT
)
AS
BEGIN

	SELECT
		CS.IdCursoSeccion,
		CS.HoraFin,
		CS.HoraInicio,
		C.NombreCurso,
		PE.ApellidoMaterno + ' ' + PE.ApellidoMaterno + ' ' + PE.Nombres AS Profesor,
		S.NombreSeccion
	FROM CursoSeccion CS INNER JOIN Curso C
	ON C.IdCurso = CS.IdCurso INNER JOIN Profesor P
	ON P.IdProfesor = CS.IdProfesor INNER JOIN Persona PE
	ON PE.IdPersona = P.IdPersona INNER JOIN Seccion S
	ON S.IdSeccion = CS.IdSeccion
	WHERE IdCursoSeccion = @IdCursoSeccion 
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProfesor]    Script Date: 03/03/2022 0:07:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ObtenerProfesor]
(
	@IdProfesor AS INT
)
AS
BEGIN

		SELECT 
			 IdProfesor,
			 PE.IdPersona,
			 PE.ApellidoPaterno,
			 PE.ApellidoMaterno,
			 PE.Nombres,
			 CASE WHEN PE.IdDocumento = '1' THEN 'DNI' ELSE 'Carnet Extranjeria' END AS Documento,
			 PE.NumeroDocumento,
			 PE.Telefono,
			 PE.Correo,
			 PE.Direccion,
			CASE WHEN  P.IdGrado = '1' THEN  'Magister'
			      WHEN  P.IdGrado = '2' THEN  'Doctor'
				  WHEN  P.IdGrado = '3' THEN  'Ingeniero'
			 ELSE 'Licenciado' END AS Grado,
			 CASE WHEN  P.IdTipoContrato = '1' THEN  'TIEMPO COMPLETO'
			      WHEN  P.IdTipoContrato = '2' THEN  'TIEMPO PARCIAL'
				  WHEN  P.IdTipoContrato = '3' THEN  'ESTABLE'
			 ELSE 'POR CONTRATO' END AS TipoContrato,
			 P.Sueldo
		FROM Profesor P INNER JOIN Persona PE
		ON PE.IdPersona = P.IdPersona
		WHERE P.IdProfesor = @IdProfesor
END

GO
USE [master]
GO
ALTER DATABASE [BDClase] SET  READ_WRITE 
GO
