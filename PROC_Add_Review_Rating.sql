IF OBJECT_ID('dbo.AddReviewRating', 'P') IS NOT NULL
DROP PROC dbo.AddReviewRating
GO

CREATE PROC dbo.AddReviewRating

@ReviewID INT = NULL,
@CustomerID INT = NULL,
@PlusMinus CHAR(1) = NULL

AS

	DECLARE @error AS NVARCHAR(100);
	
	IF @ReviewID IS NULL OR @CustomerID IS NULL OR @PlusMinus IS NULL
	BEGIN
		SET @error = 'Error! Rating lacking information.';
		RAISERROR(@error, 16,1);
		RETURN;
	END

	INSERT INTO dbo.[Review Ratings] VALUES
	(@ReviewID, @CustomerID, @PlusMinus)


GO
