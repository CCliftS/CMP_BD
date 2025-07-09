CREATE TABLE origen
(
    id_origen INT IDENTITY(1,1) NOT NULL,
    origen_name NVARCHAR(65),
    CONSTRAINT PK_origen PRIMARY KEY CLUSTERED (id_origen ASC)
);
 
INSERT INTO origen (origen_name)
VALUES ('Resolución Calificación Ambiental (RCA)'),
       ('Compromiso Histórico'),
       ('Controversia Operacional'),
       ('Solicitud Actor Clave'),
       ('Estrategia de Gerencia'),
       ('Mesa de Trabajo'),
       ('Acuerdo de colaboración');
 
CREATE TABLE inversion
(
    id_inversion INT IDENTITY(1,1) NOT NULL,
    linea NVARCHAR(50),
    CONSTRAINT PK_inversion PRIMARY KEY CLUSTERED (id_inversion ASC)
);
 
INSERT INTO inversion (linea)
VALUES ('Desarrollo productivo'),
       ('Identidad y cultura'),
       ('Formación y Educación'),
       ('Habitabilidad e infraestructura comunitaria'),
       ('Calidad de Vida');
 
CREATE TABLE tipo
(
    id_tipo INT IDENTITY(1,1) NOT NULL,
    tipo_name NVARCHAR(50),
    CONSTRAINT PK_tipo PRIMARY KEY CLUSTERED (id_tipo ASC)
);
 
INSERT INTO tipo (tipo_name)
VALUES ('Programa'),
       ('Auspicios/donaciones'),
       ('Proyecto');
 
CREATE TABLE alcance
(
    id_alcance INT IDENTITY(1,1) NOT NULL,
    alcance_name NVARCHAR(50),
    CONSTRAINT PK_alcance PRIMARY KEY CLUSTERED (id_alcance ASC)
);
 
INSERT INTO alcance (alcance_name)
VALUES ('Regional'),
       ('Provincial/Valle'),
       ('Comunal'),
       ('Local/Comunitario');
 
CREATE TABLE interaccion
(
    id_interaccion INT IDENTITY(1,1) NOT NULL,
    operacion NVARCHAR(50),
    CONSTRAINT PK_interaccion PRIMARY KEY CLUSTERED (id_interaccion ASC)
);
 
INSERT INTO interaccion (operacion)
VALUES ('Mina'),
       ('Planta'),
       ('Puerto'),
       ('Línea Férrea'),
       ('Tránsito de Camiones'),
       ('Relaves/Concentraducto/Acueducto'),
       ('Proyectos de optimización o desarrollo'),
       ('Transversal');
 
CREATE TABLE riesgo
(
    id_riesgo INT IDENTITY(1,1) NOT NULL,
    tipo_riesgo NVARCHAR(50),
    CONSTRAINT PK_riesgo PRIMARY KEY CLUSTERED (id_riesgo ASC)
);
 
INSERT INTO riesgo (tipo_riesgo)
VALUES ('GRP Personas'),
       ('Procesos'),
       ('Activos'),
       ('Reputacional'),
       ('Cumplimiento'),
       ('Ambiental');
 
CREATE TABLE valle
(
    id_valle INT IDENTITY(1,1) NOT NULL,
    valle_name NVARCHAR(50),
    CONSTRAINT PK_valle PRIMARY KEY CLUSTERED (id_valle ASC)
);
 
INSERT INTO valle (valle_name)
VALUES ('Valle de Copiapó'),
       ('Valle del Huasco'),
       ('Valle del Elqui'),
       ('Transversal');
 
CREATE TABLE faena
(
    id_faena INT IDENTITY(1,1) NOT NULL,
    faena_name NVARCHAR(50),
    CONSTRAINT PK_faena PRIMARY KEY CLUSTERED (id_faena ASC)
);
 
INSERT INTO faena (faena_name)
VALUES ('Mina Cerro Negro Norte'),
       ('Planta Magnetita'),
       ('Puerto Punta Totoralillo'),
       ('Mina Los Colorados'),
       ('Planta De Pellets'),
       ('Puerto Guacolda II'),
       ('Minas El Romeral'),
       ('Mina De Pleito'),
       ('Puerto Guayacán'),
       ('Transversal');
 
CREATE TABLE prioridad
(
    id_prioridad INT IDENTITY(1,1) NOT NULL,
    prioridad_name NVARCHAR(30),
    CONSTRAINT PK_prioridad PRIMARY KEY CLUSTERED (id_prioridad ASC)
);
 
INSERT INTO prioridad (prioridad_name)
VALUES ('Alta'),
       ('Media'),
       ('Baja'),
       ('Urgente');
 
CREATE TABLE cumplimiento_estado
(
    id_cumplimiento_estado INT IDENTITY(1,1) NOT NULL,
    estado NVARCHAR(50),
    dias INT,
    CONSTRAINT PK_cumplimiento_estado PRIMARY KEY CLUSTERED (id_cumplimiento_estado ASC)
);
 
INSERT INTO cumplimiento_estado (estado, dias)
VALUES ('Ingreso solicitud(formulario donaciones)', 5),
       ('Carta conductora', 5),
       ('Minuta/Acta comité donaciones', 15),
       ('Autorización (GG, CD o Directorio)', 15),
       ('Transferencia recursos/Orden compra', 15),
       ('Pago (HEM/HES/Comprobante transferencia)', 30),
       ('Completado', 0);
 
CREATE TABLE subtarea_estado
(
    id_subtarea_estado INT IDENTITY(1,1) NOT NULL,
    estado NVARCHAR(50),
    porcentaje INT,
    CONSTRAINT PK_subtarea_estado PRIMARY KEY CLUSTERED (id_subtarea_estado ASC)
);
 
INSERT INTO subtarea_estado (estado, porcentaje)
VALUES ('NO iniciada', 0),
       ('En Proceso', 50),
       ('En Espera', 40),
       ('Completada', 100),
       ('Cancelada', 0);
 
CREATE TABLE tarea_estado
(
    id_tarea_estado INT IDENTITY(1,1) NOT NULL,
    estado NVARCHAR(50),
    CONSTRAINT PK_tarea_estado PRIMARY KEY CLUSTERED (id_tarea_estado ASC)
);
 
INSERT INTO tarea_estado (estado)
VALUES ('NO iniciada'),
       ('En Espera'),
       ('En Cumplimiento'),
       ('En Proceso'),
       ('Completada'),
       ('Cancelada');
 
CREATE TABLE beneficiario
(
    id_beneficiario UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    nombre_legal NVARCHAR(50),
    rut NVARCHAR(50),
    direccion NVARCHAR(50),
    tipo_entidad NVARCHAR(50),
    representante NVARCHAR(50),
    personalidad_juridica BIT,
    CONSTRAINT PK_beneficiario PRIMARY KEY NONCLUSTERED (id_beneficiario)
);
 
CREATE TABLE contacto
(
    id_contacto UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_beneficiario UNIQUEIDENTIFIER NOT NULL,
    nombre NVARCHAR(50),
    cargo NVARCHAR(50),
    mail NVARCHAR(50),
    phone NVARCHAR(50),
    CONSTRAINT PK_contacto PRIMARY KEY NONCLUSTERED (id_contacto),
    CONSTRAINT FK_contacto_beneficiario FOREIGN KEY (id_beneficiario) REFERENCES beneficiario (id_beneficiario) ON DELETE CASCADE
);
 
CREATE TABLE rol
(
    id_rol INT IDENTITY(1,1) NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_rol PRIMARY KEY NONCLUSTERED (id_rol ASC)
);
 
INSERT INTO rol (nombre)
VALUES ('Admin'),
       ('Gerente'),
       ('Superintendente Relacionamiento'),
       ('Superintendente Comunicaciones'),
       ('Encargado Cumplimiento'),
       ('Jefe Relacionamiento VE'),
       ('Jefe Relacionamiento VH'),
       ('Jefe Relacionamiento VC'),
       ('Encargado Comunicaciones'),
       ('Encargado Asuntos Públicos'),
       ('Usuario');
 
CREATE TABLE usuario (
    id_usuario UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    password_hash NVARCHAR(255) NOT NULL,
    full_name NVARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    organization NVARCHAR(255),
    is_active BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    last_login DATETIME,
    CONSTRAINT PK_usuario PRIMARY KEY NONCLUSTERED (id_usuario),
    CONSTRAINT FK_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol (id_rol) ON DELETE CASCADE
);
 
CREATE TABLE dbo.proceso
(
    id_proceso   INT IDENTITY(1,1) NOT NULL,
    proceso_name NVARCHAR(50)      NOT NULL,
    CONSTRAINT PK_proceso PRIMARY KEY CLUSTERED (id_proceso ASC)
);
 
INSERT INTO dbo.proceso (proceso_name)
VALUES ('Relacionamiento VC'),
       ('Relacionamiento VH'),
       ('Relacionamiento VE'),
       ('Comunicaciones Internas'),
       ('Comunicaciones Externas'),
       ('Asuntos Públicos'),
       ('Transversales');
 
CREATE TABLE tarea
(
    id_tarea UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_valle INT,
    id_faena INT,
    nombre NVARCHAR(100),
    descripcion NVARCHAR(500),
    estado INT DEFAULT (1),
    proceso INT,
    aplica BIT,
    beneficiario UNIQUEIDENTIFIER,
    CONSTRAINT PK_tarea PRIMARY KEY NONCLUSTERED (id_tarea),
    CONSTRAINT FK_tarea_valle FOREIGN KEY (id_valle) REFERENCES valle (id_valle) ON DELETE CASCADE,
    CONSTRAINT FK_tarea_faena FOREIGN KEY (id_faena) REFERENCES faena (id_faena) ON DELETE CASCADE,
    CONSTRAINT FK_tarea_estado FOREIGN KEY (estado) REFERENCES tarea_estado (id_tarea_estado) ON DELETE CASCADE,
    CONSTRAINT FK_tarea_proceso FOREIGN KEY (proceso) REFERENCES proceso (id_proceso) ON DELETE CASCADE,
    CONSTRAINT FK_tarea_beneficiario FOREIGN KEY (beneficiario) REFERENCES beneficiario (id_beneficiario) ON DELETE NO ACTION
);
 
CREATE TABLE info_tarea
(
    id_info_tarea UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_tarea UNIQUEIDENTIFIER NOT NULL,
    id_origen INT,
    id_inversion INT,
    id_tipo INT,
    id_alcance INT,
    id_interaccion INT,
    id_riesgo INT,
    CONSTRAINT PK_info_tarea PRIMARY KEY NONCLUSTERED (id_info_tarea),
    CONSTRAINT FK_info_tarea FOREIGN KEY (id_tarea) REFERENCES tarea (id_tarea) ON DELETE CASCADE,
    CONSTRAINT FK_info_tarea_origen FOREIGN KEY (id_origen) REFERENCES origen (id_origen) ON DELETE CASCADE,
    CONSTRAINT FK_info_tarea_inversion FOREIGN KEY (id_inversion) REFERENCES inversion (id_inversion) ON DELETE CASCADE,
    CONSTRAINT FK_info_tarea_tipo FOREIGN KEY (id_tipo) REFERENCES tipo (id_tipo) ON DELETE CASCADE,
    CONSTRAINT FK_info_tarea_alcance FOREIGN KEY (id_alcance) REFERENCES alcance (id_alcance) ON DELETE CASCADE,
    CONSTRAINT FK_info_tarea_interaccion FOREIGN KEY (id_interaccion) REFERENCES interaccion (id_interaccion) ON DELETE CASCADE,
    CONSTRAINT FK_info_tarea_riesgo FOREIGN KEY (id_riesgo) REFERENCES riesgo (id_riesgo) ON DELETE CASCADE
);
 
CREATE TABLE subtarea
(
    id_subtarea UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_tarea UNIQUEIDENTIFIER NOT NULL,
    nombre NVARCHAR(100),
    descripcion NVARCHAR(500),
    presupuesto INT,
    gasto INT,
    fecha_inicio DATE,
    fecha_termino DATE,
    fecha_final DATE,
    id_estado INT DEFAULT (1),
    id_prioridad INT,
    CONSTRAINT PK_subtarea PRIMARY KEY NONCLUSTERED (id_subtarea),
    CONSTRAINT FK_subtarea_tarea FOREIGN KEY (id_tarea) REFERENCES tarea (id_tarea) ON DELETE CASCADE,
    CONSTRAINT FK_subtarea_estado FOREIGN KEY (id_estado) REFERENCES subtarea_estado (id_subtarea_estado) ON DELETE CASCADE,
    CONSTRAINT FK_subtarea_prioridad FOREIGN KEY (id_prioridad) REFERENCES prioridad (id_prioridad) ON DELETE CASCADE
);
 
CREATE TABLE tipo_documento
(
    id_tipo_documento INT IDENTITY(1,1) NOT NULL,
    tipo_documento NVARCHAR(50),
    CONSTRAINT PK_tipo_documento PRIMARY KEY CLUSTERED (id_tipo_documento ASC)
);
 
INSERT INTO tipo_documento (tipo_documento)
VALUES ('Formulario de Aportes'),
       ('Carta de Aporte'),
       ('Informe Final'),
       ('Minuta'),
       ('Factura'),
       ('Comprobante de Transferencia'),
       ('Guia de Despacho'),
       ('Estado de Pago'),
       ('Acta de Entrega');
 
CREATE TABLE documento
(
    id_documento UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_tarea UNIQUEIDENTIFIER,
    nombre_archivo NVARCHAR(255),
    tipo_documento INT NOT NULL,
    ruta NVARCHAR(500),
    fecha_carga DATE,
    CONSTRAINT PK_documento PRIMARY KEY NONCLUSTERED (id_documento),
    CONSTRAINT FK_documento_tarea FOREIGN KEY (id_tarea) REFERENCES tarea (id_tarea) ON DELETE NO ACTION,
    CONSTRAINT FK_documento_tipo_documento FOREIGN KEY (tipo_documento) REFERENCES tipo_documento (id_tipo_documento) ON DELETE CASCADE
);
 
CREATE TABLE Cumplimiento (
    id_cumplimiento UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_tarea UNIQUEIDENTIFIER NOT NULL,
    id_cump_est INT DEFAULT (1),
    updated_at DATETIME DEFAULT GETDATE(),
    valor INT, -- valor del memo O solped
    ceco INT,  -- solo para SOLPED
    cuenta INT, -- solo para SOLPED
    SOLPED_MEMO_SAP INT,
    HES_HEM_SAP INT,
    CONSTRAINT PK_Cumplimiento PRIMARY KEY NONCLUSTERED (id_cumplimiento),
    CONSTRAINT FK_Cumplimiento_tarea FOREIGN KEY (id_tarea) REFERENCES tarea (id_tarea) ON DELETE CASCADE,
    CONSTRAINT FK_Cumplimiento_estado FOREIGN KEY (id_cump_est) REFERENCES cumplimiento_estado (id_cumplimiento_estado) ON DELETE CASCADE
);
 
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
 
GO
CREATE OR ALTER TRIGGER dbo.tr_subtarea_validate_dates
ON dbo.subtarea
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
 
    /* Valida que la fecha de termino no sea menor que la fecha de inicio */
    IF EXISTS (SELECT 1 FROM inserted WHERE fecha_termino IS NOT NULL AND fecha_inicio IS NOT NULL AND fecha_termino < fecha_inicio)
    BEGIN
        THROW 51003, 'La fecha de termino no puede ser menor que la fecha de inicio.', 1;
    END
 
    /* Valida que la fecha final no sea menor que la fecha de inicio */
    IF EXISTS (SELECT 1 FROM inserted WHERE fecha_final IS NOT NULL AND fecha_inicio IS NOT NULL AND fecha_final < fecha_inicio)
    BEGIN
        THROW 51004, 'La fecha final no puede ser menor que la fecha de inicio.', 1;
    END
END;
 
GO
-- Trigger para actualizar el estado de la tarea basado en el estado de las subtareas
CREATE OR ALTER TRIGGER tr_tarea_autostatus
ON dbo.subtarea
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
 
    DECLARE
        @SubtareaCompletada INT = (SELECT id_subtarea_estado FROM subtarea_estado WHERE estado = 'Completada'),
        @TareaCompletada INT = (SELECT id_tarea_estado FROM tarea_estado WHERE estado = 'Completada'),
        @TareaEnProceso INT = (SELECT id_tarea_estado FROM tarea_estado WHERE estado = 'En Proceso');
 
    -- Tabla temporal para tareas afectadas
    DECLARE @Afectadas TABLE (id_tarea UNIQUEIDENTIFIER PRIMARY KEY);
    INSERT INTO @Afectadas
    SELECT DISTINCT id_tarea FROM inserted
    UNION SELECT DISTINCT id_tarea FROM deleted;
 
    -- Actualizar estado de tareas
    UPDATE t
    SET estado = CASE
        WHEN EXISTS (
            SELECT 1
            FROM subtarea s
            WHERE
                s.id_tarea = t.id_tarea
                AND s.id_estado <> @SubtareaCompletada
        ) THEN @TareaEnProceso
        ELSE @TareaCompletada
    END
    FROM dbo.tarea t
    WHERE t.id_tarea IN (SELECT id_tarea FROM @Afectadas);
END;
GO
 
CREATE TABLE historial
(
    id_historial UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    nombre NVARCHAR(50),
    id_proceso INT,
    fecha_final DATE,
    gasto_total INT,
    id_valle INT,
    id_faena INT,
    SOLPED_MEMO_SAP INT,
    HES_HEM_SAP INT,
    beneficiario UNIQUEIDENTIFIER,
    CONSTRAINT PK_historial PRIMARY KEY NONCLUSTERED (id_historial),
    CONSTRAINT FK_his_proceso FOREIGN KEY (id_proceso) REFERENCES proceso (id_proceso) ON DELETE NO ACTION,
    CONSTRAINT FK_his_valle FOREIGN KEY (id_valle) REFERENCES valle (id_valle) ON DELETE NO ACTION,
    CONSTRAINT FK_his_faena FOREIGN KEY (id_faena) REFERENCES faena (id_faena) ON DELETE NO ACTION,
    CONSTRAINT FK_his_beneficiario FOREIGN KEY (beneficiario) REFERENCES beneficiario (id_beneficiario) ON DELETE NO ACTION
);
 
CREATE TABLE historial_doc
(
    id_his_doc UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() NOT NULL,
    id_historial UNIQUEIDENTIFIER,
    nombre_archivo NVARCHAR(255),
    tipo_documento INT NOT NULL,
    ruta NVARCHAR(500),
    fecha_carga DATE,
    CONSTRAINT PK_his_doc PRIMARY KEY NONCLUSTERED (id_his_doc),
    CONSTRAINT FK_his_doc_historial FOREIGN KEY (id_historial) REFERENCES historial (id_historial) ON DELETE NO ACTION,
    CONSTRAINT FK_his_doc_tipo_documento FOREIGN KEY (tipo_documento) REFERENCES tipo_documento (id_tipo_documento) ON DELETE NO ACTION
);
 
-- Crear tabla para tokens de reset de contraseña
CREATE TABLE password_reset_token (
    id_token UNIQUEIDENTIFIER NOT NULL
        CONSTRAINT PK_password_reset_token PRIMARY KEY NONCLUSTERED
        CONSTRAINT DF_password_reset_token_id_token DEFAULT (newsequentialid()),
   
    id_usuario UNIQUEIDENTIFIER NOT NULL,
   
    token NVARCHAR(255) NOT NULL
        CONSTRAINT UQ_password_reset_token_token UNIQUE,
   
    expires_at DATETIME NOT NULL,
   
    used BIT NOT NULL
        CONSTRAINT DF_password_reset_token_used DEFAULT (0),
   
    created_at DATETIME NOT NULL
        CONSTRAINT DF_password_reset_token_created_at DEFAULT (getdate()),
   
    -- Foreign key hacia la tabla usuario
    CONSTRAINT FK_password_reset_token_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);
 
-- Crear índice para mejorar performance en búsquedas por usuario
CREATE INDEX IX_password_reset_token_id_usuario
ON password_reset_token (id_usuario);
 
-- Crear índice para mejorar performance en búsquedas por token
CREATE INDEX IX_password_reset_token_token
ON password_reset_token (token);
 
ALTER TABLE cumplimiento
ADD updated_at DATETIME DEFAULT GETDATE();
 
CREATE OR ALTER TRIGGER tr_cumplimiento_update_timestamp
ON cumplimiento
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
   
    -- Solo actualizar updated_at si cambió el estado
    IF UPDATE(id_cump_est)
    BEGIN
        UPDATE cumplimiento
        SET updated_at = GETDATE()
        FROM cumplimiento c
        INNER JOIN inserted i ON c.id_cumplimiento = i.id_cumplimiento
        WHERE c.id_cumplimiento = i.id_cumplimiento;
    END
END;
 
ALTER TABLE Cumplimiento
ADD listo BIT NOT NULL DEFAULT 0;
 
-- Trigger para crear historial automáticamente cuando una tarea se completa
CREATE OR ALTER TRIGGER tr_tarea_create_history
ON dbo.tarea
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @TareaCompletada INT = (SELECT id_tarea_estado FROM tarea_estado WHERE estado = 'Completada');
   
    -- Solo procesar tareas que cambiaron a estado "Completada"
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN deleted d ON i.id_tarea = d.id_tarea
        WHERE i.estado = @TareaCompletada
        AND d.estado <> @TareaCompletada
    )
    BEGIN
        -- Insertar en historial para cada tarea que se completó
        INSERT INTO historial (
            nombre,
            id_proceso,
            fecha_final,
            gasto_total,
            id_valle,
            id_faena,
            beneficiario,
            SOLPED_MEMO_SAP,
            HES_HEM_SAP
        )
        SELECT
            i.nombre,
            i.proceso,
            GETDATE() as fecha_final,
            ISNULL((
                SELECT SUM(s.gasto)
                FROM subtarea s
                WHERE s.id_tarea = i.id_tarea
            ), 0) as gasto_total,
            i.id_valle,
            i.id_faena,
            i.beneficiario,
            ISNULL((
                SELECT TOP 1 c.SOLPED_MEMO_SAP
                FROM Cumplimiento c
                WHERE c.id_tarea = i.id_tarea
                ORDER BY c.updated_at DESC
            ), 0) as SOLPED_MEMO_SAP,
            ISNULL((
                SELECT TOP 1 c.HES_HEM_SAP
                FROM Cumplimiento c
                WHERE c.id_tarea = i.id_tarea
                ORDER BY c.updated_at DESC
            ), 0) as HES_HEM_SAP
        FROM inserted i
        INNER JOIN deleted d ON i.id_tarea = d.id_tarea
        WHERE i.estado = @TareaCompletada
        AND d.estado <> @TareaCompletada;
 
        -- Copiar documentos al historial (CORREGIDO)
        INSERT INTO historial_doc (
            id_historial,
            nombre_archivo,
            tipo_documento,
            ruta,
            fecha_carga
        )
        SELECT
            h.id_historial,
            doc.nombre_archivo,
            doc.tipo_documento,
            doc.ruta,
            doc.fecha_carga
        FROM inserted i
        INNER JOIN deleted d ON i.id_tarea = d.id_tarea
        INNER JOIN documento doc ON doc.id_tarea = i.id_tarea
        CROSS APPLY (
            SELECT TOP 1 id_historial
            FROM historial h2
            WHERE h2.nombre = i.nombre
            AND h2.id_proceso = i.proceso
            AND ISNULL(h2.id_valle, -1) = ISNULL(i.id_valle, -1)
            AND ISNULL(h2.beneficiario, '00000000-0000-0000-0000-000000000000') = ISNULL(i.beneficiario, '00000000-0000-0000-0000-000000000000')
            ORDER BY h2.fecha_final DESC
        ) h
        WHERE i.estado = @TareaCompletada
        AND d.estado <> @TareaCompletada;
    END
END;
 
-- Trigger para cambiar estado de tarea cuando compliance se completa
CREATE OR ALTER TRIGGER tr_compliance_update_task_status
ON dbo.Cumplimiento
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
 
    -- IDs de estados basados en tu BD
    DECLARE @ComplianceCompletado INT = (SELECT id_cumplimiento_estado FROM cumplimiento_estado WHERE estado = 'Completado');
    DECLARE @TareaDueDiligence INT = 3; -- "Due Diligence"
    DECLARE @TareaEnProceso INT = 4;    -- "En Proceso"
   
    -- Solo procesar cumplimientos que cambiaron a estado "Completado"
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN deleted d ON i.id_cumplimiento = d.id_cumplimiento
        WHERE i.id_cump_est = @ComplianceCompletado
        AND d.id_cump_est <> @ComplianceCompletado
    )
    BEGIN
        -- Actualizar tareas que están en "Due Diligence" (3) a "En Proceso" (4)
        UPDATE tarea
        SET estado = @TareaEnProceso
        FROM tarea t
        INNER JOIN inserted i ON t.id_tarea = i.id_tarea
        INNER JOIN deleted d ON i.id_cumplimiento = d.id_cumplimiento
        WHERE t.estado = @TareaDueDiligence  -- Due Diligence (3)
        AND i.id_cump_est = @ComplianceCompletado
        AND d.id_cump_est <> @ComplianceCompletado;
       
        -- Log opcional para debugging
        IF @@ROWCOUNT > 0
        BEGIN
            PRINT 'Compliance completed: Updated ' + CAST(@@ROWCOUNT AS VARCHAR) + ' task(s) from Due Diligence to En Proceso';
        END
    END
END;

ALTER TABLE info_tarea
ADD cantidad INT;