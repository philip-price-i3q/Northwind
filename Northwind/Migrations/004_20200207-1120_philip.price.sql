-- <Migration ID="249fd755-76e3-40b9-9d01-129d07a7d142" />
GO


SET DATEFORMAT YMD;


GO
PRINT (N'Add 1 row to [dbo].[Region]');

INSERT  INTO [dbo].[Region] ([RegionID], [RegionDescription])
VALUES                     (6, N'SouthEastern                                      ');


GO