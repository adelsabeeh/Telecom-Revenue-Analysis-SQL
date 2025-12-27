-- ÊÞÑíÑ íæÖÍ ÅÌãÇáí ÇáãÈÇáÛ ÍÓÈ ÇáãÏíäÉ ãÚ ÊÕäíÝ äæÚ ÇáÇÔÊÑÇß
SELECT 
    s.City, 
    s.FullName, 
    s.PackageType, 
    SUM(p.Amount) AS TotalPaid,
    CASE 
        WHEN SUM(p.Amount) >= 300 THEN 'Platinum Subscriber'
        WHEN SUM(p.Amount) >= 150 THEN 'Gold Subscriber'
        ELSE 'Silver Subscriber'
    END AS LoyaltyTier
FROM Subscribers s
INNER JOIN Payments p ON s.SubID = p.SubID
GROUP BY s.City, s.FullName, s.PackageType
ORDER BY TotalPaid DESC;