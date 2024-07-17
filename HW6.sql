-- Task 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

-- Создание функции
IF OBJECT_ID('dbo.FormatSeconds', 'FN') IS NOT NULL
BEGIN
    DROP FUNCTION dbo.FormatSeconds;
END
GO

CREATE FUNCTION dbo.FormatSeconds (@seconds INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @days INT;
    DECLARE @hours INT;
    DECLARE @minutes INT;
    DECLARE @remaining_seconds INT;
    DECLARE @result NVARCHAR(50);

    SET @days = @seconds / 86400;
    SET @hours = (@seconds % 86400) / 3600;
    SET @minutes = (@seconds % 3600) / 60;
    SET @remaining_seconds = @seconds % 60;

    SET @result = CAST(@days AS NVARCHAR) + ' days ' 
                + CAST(@hours AS NVARCHAR) + ' hours ' 
                + CAST(@minutes AS NVARCHAR) + ' minutes ' 
                + CAST(@remaining_seconds AS NVARCHAR) + ' seconds';

    RETURN @result;
END;
GO


-- Использование функции
SELECT dbo.FormatSeconds(123456) AS FormattedTime;
GO


-- Task 2 
-- Выведите только чётные числа от 1 до 10.
-- Пример: 2,4,6,8,10

-- Создание функции
CREATE PROCEDURE PrintEvenNumbers
AS
BEGIN
    DECLARE @num INT = 1;

    WHILE @num <= 10
    BEGIN
        IF @num % 2 = 0
        BEGIN
            PRINT CAST(@num AS VARCHAR(10)); -- Выводим чётное число
        END

        SET @num = @num + 1;
    END
END;
GO


--Использование функции 
EXEC PrintEvenNumbers;

