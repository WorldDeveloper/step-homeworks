USE [library]
GO


/*написать триггер, который запрещает удалять книги издательства BHV...
1) если в таблице удаляемых есть книги НЕ издательства BHV, то они всё же удаляются, а BHV - остаются.*/

CREATE TRIGGER [dbo].[Books_INSTEADOF_DELETE] ON [dbo].[Books]
INSTEAD OF DELETE
AS
BEGIN	
	DELETE FROM Books 
	WHERE Id IN (SELECT Deleted.Id FROM Deleted JOIN Press ON Deleted.Id_Press=Press.Id WHERE Press.Name!='BHV');

	IF EXISTS(SELECT Deleted.Id FROM Deleted JOIN Press ON Deleted.Id_Press=Press.Id WHERE Press.Name='BHV')
	THROW 50000, 'You are not allowed to delete books issued by "BHV"',1;
END
go

