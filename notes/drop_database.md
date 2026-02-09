# DROP Database

To delete a database in SQL Server, you can use the `DROP DATABASE` command. Here's the general syntax:

```sql
DROP DATABASE database_name;
```

### Steps:

1. **Connect to SQL Server**:
   First, ensure you're connected to the SQL Server instance where the database resides.

2. **Close all connections to the database**:
   Before you can drop a database, you need to make sure there are no active connections to it. You can either close them manually or forcefully disconnect them.

   To check active connections:

   ```sql
   SELECT 
       db_name(dbid) as DatabaseName,
       count(dbid) as Connections
   FROM sys.sysprocesses
   GROUP BY dbid
   HAVING dbid > 4
   ```

   If there are active connections, you can use the following command to terminate them:

   ```sql
   ALTER DATABASE database_name SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
   ```

3. **Drop the database**:
   After ensuring there are no active connections, you can drop the database with the following command:

   ```sql
   DROP DATABASE database_name;
   ```

4. **Revert to multi-user mode (optional)**:
   If you had to set the database to single-user mode, you can revert it back to multi-user mode once the database is dropped.

   ```sql
   ALTER DATABASE database_name SET MULTI_USER;
   ```

### Example:

To delete a database named `TestDB`, you would run:

```sql
USE master;  -- Ensure you're in the master database
ALTER DATABASE TestDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  -- Disconnect users
DROP DATABASE TestDB;  -- Delete the database
```

### Important Notes:

* **Data loss**: This action is permanent, and all data in the database will be lost. Make sure you have a backup before performing this operation if needed.
* **Permissions**: You need the appropriate permissions to drop a database, typically being a member of the `sysadmin` or `db_owner` roles.
