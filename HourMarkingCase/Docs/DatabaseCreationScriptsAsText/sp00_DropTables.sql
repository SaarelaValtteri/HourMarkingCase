-- Hour Marking case database creation scripts 2016-10-27


CREATE PROCEDURE sp00_DropTables

AS

/*  Juhani added a template for creating more drops

	IF OBJECT_ID('') IS NOT NULL
		BEGIN
			DROP TABLE xxxxxx;
		END

*/
	IF OBJECT_ID('HourMarking') IS NOT NULL
		BEGIN
			DROP TABLE HourMarking;
		END

    IF OBJECT_ID('WorkTargetsTag') IS NOT NULL
		BEGIN
			DROP TABLE WorkTargetsTag;
		END

	IF OBJECT_ID('UserWorkTarget') IS NOT NULL
		BEGIN
			DROP TABLE UserWorkTarget;
		END

	IF OBJECT_ID('User') IS NOT NULL
		BEGIN
			DROP TABLE [User];
		END
		
	IF OBJECT_ID('WorkTarget') IS NOT NULL
		BEGIN
			DROP TABLE WorkTarget;
		END
	
	IF OBJECT_ID('Tag') IS NOT NULL
		BEGIN
			DROP TABLE Tag;
		END

/*  Juhani added a template for creating more drops

	IF OBJECT_ID('') IS NOT NULL
		BEGIN
			DROP TABLE xxxxxx;
		END

*/




-- Finally, display a message
IF (@@Error = 0) 
	BEGIN
		PRINT '================================='
		PRINT ' ALL TABLES DROPPED SUCCESSFULLY.'
		PRINT '================================='
		PRINT ' '
	END
ELSE
	BEGIN
		PRINT '=============================='
		PRINT ' See the error messages above!'
		PRINT '=============================='
		PRINT ' '
	END

-- End 