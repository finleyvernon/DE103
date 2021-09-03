--T-SQL
use ImportDemo;
GO

BULK
INSERT Employee
FROM 'P:\FC\School of Computing\BICT\DTEC502\SQL Demo Scripts\Topic7\Import\TextToInsert.txt' --location with filename
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

-- moreImport.csv
BULK
INSERT Employee
FROM 'P:\FC\School of Computing\BICT\DTEC502\SQL Demo Scripts\Topic7\Import\moreImport.csv' --location with filename
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO













