USE ct_usm_postulaciones;

-- =========================================================
-- BLOQUE EXTRA DE DEFENSA PARA CONSULTAS 8, 9 y 10
-- Ejecutar despues de las evidencias de poblamiento base
-- =========================================================

-- ---------------------------------------------------------
-- A) Empresa sin postulaciones (para consulta 9)
-- ---------------------------------------------------------
INSERT INTO Empresa (
    rut_empresa,
    nombre_empresa,
    nombre_representante_empresa,
    mail_representante_empresa,
    telefono_representante_empresa,
    convenio_marco_usm,
    id_tamano_empresa
) VALUES
('82789012-3', 'BioInnovacion del Pacifico SpA', 'Lorena Campos', 'lcampos@bioinnovacion.cl', '+56977777777', TRUE, 2);

-- Esta empresa no se asociara a ninguna postulacion.
-- Debe aparecer en la consulta 9.


-- ---------------------------------------------------------
-- B) Postulacion que NO cumple minimo de equipo (para consulta 8)
-- Menos de 3 profesores y menos de 5 estudiantes
-- ---------------------------------------------------------
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
(11, 'POST-2026-011', 'CT-INT-011', '2026-03-25',
 'Probar una iniciativa con equipo insuficiente para la defensa.',
 'Se crea una postulacion de prueba para validar la consulta de minimo de equipo.',
 'Debe ser detectada por tener menos profesores y menos estudiantes de los requeridos.',
 '80567890-1',
 'Caso de prueba de equipo insuficiente',
 1,
 9000000,
 6,
 6,
 1,
 '11111111-1',
 '11666666-6');

INSERT INTO Postulacion_sede (id_postulacion, id_sede) VALUES
(11, 1);

INSERT INTO Documento_Postulacion (id_documento, nombre_documento, id_postulacion) VALUES
(11, 'documento_prueba_equipo_insuficiente.pdf', 11);

INSERT INTO Etapa_cronograma (id_etapa, nombre_etapa, plazo_semanas, entregable, id_postulacion) VALUES
(31, 'Diagnostico', 2, 'Informe inicial', 11),
(32, 'Diseno', 3, 'Propuesta de solucion', 11),
(33, 'Cierre', 2, 'Reporte final', 11);

-- Solo 2 profesores + 4 estudiantes = NO cumple
INSERT INTO Integrante_postulacion (id_postulacion, rut_persona, rol_cumple, departamento_area, id_sede) VALUES
(11, '11111111-1', 'Directora Academica', 'Informatica', 1),
(11, '11222222-2', 'Docente Especialista', 'Industrial', 1),
(11, '20111111-1', 'Analista de Datos', 'Informatica', 1),
(11, '20222222-2', 'Desarrollador', 'Informatica', 1),
(11, '20333333-3', 'Documentacion', 'Industrial', 1),
(11, '20444444-4', 'Apoyo en Terreno', 'Industrial', 1);

-- Esta postulacion debe aparecer en la consulta 8.


-- ---------------------------------------------------------
-- C) Postulacion que excede 36 semanas (para consulta 10)
-- ---------------------------------------------------------
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
(12, 'POST-2026-012', 'CT-INT-012', '2026-03-27',
 'Probar una postulacion cuyo cronograma supera el plazo maximo permitido.',
 'Se crea un caso de prueba para validar la consulta de exceso de semanas.',
 'Debe ser detectada por superar 36 semanas acumuladas.',
 '79456789-0',
 'Caso de prueba de cronograma extendido',
 2,
 15000000,
 7,
 7,
 1,
 '11333333-3',
 '11777777-7');

INSERT INTO Postulacion_sede (id_postulacion, id_sede) VALUES
(12, 2);

INSERT INTO Documento_Postulacion (id_documento, nombre_documento, id_postulacion) VALUES
(12, 'documento_prueba_cronograma_extendido.pdf', 12);

-- 3 etapas que suman 39 semanas
INSERT INTO Etapa_cronograma (id_etapa, nombre_etapa, plazo_semanas, entregable, id_postulacion) VALUES
(34, 'Diagnostico Extendido', 12, 'Informe de diagnostico extendido', 12),
(35, 'Desarrollo Extendido', 14, 'Plataforma y prototipo funcional', 12),
(36, 'Validacion Extendida', 13, 'Informe final de validacion', 12);

-- Equipo completo para que esta no falle por consulta 8
INSERT INTO Integrante_postulacion (id_postulacion, rut_persona, rol_cumple, departamento_area, id_sede) VALUES
(12, '11333333-3', 'Directora Academica', 'Informatica', 2),
(12, '11444444-4', 'Docente Especialista', 'Electronica', 2),
(12, '11777777-7', 'Coordinador Tecnico', 'Industrial', 2),
(12, '20555555-5', 'Analista QA', 'Industrial', 2),
(12, '20666666-6', 'Analista de Datos', 'Informatica', 2),
(12, '20777777-7', 'Desarrolladora Frontend', 'Informatica', 2),
(12, '20888888-8', 'Desarrollador Backend', 'Informatica', 2),
(12, '20999999-9', 'Documentacion Tecnica', 'Industrial', 2);

-- Esta postulacion debe aparecer en la consulta 10.