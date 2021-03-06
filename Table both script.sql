USE [UPAudit]
GO
/****** Object:  Table [dbo].[M_Designation_Detail]    Script Date: 05-Feb-20 7:40:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Designation_Detail](
	[ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[DesignationID] [numeric](10, 0) NULL,
	[ParentDesignationID] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MDesignation]    Script Date: 05-Feb-20 7:40:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MDesignation](
	[ID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ParentID] [numeric](10, 0) NULL,
	[SHName] [varchar](6) NULL,
	[TreeLevel] [int] NULL,
	[Flag] [varchar](1) NULL,
	[CreatedBy] [nvarchar](32) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](32) NULL,
	[UpdatedDate] [datetime] NULL,
	[HName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[M_Designation_Detail] ON 

INSERT [dbo].[M_Designation_Detail] ([ID], [DesignationID], [ParentDesignationID]) VALUES (CAST(1 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1,2,15,16,')
INSERT [dbo].[M_Designation_Detail] ([ID], [DesignationID], [ParentDesignationID]) VALUES (CAST(2 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1,2,15,16,')
INSERT [dbo].[M_Designation_Detail] ([ID], [DesignationID], [ParentDesignationID]) VALUES (CAST(10009 AS Numeric(10, 0)), CAST(1 AS Numeric(10, 0)), N'24')
SET IDENTITY_INSERT [dbo].[M_Designation_Detail] OFF
SET IDENTITY_INSERT [dbo].[MDesignation] ON 

INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(1 AS Numeric(10, 0)), N'Senior Auditor', CAST(24 AS Numeric(10, 0)), N'AO', 0, NULL, N'7', CAST(0x0000A25200B568E5 AS DateTime), NULL, NULL, N'ज्येष्ट लेखा परीक्षक')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(2 AS Numeric(10, 0)), N'Chief Audit Officer', CAST(0 AS Numeric(10, 0)), N'HO', 0, NULL, N'7', CAST(0x0000A25200B5D8D2 AS DateTime), NULL, NULL, N'मुख्य लेखा परीक्षा अधिकारी')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(15 AS Numeric(10, 0)), N'Deputy Chief Audit Officer ', CAST(2 AS Numeric(10, 0)), N'RO', 0, NULL, N'7', CAST(0x0000A2630108CDF5 AS DateTime), NULL, NULL, N'उप मुख्य लेखा परीक्षा अधिकारी')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(16 AS Numeric(10, 0)), N'District Audit Officer', CAST(15 AS Numeric(10, 0)), N'DO', 0, NULL, N'7', CAST(0x0000A26301090E2A AS DateTime), NULL, NULL, N'ज़िला लेखा परीक्षा अधिकारी')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(20 AS Numeric(10, 0)), N'Assistant Audit Officer ', CAST(2 AS Numeric(10, 0)), N'AO', 0, NULL, N'7', CAST(0x0000A276012F953A AS DateTime), NULL, NULL, N'सहायक लेखा परीक्षा अधिकारी')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(22 AS Numeric(10, 0)), N'Joint Chief Audit Officer', CAST(2 AS Numeric(10, 0)), N'HO', 0, NULL, NULL, CAST(0x0000A2AF00B89BC3 AS DateTime), NULL, NULL, N'संयुक्त मुख्य लेखा परीक्षा अधिकारी')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(23 AS Numeric(10, 0)), N'Deputy Chief Audit Officer(HO)', CAST(2 AS Numeric(10, 0)), N'HO', 0, NULL, NULL, CAST(0x0000A2AF00B8EE79 AS DateTime), NULL, NULL, N'उप मुख्य लेखा परीक्षा अधिकारी')
INSERT [dbo].[MDesignation] ([ID], [Name], [ParentID], [SHName], [TreeLevel], [Flag], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [HName]) VALUES (CAST(24 AS Numeric(10, 0)), N'Auditor ', CAST(2 AS Numeric(10, 0)), N'AO', 0, NULL, NULL, CAST(0x0000A2AF00BA722E AS DateTime), NULL, NULL, N'लेखा परीक्षक ')
SET IDENTITY_INSERT [dbo].[MDesignation] OFF
ALTER TABLE [dbo].[MDesignation] ADD  CONSTRAINT [DF_MDesignation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
