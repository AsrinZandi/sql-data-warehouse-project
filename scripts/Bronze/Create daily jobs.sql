------sql server agent----> jobs---->history
USE msdb;
GO

EXEC sp_add_job
    @job_name = 'Load Bronze Daily';

EXEC sp_add_jobstep
    @job_name = 'Load Bronze Daily',
    @step_name = 'Run Procedure',
    @subsystem = 'TSQL',
    @command = 'EXEC bronze.load_bronze;',
    @database_name = 'DataWarehouse';

EXEC sp_add_schedule
    @schedule_name = 'Daily 8AM',
    @freq_type = 4, -- daily
    @freq_interval = 1,
    @active_start_time = 080000; -- 8:00 AM

EXEC sp_attach_schedule
    @job_name = 'Load Bronze Daily',
    @schedule_name = 'Daily 8AM';

EXEC sp_add_jobserver
    @job_name = 'Load Bronze Daily';
