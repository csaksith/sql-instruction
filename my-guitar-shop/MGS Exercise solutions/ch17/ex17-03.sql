USE MyGuitarShop;

DECLARE @DynamicSQL varchar(256),
        @LoginName varchar(128)

DECLARE Login_Cursor CURSOR
DYNAMIC
FOR
  SELECT FirstName + LastName AS LoginName
  FROM Administrators;

OPEN Login_Cursor;
FETCH NEXT FROM Login_Cursor
  INTO @LoginName;
WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @DynamicSQL = 'CREATE LOGIN ' + @LoginName + ' ' +
                      'WITH PASSWORD = ''TempPa$$1'', ' +
                      'DEFAULT_DATABASE = MyGuitarShop';
    EXEC (@DynamicSQL);
    SET @DynamicSQL = 'CREATE USER ' + @LoginName + ' ' +
                      'FOR LOGIN ' + @LoginName;
    EXEC (@DynamicSQL);
    SET @DynamicSQL = 'ALTER ROLE OrderEntry ADD MEMBER ' +
                      @LoginName;
    EXEC (@DynamicSQL);
    FETCH NEXT FROM Login_Cursor
      INTO @LoginName;
  END;
CLOSE Login_Cursor;

DEALLOCATE Login_Cursor;