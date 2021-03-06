USE [SaintsCore]
GO

DECLARE	@return_value int
DECLARE @ID nvarchar(max) = N'688307ee-aff1-4c4f-bdd9-85fea3c4c2a6';
SELECT @ID, CONVERT(uniqueidentifier, @ID);
DECLARE @userID nvarchar(max) = N'84D4E526-ED04-43DA-9433-5D822A2532DA';
SELECT @userID, CONVERT(uniqueidentifier, @userID);
DECLARE @addressID nvarchar(max) = N'85D4E526-ED04-43DA-9433-5D822A2532DC';
SELECT @addressID, CONVERT(uniqueidentifier, @addressID);
DECLARE @emailID nvarchar(max) = N'84D4E526-ED04-43DA-9433-5D822A2532BC';
SELECT @emailID, CONVERT(uniqueidentifier, @emailID);

EXEC	@return_value = [dbo].[User_Add]
		@Id = @ID,
		@FName = N'Hany',
		@LName = N'Seif',
		@MName = N'Mina',
		@DOB = N'01/01/2001',
		@POB = N'Cairo, Egypt',
		@currentUserId = @userID,
		@AddressID = @addressID,
		@Address1 = '111',
		@Address2 = NULL,
		@City = N'Cairo',
		@State = N'MA',
		@Zip = N'01770',
		@Country = 'USA',
		@EmailID = @emailID,
		@EmailAddress = N'mina.botros@ge.com'

SELECT	'Return Value' = @return_value

GO
