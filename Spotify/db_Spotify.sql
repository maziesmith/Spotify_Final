CREATE DATABASE Spotify;
USE [Spotify]
GO
/****** Object:  Table [dbo].[tbl_Track]    Script Date: 03/09/2015 10:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Track](
	[idTrack] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[id] [varchar](12) NULL,
	[trackNumber] [varchar](2) NULL,
	[length] [float] NULL,
	[popularity] [float] NULL,
 CONSTRAINT [PK_tbl_Track] PRIMARY KEY CLUSTERED 
(
	[idTrack] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Availability]    Script Date: 03/09/2015 10:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Availability](
	[idAvailability] [int] IDENTITY(1,1) NOT NULL,
	[territories] [varchar](250) NULL,
	[idAlbum] [int] NULL,
 CONSTRAINT [PK_tbl_Availability] PRIMARY KEY CLUSTERED 
(
	[idAvailability] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Artist]    Script Date: 03/09/2015 10:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Artist](
	[idArtist] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NULL,
	[idTrack] [int] NULL,
 CONSTRAINT [PK_tbl_Artist] PRIMARY KEY CLUSTERED 
(
	[idArtist] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Album]    Script Date: 03/09/2015 10:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Album](
	[idAlbum] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[released] [varchar](4) NULL,
	[idTrack] [int] NULL,
 CONSTRAINT [PK_tbl_Album] PRIMARY KEY CLUSTERED 
(
	[idAlbum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[PA_Insertar_Track]    Script Date: 03/09/2015 10:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_Insertar_Track]
	@pName varchar(100),
	@pId varchar(12),
	@pTrackNumber varchar(2),
	@pLength float,
	@pPopularity float
as
	INSERT INTO tbl_Track VALUES(@pName, @pId, @pTrackNumber, @pLength, @pPopularity);
GO
/****** Object:  StoredProcedure [dbo].[PA_Insertar_Availability]    Script Date: 03/09/2015 10:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_Insertar_Availability]
	@pTerritories varchar(250),
	@pIdAlbum int
as
	INSERT INTO tbl_Availability VALUES(@pTerritories, @pIdAlbum);
GO
/****** Object:  StoredProcedure [dbo].[PA_Insertar_Artist]    Script Date: 03/09/2015 10:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_Insertar_Artist]
	@pName varchar(150),
	@pIdTrack int
as
	INSERT INTO tbl_Artist VALUES(@pName, @pIdTrack);
GO
/****** Object:  StoredProcedure [dbo].[PA_Insertar_Album]    Script Date: 03/09/2015 10:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PA_Insertar_Album]
	@pName varchar(50),
	@pReleased varchar(4),
	@pIdTrack int
as
	INSERT INTO tbl_Album VALUES(@pName, @pReleased, @pIdTrack);
GO
