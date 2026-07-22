


-- ==========================================================
-- 1. MAESTRO DE CLIENTES (silver.sap_kna1)
-- ==========================================================
IF OBJECT_ID('silver.sap_kna1', 'U') IS NOT NULL DROP TABLE silver.sap_kna1;
CREATE TABLE silver.sap_kna1 (
    mandante VARCHAR(3) NOT NULL,
    cliente_id VARCHAR(10) NOT NULL,
    nombre VARCHAR(100),
    poblacion VARCHAR(50),
    pais VARCHAR(3),
    region VARCHAR(3),
    codigo_postal VARCHAR(10),
    rfc_vat VARCHAR(20),
    fecha_creacion DATE,
    grupo_cuentas VARCHAR(4),
    fecha_carga DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_silver_sap_kna1 PRIMARY KEY (mandante, cliente_id)
);

-- ==========================================================
-- 2. INTERLOCUTORES DE CLIENTES (silver.sap_knvp)
-- ==========================================================
IF OBJECT_ID('silver.sap_knvp', 'U') IS NOT NULL DROP TABLE silver.sap_knvp;
CREATE TABLE silver.sap_knvp (
    mandante VARCHAR(3) NOT NULL,
    cliente_id VARCHAR(10) NOT NULL,
    organizacion_ventas VARCHAR(4) NOT NULL,
    canal_distribucion VARCHAR(2) NOT NULL,
    sector VARCHAR(2) NOT NULL,
    funcion_interlocutor VARCHAR(2) NOT NULL,
    interlocutor_id VARCHAR(10) NOT NULL,
    fecha_carga DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_silver_sap_knvp PRIMARY KEY (mandante, cliente_id, organizacion_ventas, canal_distribucion, sector, funcion_interlocutor, interlocutor_id)
);

-- ==========================================================
-- 3. LÍMITES DE CRÉDITO (silver.sap_knkk)
-- ==========================================================
IF OBJECT_ID('silver.sap_knkk', 'U') IS NOT NULL DROP TABLE silver.sap_knkk;
CREATE TABLE silver.sap_knkk (
    mandante VARCHAR(3) NOT NULL,
    cliente_id VARCHAR(10) NOT NULL,
    area_control_credito VARCHAR(4) NOT NULL,
    limite_credito DECIMAL(15,2),
    saldo_mantenido DECIMAL(15,2),
    moneda VARCHAR(5),
    bloqueado_credito CHAR(1),
    fecha_carga DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_silver_sap_knkk PRIMARY KEY (mandante, cliente_id, area_control_credito)
);

-- ==========================================================
-- 4. PARTIDAS ABIERTAS (silver.sap_bsid)
-- ==========================================================
IF OBJECT_ID('silver.sap_bsid', 'U') IS NOT NULL DROP TABLE silver.sap_bsid;
CREATE TABLE silver.sap_bsid (
    mandante VARCHAR(3) NOT NULL,
    sociedad VARCHAR(4) NOT NULL,
    cliente_id VARCHAR(10) NOT NULL,
    ejercicio INT NOT NULL,
    documento_id VARCHAR(10) NOT NULL,
    posicion INT NOT NULL,
    fecha_contabilizacion DATE,
    fecha_documento DATE,
    fecha_vencimiento DATE,
    clase_documento VARCHAR(2),
    monto_moneda_local DECIMAL(15,2),
    monto_moneda_doc DECIMAL(15,2),
    moneda VARCHAR(5),
    asignacion VARCHAR(18),
    condicion_pago VARCHAR(4),
    fecha_carga DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_silver_sap_bsid PRIMARY KEY (mandante, sociedad, cliente_id, ejercicio, documento_id, posicion)
);

-- ==========================================================
-- 5. PARTIDAS COMPENSADAS (silver.sap_bsad)
-- ==========================================================
IF OBJECT_ID('silver.sap_bsad', 'U') IS NOT NULL DROP TABLE silver.sap_bsad;
CREATE TABLE silver.sap_bsad (
    mandante VARCHAR(3) NOT NULL,
    sociedad VARCHAR(4) NOT NULL,
    cliente_id VARCHAR(10) NOT NULL,
    ejercicio INT NOT NULL,
    documento_id VARCHAR(10) NOT NULL,
    posicion INT NOT NULL,
    fecha_contabilizacion DATE,
    fecha_documento DATE,
    fecha_compensacion DATE,
    documento_compensacion VARCHAR(10),
    clase_documento VARCHAR(2),
    monto_moneda_local DECIMAL(15,2),
    monto_moneda_doc DECIMAL(15,2),
    moneda VARCHAR(5),
    condicion_pago VARCHAR(4),
    fecha_carga DATETIME DEFAULT GETDATE(),
    CONSTRAINT PK_silver_sap_bsad PRIMARY KEY (mandante, sociedad, cliente_id, ejercicio, documento_id, posicion)
);
GO
