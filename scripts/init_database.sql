/*
==================================
CREATE database and schema
=================================
Script purpose:
		This script creates a new db name 'DataWarehouse' after checking if it already exists.
		If the db exists, it is dropped and recreated. Additionally, the script sets up three schemas 
		within the db: 'bronze','silver','gold'.
WARNING:
	Running this script will drop the entire 'DataWarehouse' db if it exists.
	All the data in db will be permantely deleted. Proceed with caution 
	and ensure have proper backups before running this script
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' db
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create db 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schema
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
