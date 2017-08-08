-- Hour Marking case database creation scripts 2016-10-27

-- Keywords that shuold be avoided: user, table, name, text
-- In other systems even: description, owner, id 


CREATE PROCEDURE sp01_CreateTables

AS

	CREATE TABLE Tag
	(
		id			        INT		        NOT NULL IDENTITY(1001,1),
		name			    VARCHAR(200)	NOT NULL,
        [description]       VARCHAR(MAX)    ,	

		CONSTRAINT pk_Tag PRIMARY KEY (id)
	);

	CREATE TABLE WorkTarget 
	(
		id			        INT			    NOT NULL IDENTITY(1,1),	-- Surrogate key
		name				VARCHAR(200)	NOT NULL,
		[description]	    VARCHAR(MAX)	,

		CONSTRAINT pk_WorkTarget PRIMARY KEY (id)
	);

	CREATE TABLE [User]
	(
		id			            INT		        NOT NULL IDENTITY(101,1),	-- Surrogate key and auto-generated, autoincrement
		firstName				VARCHAR(200)	NOT NULL,
        lastName				VARCHAR(200)	NOT NULL,
		email			        VARCHAR(250)    NOT NULL,
        phoneNumber			    VARCHAR(200)    ,
		isAdmin         	    BIT			    NOT NULL,				

		CONSTRAINT pk_User PRIMARY KEY (id),

		CONSTRAINT unique_User_email UNIQUE (email),
		CONSTRAINT unique_User_phoneNumber UNIQUE (phoneNumber)
	);


  
	CREATE TABLE UserWorkTarget
    (
        userId              INT            NOT NULL,
        workTargetId        INT            NOT NULL,

        CONSTRAINT pk_UserWorkTarget PRIMARY KEY (userId, workTargetId),

        CONSTRAINT fk_UserWorkTarget_User FOREIGN KEY (userId) REFERENCES [User](id),
        CONSTRAINT fk_UserWorkTarget_WorkTarget FOREIGN KEY (workTargetId) REFERENCES WorkTarget(id)
     );

    CREATE TABLE WorkTargetsTag
    (
        workTargetId        INT             NOT NULL,
        tagId               INT             NOT NULL,


        CONSTRAINT pk_WorkTargetsTag PRIMARY KEY (workTargetId, tagId),

        CONSTRAINT fk_WorkTargetsTag_WorkTarget FOREIGN KEY (workTargetId) 
					REFERENCES WorkTarget(id),

        CONSTRAINT fk_WorkTargetsTag_Tag FOREIGN KEY (tagId)
                REFERENCES Tag(id) 
    );

	CREATE TABLE HourMarking
	(
		id				    INT			    NOT NULL IDENTITY(10001,1),	-- Surrogate key
		[hours]				DECIMAL(4,2)  	NOT NULL CHECK ([hours]>0),
		[date]			    DATE	        NOT NULL,
		userId				INT             NOT NULL,
	    workTargetId        INT             NOT NULL,
		tagId               INT			    NOT NULL,

		CONSTRAINT pk_HourMarking PRIMARY KEY (id),

		CONSTRAINT fk_HourMarking_User FOREIGN KEY (userId) REFERENCES [User](id),
        CONSTRAINT fk_HourMarking_WorkTarget FOREIGN KEY (workTargetId)	REFERENCES WorkTarget(id),
		CONSTRAINT fk_HourMarking_Tag FOREIGN KEY (tagId) REFERENCES Tag(id)
	);

-- Finally, display a message
IF (@@Error = 0) 
	BEGIN
		PRINT '============================='
		PRINT ' TABLES CREATED SUCCESSFULLY.'
		PRINT '============================='
		PRINT ' '
	END

-- End --