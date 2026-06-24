USE ANALISIS_DATOS;
GO

-- Crear esquema Bronze si no existe
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze;');
    PRINT 'Esquema [bronze] creado con éxito.';
END
GO

-- Crear esquema Silver si no existe
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver;');
    PRINT 'Esquema [silver] creado con éxito.';
END
GO

-- Crear esquema Gold si no existe
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold;');
    PRINT 'Esquema [gold] creado con éxito.';
END
GO
