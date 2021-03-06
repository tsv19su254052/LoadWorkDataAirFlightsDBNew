USE [AirPortsAndRoutesDBNew62]
GO
/****** Object:  StoredProcedure [dbo].[SelectAirRouteWithJOIN]    Script Date: 05.05.2021 6:32:59 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Тарасов СЕРГЕЙ
-- Create date: 05 мая 2021 года>
-- Description:	<Выбор маршрутов по аэропорту>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAirRouteWithJOIN] (@AirPort NVARCHAR(50))
AS
BEGIN
	-- Тело процедуры
	SET XACT_ABORT ON -- закрываем открытые безхозные транзакции, исходя из того, что одновременно пусть будет открыта только одна транзакция
	SET NOCOUNT ON; -- снимаем ограничение "row(s) affected", SET NOCOUNT ON added to prevent extra result sets from

	/*  Маршруты аэропорта  */
	SET Transaction Isolation Level Read Committed
	SELECT AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortName AS DEPARTURE,
	   AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortCity AS DEPARTURE_CITY,
	   AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortCountry AS DEPARTURE_COUNTRY,
	   AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortCodeIATA AS Departure_IATA,
	   AirPortsTable_1.AirPortName AS ARRIVAL,
	   AirPortsTable_1.AirPortCity AS ARRIVAL_CITY,
	   AirPortsTable_1.AirPortCountry AS ARRIVAL_COUNTRY,
	   AirPortsTable_1.AirPortCodeIATA AS Arrival_IATA
	FROM AirPortsAndRoutesDBNew62.dbo.AirRoutesTable INNER JOIN
     AirPortsAndRoutesDBNew62.dbo.AirPortsTable ON AirPortsAndRoutesDBNew62.dbo.AirRoutesTable.AirPortDeparture = AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortUniqueNumber INNER JOIN
     AirPortsAndRoutesDBNew62.dbo.AirPortsTable AS AirPortsTable_1 ON AirPortsAndRoutesDBNew62.dbo.AirRoutesTable.AirPortArrival = AirPortsTable_1.AirPortUniqueNumber
	WHERE (AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortCodeIATA = @AirPort) OR (AirPortsTable_1.AirPortCodeIATA = @AirPort)
	ORDER BY DEPARTURE, ARRIVAL
	-- PMD - PalmDale: 7 маршрутов
	-- XSD (KTPH) - Tonopah: 0 маршрутов
	-- (KXTA) - Homey (Area 51):
	-- (KDRA) - Desert Rock:
	-- LAX - 855 маршрутов
	-- SXM - 67 маршрутов

	-- Число строк
	SELECT COUNT(*) AS LinesCount
	FROM AirPortsAndRoutesDBNew62.dbo.AirRoutesTable INNER JOIN
     AirPortsAndRoutesDBNew62.dbo.AirPortsTable ON AirPortsAndRoutesDBNew62.dbo.AirRoutesTable.AirPortDeparture = AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortUniqueNumber INNER JOIN
     AirPortsAndRoutesDBNew62.dbo.AirPortsTable AS AirPortsTable_1 ON AirPortsAndRoutesDBNew62.dbo.AirRoutesTable.AirPortArrival = AirPortsTable_1.AirPortUniqueNumber
	WHERE (AirPortsAndRoutesDBNew62.dbo.AirPortsTable.AirPortCodeIATA = @AirPort) OR (AirPortsTable_1.AirPortCodeIATA = @AirPort)

	-- Выключаем обратно
	SET XACT_ABORT OFF
	SET NOCOUNT OFF
END
