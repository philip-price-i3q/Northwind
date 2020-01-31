-- <Migration ID="3fbb7809-a9b9-4900-ac5d-bf63aaa16a0a" />
GO

PRINT N'Creating [dbo].[StatusLookup]'
GO
CREATE TABLE [dbo].[StatusLookup]
(
[StatusKey] [int] NOT NULL,
[StatusName] [varchar] (100) NULL
)
GO
PRINT N'Creating primary key [StatusLookupPK] on [dbo].[StatusLookup]'
GO
ALTER TABLE [dbo].[StatusLookup] ADD CONSTRAINT [StatusLookupPK] PRIMARY KEY CLUSTERED  ([StatusKey])
GO
