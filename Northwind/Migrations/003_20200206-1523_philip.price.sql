-- <Migration ID="461ba6fa-25aa-43d8-b667-93a158e41ab8" />
GO

PRINT N'Altering [dbo].[Suppliers]'
GO
ALTER TABLE [dbo].[Suppliers] ADD
[Facebook] [nchar] (10) NULL
GO

SET IMPLICIT_TRANSACTIONS, NUMERIC_ROUNDABORT OFF;
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, NOCOUNT, QUOTED_IDENTIFIER ON;

SET DATEFORMAT YMD;


GO
IF (SELECT COUNT(*)
    FROM   [dbo].[Region]) = 0
    BEGIN
        PRINT (N'Add 5 rows to [dbo].[Region]');
        INSERT  INTO [dbo].[Region] ([RegionID], [RegionDescription])
        VALUES                     (1, N'Eastern                                           ');
        INSERT  INTO [dbo].[Region] ([RegionID], [RegionDescription])
        VALUES                     (2, N'Western                                           ');
        INSERT  INTO [dbo].[Region] ([RegionID], [RegionDescription])
        VALUES                     (3, N'Northern                                          ');
        INSERT  INTO [dbo].[Region] ([RegionID], [RegionDescription])
        VALUES                     (4, N'Southern                                          ');
        INSERT  INTO [dbo].[Region] ([RegionID], [RegionDescription])
        VALUES                     (5, N'NorthEastern                                      ');
    END


GO