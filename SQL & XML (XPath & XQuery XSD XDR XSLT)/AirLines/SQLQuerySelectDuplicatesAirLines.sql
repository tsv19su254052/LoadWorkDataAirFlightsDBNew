USE AirLinesDBNew62
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT AirLineName, AirLineCodeIATA, AirLineCodeICAO,  COUNT(*) AS Duplicates
  FROM dbo.AirLinesTable
  GROUP BY AirLineName, AirLineCodeIATA, AirLineCodeICAO
  HAVING COUNT(*) > 1 -- (63 -> __) авиакомпаний с дубликатами по кодам IATA и ICAO, были по 3 ... 4 строки
  ORDER BY AirLineCodeIATA, AirLineCodeICAO