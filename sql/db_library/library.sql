USE [master]
GO
/****** Object:  Database [library]    Script Date: 18.06.2015 10:54:23 ******/
CREATE DATABASE [library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library', FILENAME = N'D:\GitHub\step-homeworks\sql\db_library\library.mdf' , SIZE = 7360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'library_log', FILENAME = N'D:\GitHub\step-homeworks\sql\db_library\library_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [library] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library] SET ARITHABORT OFF 
GO
ALTER DATABASE [library] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [library] SET  MULTI_USER 
GO
ALTER DATABASE [library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [library] SET DELAYED_DURABILITY = DISABLED 
GO
USE [library]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Pages] [int] NOT NULL,
	[YearPress] [int] NOT NULL,
	[Id_Themes] [int] NOT NULL,
	[Id_Category] [int] NOT NULL,
	[Id_Author] [int] NOT NULL,
	[Id_Press] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__Facultie__3214EC072FC1D492] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Id_Faculty] [int] NOT NULL,
 CONSTRAINT [PK__Groups__3214EC07F6F3CA69] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Issued]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issued](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VisitorName] [nvarchar](15) NOT NULL,
	[VisitorSurname] [nvarchar](25) NOT NULL,
	[BookTitle] [nvarchar](100) NOT NULL,
	[DateOut] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibDeleted]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibDeleted](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Pages] [int] NOT NULL,
	[YearPress] [int] NOT NULL,
	[Id_Themes] [int] NOT NULL,
	[Id_Category] [int] NOT NULL,
	[Id_Author] [int] NOT NULL,
	[Id_Press] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libs]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Press]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Press](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Returned]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returned](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[BookTitle] [nvarchar](100) NOT NULL,
	[DateIn] [date] NOT NULL,
 CONSTRAINT [PK__Returned__3214EC07A02095A2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[S_Cards]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Student] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Group] [int] NOT NULL,
	[Term] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Cards]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Teacher] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
	[DateOut] [datetime] NOT NULL,
	[DateIn] [datetime] NULL,
	[Id_Lib] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Id_Dep] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Themes]    Script Date: 18.06.2015 10:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (1, N'Джеймс Р.', N'Грофф')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (2, N'Сергей', N'Никольский')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (3, N'Михаил', N'Маров')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (4, N'Борис', N'Карпов')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (5, N'Алексей', N'Архангельский')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (6, N'Владимир', N'Король')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (7, N'Евангелос', N'Петрусос')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (8, N'Маркус', N'Херхагер')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (9, N'Павел', N'Гарбар')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (10, N'Александр', N'Матросов')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (11, N'Людмила', N'Омельченко')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (12, N'Кевин', N'Рейчард')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (13, N'Ольга', N'Кокорева')
INSERT [dbo].[Authors] ([Id], [FirstName], [LastName]) VALUES (14, N'Марк', N'Браун')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (1, N'SQL', 816, 2001, 1, 1, 1, 2, N'2-е издание', 14)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (2, N'3D Studio Max 3', 640, 2000, 3, 6, 3, 3, N'Учебный курс', 4)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (3, N'100 компонентов общего назначения библиотеки Delphi 5', 272, 1999, 2, 4, 5, 4, N'Компоненты', 5)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (4, N'Visual Basic 6', 416, 2000, 2, 5, 4, 3, N'Специальный справочник', 6)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (5, N'Курс математического анализа', 328, 1990, 4, 2, 2, 5, N'1-й том', 5)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (6, N'Библиотека C++ Builder 5: 70 компонентов ввода/вывода информации', 288, 2000, 2, 3, 5, 4, N'Компоненты', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (7, N'Интегрированная среда разработки', 272, 2000, 2, 3, 5, 4, N'Среда разработки', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (8, N'Русская справка (Help) по Delphi 5 и  Object Pascal', 32, 2000, 2, 4, 5, 4, N'Справочник', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (9, N'Visual Basic 6.0 for Application', 488, 2000, 2, 5, 6, 6, N'Справочник с примерами', 3)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (10, N'Visual Basic 6', 576, 2000, 2, 5, 7, 2, N'Руководство разработчика 1-й том', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (11, N'Mathcad 2000', 416, 2000, 5, 7, 8, 2, N'Полное руководство', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (12, N'Novell GroupWise 5.5 система электронной почты и коллективной работы', 480, 2000, 6, 8, 9, 2, N'Сетевые пакеты', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (13, N'Реестр Windows 2000', 352, 2000, 9, 12, 13, 2, N'Руководство для профессионалов', 4)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (14, N'Unix справочник', 384, 1999, 9, 13, 12, 3, N'Справочное руководство', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (15, N'Самоучитель Visual FoxPro 6.0', 512, 1999, 1, 11, 11, 2, N'Самоучитель', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (16, N'Самоучитель FrontPage 2000', 512, 1999, 7, 10, 11, 2, N'Самоучитель', 1)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (17, N'Самоучитель Perl', 432, 2000, 2, 9, 10, 2, N'Самоучитель', 2)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (18, N'HTML 3.2', 1040, 2000, 7, 14, 14, 2, N'Руководство', 5)
INSERT [dbo].[Books] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (35, N'Book', 100, 2010, 1, 1, 1, 2, N'comment', 0)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Язык SQL')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Математический анализ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'C++ Builder')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Delphi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Visual Basic')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'3D Studio Max')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Mathcad')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Novell')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Perl')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'FrontPage')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Visual FoxPro')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Windows 2000')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Unix')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (14, N'HTML')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'Программерства')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'Графики и Дизайна')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'Железа и Администрирования')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (1, N'Программирования')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (2, N'Веб-дизайна')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (3, N'Администрирования')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (2, N'9П1', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (3, N'9П2', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (4, N'9А', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (5, N'9Д', 2)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (6, N'14А', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (7, N'19П1', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (8, N'18П2', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (9, N'18А', 3)
INSERT [dbo].[Groups] ([Id], [Name], [Id_Faculty]) VALUES (10, N'19Д', 2)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[LibDeleted] ON 

INSERT [dbo].[LibDeleted] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (14, N'book', 100, 2010, 1, 1, 1, 2, N'comment', 0)
INSERT [dbo].[LibDeleted] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (18, N'book1', 500, 1999, 1, 1, 1, 4, N'fsdasfsdf', 1)
INSERT [dbo].[LibDeleted] ([Id], [Name], [Pages], [YearPress], [Id_Themes], [Id_Category], [Id_Author], [Id_Press], [Comment], [Quantity]) VALUES (19, N'book1', 500, 2005, 1, 1, 1, 3, N'fsdasfsdf', 1)
SET IDENTITY_INSERT [dbo].[LibDeleted] OFF
SET IDENTITY_INSERT [dbo].[Libs] ON 

INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (1, N'Сергей', N'Максименко')
INSERT [dbo].[Libs] ([Id], [FirstName], [LastName]) VALUES (2, N'Дмитрий', N'Чеботарев')
SET IDENTITY_INSERT [dbo].[Libs] OFF
SET IDENTITY_INSERT [dbo].[Press] ON 

INSERT [dbo].[Press] ([Id], [Name]) VALUES (1, N'DiaSoft')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (2, N'BHV')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (3, N'Питер')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (4, N'Бином')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (5, N'Наука')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (6, N'Кудиц-Образ')
INSERT [dbo].[Press] ([Id], [Name]) VALUES (7, N'Диалектика')
SET IDENTITY_INSERT [dbo].[Press] OFF
SET IDENTITY_INSERT [dbo].[S_Cards] ON 

INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 1, CAST(N'2001-05-17 00:00:00.000' AS DateTime), CAST(N'2001-06-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 17, 18, CAST(N'2000-05-18 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 3, CAST(N'2001-04-21 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 21, 4, CAST(N'2001-03-26 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 3, 1, CAST(N'2000-05-07 00:00:00.000' AS DateTime), CAST(N'2001-04-12 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 7, 11, CAST(N'2001-06-02 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 16, 14, CAST(N'2001-04-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 11, 6, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (9, 17, 2, CAST(N'2001-10-01 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (10, 10, 13, CAST(N'2001-05-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[S_Cards] ([Id], [Id_Student], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (138, 4, 1, CAST(N'2015-04-01 00:00:00.000' AS DateTime), CAST(N'2015-05-01 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[S_Cards] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (2, N'Вячеслав', N'Зезик', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (3, N'Ольга', N'Мантуляк', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (4, N'Ольга', N'Хренова', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (5, N'Ольга', N'Медведева', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (6, N'Галина', N'Инащенко', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (7, N'Юрий', N'Минаев', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (8, N'Юрий', N'Домовесов', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (9, N'Руслан', N'Ярмолович', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (10, N'Игорь', N'Удовик', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (11, N'Петр', N'Кацевич', 8, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (12, N'Евгений', N'Бурцев', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (13, N'Флора', N'Побирская', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (14, N'Наталья', N'Гридина', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (15, N'Елена', N'Акусова', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (16, N'Светлана', N'Горшкова', 9, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (17, N'Александр', N'Любенко', 10, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (18, N'Евгения', N'Цимбалюк', 10, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (19, N'Ольга', N'Болячевская', 5, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (20, N'Станислав', N'Плешаков', 7, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (21, N'Елена', N'Таран', 4, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (22, N'Денис', N'Рогачевский', 6, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (23, N'Оксана', N'Тихонова', 6, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (24, N'Петр', N'Максимов', 3, 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Id_Group], [Term]) VALUES (25, N'Ирина', N'Стогнеева', 5, 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[T_Cards] ON 

INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (1, 2, 13, CAST(N'2000-01-01 00:00:00.000' AS DateTime), CAST(N'2001-07-04 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (2, 10, 2, CAST(N'2000-03-03 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (3, 6, 12, CAST(N'2000-06-04 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (4, 3, 1, CAST(N'2000-09-05 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (5, 8, 8, CAST(N'2000-05-05 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (6, 5, 18, CAST(N'2001-02-02 00:00:00.000' AS DateTime), NULL, 2)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (7, 12, 17, CAST(N'2001-03-04 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[T_Cards] ([Id], [Id_Teacher], [Id_Book], [DateOut], [DateIn], [Id_Lib]) VALUES (8, 4, 18, CAST(N'2000-07-02 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[T_Cards] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (1, N'Григорий', N'Ящук', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (2, N'Алекс', N'Туманов', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (3, N'Сергей', N'Максименко', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (4, N'Дмитрий', N'Боровский', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (5, N'Виктор', N'Бровар', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (6, N'Вадим', N'Ткаченко', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (7, N'Вячеслав', N'Калашников', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (8, N'Руслан', N'Кучеренко', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (9, N'Андрей', N'Тендюк', 1)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (10, N'Анатолий', N'Выклюк', 2)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (11, N'Олег', N'Резниченко', 3)
INSERT [dbo].[Teachers] ([Id], [FirstName], [LastName], [Id_Dep]) VALUES (12, N'Александр', N'Артемов', 1)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
SET IDENTITY_INSERT [dbo].[Themes] ON 

INSERT [dbo].[Themes] ([Id], [Name]) VALUES (1, N'Базы данных')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (2, N'Программирование')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (3, N'Графические пакеты')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (4, N'Высшая математика')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (5, N'Математические пакеты')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (6, N'Сети')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (7, N'Web-дизайн')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (8, N'Windows 2000')
INSERT [dbo].[Themes] ([Id], [Name]) VALUES (9, N'Операционные системы')
SET IDENTITY_INSERT [dbo].[Themes] OFF
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([Id_Author])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([Id_Category])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([Id_Press])
REFERENCES [dbo].[Press] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([Id_Themes])
REFERENCES [dbo].[Themes] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK__Groups__Id_Facul__6383C8BA] FOREIGN KEY([Id_Faculty])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK__Groups__Id_Facul__6383C8BA]
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
GO
ALTER TABLE [dbo].[S_Cards]  WITH CHECK ADD FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([Id_Group])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD FOREIGN KEY([Id_Lib])
REFERENCES [dbo].[Libs] ([Id])
GO
ALTER TABLE [dbo].[T_Cards]  WITH CHECK ADD FOREIGN KEY([Id_Teacher])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD FOREIGN KEY([Id_Dep])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD CHECK  (([Quantity]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[DebtorStudent]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DebtorStudent]
AS
SELECT FirstName, LastName, CAST(DateOut AS date) AS DateOut, Name AS Book
FROM Students JOIN S_Cards 
ON Students.Id=S_Cards.Id_Student 
JOIN Books ON S_Cards.Id_book=Books.Id
WHERE DateIn IS NULL
ORDER BY LastName;

GO
/****** Object:  StoredProcedure [dbo].[factorial]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[factorial]
@f int
AS

IF @f>0 
	BEGIN
		DECLARE @f2 int=@f-1;
		EXEC @f2=factorial @f2;
		RETURN @f*@f2;
	END
ELSE
	IF @f=0
		RETURN 1;
	ELSE
		BEGIN
			DECLARE @msg NVARCHAR(100) = N'Error: number('+CAST(@f AS NVARCHAR)+N') is invalid.';
			THROW 50001, @msg, 1; 
		END
RETURN

--test
DECLARE @result int;
DECLARE @number int=5;
EXEC @result=factorial @number;
PRINT 'factorial('+CAST(@number AS nvarchar)+') = '+ CAST(@result AS nvarchar);
--/test
GO
/****** Object:  StoredProcedure [dbo].[LibrariansList]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LibrariansList]
AS
SELECT Id, FirstName, Lastname, (SELECT COUNT(*) FROM S_Cards WHERE Id_Lib=Libs.Id)+
(SELECT COUNT(*) FROM T_Cards WHERE Id_lib=Libs.Id) As [Number]
FROM Libs;
GO
/****** Object:  StoredProcedure [dbo].[MaxBooksStudent]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[MaxBooksStudent]
AS
SELECT TOP 1 WITH TIES FirstName, LastName FROM Students JOIN S_Cards ON Students.Id=S_Cards.Id_Student
GROUP BY FirstName, Lastname
ORDER BY Count(Students.Id) DESC;

GO
/****** Object:  StoredProcedure [dbo].[NumberOfTakenBooks]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[NumberOfTakenBooks]
AS
SELECT Groups.Name AS [Group/Department], COUNT(S_Cards.Id) AS [Number of  taken books]
FROM Groups LEFT JOIN Students ON Students.Id_Group=Groups.Id
 LEFT JOIN S_Cards ON Students.Id=S_Cards.Id_Student 
GROUP BY Groups.Name
UNION
SELECT Departments.Name, COUNT(T_Cards.Id) AS [Number of  taken books]
FROM Departments LEFT JOIN Teachers ON Teachers.Id_Dep=Departments.Id
 LEFT JOIN T_Cards ON Teachers.Id=T_Cards.ID_Teacher 
GROUP BY Departments.Name;

GO
/****** Object:  StoredProcedure [dbo].[SpecificBooks]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SpecificBooks]
@FirstName nvarchar(15)=NULL,
@LastName nvarchar(25)=NULL,
@Theme nvarchar(30)=NULL,
@Category nvarchar(30)=NULL,
@SortedField int=1,
@SortDirection nvarchar(4)='ASC'
AS
IF @SortedField<1 OR @SortedField>5
	THROW 50001, 'Choose correct sorting column (1-5)', 1;
	
IF NOT( @SortDirection='asc' OR @SortDirection='desc')
	THROW 50001, 'Set correct sorting order (asc/desc)',1;
	 
DECLARE @exec_msg nvarchar(max)='SELECT Books.Name AS Book, FirstName, LastName, Themes.Name AS Theme, Categories.Name AS Category
FROM Books JOIN Authors ON Books.Id_Author=Authors.Id
JOIN Themes ON Books.Id_Themes=Themes.Id
JOIN Categories ON Books.Id_Category=Categories.Id
WHERE FirstName Like ''%'+ ISNULL(@FirstName, '%')
	+'%'' AND LastName LIKE ''%'+ISNULL(@Lastname, '%')
	+'%'' AND Themes.Name LIKE ''%'+ISNULL(@Theme, '%') 
	+'%'' AND Categories.Name LIKE ''%'+ISNULL(@Category, '%')
	+'%'' ORDER BY '+CAST(@SortedField AS nvarchar)+' '+ CAST(@SortDirection AS nvarchar);

EXEC (@exec_msg);

GO
/****** Object:  StoredProcedure [dbo].[StudentsWithoutBooks]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[StudentsWithoutBooks]
AS
SELECT COUNT(*) AS [Number of students never taking books from library]
FROM Students LEFT JOIN S_Cards 
ON Students.Id=S_Cards.Id_Student 
WHERE DateOut IS NULL;

GO
/****** Object:  StoredProcedure [dbo].[Test_CardInsert_Date_In]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Test Trigger Cards_INSERT
CREATE PROC [dbo].[Test_CardInsert_Date_In]
 @Table nvarchar(50),
 @PersonId int,
 @BookId int
 AS
 
if object_id('tempdb..#tmp_returned') IS NOT NULL
	DROP TABLE #tmp_returned;

select * into #tmp_returned from Issued;
Declare @NumberOfBooks int;
SELECT @NumberOfBooks=Quantity FROM Books WHERE Id=@BookId;
---------------------------------------------------------
	DECLARE @msg nvarchar(max)='INSERT '+@Table+
		' VALUES('+CAST(@PersonId AS nvarchar)+' ,'+ CAST(@BookId AS nvarchar)+', GETDATE(), NULL, 1)';
	EXEC(@msg);
---------------------------------------------------------

SELECT Name AS BookTitle, @NumberOfBooks AS PreviousQuantity, Quantity AS ActualQuantity FROM Books WHERE Id=@BookId;

SELECT * FROM Issued
EXCEPT
SELECT * FROM #tmp_returned;

EXEC('SELECT TOP 1 * FROM '+@Table+' ORDER BY Id DESC');

GO
/****** Object:  StoredProcedure [dbo].[Test_Trigger_Cards_UPDATE_Date_In]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Trigger Books_returned from Teacher
CREATE PROC [dbo].[Test_Trigger_Cards_UPDATE_Date_In]
 @CardId int,
 @Table nvarchar(50)
 AS
 
if object_id('tempdb..#tmp_returned') IS NOT NULL
	DROP TABLE #tmp_returned;

select * into #tmp_returned from returned;
DECLARE @exec_msg nvarchar(max);
DECLARE @BookId int;

SET @exec_msg='SELECT @BookId=Id_Book FROM '+@Table+' WHERE id='+CAST(@CardID AS nvarchar);
Print @BookId;
Print @Table;
Print @CardId;
EXEC sp_executesql @exec_msg, N'@BookId int out', @BookId out
Declare @NumberOfBooks int;
SELECT @NumberOfBooks=Quantity FROM Books WHERE Id=@BookId;
---------------------------------------------------------
	EXEC ('UPDATE '+@Table+' SET DateIn=NULl WHERE id='+@CardId);
	EXEC ('UPDATE '+@Table+' SET DateIn=GetDate() WHERE id='+@CardId);
---------------------------------------------------------

SELECT Name AS BookTitle, @NumberOfBooks AS PreviousQuantity, Quantity AS ActualQuantity FROM Books WHERE Id=@BookId;

SELECT * FROM Returned
EXCEPT
SELECT * FROM #tmp_returned;

EXEC('SELECT * FROM '+@Table+' WHERE id='+@CardId);

GO
/****** Object:  StoredProcedure [dbo].[TSBooks]    Script Date: 18.06.2015 10:54:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[TSBooks]
AS
SELECT Count(*) AS [Count] FROM S_Cards JOIN T_Cards
ON S_Cards.Id_Book=T_Cards.Id_Book;

GO
USE [master]
GO
ALTER DATABASE [library] SET  READ_WRITE 
GO
