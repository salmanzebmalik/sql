/* AdventureWorksDW2022 */
RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/AdventureWorksDW2022.bak'
GO

RESTORE DATABASE AdventureWorksDW2022
FROM DISK = '/var/opt/mssql/AdventureWorksDW2022.bak'
WITH MOVE 'AdventureWorksDW2022' TO '/var/opt/mssql/data/AdventureWorksDW2022.mdf',
     MOVE 'AdventureWorksDW2022_log'  TO '/var/opt/mssql/data/AdventureWorksDW2022_log.ldf',
     REPLACE;
GO

/* MyDatabase */
RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/MyDatabase.bak'
GO

RESTORE DATABASE MyDatabase
FROM DISK = '/var/opt/mssql/MyDatabase.bak'
WITH MOVE 'MyDatabase' TO '/var/opt/mssql/data/MyDatabase.mdf',
     MOVE 'MyDatabase_log'  TO '/var/opt/mssql/data/MyDatabase_log.ldf',
     REPLACE;
GO

/* SalesDB */
RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/SalesDB.bak'
GO

RESTORE DATABASE SalesDB
FROM DISK = '/var/opt/mssql/SalesDB.bak'
WITH MOVE 'SalesDB' TO '/var/opt/mssql/data/SalesDB.mdf',
     MOVE 'SalesDB_log'  TO '/var/opt/mssql/data/SalesDB_log.ldf',
     REPLACE;
GO