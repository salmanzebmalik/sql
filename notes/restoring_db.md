# Restoring Database

## Restoring Database from `.bak` files: [Script](/mssql_setup/scripts/restore_database.sql)

- If you're running mssql server in docker, then you will need to paste `.bak`files from your local repository to docker container.
   
   You can run `docker cp <local_file_address>/<filename>.bak /var/opt/mssql/<filename>.bak`

   After successfully pasting the file in docker repository, you can run the following command given below to convert it in a database.
```sql
/* filename */
RESTORE FILELISTONLY
FROM DISK = '/var/opt/mssql/filename.bak'
GO

RESTORE DATABASE filename
FROM DISK = '/var/opt/mssql/filename.bak'
WITH MOVE 'filename' TO '/var/opt/mssql/data/filename.mdf',
     MOVE 'filename_log'  TO '/var/opt/mssql/data/filename_log.ldf',
     REPLACE;
GO
```