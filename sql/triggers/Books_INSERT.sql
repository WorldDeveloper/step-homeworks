USE [library]
GO

/* 5. Если новая книга добавляется в базу, она должна быть удалена из таблицы LibDeleted (если она там есть).*/

CREATE TRIGGER Books_INSERT ON Books
AFTER INSERT
AS
BEGIN
	Print 'books_insert';
	DECLARE @ErrorMessage nvarchar(max)='Transaction was canceled. ';
	DECLARE @RowCount int=0;
	SELECT @RowCount=COUNT(*) from inserted;
	IF @RowCount>1
	BEGIN
		ROLLBACK TRAN;
		SET @ErrorMessage=@ErrorMessage+char(13)+char(10)+'Limit INSERT to a single row';
		THROW 50001, @ErrorMessage, 1;
	END

	DECLARE @Id int=NULL
	SELECT @Id=LibDeleted.Id FROM LibDeleted JOIN Inserted ON LibDeleted.Name=Inserted.Name WHERE 
	LibDeleted.Pages=Inserted.Pages AND
	LibDeleted.YearPress=Inserted.YearPress AND
	LibDeleted.Id_Author=Inserted.Id_Author AND
	LibDeleted.Id_Press=Inserted.Id_Press
	
	If @Id IS NOT NULL
		DELETE FROM LibDeleted WHERE Id=@Id;
END
go
