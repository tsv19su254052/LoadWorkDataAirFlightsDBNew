USE master
GO
/* Переместить tempdb на другой диск по указанному пути */
ALTER DATABASE tempdb 
MODIFY FILE (NAME = tempdev, FILENAME = 'W:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Data\tempdb.mdf')
GO
ALTER DATABASE tempdb 
MODIFY FILE (NAME = templog, FILENAME = 'W:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Data\templog.ldf')
GO
/* Перезапустить  Microsoft SQL Server */
