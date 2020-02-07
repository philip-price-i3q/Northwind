IF OBJECT_ID('[dbo].[newproc]') IS NOT NULL
	DROP PROCEDURE [dbo].[newproc];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--SET QUOTED_IDENTIFIER ON|OFF
--SET ANSI_NULLS ON|OFF
--GO
CREATE PROCEDURE [dbo].[newproc]
    @parameter_name AS INT
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
    SELECT CustomerID,
           CompanyName,
           ContactName,
           ContactTitle,
           Address,
           City,
           Region,
           PostalCode,
           Country,
           Phone,
           Fax FROM dbo.Customers
GO
