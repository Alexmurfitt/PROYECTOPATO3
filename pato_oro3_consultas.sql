-- ============================================
-- Consultas Detectivescas para el Caso "El Pato de Oro"
-- ============================================

-- 1. Personas que estuvieron el día 12 de marzo de 2025 (día del robo):
SELECT * FROM Registro_Reboot
WHERE fecha = '2025-03-12';

-- 2. Personas que se quedaron en el descanso (entre las 13:00 y las 14:00):
SELECT * FROM Ubicacion_Persona
WHERE desde BETWEEN '13:00:00' AND '14:00:00';

-- 3. Personas que tenían mochilas grandes:
SELECT p.*
FROM Personas p
JOIN Inventario i ON p.inventario_id = i.inventario_id
WHERE i.tamaño = 'Grande';

-- 4. Declaraciones sospechosas (contradicciones o información clave):
SELECT * FROM Declaraciones
WHERE declaracion LIKE '%acompañé a Matias%'
   OR declaracion LIKE '%volví a clase%';

-- 5. Registros de ventas de oro en tiendas:
SELECT * FROM Detalle_Tienda;

-- 6. Análisis final: Quién cumple todas las condiciones sospechosas.
SELECT p.*
FROM Personas p
JOIN Registro_Reboot rr ON p.persona_id = rr.persona_id
JOIN Inventario i ON p.inventario_id = i.inventario_id
WHERE rr.fecha = '2025-03-12'
  AND p.persona_id IN (SELECT persona_id FROM Ubicacion_Persona WHERE desde BETWEEN '13:00:00' AND '14:00:00')
  AND i.tamaño = 'Grande'
  AND p.altura = 'alto'
  AND p.constitucion = 'delagada';
