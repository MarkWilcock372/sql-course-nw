/*
Example lesson stub
*/
-- Some explantion here
SELECT   ps.PatientId,
         ps.AdmittedDate,
         ps.DischargeDate,
         ps.Hospital,
         ps.Ward,
         ps.ethnicity,
         DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS "LengthOfStay"
FROM     PatientStay AS ps
--WHERE  ps.Hospital IN ('Kingston', 'PRUH')
--AND ps.AdmittedDate BETWEEN DATEFROMPARTS(2024, 2, 28) AND DATEFROMPARTS(2024, 3, 1)
ORDER BY LengthOfStay DESC, ps.AdmittedDate DESC;

SELECT   ps.Hospital,
         ps.Ward,
         COUNT(*) AS NumberOfPatients,
         SUM(ps.Tariff) AS TotalTariff,
         MAX(PS.Tariff) AS BiggestTariff
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.Ward
HAVING   SUM(ps.Tariff) >= 10
ORDER BY TotalTariff DESC;