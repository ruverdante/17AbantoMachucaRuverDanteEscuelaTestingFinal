# Proyecto Final: Automatización API Swagger Petstore
**Estudiante:** Ruver Dante Abanto Machuca  
**ID de Entrega:** 17  
**Institución:** Escuela de Testing - NTT DATA

## 1. Descripción General
Este proyecto consiste en la automatización de pruebas funcionales para los módulos **User** (Gestión de Usuarios) y **Store** (Gestión de Tienda e Inventario) de la API pública [Swagger Petstore](https://petstore.swagger.io/).

Se ha utilizado **Karate DSL** como framework principal, permitiendo una validación robusta de los contratos de API y la lógica de negocio mediante un enfoque BDD (Behavior Driven Development).

## 2. Estrategia de Prueba
La batería de pruebas se diseñó bajo los siguientes pilares:
- **Happy Paths (@happypath):** Validación de flujos exitosos (Creación, Consulta, Actualización y Eliminación).
- **Unhappy Paths (@unhappypath):** Validación de manejo de errores, asegurando que la API responda con los códigos de estado correctos (404, 400) ante datos inexistentes o inválidos.
- **Data Driven Testing:** Uso de `Scenario Outline` para ejecutar múltiples iteraciones con diferentes juegos de datos.

## 3. Estructura del Proyecto
El proyecto sigue una estructura organizada para facilitar el mantenimiento:
- `src/test/java/examples/user`: Scripts de prueba y Runners para el módulo de usuarios.
- `src/test/java/examples/store`: Scripts de prueba y Runners para el módulo de pedidos.
- `src/test/java/helpers`: Centralización de payloads en formato JSON para evitar la exposición de datos en el código.
- `karate-config.js`: Configuración global de entorno y URL base.

## 4. Configuración y Seguridad
Para cumplir con las mejores prácticas de seguridad en pruebas:
- La **URL Base** está centralizada en `karate-config.js`, evitando la duplicidad y facilitando el cambio de entornos (dev, stg, prod).
- No se exponen datos sensibles directamente en los archivos `.feature`.
- Se implementó un archivo `.gitignore` para evitar la subida de archivos temporales de compilación y reportes locales al repositorio.

## 5. Instrucciones de Ejecución
### Requisitos Previos
- Java JDK 11 o superior.
- Maven.
- IntelliJ IDEA (recomendado).

### Pasos para ejecutar
1. Clonar el proyecto desde el repositorio.
2. Abrir el proyecto en el IDE.
3. Navegar hasta los archivos Runner:
    - `src/test/java/examples/user/UserRunner.java`
    - `src/test/java/examples/store/StoreRunner.java`
4. Hacer clic derecho sobre el archivo deseado y seleccionar **"Run"**.

## 6. Reportes y Evidencia
Tras la ejecución, Karate genera automáticamente reportes visuales en formato HTML.
- **Ruta del reporte:** `target/karate-reports/karate-summary.html`
- El reporte detalla el tiempo de respuesta, los payloads enviados/recibidos y el estado (Pass/Fail) de cada escenario.