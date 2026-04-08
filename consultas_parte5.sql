USE ct_usm_postulaciones;

-- =========================================================
-- 1. Listado general de postulaciones
-- Pregunta: ¿Cuáles son las postulaciones registradas con su
-- fecha, tipo de iniciativa, sedes, región de ejecución,
-- región de impacto, empresa y presupuesto total?
-- =========================================================
SELECT
    p.numero_postulacion,
    p.fecha_postulacion,
    ti.nombre AS tipo_iniciativa,
    GROUP_CONCAT(DISTINCT s.nombre ORDER BY s.nombre SEPARATOR ', ') AS sedes,
    re.nombre AS region_ejecucion,
    ri.nombre AS region_impacto,
    e.nombre_empresa,
    p.presupuesto_total
FROM Postulacion p
JOIN Tipo_iniciativa ti
    ON p.id_tipo_iniciativa = ti.id_tipo_iniciativa
JOIN Empresa e
    ON p.rut_empresa = e.rut_empresa
JOIN Region re
    ON p.id_region_ejecucion = re.id_region
JOIN Region ri
    ON p.id_region_impacto = ri.id_region
LEFT JOIN Postulacion_sede ps
    ON p.id_postulacion = ps.id_postulacion
LEFT JOIN Sede s
    ON ps.id_sede = s.id_sede
GROUP BY
    p.numero_postulacion,
    p.fecha_postulacion,
    ti.nombre,
    re.nombre,
    ri.nombre,
    e.nombre_empresa,
    p.presupuesto_total
ORDER BY p.numero_postulacion;


-- =========================================================
-- 2. Postulaciones por región
-- Pregunta: ¿Qué postulaciones tienen como región de ejecución
-- la Región de Valparaiso, mostrando empresa, sedes y presupuesto?
-- =========================================================
SELECT
    p.numero_postulacion,
    p.nombre_iniciativa,
    e.nombre_empresa,
    GROUP_CONCAT(DISTINCT s.nombre ORDER BY s.nombre SEPARATOR ', ') AS sedes,
    p.presupuesto_total
FROM Postulacion p
JOIN Empresa e
    ON p.rut_empresa = e.rut_empresa
JOIN Region r
    ON p.id_region_ejecucion = r.id_region
LEFT JOIN Postulacion_sede ps
    ON p.id_postulacion = ps.id_postulacion
LEFT JOIN Sede s
    ON ps.id_sede = s.id_sede
WHERE r.nombre = 'Valparaiso'
GROUP BY
    p.numero_postulacion,
    p.nombre_iniciativa,
    e.nombre_empresa,
    p.presupuesto_total
ORDER BY p.numero_postulacion;

-- Si el profesor quiere otra región, cambia 'Valparaiso' por el nombre deseado.


-- =========================================================
-- 3. Conteo por tipo de iniciativa
-- Pregunta: ¿Cuántas postulaciones son Nuevas y cuántas son Existentes?
-- =========================================================
SELECT
    ti.nombre AS tipo_iniciativa,
    COUNT(*) AS cantidad_postulaciones
FROM Postulacion p
JOIN Tipo_iniciativa ti
    ON p.id_tipo_iniciativa = ti.id_tipo_iniciativa
GROUP BY ti.nombre
ORDER BY ti.nombre;


-- =========================================================
-- 4. Equipo de trabajo de una postulación
-- Pregunta: Dado un código interno, ¿quiénes integran el equipo
-- de trabajo, indicando rut, nombre, tipo, sede, email y rol?
-- =========================================================
SELECT
    p.numero_postulacion,
    p.codigo_interno,
    pe.rut_persona,
    pe.nombre,
    tp.nombre AS tipo_persona,
    s.nombre AS sede,
    pe.email,
    ip.rol_cumple
FROM Postulacion p
JOIN Integrante_postulacion ip
    ON p.id_postulacion = ip.id_postulacion
JOIN Persona pe
    ON ip.rut_persona = pe.rut_persona
JOIN Tipo_persona tp
    ON pe.id_tipo_persona = tp.id_tipo_persona
JOIN Sede s
    ON ip.id_sede = s.id_sede
WHERE p.codigo_interno = 'CT-INT-001'
ORDER BY tp.nombre DESC, pe.nombre;

-- También puedes filtrar por número de postulación:
-- WHERE p.numero_postulacion = 'POST-2026-001'


-- =========================================================
-- 5. Empresas con postulaciones y convenio
-- Pregunta: ¿Qué empresas tienen postulaciones asociadas,
-- cuál es su tamaño, si tienen convenio y cuántas postulaciones poseen?
-- =========================================================
SELECT
    e.nombre_empresa,
    te.nombre AS tamano_empresa,
    CASE
        WHEN e.convenio_marco_usm = TRUE THEN 'Si'
        ELSE 'No'
    END AS convenio,
    COUNT(p.id_postulacion) AS cantidad_postulaciones
FROM Empresa e
JOIN Tamano_Empresa te
    ON e.id_tamano_empresa = te.id_tamano_empresa
LEFT JOIN Postulacion p
    ON e.rut_empresa = p.rut_empresa
GROUP BY
    e.nombre_empresa,
    te.nombre,
    e.convenio_marco_usm
ORDER BY cantidad_postulaciones DESC, e.nombre_empresa;


-- =========================================================
-- 6. Postulaciones con presupuesto sobre el promedio
-- Pregunta: ¿Qué postulaciones tienen un presupuesto total
-- superior al promedio general?
-- =========================================================
SELECT
    p.numero_postulacion,
    e.nombre_empresa,
    p.presupuesto_total
FROM Postulacion p
JOIN Empresa e
    ON p.rut_empresa = e.rut_empresa
WHERE p.presupuesto_total > (
    SELECT AVG(presupuesto_total)
    FROM Postulacion
)
ORDER BY p.presupuesto_total DESC;


-- =========================================================
-- 7. Cantidad de integrantes por postulación y tipo
-- Pregunta: ¿Cuántos profesores y cuántos estudiantes tiene
-- cada postulación, agrupando por postulación y tipo de persona?
-- =========================================================
SELECT
    p.numero_postulacion,
    tp.nombre AS tipo_persona,
    COUNT(*) AS cantidad_integrantes
FROM Postulacion p
JOIN Integrante_postulacion ip
    ON p.id_postulacion = ip.id_postulacion
JOIN Persona pe
    ON ip.rut_persona = pe.rut_persona
JOIN Tipo_persona tp
    ON pe.id_tipo_persona = tp.id_tipo_persona
GROUP BY
    p.numero_postulacion,
    tp.nombre
ORDER BY
    p.numero_postulacion,
    tp.nombre;


-- =========================================================
-- 8. Postulaciones que no cumplen el mínimo de equipo
-- Pregunta: ¿Qué postulaciones tienen menos de 3 profesores
-- o menos de 5 estudiantes?
-- =========================================================
SELECT
    p.numero_postulacion,
    SUM(CASE WHEN tp.nombre = 'Profesor' THEN 1 ELSE 0 END) AS cantidad_profesores,
    SUM(CASE WHEN tp.nombre = 'Estudiante' THEN 1 ELSE 0 END) AS cantidad_estudiantes
FROM Postulacion p
JOIN Integrante_postulacion ip
    ON p.id_postulacion = ip.id_postulacion
JOIN Persona pe
    ON ip.rut_persona = pe.rut_persona
JOIN Tipo_persona tp
    ON pe.id_tipo_persona = tp.id_tipo_persona
GROUP BY p.numero_postulacion
HAVING
    SUM(CASE WHEN tp.nombre = 'Profesor' THEN 1 ELSE 0 END) < 3
    OR
    SUM(CASE WHEN tp.nombre = 'Estudiante' THEN 1 ELSE 0 END) < 5
ORDER BY p.numero_postulacion;

-- Con tus datos actuales probablemente devuelva 0 filas, porque todas cumplen.
-- Para la defensa, conviene tener datos de prueba que rompan esta regla.


-- =========================================================
-- 9. Empresas sin postulaciones registradas
-- Pregunta: ¿Qué empresas están registradas pero no tienen
-- ninguna postulación asociada?
-- =========================================================
SELECT
    e.nombre_empresa,
    e.rut_empresa,
    te.nombre AS tamano_empresa
FROM Empresa e
JOIN Tamano_Empresa te
    ON e.id_tamano_empresa = te.id_tamano_empresa
LEFT JOIN Postulacion p
    ON e.rut_empresa = p.rut_empresa
WHERE p.id_postulacion IS NULL
ORDER BY e.nombre_empresa;

-- Con tus datos actuales probablemente devuelva 0 filas, porque las 6 empresas fueron usadas.


-- =========================================================
-- 10. Postulaciones que exceden el plazo máximo
-- Pregunta: ¿Qué postulaciones tienen un cronograma cuya suma
-- de semanas supera las 36 semanas?
-- =========================================================
SELECT
    p.numero_postulacion,
    p.codigo_interno,
    COUNT(ec.id_etapa) AS total_etapas,
    SUM(ec.plazo_semanas) AS total_semanas
FROM Postulacion p
JOIN Etapa_cronograma ec
    ON p.id_postulacion = ec.id_postulacion
GROUP BY
    p.numero_postulacion,
    p.codigo_interno
HAVING SUM(ec.plazo_semanas) > 36
ORDER BY total_semanas DESC, p.numero_postulacion;

-- Con tus datos actuales probablemente devuelva 0 filas, porque los cronogramas suman menos de 36 semanas.
-- Para la defensa, conviene tener datos de prueba que superen ese límite.