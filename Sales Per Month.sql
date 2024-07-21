DROP TABLE IF EXISTS #Hash1
SELECT
Id,
OriginalDealId,
WonTime,
[Status]
INTO #Hash1
FROM
pipedrive.PD_Deals AS PD
WHERE
PD.PipelineId IN (1,10)
AND
[Status] = 'won'


SELECT
CONCAT(YEAR(H.WonTime),'-',MONTH(H.WonTime)) AS SalesMonth,
COUNT(CONCAT(YEAR(H.WonTime),'-',MONTH(H.WonTime))) AS DealWonCount
--COUNT(MONTH(H.WonTime)) AS SalesCount,
--COUNT(PD.WebTrackerId) AS TrackerCount,
--COUNT(PD.AcRef) AS ACREFCount
FROM
pipedrive.PD_Deals AS PD
INNER JOIN #Hash1 AS H ON H.OriginalDealId = PD.Id
GROUP BY
CONCAT(YEAR(H.WonTime),'-',MONTH(H.WonTime))