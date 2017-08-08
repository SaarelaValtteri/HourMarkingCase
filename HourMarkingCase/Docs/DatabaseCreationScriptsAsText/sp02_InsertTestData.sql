-- Hour Marking case database creation scripts 2016-10-27


CREATE PROCEDURE sp02_InsertTestData

AS
INSERT INTO Tag
        (name, [description])
    VALUES
        ('HTML', 'Website Design'),
        ('C#',  'Console Writeline'),
        ('CSS', 'Cascading Style Sheet'),
        ('SQL', 'Database creation'),
		('Javascript', Null),
		('JQuery', Null),
		('C++', Null),
		('AngularJS', Null),
		('Database Roles', 'SQL:Role'),
		('SEO', 'Search Engine Optimization');

INSERT INTO WorkTarget
		(name, [description])
	VALUES
		('Programming', 'Just a test'),
        ('Front-End', 'Just a test'),
        ('Back-End', 'Just a test'),
        ('Database', 'Just a test'),
		('Javascript Implementation', 'Just a test');

INSERT INTO [User]
		(firstName, lastName, email, phoneNumber, isAdmin)
	VALUES
		('Bill', 'Tester', 'bill@yahoo.com', '123456789', 0),
		('Mary', 'Christmas', 'hhh@aaa.com', '987654321', 0),
        ('Joe', 'West', 'joe@west.com', '0456789123', 0),
        ('Barry', 'Allen', 'barry@allen.com', '384848484', 1),
		('Niko', 'Rasku', 'niko@rasku.com', '0500423111', 1);	




INSERT INTO UserWorkTarget
		(userId, workTargetId)
	VALUES
		(101, 1),
		(101, 2),
        (101, 3),
		(101, 4),
		(101, 5),
		(102, 1),
		(102, 2),
		(102, 3),
		(102, 4),
		(102, 5),
		(103, 1),
		(103, 2),
		(103, 3),
		(103, 4),
		(103, 5),
		(104, 1),
		(104, 2),
		(104, 3),
		(104, 4),
		(104, 5);

INSERT INTO WorkTargetsTag
        (workTargetId, tagId)
    VALUES
        (1, 1001),
        (1, 1002),
        (1, 1003),
        (1, 1004),
		(1, 1005),
		(2, 1006),
        (2, 1007),
        (2, 1008),
        (2, 1009),
		(2, 1010),
		(3, 1001),
        (3, 1002),
        (3, 1003),
        (3, 1004),
		(3, 1005),
		(4, 1006),
        (4, 1007),
        (4, 1008),
        (4, 1009),
		(4, 1010),
		(5, 1001),
        (5, 1002),
        (5, 1003),
        (5, 1004),
		(5, 1005);

INSERT INTO HourMarking
		([hours], [date], userId, workTargetId, tagId)
	VALUES
		(0.5, '2015-10-12', 101, 1, 1001),
        (10, '2015-03-06', 101, 1, 1002),
        (15, '2015-12-10', 101, 1, 1003),
        (2, '2015-09-01', 101, 1, 1004),
		(5, '2015-06-04', 101, 1, 1005),
		(3, '2015-10-12', 102, 2, 1001),
        (5, '2015-03-06', 102, 2, 1002),
        (4, '2015-12-10', 102, 2, 1003),
        (5, '2015-09-01', 102, 2, 1004),
		(5, '2015-06-04', 102, 2, 1005),
		(5, '2015-10-12', 103, 3, 1001),
        (6.5, '2015-03-06', 103, 3, 1002),
        (3.5, '2015-12-10', 103, 3, 1003),
        (7.2, '2015-09-01', 103, 3, 1004),
		(3.2, '2015-06-04', 103, 3, 1005),
		(0.5, '2015-10-12', 104, 4, 1001),
        (2.5, '2015-03-06', 104, 4, 1002),
        (1.5, '2015-12-10', 104, 4, 1003),
        (9, '2015-09-01', 104, 4, 1004),
		(10, '2015-06-04', 104, 4, 1005),
		(0.5, '2015-10-12', 105, 5, 1001),
        (1, '2015-03-06', 105, 5, 1002),
        (4.5, '2015-12-10', 105, 5, 1003),
        (12.5, '2015-09-01', 105, 5, 1004),
		(5, '2015-06-04', 105, 5, 1005),
		(13.5, '2015-10-12', 101, 1, 1006),
        (15, '2015-03-06', 102, 2, 1006),
        (4, '2015-12-10', 103, 3, 1006),
        (16.5, '2015-09-01', 104, 4, 1006),
		(2, '2015-06-04', 105, 5, 1006);

		/* Optional: */
/* 
EXEC sp03_DeleteAllData;
*/

/* Template, copy from this, do not edit this template ***

INSERT INTO Category
		(categoryId, 
		categoryTitle,
		description)
	VALUES
		(,
		'',
		'')
		;	

*/

/* Template, copy from this, do not edit this template ***

INSERT INTO Idea
		(ideaId,	title,
		description,
		budget,		isReadyForComments,
		peopleNeeded,		creationDate,		lastModified,
		categoryId)
	VALUES
		(100,		'',
		'',
		'.',		,
		,					'2013--',			'2013-- :',
		1),
		(100,		'',
		'',
		'.',		,
		,					'2013--',			'2013-- :',
		1)
		;

*/


/* Template, copy from this, do not edit this template ***

INSERT INTO Member
		(memberId,
		userName,			
		email)
	VALUES
		(10,
		'',
		'@.'
		)
		;

*/		


/* Template, copy from this, do not edit this template ***

INSERT INTO MemberIdea
		(memberId, ideaId)
	VALUES
		(10,		100),
		(10,		100)
		;

*/		

/*INSERT INTO MemberIdea
		(memberId, ideaId)
	VALUES
		(101,		1003),
		(101,		1001),
		(102,		1001)
		;
*/


/* Template, copy from this, do not edit this template ***

INSERT INTO Comment
		(memberId,	ideaId,		commentTimeStamp,			commentLine)
	VALUES
		(10,		100,		'-- :',		''),
		(10,		100,		'-- :',		'')
		;

*/		



-- Finally, display a message (not robust error handling...)
IF (@@Error = 0) 
	BEGIN
		PRINT '================================='
		PRINT ' TEST DATA INSERTED SUCCESSFULLY.'
		PRINT '================================='
		PRINT ' '
	END
ELSE
	BEGIN
		PRINT '================================='
		PRINT ' TEST DATA INSERTION FAILED!'
		PRINT ' See the error messages above.'
		PRINT ' '
		PRINT ' (Maybe tables do not exist yet?)'
		PRINT '================================='
		PRINT ' '
	END

-- End --