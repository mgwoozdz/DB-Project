IF OBJECT_ID('dbo.AddReviewRating', 'P') IS NOT NULL
DROP PROC dbo.AddReviewRating
GO

CREATE PROC dbo.AddReviewRaiting

@ReviewID INT = NULL,
@CustomerID INT = NULL,
@Plus/Minus CHAR(1) = NULL,

AS

	DECLARE @error AS NVARCHAR(100);
	
	IF @ReviewID IS NULL OR @CustomerID IS NULL OR @Plus/Minus IS NULL
	BEGIN
		SET @error = 'Error! Rating lacking information.';
		RAISERROR(@error, 16,1);
		RETURN;
	END

	INSERT INTO dbo.[Reviews] VALUES
	(@ReviewID, @CustmerID, @Plus/Minus)


GO
