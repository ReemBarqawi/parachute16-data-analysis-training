
/****** Object:  Database [SchoolNew]    Script Date: 11/18/2025 5:21:18 PM ******/
CREATE DATABASE [SchoolNew]
go
USE [SchoolNew]
GO

CREATE TABLE [dbo].[Marks](
	[Student_SubjectID] [int] NULL,
	[Mark] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[School1]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School1](
	[SchoolID] [int] NOT NULL,
	[SchoolName] [varchar](30) NULL,
	[SchoolAddress] [varchar](50) NULL,
	[PhoneNo] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Gender] [char](1) NULL,
	[Birthdate] [date] NULL,
	[SchooldID] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSubject]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubject](
	[StudentSubjectID] [int] NOT NULL,
	[StudentID] [int] NULL,
	[SubjectID] [int] NULL,
 CONSTRAINT [PK_StudentSubject] PRIMARY KEY CLUSTERED 
(
	[StudentSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] NOT NULL,
	[SubjectNameAr] [nvarchar](30) NULL,
	[SubjectNameEn] [varchar](30) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] NOT NULL,
	[FirstName] [nchar](30) NULL,
	[LastName] [nchar](30) NULL,
	[Gender] [char](1) NULL,
	[BirthDate] [date] NULL,
	[SchoolID] [int] NULL,
	[IsActive] [bit] NULL,
	[Salary] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherStudent]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherStudent](
	[TeacherID] [int] NULL,
	[StudentID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 11/18/2025 5:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[TeacherID] [int] NULL,
	[SubjectID] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (1, 90)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (2, 89)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (3, 78)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (4, 67)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (5, 89)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (6, 68)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (7, 89)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (8, 54)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (9, 65)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (10, 56)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (11, 55)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (12, 45)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (13, 79)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (14, 98)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (15, 76)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (16, 87)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (17, 66)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (18, 78)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (19, 94)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (20, 94)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (21, 93)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (22, 92)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (23, 94)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (24, 67)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (25, 85)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (26, 67)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (27, 65)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (28, 87)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (29, 88)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (30, 77)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (31, 76)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (32, 74)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (33, 64)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (34, 66)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (35, 46)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (36, 56)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (37, 67)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (38, 87)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (39, 88)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (40, 98)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (41, 88)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (42, 90)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (43, 91)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (44, 76)
GO
INSERT [dbo].[Marks] ([Student_SubjectID], [Mark]) VALUES (45, 65)
GO
INSERT [dbo].[School1] ([SchoolID], [SchoolName], [SchoolAddress], [PhoneNo]) VALUES (1, N'Khalda School', N'Amman-Khalda', NULL)
GO
INSERT [dbo].[School1] ([SchoolID], [SchoolName], [SchoolAddress], [PhoneNo]) VALUES (2, N'Amman School', N'Amman', NULL)
GO
INSERT [dbo].[School1] ([SchoolID], [SchoolName], [SchoolAddress], [PhoneNo]) VALUES (3, N'King School', N'Irbid', NULL)
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (1, N'Batool', N'Abu Faraha ', N'F', CAST(N'1994-02-28' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (2, N'Haya', N'Sewdan', N'F', CAST(N'1997-12-25' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (3, N'Aya', N'Asem', N'F', CAST(N'1994-08-26' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (4, N'Murad', N'Adel', N'M', CAST(N'1995-06-27' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (5, N'Dana', N'Ababenh', N'F', CAST(N'1995-08-28' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (6, N'Hamzeh', N'Halwaa', N'M', CAST(N'2001-08-31' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (7, N'Ahmad', N'Abed', N'M', CAST(N'1989-01-26' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (8, N'Namaa', N'Azazieh', N'F', CAST(N'1995-05-13' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (9, N'Sara', N'Ahmad', N'M', CAST(N'1998-09-22' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (10, N'Ali', N'Abed', N'M', CAST(N'1996-11-02' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (11, N'Zaid', N'Belal', N'M', CAST(N'1997-08-09' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (12, N'Leen', N'Saleh', N'F', CAST(N'2002-03-04' AS Date), 1)
GO
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Gender], [Birthdate], [SchooldID]) VALUES (13, N'husam', N'saleh', N'M', CAST(N'2002-03-04' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (2, 1, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (3, 2, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (4, 2, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (5, 3, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (6, 3, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (7, 4, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (8, 4, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (9, 4, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (10, 5, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (11, 5, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (12, 5, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (13, 6, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (14, 6, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (15, 6, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (16, 7, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (17, 7, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (18, 7, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (19, 7, 4)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (20, 8, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (21, 8, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (22, 8, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (23, 8, 4)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (24, 9, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (25, 9, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (26, 9, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (27, 9, 4)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (28, 10, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (29, 10, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (30, 10, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (31, 10, 4)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (32, 10, 5)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (33, 10, 6)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (34, 11, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (35, 11, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (36, 11, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (37, 11, 4)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (38, 11, 5)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (39, 11, 6)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (40, 12, 1)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (41, 12, 2)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (42, 12, 3)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (43, 12, 4)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (44, 12, 5)
GO
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [StudentID], [SubjectID]) VALUES (45, 12, 6)
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectNameAr], [SubjectNameEn]) VALUES (1, N'رياضيات', N'Math')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectNameAr], [SubjectNameEn]) VALUES (2, N'انجليزي', N'English')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectNameAr], [SubjectNameEn]) VALUES (3, N'علوم', N'Science')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectNameAr], [SubjectNameEn]) VALUES (4, N'فن', N'Art')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectNameAr], [SubjectNameEn]) VALUES (5, N'عربي', N'Arabic')
GO
INSERT [dbo].[Subjects] ([SubjectID], [SubjectNameAr], [SubjectNameEn]) VALUES (6, N'الاحياء', N'Bio')
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (1, N'Sarah                         ', N'Malkawi                       ', N'F', CAST(N'1985-09-05' AS Date), 1, 1, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (2, N'Shahed                        ', N'Ahmad                         ', N'F', CAST(N'1986-08-15' AS Date), 1, 1, CAST(500 AS Decimal(18, 0)))
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (3, N'Mohammad                      ', N'Nasser                        ', N'M', CAST(N'1977-05-17' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (4, N'Saleem                        ', N'Alfaqeeh                      ', N'M', CAST(N'1965-10-24' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (5, N'Israa                         ', N'Naeem                         ', N'F', CAST(N'1980-03-02' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (6, N'Fatmeh                        ', N'Ahmad                         ', N'F', CAST(N'1971-03-21' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Teachers] ([TeacherID], [FirstName], [LastName], [Gender], [BirthDate], [SchoolID], [IsActive], [Salary]) VALUES (8, N'rama                          ', N'yousef                        ', N'F', CAST(N'1980-09-08' AS Date), 1, 0, NULL)
GO
INSERT [dbo].[TeacherSubject] ([TeacherID], [SubjectID]) VALUES (1, 4)
GO
INSERT [dbo].[TeacherSubject] ([TeacherID], [SubjectID]) VALUES (2, 5)
GO
INSERT [dbo].[TeacherSubject] ([TeacherID], [SubjectID]) VALUES (3, 3)
GO
INSERT [dbo].[TeacherSubject] ([TeacherID], [SubjectID]) VALUES (4, 1)
GO
INSERT [dbo].[TeacherSubject] ([TeacherID], [SubjectID]) VALUES (5, 2)
GO
INSERT [dbo].[TeacherSubject] ([TeacherID], [SubjectID]) VALUES (6, 6)
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_StudentSubject] FOREIGN KEY([Student_SubjectID])
REFERENCES [dbo].[StudentSubject] ([StudentSubjectID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_StudentSubject]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_School1] FOREIGN KEY([SchooldID])
REFERENCES [dbo].[School1] ([SchoolID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_School1]
GO
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubject_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_StudentSubject_Students]
GO
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubject_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_StudentSubject_Subjects]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_School1] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[School1] ([SchoolID])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_School1]
GO
ALTER TABLE [dbo].[TeacherStudent]  WITH CHECK ADD  CONSTRAINT [FK_TeacherStudent_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[TeacherStudent] CHECK CONSTRAINT [FK_TeacherStudent_Students]
GO
ALTER TABLE [dbo].[TeacherStudent]  WITH CHECK ADD  CONSTRAINT [FK_TeacherStudent_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[TeacherStudent] CHECK CONSTRAINT [FK_TeacherStudent_Teachers]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeacherSubject_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_TeacherSubject_Subjects]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_TeacherSubject_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_TeacherSubject_Teachers]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK_Students] CHECK  (([Gender]='F' OR [Gender]='M'))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK_Students]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [CK_Teachers] CHECK  (([Gender]='M' OR [Gender]='F'))
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [CK_Teachers]
GO
USE [master]
GO
ALTER DATABASE [SchoolNew] SET  READ_WRITE 
GO
