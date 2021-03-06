USE [library]
GO


/* 5. Если новая книга добавляется в базу, она должна быть удалена из таблицы LibDeleted (если она там есть).*/

CREATE TRIGGER [dbo].[Books_INSERT] ON [dbo].[Books]
AFTER INSERT
AS
BEGIN
	DECLARE @ErrorMessage nvarchar(max)='Transaction was canceled. ';

	/*написать триггер, который запретит вставку книги с годом издательства меньше 2000.*/
	IF EXISTS(SELECT * FROM Inserted WHERE YearPress<2000)
		BEGIN
		ROLLBACK TRAN;
		SET @ErrorMessage=@ErrorMessage+char(13)+char(10)+'You are not allowed to add books with issue year less than 2000';
		THROW 50001, @ErrorMessage, 1;
	END

	DECLARE @DeletedId Table (Id int);
	INSERT @DeletedId SELECT LibDeleted.Id FROM LibDeleted JOIN Inserted ON LibDeleted.Name=Inserted.Name WHERE 
	LibDeleted.Pages=Inserted.Pages AND
	LibDeleted.YearPress=Inserted.YearPress AND
	LibDeleted.Id_Author=Inserted.Id_Author AND
	LibDeleted.Id_Press=Inserted.Id_Press
	
	DELETE FROM LibDeleted WHERE Id IN (SELECT Id FROM @DeletedId);
END
go