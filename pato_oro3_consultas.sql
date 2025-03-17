USE PATO3;

-- CONSULTAS GENERALES DEL CASO "EL PATO DE ORO"
-- ============================================
-- 1. Consultar quién estuvo el día del robo
SELECT rr.*, p.nombre, p.apellidos
FROM Registro_Reboot rr
JOIN Personas p ON rr.persona_id = p.persona_id
WHERE rr.fecha = '2025-03-12';
-- ============================================
-- 2. Personas que se quedaron en el descanso entre las 13:00 y las 14:00 (deben ser 5 personas):
-- ============================================
SELECT up.*, p.nombre, p.apellidos, l.name AS Lugar
FROM Ubicacion_Persona up
JOIN Personas p ON up.persona_id = p.persona_id
JOIN Lugares l ON up.lugar_id = l.lugar_id
WHERE up.desde BETWEEN '13:00:00' AND '14:00:00';
-- ============================================
-- 3.1 Listado completo de Personas con sus mochilas asociadas
-- ============================================
SELECT 
    p.*, 
    i.mochila_descripcion AS Mochila_Descripcion
FROM 
    Personas p
LEFT JOIN 
    Inventario i ON p.inventario_id = i.persona_id;
-- ============================================
-- 3.2 Personas que tenían mochilas grandes:
-- ============================================
SELECT 
    p.persona_id,
    p.nombre,
    p.apellidos,
    i.mochila_descripcion
FROM 
    Personas p
JOIN 
    Inventario i ON p.inventario_id = i.persona_id
WHERE 
    i.mochila_descripcion LIKE '%grande%';
-- =========================================================
-- 4. Declaraciones y coartadas completas (con pistas)
-- Deben aparecer 12 registros (uno por persona)
-- =========================================================
SELECT d.*, p.nombre, p.apellidos
FROM Declaraciones d
JOIN Personas p ON d.persona_id = p.persona_id;
-- ================================================
-- OTRA FORMA DE CONSULTARLO con datos físicos
-- ================================================
SELECT 
    d.declaracion, 
    p.nombre, 
    p.apellidos, 
    p.altura, 
    p.constitucion, 
    p.color_pelo
FROM 
    Declaraciones d
JOIN 
    Personas p ON d.persona_id = p.persona_id
ORDER BY 
    p.persona_id;
-- =========================================================
-- 5. Ventas de oro (Detalle_Tienda)
-- Con descripción física de la persona que vendió
-- =========================================================
SELECT dt.*, l.name AS Lugar_Tienda, p.nombre AS Trabajador_Nombre, p.apellidos AS Trabajador_Apellidos
FROM Detalle_Tienda dt
JOIN Lugares l ON dt.lugar_id = l.lugar_id
JOIN Personas p ON dt.trabajador_id = p.persona_id;
-- =========================================================
-- 6. Consulta final: Persona que cumple con todas las condiciones del ladrón
-- =========================================================
SELECT
    p.persona_id,
    p.nombre,
    p.apellidos,
    p.altura,
    p.constitucion,
    p.inventario_id,
    COUNT(dt.tienda_id) AS Numero_Ventas
FROM
    Personas p
JOIN
    Registro_Reboot rr ON p.persona_id = rr.persona_id
JOIN
    Inventario i ON p.inventario_id = i.persona_id -- (uno a uno)
JOIN
    Ubicacion_Persona up ON p.persona_id = up.persona_id
LEFT JOIN
    Detalle_Tienda dt ON p.persona_id = dt.persona_id -- (ventas asociadas directamente)
WHERE
    rr.fecha = '2025-03-12' -- Estuvo el día del robo
    AND up.desde BETWEEN '13:00:00' AND '14:00:00' -- Se quedó en descanso
    AND i.mochila_descripcion LIKE '%grande%' -- Mochila grande
    AND p.altura = 'alto' -- Físico alto
    AND p.constitucion = 'fuerte' -- ⚠️ Cambiado a "fuerte", NO delgada, según las nuevas pistas.
GROUP BY
    p.persona_id
ORDER BY
    Numero_Ventas DESC;
--====================0
-- Consulta anterior simplificada teniendo en cuenta que ya se había descartado a varias personas con las primeras 5 consultas:
SELECT 
    p.persona_id, 
    p.nombre, 
    p.apellidos, 
    COUNT(dt.tienda_id) AS Numero_Ventas
FROM 
    Personas p
JOIN 
    Detalle_Tienda dt ON p.persona_id = dt.persona_id
WHERE 
    p.persona_id IN (
        SELECT persona_id FROM Personas 
        WHERE altura = 'alto' 
        AND constitucion = 'fuerte' 
        AND inventario_id IN (SELECT persona_id FROM Inventario WHERE mochila_descripcion LIKE '%grande%')
        AND persona_id IN (SELECT persona_id FROM Registro_Reboot WHERE fecha = '2025-03-12')
        AND persona_id IN (SELECT persona_id FROM Ubicacion_Persona WHERE desde BETWEEN '13:00:00' AND '14:00:00')
    )
GROUP BY 
    p.persona_id
ORDER BY 
    Numero_Ventas DESC;
