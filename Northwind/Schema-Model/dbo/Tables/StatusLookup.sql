CREATE TABLE [dbo].[StatusLookup]
(
[StatusKey] [int] NOT NULL,
[StatusName] [varchar] (100) NULL
)
GO
ALTER TABLE [dbo].[StatusLookup] ADD CONSTRAINT [StatusLookupPK] PRIMARY KEY CLUSTERED  ([StatusKey])
GO
