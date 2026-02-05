/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================

This stored procedure loads data into the 'bronze' schema from external CSV files. 
It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
===============================================================================
*/

create or alter procedure bronze.load_bronze 
as
begin
	
declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime

print('==================================================')
print('Loading bronze layer for source system CRM');
print('==================================================')

set @batch_start_time = getdate();

set @start_time = getdate();
truncate table [bronze].[crm_cust_info]
bulk insert [bronze].[crm_cust_info]
from 'C:\***\source_crm\cust_info.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
set @end_time = getdate()
print('>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds')
print('>> Data inserted in bronze.crm_cust_info');


set @start_time = getdate();
truncate table [bronze].[crm_prd_info]
bulk insert [bronze].[crm_prd_info]
from 'C:\***\source_crm\prd_info.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
set @end_time = getdate()
print('>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds')
print('>> Data inserted in bronze.crm_prd_info');


set @start_time = getdate();
truncate table [bronze].[crm_sales_details]
bulk insert [bronze].[crm_sales_details]
from 'C:\***\source_crm\sales_details.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
set @end_time = getdate()
print('>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds')
print('>> Data inserted in bronze.crm_sales_details');


print('==================================================')
print('Loading bronze layer for source system ERP');
print('==================================================')

set @start_time = getdate();
truncate table [bronze].[erp_cust_az12]
bulk insert [bronze].[erp_cust_az12]
from 'C:\***\source_erp\cust_az12.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
set @end_time = getdate()
print('>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds')
print('>> Data inserted in bronze.erp_cust_az12');


set @start_time = getdate();
truncate table [bronze].[erp_loc_a101]
bulk insert [bronze].[erp_loc_a101]
from 'C:\***\source_erp\loc_a101.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
set @end_time = getdate()
print('>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds')
print('>> Data inserted in bronze.erp_loc_a101');


set @start_time = getdate();
truncate table [bronze].[erp_px_cat_g1v2]
bulk insert [bronze].[erp_px_cat_g1v2]
from 'C:\***\source_erp\px_cat_g1v2.csv'
with (
	firstrow = 2,
	fieldterminator = ',',
	tablock
);
set @end_time = getdate()
print('>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds')
print('>> Data inserted in bronze.erp_px_cat_g1v2')

print('==================================================')
set @batch_end_time = getdate();
print('>> Batch Load duration: ' + cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + ' seconds')
print('==================================================')

end

---- Executing the store procedure
-- exec bronze.load_bronze 
