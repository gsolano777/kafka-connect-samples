# kafka-connect-samples
A docker compose project to show how to use Kafka Connect to move data from MySQL database into MongoDB collections.

# MySQL Database
For this project [MySQL Employees Sample Database](https://dev.mysql.com/doc/employee/en/) will be used.

MySQL java connector/driver is located in /kafka-connect/drivers/mysql_driver/mysql-connector-java-8.0.16.jar. The driver is mapped to Kafka Connect volume path: /usr/share/java/kafka-connect-jdbc/mysql_driver
 
# MongoDB
The docker project is configured to create the required Mongo database **Employees** with user: **employess** and password: **employees123**. 

All the data is persisted in volume path **/mongo/data:/data/db**.

# Running the project

```
docker-compose up --build
```

When starting the project with build param, mysql employees database will be installed in MySQL.

```
mysql-employees_1  | +-----------------------------+
mysql-employees_1  | | INFO                        |
mysql-employees_1  | +-----------------------------+
mysql-employees_1  | | CREATING DATABASE STRUCTURE |
mysql-employees_1  | +-----------------------------+
mysql-employees_1  | +------------------------+
mysql-employees_1  | | INFO                   |
mysql-employees_1  | +------------------------+
mysql-employees_1  | | storage engine: InnoDB |
mysql-employees_1  | +------------------------+
mysql-employees_1  | +---------------------+
mysql-employees_1  | | INFO                |
mysql-employees_1  | +---------------------+
mysql-employees_1  | | LOADING departments |
mysql-employees_1  | +---------------------+
mysql-employees_1  | +-------------------+
mysql-employees_1  | | INFO              |
mysql-employees_1  | +-------------------+
mysql-employees_1  | | LOADING employees |
mysql-employees_1  | +-------------------+
mysql-employees_1  | +------------------+
mysql-employees_1  | | INFO             |
mysql-employees_1  | +------------------+
mysql-employees_1  | | LOADING dept_emp |
mysql-employees_1  | +------------------+
mysql-employees_1  | +----------------------+
mysql-employees_1  | | INFO                 |
mysql-employees_1  | +----------------------+
mysql-employees_1  | | LOADING dept_manager |
mysql-employees_1  | +----------------------+
mysql-employees_1  | +----------------+
mysql-employees_1  | | INFO           |
mysql-employees_1  | +----------------+
mysql-employees_1  | | LOADING titles |
mysql-employees_1  | +----------------+
mysql-employees_1  | +------------------+
mysql-employees_1  | | INFO             |
mysql-employees_1  | +------------------+
mysql-employees_1  | | LOADING salaries |
mysql-employees_1  | +------------------+
mysql-employees_1  | +---------------------+
mysql-employees_1  | | data_load_time_diff |
mysql-employees_1  | +---------------------+
mysql-employees_1  | | 00:02:58            |
mysql-employees_1  | +---------------------+
mysql-employees_1  | 
mysql-employees_1  | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/test_db-master.zip
mysql-employees_1  | 
mysql-employees_1  | 2019-08-21T04:08:01.808081Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.16)  MySQL Community Server - GPL.
mysql-employees_1  | 
mysql-employees_1  | MySQL init process done. Ready for start up.
```

# Confluent Kafka Platform

The project includes a modified version of [Confluent docker-compose project](https://github.com/confluentinc/cp-docker-images/blob/5.3.0-post/examples/cp-all-in-one/docker-compose.yml)

# Kafka Connect Plugins

The plugins to run JDBC source connectors and MongoDB sink connectors are located in /kafka-connect/plugins

# Sample Connectors

[Source and sink sample connectors](/kafka-connect/scripts) can be run using the REST API. 

```
curl -H $CT -d "@samples.employees.source.json" -X POST http://localhost:8083/connectors
curl -H $CT -d "@samples.employees.target.json" -X POST http://localhost:8083/connectors
```