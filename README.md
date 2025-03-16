# 🦆 Proyecto PATO ORO 3

Bienvenido al **Proyecto PATO ORO 3**, un proyecto completo de investigación detectivesca, diseñado para resolver el misterioso robo del "Pato de Oro", una valiosa figura desaparecida de Reboot Academy.

---

## 🎯 Objetivo del Proyecto

Desarrollar una **base de datos lógica y coherente**, con una historia detectivesca, que permita resolver un caso de robo mediante el uso de **consultas SQL avanzadas**, aplicando deducción, análisis y filtrado de información hasta encontrar al culpable.

---

## 📚 Descripción del Caso

- **El Pato de Oro**, mascota icónica de Reboot, valorada en **más de 1 millón de euros**, ha desaparecido el **miércoles 12 de marzo de 2025**.
- El ladrón **aprovechó un momento sin vigilancia, ocultó el pato en una mochila grande**, y **fundió el oro**, vendiéndolo en diversas tiendas bajo identidades falsas.
- Tu misión: analizar los registros de asistencia, mochilas, testimonios y ventas de oro para encontrar al culpable.

---

## 📦 Estructura del Proyecto

| Archivo | Descripción |
|--------|-------------|
| `pato_oro3.sql` | **Estructura completa** de la base de datos con todas las tablas y relaciones (PRIMARY y FOREIGN KEYS). |
| `pato_oro3_datos.sql` | **Datos iniciales** insertados: personas, inventario, lugares, registros, declaraciones y ventas. |
| `pato_oro3_consultas.sql` | **Consultas SQL avanzadas** para investigar y resolver el caso. |
| `README.md` | Descripción detallada del proyecto y sus objetivos. |

---

## 🔑 Requisitos

- **MySQL** o **MariaDB** instalado.
- Herramienta de gestión de bases de datos (como MySQL Workbench, DBeaver, etc.).
- Conocimientos básicos de SQL para ejecutar las consultas.

---

## ⚙️ Instalación y Uso

### 1. Clonar el Repositorio

```bash
git clone git@github.com:Alexmurfitt/PROYECTOPATO3.git

# Proyecto Pato de Oro 3

Este proyecto recrea un caso detectivesco para identificar al ladrón de "El Pato de Oro", una valiosa mascota de Reboot Academy.

## Objetivo

Utilizar una base de datos compleja y lógica para resolver el caso mediante consultas SQL avanzadas.

## Características

- 12 personas con distintos roles y mochilas.
- Registro de asistencia, ubicaciones, inventario, declaraciones y ventas de oro.
- Proceso detectivesco para deducir al ladrón basado en pistas y datos cruzados.

## Archivos

- `pato_oro3.sql`: Estructura completa de la base de datos.
- `pato_oro3_datos.sql`: Datos iniciales insertados.
- `pato_oro3_consultas.sql`: Consultas SQL para resolver el caso.

## Instrucciones

### 1. Importar la Base de Datos

```bash
mysql -u usuario -p < pato_oro3.sql
