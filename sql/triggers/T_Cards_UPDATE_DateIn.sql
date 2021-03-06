USE [library]
GO


CREATE TRIGGER T_Cards_UPDATE_DateIn ON T_Cards
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	/*		2. Чтобы при возврате определённой книги, её количество увеличивалось на 1,
		 и это фиксировалось в таблице Returned.
		  Сделать так, чтобы нельзя было вернуть больше книг, чем их было изначально! 
	*/

	IF EXISTS(SELECT * FROM Deleted JOIN Inserted ON Deleted.Id=Inserted.Id WHERE (Deleted.DateIn IS NULL) AND NOT(Inserted.DateIn IS NULL) )
	BEGIN
		DECLARE @RowCount int=0;
		SELECT @RowCount=COUNT(*) from inserted;
		IF @RowCount>1
		THROW 50000, 'Transaction was canceled. Limit UPDATE to a single row', 1;

	
		INSERT Returned(FirstName, Lastname, BookTitle, DateIn)
		SELECT FirstName, LastName, Books.Name, DateIn 
		FROM inserted JOIN Teachers ON inserted.Id_Teacher=Teachers.Id JOIN Books ON inserted.Id_book=Books.id;
	
		UPDATE Books SET Quantity=Quantity+1  
		FROM Inserted WHERE Books.Id=Inserted.Id_Book;
		PRINT char(13)+char(10)+'->'+'Book was returned';
	END

	SET NOCOUNT OFF;
END;
Go