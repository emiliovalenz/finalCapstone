
# Software Guidebook — Plantilla de Documentación

**Nombre del sistema:**   E-Catalog 

**Equipo / Integrantes:** Luis Guillen, Gibran Garcia, Carlos Valenzuela

**Fecha:** 31 - Mayo - 2026 

**Versión del documento:** Final  

---

# 1. Contexto

Esta sección establece el escenario general. Debe responder: ¿qué es el sistema? ¿por qué existe? ¿quién lo usa? ¿cómo encaja en su entorno? Una página o dos es suficiente; un diagrama de contexto (C4 Level 1) es altamente recomendado.

## ¿Qué es y para qué sirve este sistema?
Escribe aquí una descripción breve del sistema.

E-Catalog es un sistema que consiste en un catálogo digital que contiene piezas manufacturadas y compradas en la empresa Collins Aerospace con la intención de proporcionar información sobre ellas de una manera sencilla e intuitiva para el usuario, en este caso, siendo los empleados dentro de Collins Aerospace.
## ¿Cómo encaja en el entorno existente?
Describe los sistemas externos, procesos de negocio o plataformas con las que interactúa.

E-Catalog interactúa con el Sistema de Autenticación de Collins Aerospace para delegar la tarea de Autenticar usuarios, permitiéndoles el acceso a la plataforma.

## ¿Quiénes son los usuarios?

| Rol / Actor | Descripción |
|---|---|
| Ingenieros | Ingenieros que trabajan en el área de Standard Parts en Collins Aerospace |
| Personal de IT | Empleados que trabajan en el área de IT en Collins Aerospace|
| Developers |Developers que trabajan en Collins Aerospace|

## Diagrama de Contexto
Inserta aquí un diagrama C4 de Contexto (Level 1) o un esquema equivalente.

![Diagrama C1](Diagramas/diagramC1.png)

---

# 2. Vista Funcional

Resume las funcionalidades clave del sistema. No es un manual de usuario; es un mapa de lo que hace el sistema y qué funcionalidades son arquitectónicamente significativas.

## ¿Qué hace el sistema?
Describe brevemente el propósito funcional del sistema.

El propósito de E-Catalog es brindar un catálogo donde los Ingenieros en Collins Aerospace puedan consultar información y datos tanto de piezas manufacturadas como de piezas compradas. Esto con la intención de tener un acceso rápido y sencillo de navegar para la suplir la necesidad de consulta de información en el día a día del trabajo.

## Funcionalidades principales

| # | Funcionalidad | ¿Arquitectónicamente significativa? | ¿Por qué? |
|---|---|---|---|
| 1 | Búsqueda y filtrado de piezas (por número de parte, categoría, material, dimensiones, etc.) | Sí | Es el núcleo del sistema; impacta el modelo de datos, indexación y rendimiento de queries |
| 2 | Visualización de ficha técnica de pieza (especificaciones, planos, tolerancias, materiales) | Sí | Puede requerir renderizado de archivos PDF/PNG y almacenamiento de archivos pesados |
| 3 | Gestión de catálogo (alta, baja y modificación de piezas) | Sí | Define flujos de escritura, roles y permisos |
| 4 | Exportación de información de piezas (PDF, Excel) | No | Es útil pero no cambia decisiones estructurales del sistema |

## Usuarios y sus necesidades

| Rol | Necesidad principal que cubre el sistema |
|---|---|
| Ingenieros de Collins Aerospace | Utilizan el E-Catalog para consultar información de piezas manufacturadas y compradas. También gestiona el catálogo: alta, baja y modificación de piezas. |
|Personal de IT de Collins Aerospace|Revisa el estado del sistema para mantenerlo estable y funcionando|
|Developers de Collins Aerospace|Se encargan de darle continuidad al desarrollo del sistema extendiendo su funcionalidad y adaptándolo día con día|

## Diagrama de flujo / casos de uso (opcional si aplica)

Un diagrama de casos de uso UML, wireframe o diagrama de flujo de actividad puede ir aquí.

<div align="center">

![Diagrama de Flujo](Diagramas/diagramaFlujo.png)

</div>


---

# 3. Atributos de Calidad

Lista los requisitos no funcionales con valores precisos y medibles. Evita términos vagos como "rápido" o "escalable"; usa métricas concretas.

| Atributo | Descripción | Métrica / Criterio de aceptación |
|---|---|---|
| Rendimiento | Las búsquedas y consultas de piezas deben responder ágilmente para no interrumpir el flujo de trabajo del ingeniero | Tiempo de respuesta menor a 2 segundos en el 95% de las consultas |
| Escalabilidad | El sistema debe soportar el uso simultáneo de múltiples ingenieros dentro de la red interna | Soportar al menos 10 usuarios concurrentes sin degradación notable del rendimiento |
| Disponibilidad | El sistema debe estar disponible durante el horario laboral de Collins Aerospace | 99% de uptime en horario laboral (lunes a viernes, 7am–5pm) |
| Seguridad | El acceso al sistema debe estar restringido a empleados autenticados mediante el sistema de autenticación de Collins Aerospace | 100% de endpoints protegidos; ningún acceso sin sesión válida del sistema corporativo |
| Mantenibilidad | El código debe ser comprensible y fácil de extender por nuevos developers que se incorporen al proyecto | Un developer nuevo debe ser capaz de entender y modificar cualquier módulo del sistema en menos de 2 horas, contando con la documentación disponible |
| Usabilidad | Los ingenieros deben poder encontrar una pieza sin necesidad de capacitación previa | Un usuario nuevo debe poder realizar una búsqueda exitosa en menos de 3 minutos sin ayuda |

> **Nota:** Indica explícitamente qué atributos están fuera de alcance si aplica (ej. "Soporte multilingüe no está contemplado en esta versión").

Atributos fuera de alcance:  
- Soporte multilingüe (solo español)  
- Acceso desde fuera de la red interna (no hay acceso remoto/VPN contemplado)  
- Alta disponibilidad 24/7 fuera de horario laboral
---

# 4. Restricciones

Documenta las restricciones impuestas al proyecto: tecnológicas, organizacionales, presupuestarias, legales, etc. Las restricciones reducen opciones de diseño y deben quedar explícitas.

| Tipo | Restricción | Impacto en la arquitectura |
|---|---|---|
| Tecnológica | Uso de SQL Server | Limita la elección de DBMS y obliga a usar patrones y herramientas específicas de SQL Server. Reduce portabilidad futura pero aprovecha licencias corporativas existentes. |
| Presupuesto / Tiempo | No hay presupuesto para el proyecto. El tiempo para realizar el proyecto es de 6 meses | Obliga a usar tecnologías open source y gratuitas. El alcance funcional debe limitarse a lo esencial; descarta soluciones complejas que requieran licencias o infraestructura costosa |
| Plataforma de despliegue | El sistema debe desplegarse localmente en una máquina Windows de la empresa | Descarta opciones cloud; obliga a usar tecnologías compatibles con Windows. El sistema solo es accesible desde la red interna de la empresa |
| Equipo | Equipo de 6 personas con conocimiento que tengan conocimiento en Front-End, Back-End, Base de Datos, Diseño y Maquetado| Se debe elegir un stack tecnológico conocido por el equipo para evitar curvas de aprendizaje que comprometan los tiempos. La arquitectura debe ser simple y bien documentada para facilitar la colaboración |
| Legal / Regulatoria | N/A | N/A |

---

# 5. Principios de Diseño

Enumera los principios que guían las decisiones de arquitectura y desarrollo. Deben ser conocidos y compartidos por todo el equipo.

| # | Principio | Descripción / Justificación |
|---|---|---|
| 1 | DRY (Don't Repeat Yourself) | El código no debe duplicarse. Si una lógica se repite, se extrae en un componente o función reutilizable para facilitar el mantenimiento y reducir errores |

---

# 6. Arquitectura de Software

Esta es la vista de "gran cuadro" del sistema. Describe la estructura de contenedores y componentes principales. Usa diagramas C4 (Level 2 y/o Level 3).

## Descripción general

Explica en 2-4 párrafos la estructura del sistema: qué contenedores lo componen, qué tecnologías usan y cómo interactúan entre sí.

## Diagrama de Contenedores (C4 Level 2)

Muestra los contenedores (aplicaciones, bases de datos, servicios) y sus interacciones.

```text
[ Diagrama aquí ]
```

## Diagrama de Componentes (C4 Level 3) — opcional

Muestra los componentes internos de un contenedor relevante.

```text
[ Diagrama aquí ]
```

## Resumen de contenedores / componentes principales

| Contenedor / Componente | Tecnología | Responsabilidad |
|---|---|---|
| Ej. Web App | React + TypeScript | Interfaz de usuario |
| Ej. API REST | Node.js / Express | Lógica de negocio |
| Ej. Base de datos | PostgreSQL | Persistencia de datos |
| ... | ... | ... |

---

# 7. Código

Explica los aspectos de implementación más importantes, complejos o no obvios. No documentes todo; enfócate en lo que los nuevos integrantes del equipo necesitan entender.

## Aspectos relevantes de implementación

Para cada aspecto importante, incluye una breve descripción y, si ayuda, un diagrama de clases o de secuencia simplificado.

### 7.1 [Nombre del aspecto, ej. Manejo de autenticación]
Descripción...

### 7.2 [Nombre del aspecto, ej. Estrategia de caché]
Descripción...

### 7.3 [Nombre del aspecto, ej. Patrón de acceso a datos]
Descripción...

---

# 8. Datos

Documenta lo importante sobre los datos del sistema: modelo, almacenamiento, propietarios, retención y respaldo.

## Modelo de datos (resumen)

Incluye un diagrama entidad-relación simplificado o un esquema de alto nivel.

```text
[ Diagrama o descripción del modelo de datos aquí ]
```

## Preguntas clave sobre los datos

| Pregunta | Respuesta |
|---|---|
| ¿Dónde se almacenan los datos? | ... |
| ¿Quién es propietario de los datos? | ... |
| ¿Cuánto almacenamiento se requiere? | ... |
| ¿Estrategia de respaldo? | ... |
| ¿Requisitos de archivado o retención? | ... |
| ¿Se usan archivos planos? ¿En qué formato? | ... |

---

# 9. Arquitectura de Infraestructura

Describe el hardware (físico o virtual) y la red sobre la que correrá el software.

## Diagrama de infraestructura / red

```text
[ Diagrama aquí ]
```

## Descripción de componentes de infraestructura

| Componente | Tipo | Descripción / Propósito |
|---|---|---|
| Ej. Servidor Web | VM / Cloud | ... |
| Ej. Servidor de BD | VM / Cloud | ... |
| Ej. Load Balancer | ... | ... |

## Consideraciones de alta disponibilidad

¿Se contempla redundancia, failover o disaster recovery? ¿Cómo?

---

# 10. Despliegue

Documenta el mapeo entre los contenedores de software y la infraestructura. ¿Dónde corre cada pieza del sistema? El sistema corre en un servidor web local que se tiene en la planta de Mexicali, donde se ejectuan simultaneamente el frontend, el backend y la base de datos, debido a que es un proyecto interno y la carga que tiene planeada recibir es baja/media.

![imagen-infraestructura-contenedores](infraestructura-contenedores.png)



## Estrategia de despliegue

Describe cómo y dónde se despliega el sistema (ej. contenedores Docker en AWS ECS, despliegue manual en VPS, etc.).
El sistema se despliega en una máquina Windows ubicada físicamente dentro de la red de la planta. El acceso remoto para administración es vía **RDP**; para ejecución de comandos se usa PowerShell desde esa misma sesión.

El proceso es manual y controlado por el administrador del servidor.

El flujo estándar para cada actualización es el siguiente:

1. Los cambios se consolidan en la rama `main` del repositorio Git
2. El administrador notifica a los usuarios que habrá una ventana de mantenimiento 
3. Se toma un backup de la base de datos antes de cualquier intervención
4. El administrador accede al servidor vía RDP y ejecuta el pase a producción desde una terminal PowerShell
5. Se verifica que el sistema responda correctamente antes de cerrar la ventana de mantenimiento

```powershell
# ── 1. Obtener últimos cambios ──────────────────────────────────────────
cd C:\inetpub\eCatalogApp
git pull origin main

# ── 2. Build del frontend ───────────────────────────────────────────────
cd eCatalogCollinsFront
pnpm install
pnpm run build
# El resultado queda en eCatalogCollinsFront\dist\ — IIS sirve esta carpeta

# ── 3. Actualizar dependencias del backend ──────────────────────────────
cd ..\eCatalogCollinsBack
pip install -r requirements.txt

# ── 4. Correr migraciones (si las hay en este pase) ─────────────────────
# Solo ejecutar si el pase incluye cambios de esquema
alembic upgrade head

# ── 5. Reiniciar el servicio FastAPI ────────────────────────────────────
uvicorn app.main:app --reload

# ── 6. Verificar que el proceso levantó correctamente ───────────────────
Start-Sleep -Seconds 5
Invoke-WebRequest -Uri http://localhost:8000/health -UseBasicParsing
```

IIS no necesita reiniciarse salvo que cambien archivos de configuración (`.web.config`). Al actualizar la carpeta `dist\` del frontend, IIS sirve los nuevos archivos de forma inmediata.

## Mapeo software → infraestructura

| Contenedor / Componente | Se despliega en | Configuración |
|---|---|---|
| Frontend (React + TanStack Start) | `C:\inetput\eCatalogCollinsFront` | Build estático servido por Nginx for IIS; se genera con `npm run build` antes del pase |
| Backend (FastAPI) | `C:\inetpub\eCatalogCollinsBack` | Proceso Python registrado como servicio Windows vía NSSM; Uvicorn escuchando en `localhost:8000` |
| Base de datos | SQL Server, misma máquina | Instancia única, sin réplica |
| Archivos estáticos / uploads | `C:\uploads` o carpeta equivalente | Excluida del repositorio Git, respaldo manual |
| Servidor web / reverse proxy | IIS o Nginx for Windows en puerto 80/443 | Redirige `/api/*` al proceso FastAPI en `:8000` y sirve el build del frontend para todo lo demás |
## Estrategia de rollback

¿Cómo se revierte un despliegue fallido?

Si el despliegue produce un error que no se puede resolver en menos de 15 minutos, se ejecuta rollback inmediato al último estado estable conocido.

**Criterio de activación:** si tras el pase se reportan errores funcionales por usuarios de piso o supervisores en los primeros 30 minutos, se revierte sin necesidad de diagnóstico extenso. Es preferible revertir y analizar el problema en staging que mantener el sistema inestable durante turno productivo.

El procedimiento completo de rollback es el siguiente:

```powershell
# ── 1. Revertir el código al commit anterior ────────────────────────────
cd C:\inetpub\eCatalogCollinsApp
git log --oneline -5                        # identificar el hash estable
git checkout 

# ── 2. Reconstruir el frontend ──────────────────────────────────────────
cd eCatalogCollinsFrontend
pnpm install
pnpm run build

# ── 3. Restaurar dependencias del backend ───────────────────────────────
cd ..\eCatallogCollinsBack
pip install -r requirements.txt

# ── 4. Revertir migraciones si el pase las incluyó ──────────────────────
# Omitir este paso si el pase no tocó la base de datos
alembic downgrade -1

# ── 5. Reiniciar el servicio y verificar ────────────────────────────────
uvicorn app.main:app --reload
Start-Sleep -Seconds 5
Invoke-WebRequest -Uri http://localhost:8000/health -UseBasicParsing
```

> **Importante:** si `alembic downgrade` falla o el esquema quedó en un estado inconsistente, restaurar el backup tomado al inicio del pase antes de continuar:
>
> ```powershell
> # SQL Server
> sqlcmd -S localhost -Q "RESTORE DATABASE nombre_db FROM DISK='C:\backups\pre-deploy-YYYYMMDD_HHMM.bak' WITH REPLACE"
>
> # MySQL
> mysql -u usuario -p nombre_db < C:\backups\pre-deploy-YYYYMMDD_HHMM.sql
> ```

---

# 11. Operación y Soporte

Explica cómo se monitorea, administra y mantiene el sistema en producción.

| Aspecto | Descripción |
|---|---|
| Monitoreo | El estado del servicio FastAPI se verifica manualmente accediendo al endpoint `/health` desde el navegador o con `Invoke-WebRequest -Uri http://localhost:8000/health`. El administrador revisa que IIS y el servicio Windows de FastAPI estén activos desde el Administrador de servicios (`services.msc`) al inicio de cada turno. |
| Logs / Auditoría | FastAPI escribe logs en `C:\inetpub\eCatallogApp\eCatallogCollinsBack\logs\app.log` mediante el módulo `logging` de Python. IIS genera sus propios logs de acceso en `C:\inetpub\logs\LogFiles\`. Ambos se conservan por 90 días antes de rotarse o eliminarse manualmente. |
| Alertas | No se cuenta con un sistema de alertas automático. Si el servicio cae, los usuarios de piso lo reportan directamente a TI.|
| Tareas de mantenimiento | Limpiar la carpeta `C:\backups\` manualmente cada mes para evitar que llene el disco. Verificar que el servicio FastAPI arrancó correctamente después de cualquier reinicio del equipo o actualización de Windows. |
| Cambios de configuración | Las variables de entorno de FastAPI se gestionan en un archivo `.env` ubicado en `C:\inetpub\eCatallogCollinsApp\eCatallogCollinsBack`. Cualquier cambio en ese archivo requiere reiniciar el servicio (`uvicorn app.main:app --reload`) para que tome efecto. Los cambios en la configuración de IIS (bindings, URL Rewrite, app pool) no requieren reinicio del equipo pero sí un `iisreset /noforce`. |

---

# 12. Entorno de Desarrollo

Proporciona toda la información práctica que un desarrollador nuevo necesita para comenzar a trabajar.

## Requisitos previos

| Herramienta | Versión requerida | Notas |
|---|---|---|
| Node.js | >= 20.x | Instalar con pnpm por cuestiones de seguridad con npm |
| Windows | >= 10 | N/A |
| Python | >= 3.14 | N/A |
| SQL Server | >= SQL SERVER 2022 | N/A |
| UV | >= 0.11.17 | Como node.js pero para python |

## Cómo clonar y configurar el proyecto

Empezar con la base de datos
1. Levantar una instancia de SQL Server de manera local o mediante un contenedor de Docker utilizando el puerto por defecto (`1433`).
2. Abrir tu herramienta de gestión de bases de datos (SQL Server Management Studio o Azure Data Studio) y conectarse al servidor.
3. Ejecutar el siguiente bloque de comandos unificado para estructurar la base de datos, aplicar restricciones, índices, procedimientos almacenados y cargar la información semilla para pruebas:

```sql
-- ============================================================================
-- 1. CREACIÓN E INICIALIZACIÓN DE LA BASE DE DATOS
-- ============================================================================
CREATE DATABASE eCatalogCollins;
GO

USE eCatalogCollins;
GO

-- ============================================================================
-- 2. CREACIÓN DE TABLAS PRINCIPALES
-- ============================================================================

-- Tabla de Usuarios de la Aplicación
CREATE TABLE Users (
    ID INT IDENTITY(1,1) CONSTRAINT PK_Users PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(150) NOT NULL CONSTRAINT UQ_Users_Correo UNIQUE,
    Rol NVARCHAR(50) NOT NULL,
    Fecha_Creacion DATETIME DEFAULT GETDATE()
);

-- Tabla de Catálogo de Materiales
CREATE TABLE Materials (
    ID INT IDENTITY(1,1) CONSTRAINT PK_Materials PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NULL
);

-- Tabla de Catálogo de Longitudes
CREATE TABLE Lengths (
    ID INT IDENTITY(1,1) CONSTRAINT PK_Lengths PRIMARY KEY,
    Display_Value NVARCHAR(50) NOT NULL,
    System NVARCHAR(50) NOT NULL
);

-- Tabla Principal de Componentes (Parts)
CREATE TABLE Parts (
    ID INT IDENTITY(1,1) CONSTRAINT PK_Parts PRIMARY KEY,
    Spec_IP NVARCHAR(100) NULL,
    Name NVARCHAR(150) NOT NULL,
    Part_Number NVARCHAR(100) NOT NULL CONSTRAINT UQ_Parts_Part_Number UNIQUE,
    Description NVARCHAR(MAX) NULL,
    Part_Family_Type NVARCHAR(100) NULL,
    Category NVARCHAR(100) NULL,
    Features NVARCHAR(MAX) NULL,
    Size_Range NVARCHAR(100) NULL,
    Finish NVARCHAR(100) NULL,
    Visual NVARCHAR(MAX) NULL,
    Datasheet_Spec NVARCHAR(MAX) NULL
);
GO

-- ============================================================================
-- 3. CREACIÓN DE TABLAS PUENTE (RELACIONES MUCHOS A MUCHOS)
-- ============================================================================

-- Relación Muchos a Muchos: Parts <-> Materials
CREATE TABLE Parts_Materials (
    Part_ID INT NOT NULL,
    Material_ID INT NOT NULL,
    CONSTRAINT PK_Parts_Materials PRIMARY KEY (Part_ID, Material_ID),
    CONSTRAINT FK_Parts_Materials_Parts FOREIGN KEY (Part_ID) REFERENCES Parts(ID) ON DELETE CASCADE,
    CONSTRAINT FK_Parts_Materials_Materials FOREIGN KEY (Material_ID) REFERENCES Materials(ID) ON DELETE CASCADE
);

-- Relación Muchos a Muchos: Parts <-> Lengths
CREATE TABLE Parts_Lengths (
    Part_ID INT NOT NULL,
    Length_ID INT NOT NULL,
    CONSTRAINT PK_Parts_Lengths PRIMARY KEY (Part_ID, Length_ID),
    CONSTRAINT FK_Parts_Lengths_Parts FOREIGN KEY (Part_ID) REFERENCES Parts(ID) ON DELETE CASCADE,
    CONSTRAINT FK_Parts_Lengths_Lengths FOREIGN KEY (Length_ID) REFERENCES Lengths(ID) ON DELETE CASCADE
);
GO

-- ============================================================================
-- 4. CREACIÓN DE ÍNDICES DE RENDIMIENTO
-- ============================================================================

-- Optimización de búsquedas y filtros por campos de texto frecuentes
CREATE INDEX IX_Materials_Name ON Materials(Name);
CREATE INDEX IX_Lengths_Display_Value_System ON Lengths(Display_Value, System);

-- Optimización de llaves foráneas de tablas puente para agilizar JOINS
CREATE INDEX IX_Parts_Materials_Material ON Parts_Materials(Material_ID);
CREATE INDEX IX_Parts_Lengths_Length ON Parts_Lengths(Length_ID);
GO

-- ============================================================================
-- 5. PROCEDIMIENTO ALMACENADO DE AUTENTICACIÓN
-- ============================================================================
CREATE PROCEDURE dbo.AuthUser
    @Nombre NVARCHAR(100),
    @Correo NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        ID, 
        Nombre, 
        Correo, 
        Rol, 
        Fecha_Creacion
    FROM Users
    WHERE Nombre = @Nombre AND Correo = @Correo;
END;
GO

-- ============================================================================
-- 6. INSERCIÓN DE DATOS SEMILLA
-- ============================================================================

-- Registro de Usuario de Pruebas
INSERT INTO Users (Nombre, Correo, Rol) 
VALUES ('Dev User', 'dev@collins.com', 'Admin');

-- Catálogos Base
INSERT INTO Materials (Name, Description) 
VALUES ('Steel', 'Carbon steel'), ('Aluminium', '6061-T6 Aluminium');

INSERT INTO Lengths (Display_Value, System) 
VALUES ('10mm', 'Metric'), ('1/2 inch', 'Imperial');

-- Componente Técnico Base (ID auto-asignado: 1)
INSERT INTO Parts (Name, Part_Number, Description, Category, Part_Family_Type) 
VALUES ('Standard Bolt', 'PRT-001', 'Hex head standard bolt', 'Fasteners', 'Hardware');

-- Mapeo de Relaciones Semilla para el componente 1
INSERT INTO Parts_Materials (Part_ID, Material_ID) VALUES (1, 1);
INSERT INTO Parts_Lengths (Part_ID, Length_ID) VALUES (1, 1);
GO
```

Configuracion del backend
```bash

#Continuar con la configuracion del backend
git clone https://github.com/JorgeQR1003/eCatalogCollinsBack.git
cd eCatalogCollinsBack

# Pasos de configuración
1. cd eCatalogCollinsBack
2. Crear un archivo .env que contenga DB_driver=ODBC Driver 18 for SQL Server, DB_SERVER=localhost, DB_NAME=eCatallogCollins, DB_ENCRYPT=yes
3. Crear un ambiente virtual usando uv venv -nombredelambiente
4. Al usar uv venv te ingresara automaticamente al ambiente virtual, ejecutar uv pip install -r requirements.txt
5. Ejecutar uv run app/main.py

```
Configuracion del Frontend
```Bash
# Continuar con el frontend
1. Clona el repositorio: git clone https://github.com/BarcosyPizzas/eCatalogCollinsFront.git
2. Entra al proyecto frontend: cd eCatalogCollinsFront/eCatalog
3. Instala dependencias: npm install (o npm ci si quieres instalación limpia con package-lock.json)
4. Configura variables de entorno: Crea/edita eCatalog/.env
5. Agrega VITE_API_URL=<URL_DE_TU_BACKEND> (el frontend la usa para las llamadas API)
6. Corre el proyecto en desarrollo: npm run dev
7. Abre la app en el navegador: http://localhost:3000

```

## Cómo ejecutar el proyecto localmente
```bash
1. Verificar que la instancia de base de datos este corriendo
2. Ejecutar primero el backend entrando al ambiente virtual en uv usando .venv\Scripts\activate
3. Empezar la ejecucion del programa de backend con el comando uv run app/main.py
4. Ir al repositorio frontend y correr pnpm run dev para poder empezar el proyecto en local, y ya estaria completo el programa.
```

## Cómo ejecutar las pruebas

```bash
# No se cuenta con pruebas.
```

## Estructura de ramas / flujo de trabajo Git

El proyecto usa un flujo simplificado de dos ramas fijas, adecuado para un equipo pequeño de dos personas:

| Rama | Propósito |
|---|---|
| `main` | Código en producción. Solo recibe cambios cuando hay un pase a producción validado. |
| `dev` | Rama de desarrollo activo. Frontend y backend integran sus cambios aquí directamente. |

El desarrollo del frontend y del backend se realiza directamente sobre `dev` sin crear ramas por feature. Cuando el equipo considera que `dev` está estable y probado, se hace merge a `main` y se ejecuta el proceso de despliegue.

```bash
# Flujo típico para subir cambios a producción
git checkout dev
git pull origin dev          # asegurarse de tener lo último

# validar en staging...

git checkout main
git merge dev
git push origin main         # esto detona el pase a producción manual
```

# 13. Registro de Decisiones

Documenta las decisiones de arquitectura importantes: qué se decidió, por qué y qué alternativas se descartaron. Esto previene que el equipo repita discusiones ya resueltas.

| # | Decisión | Contexto / Problema | Alternativas consideradas | Justificación |
|---|---|---|---|---|
| 1 | Usar SQL Server como base de datos | Elegir la base de datos adecuada | MySQL, PostgreSQL | Es la unica aprobada por la empresa. |
| 2 | Elegir un framework de frontend | Hay muchas tecnologias diferentes de frontend | NextJS, Angular | Se eligió Tanstack Start porque es un framework completo que se puede acoplar muy facil con react. |
| 3 | Elegir un lenguaje de programación backend | Los integrantes solo sabian python y golang al momento de inicial el proyecto | Java, .Net | Se eligió python por la velocidad de desarrollo y simpleza. |

---

Plantilla basada en el Software Guidebook de Simon Brown — *"Visualise, Document and Explore your Software Architecture"* (Part II: Document).
````