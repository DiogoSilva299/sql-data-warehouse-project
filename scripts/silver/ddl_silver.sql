/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================

This script creates tables in the 'silver' schema, adding the column dwh_create_date.
Run this script to re-define the DDL structure of 'silver' Tables.

===============================================================================
*/


CREATE TABLE [silver].[crm_cust_info](
	[cst_id] [int] NULL,
	[cst_key] [nvarchar](50) NULL,
	[cst_firstname] [nvarchar](50) NULL,
	[cst_lastname] [nvarchar](50) NULL,
	[cst_marital_status] [nvarchar](50) NULL,
	[cst_gndr] [nvarchar](50) NULL,
	[cst_create_date] [date] NULL,
	[dwh_create_date] [datetime2] default getdate()
) 

GO

CREATE TABLE [silver].[crm_prd_info](
	[prd_id] [int] NULL,
	[prd_key] [nvarchar](50) NULL,
	[prd_nm] [nvarchar](50) NULL,
	[prd_cost] [int] NULL,
	[prd_line] [nvarchar](50) NULL,
	[prd_start_dt] [datetime] NULL,
	[prd_end_dt] [datetime] NULL,
	[dwh_create_date] [datetime2] default getdate()
) 

GO

CREATE TABLE [silver].[crm_sales_details](
	[sls_ord_num] [nvarchar](50) NULL,
	[sls_prd_key] [nvarchar](50) NULL,
	[sls_cust_id] [int] NULL,
	[sls_order_dt] [int] NULL,
	[sls_ship_dt] [int] NULL,
	[sls_due_dt] [int] NULL,
	[sls_sales] [int] NULL,
	[sls_quantity] [int] NULL,
	[sls_price] [int] NULL,
	[dwh_create_date] [datetime2] default getdate()
)

GO

CREATE TABLE [silver].[erp_cust_az12](
	[CID] [nvarchar](50) NULL,
	[BDATE] [date] NULL,
	[GEN] [nvarchar](50) NULL,
	[dwh_create_date] [datetime2] default getdate()
)

GO

CREATE TABLE [silver].[erp_loc_a101](
	[CID] [nvarchar](50) NULL,
	[CNTRY] [nvarchar](50) NULL,
	[dwh_create_date] [datetime2] default getdate()
)

GO

CREATE TABLE [silver].[erp_px_cat_g1v2](
	[ID] [nvarchar](50) NULL,
	[CAT] [nvarchar](50) NULL,
	[SUBCAT] [nvarchar](50) NULL,
	[MAINTENANCE] [nvarchar](50) NULL,

) 

