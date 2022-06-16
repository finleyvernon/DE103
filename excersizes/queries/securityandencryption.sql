uSE [AdventureWorks2017];
GO

SELECT * FROM [Sales].[CreditCard];
GO

-- Create a column in which to store the encrypted data.

ALTER TABLE Sales.CreditCard
	ADD CardNumber_EncryptedbyPassphrase varbinary(256);
GO

SELECT CardNumber, ENCRYPTBYPASSPHRASE('password',CardNumber)
FROM sales.CreditCard;
GO
