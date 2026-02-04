/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a database 'DataWarehouse'. 
    This script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
*/

create database DataWarehouse

use DataWarehouse

-- Create schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
go
