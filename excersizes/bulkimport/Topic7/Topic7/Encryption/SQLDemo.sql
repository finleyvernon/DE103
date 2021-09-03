USE AdventureWorks2014;  
GO  
-- Create a column in which to store the encrypted data.  
ALTER TABLE Sales.CreditCard   
    ADD CardNumber_EncryptedbyPassphrase varbinary(256);   
GO  

/****** Script for SelectTopNRows command from SSMS  ******/
 SELECT CardNumber, ENCRYPTBYPASSPHRASE('password',CardNumber)
 FROM sales.CreditCard

GO