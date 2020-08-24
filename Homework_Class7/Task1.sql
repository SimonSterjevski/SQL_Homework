
select * from GradeDetails
--select * from AchievementType
--select * from Grade


CREATE OR ALTER PROCEDURE [dbo].[CreateGradeDetail]
(
	@GradeId int
,	@AchievementTypeID tinyint
,	@AchievementPoints tinyint
,	@AchievementMaxPoints tinyint
,	@AchievementDate datetime
)
AS
BEGIN
 BEGIN TRY
	INSERT INTO [dbo].[GradeDetails] (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
	VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)
	SELECT
		SUM(cast(gd.AchievementPoints as decimal(5,2)) / cast(gd.AchievementMaxPoints as decimal(5,2)) * act.ParticipationRate) as GradePoints
	FROM
		[dbo].[GradeDetails] as gd
		INNER JOIN [dbo].[AchievementType] as act on gd.AchievementTypeID = act.ID
	WHERE
		gd.GradeID = @GradeID
 END TRY
 BEGIN CATCH
	SELECT  
		ERROR_NUMBER() AS ErrorNumber
	,	ERROR_SEVERITY() AS ErrorSeverity
	,	ERROR_STATE() AS ErrorState
	,	ERROR_PROCEDURE() AS ErrorProcedure
	,	ERROR_LINE() AS ErrorLine
	,	ERROR_MESSAGE() AS ErrorMessage;
 END CATCH
END
GO
	

EXEC [dbo].[CreateGradeDetail]
	@GradeId = 20112
,	@AchievementTypeID = 77
,	@AchievementPoints = 97
,	@AchievementMaxPoints = 100
,	@AchievementDate = '2019-05-20'
GO
EXEC [dbo].[CreateGradeDetail]
	@GradeId = 123000
,	@AchievementTypeID = 1
,	@AchievementPoints = 95
,	@AchievementMaxPoints = 100
,	@AchievementDate = '2019-05-21'
GO


SELECT TOP 5 * 
FROM [dbo].[GradeDetails]
ORDER BY ID DESC
GO