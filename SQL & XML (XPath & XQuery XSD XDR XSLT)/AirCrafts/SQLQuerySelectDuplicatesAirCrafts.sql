USE AirFlightsDBNew62
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT AirCraftRegistration,  COUNT(*) AS Duplicates
  FROM dbo.AirCraftsTable
  GROUP BY AirCraftRegistration
  HAVING COUNT(*) > 1 -- самолетов с дубликатами пока нет