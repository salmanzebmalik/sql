# Connecting to SQL Server via Docker on macOS

This guide walks you through the steps of setting up SQL Server in a Docker container on your MacBook.

## 1. Install Docker

Before proceeding, ensure Docker Desktop is installed on your system. You can verify the installation by running:

```bash
docker --version
````

## 2. Pull the SQL Server Docker Image

To get the latest SQL Server image, run the following command:

```bash
docker pull mcr.microsoft.com/mssql/server:2022-latest
```

## 3. Run SQL Server in Docker

Start the SQL Server container by running the following command:

```bash
docker run -e "ACCEPT_EULA=Y" \
           -e "SA_PASSWORD=sg1skeA*63R87r@n6C" \
           -p 1433:1433 \
           -v sql_data:/var/opt/mssql \
           --name sqlserver \
           --platform=linux/amd64 \
           -d mcr.microsoft.com/mssql/server:2022-latest
```

### Explanation:

* **ACCEPT_EULA=Y**: Accepts the SQL Server End User License Agreement.
* **SA_PASSWORD**: Sets the password for the SQL Server `sa` account (please ensure it meets SQL Server’s password policy).
* **-p 1433:1433**: Maps port 1433 on your Mac to port 1433 in the container for SQL Server.
* **-v sql_data:/var/opt/mssql**: Uses a Docker volume to store SQL Server data.
* **--name sqlserver**: Names the container `sqlserver`.
* **--platform=linux/amd64**: Ensures compatibility with macOS.
* **-d**: Runs the container in detached mode (in the background).

## 4. Run SQL Server with Docker Compose

Alternatively, you can use Docker Compose to manage the SQL Server container. Create a `docker-compose.yml` file and add the following content:

```yaml
version: "3.8"

services:
  sqlserver:
    image: mcr.microsoft.com/mssql/server:2022-latest
    platform: linux/amd64
    container_name: sqlserver
    environment:
      SA_PASSWORD: "sg1skeA*63R87r@n6C"
      ACCEPT_EULA: "Y"
    ports:
      - "1433:1433"
    volumes:
      - data:/var/opt/mssql

volumes:
  data:
```

To start the container, run:

```bash
docker compose up -d
```

## 5. Verify SQL Server Container Status

To check if the SQL Server container is running, use:

```bash
docker ps
```

You should see something like:

```
sqlserver   mcr.microsoft.com/mssql/server:2022-latest
```

If the container is not running, start it with:

```bash
docker start sqlserver
```

## 6. Access SQL Server from the Docker Container

### Step 1: Open the Container Shell

To access the shell of the running container, execute:

```bash
docker exec -it sqlserver bash
```

### Step 2: Connect to SQL Server Using `sqlcmd`

Once inside the container, connect to SQL Server with:

```bash
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'sg1skeA*63R87r@n6C' -C
```

Now, you can run SQL queries directly in the SQL Server CLI.

For example:

```sql
SELECT name FROM sys.databases;
GO
```

To exit the SQL Server CLI, type:

```sql
QUIT
```

## 7. Manage SQL Server Data Stored in Docker Volume

If you used a Docker volume for SQL Server data, you can inspect it with:

```bash
docker volume ls
docker volume inspect sql_data
```

The data is stored in the following directory within the container:

```
/var/opt/mssql
```

## 8. View Container Logs

To view logs from the SQL Server container (useful for troubleshooting), run:

```bash
docker logs sqlserver
```

## 9. Run a Test Query from the Terminal

You can also run SQL queries without entering the container's shell. For a quick test, execute:

```bash
docker exec -it sqlserver \
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'sg1skeA*63R87r@n6C' \
-Q "SELECT @@VERSION"
```

## 10. Connect to SQL Server from Visual Studio Code (VSCode)

To connect to SQL Server from Visual Studio Code, follow these steps:

1. **Install Visual Studio Code** if you haven't already.
2. **Install the `SQL Server (mssql)` extension** in VSCode. Additionally, the `SQL Database Projects` extension and `SQLTools` (optional) are useful.
3. Press `Cmd + Shift + P` to open the Command Palette, then run `MS SQL: Connect`.

Configure the connection with the following settings:

```yaml
Profile: salmanzebmalik
Server: localhost
User: sa
Password: sg1skeA*63R87r@n6C
Port: 1433
```

Make sure to enable the **"Trust server certificate"** option to avoid SSL issues.

## 11. Useful Docker Commands for SQL Server Management

* **Stop SQL Server container**:

  ```bash
  docker stop sqlserver
  ```

* **Start SQL Server container**:

  ```bash
  docker start sqlserver
  ```

* **Remove SQL Server container**:

  ```bash
  docker rm -f sqlserver
  ```

---

By following these steps, you should now be able to run and manage SQL Server in a Docker container on your MacBook, as well as connect to it from both the terminal and Visual Studio Code.
