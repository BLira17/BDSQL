USE ct_usm_postulaciones;

-- ============================================
-- PARTE 4: POBLAMIENTO DE DATOS (DML)
-- ============================================

-- ============================================
-- 1. EMPRESAS (6)
-- ============================================
INSERT INTO Empresa (
    rut_empresa,
    nombre_empresa,
    nombre_representante_empresa,
    mail_representante_empresa,
    telefono_representante_empresa,
    convenio_marco_usm,
    id_tamano_empresa
) VALUES
('76123456-7', 'Minera Horizonte SpA', 'Jorge Paredes', 'jparedes@minerahorizonte.cl', '+56911111111', TRUE, 3),
('77234567-8', 'AgroAndes Ltda', 'Marcela Fuentes', 'mfuentes@agroandes.cl', '+56922222222', FALSE, 2),
('78345678-9', 'SaludDigital Chile SpA', 'Cristian Leiva', 'cleiva@saluddigital.cl', '+56933333333', TRUE, 2),
('79456789-0', 'Logistica Puerto Sur S.A.', 'Pamela Araya', 'paraya@puertosur.cl', '+56944444444', TRUE, 3),
('80567890-1', 'EcoEnergia Patagonia Ltda', 'Diego Alvarado', 'dalvarado@ecoenergia.cl', '+56955555555', FALSE, 1),
('81678901-2', 'Turismo Costamar EIRL', 'Francisca Mendez', 'fmendez@costamar.cl', '+56966666666', FALSE, 1);

-- ============================================
-- 2. PERSONAS
-- 8 profesores + 12 estudiantes
-- ============================================
INSERT INTO Persona (
    rut_persona,
    nombre,
    email,
    telefono,
    id_tipo_persona
) VALUES
('11111111-1', 'Ana Torres', 'ana.torres@usm.cl', '+56970000001', 1),
('11222222-2', 'Ricardo Mella', 'ricardo.mella@usm.cl', '+56970000002', 1),
('11333333-3', 'Paula Contreras', 'paula.contreras@usm.cl', '+56970000003', 1),
('11444444-4', 'Felipe Rojas', 'felipe.rojas@usm.cl', '+56970000004', 1),
('11555555-5', 'Carolina Soto', 'carolina.soto@usm.cl', '+56970000005', 1),
('11666666-6', 'Mauricio Vega', 'mauricio.vega@usm.cl', '+56970000006', 1),
('11777777-7', 'Daniela Morales', 'daniela.morales@usm.cl', '+56970000007', 1),
('11888888-8', 'Sergio Navarro', 'sergio.navarro@usm.cl', '+56970000008', 1),

('20111111-1', 'Camila Perez', 'camila.perez@usm.cl', '+56980000001', 2),
('20222222-2', 'Tomas Gonzalez', 'tomas.gonzalez@usm.cl', '+56980000002', 2),
('20333333-3', 'Valentina Rios', 'valentina.rios@usm.cl', '+56980000003', 2),
('20444444-4', 'Diego Herrera', 'diego.herrera@usm.cl', '+56980000004', 2),
('20555555-5', 'Fernanda Silva', 'fernanda.silva@usm.cl', '+56980000005', 2),
('20666666-6', 'Nicolas Munoz', 'nicolas.munoz@usm.cl', '+56980000006', 2),
('20777777-7', 'Javiera Sepulveda', 'javiera.sepulveda@usm.cl', '+56980000007', 2),
('20888888-8', 'Matias Lopez', 'matias.lopez@usm.cl', '+56980000008', 2),
('20999999-9', 'Antonia Reyes', 'antonia.reyes@usm.cl', '+56980000009', 2),
('21111111-1', 'Benjamin Castro', 'benjamin.castro@usm.cl', '+56980000010', 2),
('21222222-2', 'Sofia Ramirez', 'sofia.ramirez@usm.cl', '+56980000011', 2),
('21333333-3', 'Vicente Carrasco', 'vicente.carrasco@usm.cl', '+56980000012', 2);

-- ============================================
-- 3. POSTULACIONES (10)
-- ============================================
INSERT INTO Postulacion (
    id_postulacion,
    numero_postulacion,
    codigo_interno,
    fecha_postulacion,
    objetivo_iniciativa,
    descripcion_posibles_soluciones,
    resultados_esperados,
    rut_empresa,
    nombre_iniciativa,
    id_tipo_iniciativa,
    presupuesto_total,
    id_region_ejecucion,
    id_region_impacto,
    id_estado_postulacion,
    rut_jefe_carrera,
    rut_coordinador_ct_usm
) VALUES
(1, 'POST-2026-001', 'CT-INT-001', '2026-03-01',
 'Disminuir fallas no planificadas en equipos mineros mediante analitica predictiva.',
 'Se propone desarrollar una plataforma de monitoreo de variables operacionales y un modelo de alerta temprana.',
 'Reducir tiempos de detencion, generar panel de control y validar alertas en ambiente piloto.',
 '76123456-7', 'Plataforma de mantenimiento predictivo minero', 1, 45000000, 3, 3, 1, '11111111-1', '11666666-6'),

(2, 'POST-2026-002', 'CT-INT-002', '2026-03-03',
 'Optimizar el uso de agua en predios agricolas mediante monitoreo de humedad y riego inteligente.',
 'Se propone integrar sensores de suelo, tablero de visualizacion y recomendaciones automaticas de riego.',
 'Disminuir consumo de agua, mejorar trazabilidad y validar el sistema en un campo piloto.',
 '77234567-8', 'Sistema de riego inteligente para AgroAndes', 1, 18000000, 5, 9, 2, '11222222-2', '11666666-6'),

(3, 'POST-2026-003', 'CT-INT-003', '2026-03-05',
 'Mejorar el seguimiento de pacientes cronicos en zonas con baja cobertura de atencion presencial.',
 'Se propone una plataforma de telemonitoreo con registro clinico, alertas y tablero para profesionales.',
 'Aumentar continuidad de control, reducir eventos criticos y dejar un piloto validado con usuarios.',
 '78345678-9', 'Telemonitoreo de pacientes cronicos rurales', 2, 32000000, 7, 8, 1, '11333333-3', '11666666-6'),

(4, 'POST-2026-004', 'CT-INT-004', '2026-03-08',
 'Optimizar la planificacion y seguimiento de contenedores en operaciones portuarias.',
 'Se propone un modulo de trazabilidad operativa y analisis de tiempos de permanencia y despacho.',
 'Reducir tiempos de espera, mejorar uso de recursos y disponer de indicadores logistico operacionales.',
 '79456789-0', 'Optimizacion logistica de contenedores portuarios', 1, 38000000, 6, 6, 2, '11444444-4', '11666666-6'),

(5, 'POST-2026-005', 'CT-INT-005', '2026-03-10',
 'Controlar de mejor forma el consumo energetico de sistemas de frio en instalaciones remotas.',
 'Se propone un sistema de monitoreo energetico con sensores, dashboard y recomendaciones de eficiencia.',
 'Reducir consumo, detectar desviaciones y dejar protocolo de operacion y mantenimiento.',
 '80567890-1', 'Monitoreo energetico para camaras de frio', 1, 15000000, 14, 14, 1, '11555555-5', '11666666-6'),

(6, 'POST-2026-006', 'CT-INT-006', '2026-03-12',
 'Predecir demanda de servicios y flujos de visitantes en destinos turisticos costeros.',
 'Se propone una solucion de analitica de datos con indicadores historicos y visualizacion para toma de decisiones.',
 'Mejorar la planificacion comercial y operativa y entregar un tablero con proyecciones de demanda.',
 '81678901-2', 'Analitica de demanda para turismo costero', 2, 12000000, 6, 5, 3, '11111111-1', '11777777-7'),

(7, 'POST-2026-007', 'CT-INT-007', '2026-03-15',
 'Mejorar la trazabilidad de residuos industriales y su seguimiento documental.',
 'Se propone una plataforma de registro, validacion y seguimiento del ciclo completo de residuos.',
 'Aumentar trazabilidad, reducir errores de registro y validar una version funcional en terreno.',
 '76123456-7', 'Trazabilidad digital de residuos industriales', 1, 26000000, 7, 6, 1, '11222222-2', '11777777-7'),

(8, 'POST-2026-008', 'CT-INT-008', '2026-03-18',
 'Fortalecer competencias de ciberseguridad en pequenas organizaciones del sector salud.',
 'Se propone un programa con plataforma de capacitacion, evaluaciones y simulaciones practicas.',
 'Aumentar nivel de conocimiento, medir progreso y dejar un programa replicable con material formativo.',
 '78345678-9', 'Capacitacion en ciberseguridad para pymes de salud', 1, 21000000, 7, 7, 4, '11333333-3', '11777777-7'),

(9, 'POST-2026-009', 'CT-INT-009', '2026-03-20',
 'Detectar de forma temprana fallas en la cadena de frio para productos agroindustriales.',
 'Se propone un sistema de monitoreo con sensores de temperatura, alertas y reportes de eventos.',
 'Reducir mermas, mejorar trazabilidad y validar el sistema en operaciones de almacenamiento y traslado.',
 '77234567-8', 'Deteccion temprana de fallas en cadena de frio agricola', 2, 24000000, 5, 14, 2, '11444444-4', '11777777-7'),

(10, 'POST-2026-010', 'CT-INT-010', '2026-03-22',
 'Optimizar la mantencion de flota de apoyo portuario mediante seguimiento de fallas y disponibilidad.',
 'Se propone una plataforma de registro de mantenciones, analitica de fallas y planificacion preventiva.',
 'Reducir fallas recurrentes, mejorar disponibilidad y dejar un tablero de gestion para la empresa.',
 '79456789-0', 'Gestion inteligente de mantencion para flota portuaria', 1, 41000000, 6, 11, 1, '11555555-5', '11777777-7');

-- ============================================
-- 4. SEDES ASOCIADAS A CADA POSTULACION
-- ============================================
INSERT INTO Postulacion_sede (id_postulacion, id_sede) VALUES
(1, 1), (1, 4),
(2, 4),
(3, 2), (3, 1),
(4, 1),
(5, 5),
(6, 3),
(7, 1), (7, 2),
(8, 2), (8, 3),
(9, 4), (9, 5),
(10, 1), (10, 5);

-- ============================================
-- 5. DOCUMENTOS POR POSTULACION
-- ============================================
INSERT INTO Documento_Postulacion (id_documento, nombre_documento, id_postulacion) VALUES
(1, 'carta_apoyo_post_001.pdf', 1),
(2, 'anexo_tecnico_post_002.pdf', 2),
(3, 'formulario_clinico_post_003.pdf', 3),
(4, 'carta_compromiso_post_004.pdf', 4),
(5, 'reporte_base_post_005.pdf', 5),
(6, 'anexo_comercial_post_006.pdf', 6),
(7, 'matriz_residuos_post_007.pdf', 7),
(8, 'programa_formativo_post_008.pdf', 8),
(9, 'ficha_tecnica_post_009.pdf', 9),
(10, 'plan_mantencion_post_010.pdf', 10);

-- ============================================
-- 6. ETAPAS DE CRONOGRAMA
-- 3 etapas por postulacion
-- ============================================
INSERT INTO Etapa_cronograma (id_etapa, nombre_etapa, plazo_semanas, entregable, id_postulacion) VALUES
(1, 'Diagnostico', 3, 'Informe de levantamiento operacional', 1),
(2, 'Diseno de solucion', 4, 'Arquitectura y plan de implementacion', 1),
(3, 'Piloto y validacion', 5, 'Informe de piloto y resultados', 1),

(4, 'Diagnostico', 2, 'Informe de uso de agua y variables criticas', 2),
(5, 'Diseno de solucion', 4, 'Modelo de riego y tablero de control', 2),
(6, 'Piloto y validacion', 4, 'Resultados de validacion en campo', 2),

(7, 'Diagnostico', 3, 'Informe de proceso asistencial actual', 3),
(8, 'Diseno de solucion', 4, 'Prototipo de plataforma de telemonitoreo', 3),
(9, 'Piloto y validacion', 5, 'Validacion con usuarios y reporte final', 3),

(10, 'Diagnostico', 3, 'Levantamiento de proceso logistico', 4),
(11, 'Diseno de solucion', 4, 'Diseno de trazabilidad portuaria', 4),
(12, 'Piloto y validacion', 5, 'Indicadores y evaluacion del piloto', 4),

(13, 'Diagnostico', 2, 'Informe base de consumo energetico', 5),
(14, 'Diseno de solucion', 3, 'Diseno de monitoreo y alertas', 5),
(15, 'Piloto y validacion', 4, 'Resultados de eficiencia energetica', 5),

(16, 'Diagnostico', 2, 'Levantamiento de datos historicos de demanda', 6),
(17, 'Diseno de solucion', 3, 'Modelo de proyeccion y dashboard', 6),
(18, 'Piloto y validacion', 4, 'Reporte de validacion comercial', 6),

(19, 'Diagnostico', 3, 'Mapa actual del flujo de residuos', 7),
(20, 'Diseno de solucion', 4, 'Plataforma de seguimiento documental', 7),
(21, 'Piloto y validacion', 4, 'Resultados de prueba en terreno', 7),

(22, 'Diagnostico', 2, 'Brechas de ciberseguridad detectadas', 8),
(23, 'Diseno de solucion', 3, 'Programa formativo y evaluaciones', 8),
(24, 'Piloto y validacion', 4, 'Resultados de capacitacion y cierre', 8),

(25, 'Diagnostico', 2, 'Levantamiento de puntos criticos de cadena de frio', 9),
(26, 'Diseno de solucion', 4, 'Sistema de alertas y seguimiento', 9),
(27, 'Piloto y validacion', 4, 'Validacion operacional y reporte final', 9),

(28, 'Diagnostico', 3, 'Analisis de fallas recurrentes de flota', 10),
(29, 'Diseno de solucion', 4, 'Plan de mantencion preventiva digital', 10),
(30, 'Piloto y validacion', 5, 'Resultados del piloto y tablero final', 10);

-- ============================================
-- 7. INTEGRANTES POR POSTULACION
-- 8 integrantes por postulacion: 3 profesores + 5 estudiantes
-- ============================================
INSERT INTO Integrante_postulacion (id_postulacion, rut_persona, rol_cumple, departamento_area, id_sede) VALUES
-- Postulacion 1
(1, '11111111-1', 'Directora Academica', 'Informatica', 1),
(1, '11444444-4', 'Docente Especialista', 'Mecanica', 1),
(1, '11666666-6', 'Coordinador Tecnico', 'Industrial', 4),
(1, '20111111-1', 'Analista de Datos', 'Informatica', 1),
(1, '20222222-2', 'Desarrollador Full Stack', 'Informatica', 1),
(1, '20333333-3', 'Integracion de Sensores', 'Electronica', 4),
(1, '20444444-4', 'Levantamiento en Terreno', 'Mecanica', 4),
(1, '20555555-5', 'Documentacion y QA', 'Industrial', 1),

-- Postulacion 2
(2, '11222222-2', 'Director Academico', 'Agronomia', 4),
(2, '11555555-5', 'Docente Especialista', 'Quimica', 4),
(2, '11666666-6', 'Coordinador Tecnico', 'Industrial', 4),
(2, '20666666-6', 'Analista de Datos', 'Industrial', 4),
(2, '20777777-7', 'Desarrolladora Frontend', 'Informatica', 4),
(2, '20888888-8', 'Implementacion IoT', 'Electronica', 4),
(2, '20999999-9', 'Trabajo de Campo', 'Agronomia', 4),
(2, '21111111-1', 'Documentacion Tecnica', 'Industrial', 4),

-- Postulacion 3
(3, '11333333-3', 'Directora Academica', 'Informatica', 2),
(3, '11444444-4', 'Docente Especialista', 'Electronica', 1),
(3, '11666666-6', 'Coordinador Tecnico', 'Industrial', 2),
(3, '21222222-2', 'Analista UX', 'Informatica', 2),
(3, '21333333-3', 'Desarrollador Backend', 'Informatica', 2),
(3, '20111111-1', 'Analista de Datos', 'Industrial', 1),
(3, '20333333-3', 'Integracion de Plataforma', 'Electronica', 1),
(3, '20555555-5', 'Pruebas y Validacion', 'Biomedica', 2),

-- Postulacion 4
(4, '11111111-1', 'Directora Academica', 'Industrial', 1),
(4, '11222222-2', 'Docente Especialista', 'Logistica', 1),
(4, '11444444-4', 'Docente Tutor', 'Mecanica', 1),
(4, '20222222-2', 'Analista de Procesos', 'Industrial', 1),
(4, '20444444-4', 'Levantamiento Operacional', 'Logistica', 1),
(4, '20666666-6', 'Analista BI', 'Informatica', 1),
(4, '20888888-8', 'Desarrollador de Reportes', 'Informatica', 1),
(4, '21111111-1', 'Documentacion Tecnica', 'Industrial', 1),

-- Postulacion 5
(5, '11555555-5', 'Directora Academica', 'Electrica', 5),
(5, '11666666-6', 'Docente Especialista', 'Industrial', 5),
(5, '11333333-3', 'Docente Tutor', 'Informatica', 5),
(5, '20777777-7', 'Analista de Monitoreo', 'Electrica', 5),
(5, '20999999-9', 'Documentacion y QA', 'Industrial', 5),
(5, '21222222-2', 'Diseno de Dashboard', 'Informatica', 5),
(5, '21333333-3', 'Implementacion de Sensores', 'Electronica', 5),
(5, '20111111-1', 'Analista de Datos', 'Industrial', 5),

-- Postulacion 6
(6, '11111111-1', 'Directora Academica', 'Turismo', 3),
(6, '11777777-7', 'Docente Especialista', 'Industrial', 3),
(6, '11888888-8', 'Docente Tutor', 'Informatica', 3),
(6, '20222222-2', 'Analista Comercial', 'Industrial', 3),
(6, '20333333-3', 'Visualizacion de Datos', 'Informatica', 3),
(6, '20444444-4', 'Levantamiento Territorial', 'Turismo', 3),
(6, '20555555-5', 'Documentacion Tecnica', 'Industrial', 3),
(6, '20666666-6', 'Modelado de Datos', 'Informatica', 3),

-- Postulacion 7
(7, '11222222-2', 'Director Academico', 'Quimica', 1),
(7, '11333333-3', 'Docente Especialista', 'Industrial', 2),
(7, '11777777-7', 'Docente Tutor', 'Informatica', 2),
(7, '20777777-7', 'Analista de Procesos', 'Industrial', 1),
(7, '20888888-8', 'Desarrollador Backend', 'Informatica', 2),
(7, '20999999-9', 'Apoyo en Terreno', 'Quimica', 1),
(7, '21111111-1', 'Documentacion y QA', 'Industrial', 2),
(7, '21222222-2', 'Analista UX', 'Informatica', 1),

-- Postulacion 8
(8, '11444444-4', 'Director Academico', 'Informatica', 2),
(8, '11555555-5', 'Docente Especialista', 'Ciberseguridad', 3),
(8, '11777777-7', 'Docente Tutor', 'Industrial', 2),
(8, '21333333-3', 'Desarrollador Plataforma', 'Informatica', 2),
(8, '20111111-1', 'Analista de Datos', 'Informatica', 3),
(8, '20222222-2', 'Soporte Tecnico', 'Ciberseguridad', 2),
(8, '20333333-3', 'Diseno de Material', 'Diseno', 3),
(8, '20444444-4', 'Evaluacion de Usuarios', 'Industrial', 2),

-- Postulacion 9
(9, '11111111-1', 'Directora Academica', 'Industrial', 4),
(9, '11666666-6', 'Docente Especialista', 'Electronica', 5),
(9, '11888888-8', 'Docente Tutor', 'Mecanica', 4),
(9, '20555555-5', 'Analista QA', 'Industrial', 4),
(9, '20666666-6', 'Modelado de Datos', 'Informatica', 5),
(9, '20777777-7', 'Integracion de Sensores', 'Electronica', 4),
(9, '20888888-8', 'Desarrollador de Alertas', 'Informatica', 5),
(9, '20999999-9', 'Levantamiento Operacional', 'Industrial', 4),

-- Postulacion 10
(10, '11222222-2', 'Director Academico', 'Logistica', 1),
(10, '11555555-5', 'Docente Especialista', 'Industrial', 5),
(10, '11888888-8', 'Docente Tutor', 'Mecanica', 1),
(10, '21111111-1', 'Analista de Procesos', 'Industrial', 1),
(10, '21222222-2', 'Analista UX', 'Informatica', 5),
(10, '21333333-3', 'Desarrollador Backend', 'Informatica', 1),
(10, '20111111-1', 'Documentacion Tecnica', 'Industrial', 5),
(10, '20333333-3', 'Integracion Operacional', 'Mecanica', 1);


-- ============================================
-- 8. EVIDENCIA MINIMA REQUERIDA
-- Correr luego de polbar
-- ============================================

-- (1) COUNT(*) por tablas principales
SELECT 'Empresa' AS tabla, COUNT(*) AS total FROM Empresa
UNION ALL
SELECT 'Persona', COUNT(*) FROM Persona
UNION ALL
SELECT 'Postulacion', COUNT(*) FROM Postulacion
UNION ALL
SELECT 'Documento_Postulacion', COUNT(*) FROM Documento_Postulacion
UNION ALL
SELECT 'Etapa_cronograma', COUNT(*) FROM Etapa_cronograma
UNION ALL
SELECT 'Integrante_postulacion', COUNT(*) FROM Integrante_postulacion
UNION ALL
SELECT 'Postulacion_sede', COUNT(*) FROM Postulacion_sede;

-- (2) Una postulacion completa con JOIN
SELECT
    p.fecha_postulacion,
    p.nombre_iniciativa,
    ti.nombre AS tipo_iniciativa,
    p.objetivo_iniciativa,
    p.descripcion_posibles_soluciones,
    p.resultados_esperados,
    p.presupuesto_total,

    e.nombre_empresa,
    e.nombre_representante_empresa,
    e.mail_representante_empresa,
    e.telefono_representante_empresa,
    e.convenio_marco_usm,
    te.nombre AS tamano_empresa,

    re.nombre AS region_ejecucion,
    ri.nombre AS region_impacto,
    ep.nombre AS estado_postulacion,
    jefe.nombre AS jefe_carrera,
    coord.nombre AS coordinador_ct_usm,

    COALESCE(
        GROUP_CONCAT(DISTINCT s.nombre ORDER BY s.nombre SEPARATOR ', '),
        'Sin sedes asociadas'
    ) AS sedes_asociadas,

    COALESCE(
        GROUP_CONCAT(DISTINCT d.nombre_documento ORDER BY d.nombre_documento SEPARATOR ', '),
        'Sin documentos adjuntos'
    ) AS otros_documentos

FROM Postulacion p
JOIN Empresa e
    ON p.rut_empresa = e.rut_empresa
JOIN Tamano_Empresa te
    ON e.id_tamano_empresa = te.id_tamano_empresa
JOIN Tipo_iniciativa ti
    ON p.id_tipo_iniciativa = ti.id_tipo_iniciativa
JOIN Region re
    ON p.id_region_ejecucion = re.id_region
JOIN Region ri
    ON p.id_region_impacto = ri.id_region
JOIN Estado_postulacion ep
    ON p.id_estado_postulacion = ep.id_estado
JOIN Persona jefe
    ON p.rut_jefe_carrera = jefe.rut_persona
JOIN Persona coord
    ON p.rut_coordinador_ct_usm = coord.rut_persona
LEFT JOIN Postulacion_sede ps
    ON p.id_postulacion = ps.id_postulacion
LEFT JOIN Sede s
    ON ps.id_sede = s.id_sede
LEFT JOIN Documento_Postulacion d
    ON p.id_postulacion = d.id_postulacion
WHERE p.id_postulacion = 1
GROUP BY
    p.fecha_postulacion,
    p.nombre_iniciativa,
    ti.nombre,
    p.objetivo_iniciativa,
    p.descripcion_posibles_soluciones,
    p.resultados_esperados,
    p.presupuesto_total,
    e.nombre_empresa,
    e.nombre_representante_empresa,
    e.mail_representante_empresa,
    e.telefono_representante_empresa,
    e.convenio_marco_usm,
    te.nombre,
    re.nombre,
    ri.nombre,
    ep.nombre,
    jefe.nombre,
    coord.nombre;

-- (3) Verificacion regla 3 profesores + 5 estudiantes por postulacion
SELECT
    p.id_postulacion,
    p.nombre_iniciativa,
    SUM(CASE WHEN tp.nombre = 'Profesor' THEN 1 ELSE 0 END) AS cantidad_profesores,
    SUM(CASE WHEN tp.nombre = 'Estudiante' THEN 1 ELSE 0 END) AS cantidad_estudiantes,
    COUNT(*) AS total_integrantes
FROM Postulacion p
JOIN Integrante_postulacion ip
    ON p.id_postulacion = ip.id_postulacion
JOIN Persona pe
    ON ip.rut_persona = pe.rut_persona
JOIN Tipo_persona tp
    ON pe.id_tipo_persona = tp.id_tipo_persona
GROUP BY
    p.id_postulacion,
    p.nombre_iniciativa
HAVING
    SUM(CASE WHEN tp.nombre = 'Profesor' THEN 1 ELSE 0 END) >= 3
    AND SUM(CASE WHEN tp.nombre = 'Estudiante' THEN 1 ELSE 0 END) >= 5;