USE master
GO
/* Переместить tempdb на другой диск по указанному пути */
ALTER DATABASE tempdb 
MODIFY FILE (NAME = tempdev, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\tempdb.mdf')
GO
ALTER DATABASE tempdb 
MODIFY FILE (NAME = templog, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\templog.ldf')
GO
/* Перезапустить  Microsoft SQL Server */
