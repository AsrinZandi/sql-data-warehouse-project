
----Script purpose:
----This scripts create new data base plus three difrent scema of bronze,silver and gold 

Use master;
-----create new database
create database DataWarehouse;
use DataWarehouse;
---create new schema for bronze, silver and gold layers
GO
CREATE SCHEMA bronze;
GO
GO
CREATE SCHEMA silver;
GO
GO
CREATE SCHEMA gold;
GO


