-- (Original script templates by Kari Silpiö 2012)
-- Juhani Välimäki 
-- Idea case database creation scripts 2013-05-05


CREATE PROCEDURE sp03_DeleteAllData

AS
/* Juhani added a template for creating more ***
	DELETE FROM ;
*/


	DELETE FROM HourMarking;
	DELETE FROM WorkTargetsTag;
	DELETE FROM UserWorkTarget;
	DELETE FROM [User];
	DELETE FROM WorkTarget;
	DELETE FROM Tag;
	
/* Juhani added a template for creating more ***
	DELETE FROM ;
*/

-- Finally, display a message
IF (@@Error = 0)
	BEGIN
		PRINT '======================================='
		PRINT ' ALL TABLES'' DATA DELETED SUCCESSFULLY.'
		PRINT '======================================='
		PRINT ' '
	END
ELSE
	BEGIN
		PRINT '=================================='
		PRINT ' DELETING ALL TABLES'' DATA FAILED!'
		PRINT ' See the error messages above.'
		PRINT '=================================='
		PRINT ' '
	END

-- End