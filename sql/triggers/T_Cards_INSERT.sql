USE [library]
GO

/* 1. Чтобы при взятии определенной книги, её количество уменьшалось на 1,
а сам факт выдачи фиксировался в таблице Issued (в неё нужно записывать фамилию и имя студента/преподавателя, название книги, дату выдачи).*/

CREATE  TRIGGER T_Cards_INSERT ON T_Cards
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

		INSERT Issued(VisitorName, VisitorSurname, BookTitle, DateOut)
		SELECT FirstName, LastName, Books.Name, DateOut 
		FROM inserted JOIN Teachers ON inserted.Id_Teacher=Teachers.Id JOIN Books ON inserted.Id_book=Books.id;
	
		UPDATE Books SET Quantity=Quantity-1  
		FROM Inserted WHERE Books.Id=Inserted.Id_Book AND Quantity>0;
		PRINT char(13)+char(10)+'->'+'Book was lent out';
	
	SET NOCOUNT OFF;
END;
go
