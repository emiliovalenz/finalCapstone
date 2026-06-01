# finalCapstone


# Software Guidebook — Plantilla de Documentación

**Nombre del sistema:** ________________________________  

**Equipo / Integrantes:** ________________________________  

**Fecha:** ________________________________  

**Versión del documento:** ________________________________  

---

# 1. Contexto

Esta sección establece el escenario general. Debe responder: ¿qué es el sistema? ¿por qué existe? ¿quién lo usa? ¿cómo encaja en su entorno? Una página o dos es suficiente; un diagrama de contexto (C4 Level 1) es altamente recomendado.

## ¿Qué es y para qué sirve este sistema?
Escribe aquí una descripción breve del sistema.

## ¿Cómo encaja en el entorno existente?
Describe los sistemas externos, procesos de negocio o plataformas con las que interactúa.

## ¿Quiénes son los usuarios?

| Rol / Actor | Descripción |
|---|---|
| Ej. Usuario final | ... |
| Ej. Administrador | ... |

## Diagrama de Contexto
Inserta aquí un diagrama C4 de Contexto (Level 1) o un esquema equivalente.

```text
[ Diagrama aquí ]
```

---

# 2. Vista Funcional

Resume las funcionalidades clave del sistema. No es un manual de usuario; es un mapa de lo que hace el sistema y qué funcionalidades son arquitectónicamente significativas.

## ¿Qué hace el sistema?
Describe brevemente el propósito funcional del sistema.

## Funcionalidades principales

| # | Funcionalidad | ¿Arquitectónicamente significativa? | ¿Por qué? |
|---|---|---|---|
| 1 | ... | Sí / No | ... |
| 2 | ... | Sí / No | ... |
| 3 | ... | Sí / No | ... |

## Usuarios y sus necesidades

| Rol | Necesidad principal que cubre el sistema |
|---|---|
| ... | ... |

## Diagrama de flujo / casos de uso (opcional si aplica)

Un diagrama de casos de uso UML, wireframe o diagrama de flujo de actividad puede ir aquí.

```text
[ Diagrama aquí ]
```

---

# 3. Atributos de Calidad

Lista los requisitos no funcionales con valores precisos y medibles. Evita términos vagos como "rápido" o "escalable"; usa métricas concretas.

| Atributo | Descripción | Métrica / Criterio de aceptación |
|---|---|---|
| Rendimiento | ... | Ej. < 200 ms de latencia en el 95% de las peticiones |
| Escalabilidad | ... | Ej. Soportar hasta 10,000 usuarios concurrentes |
| Disponibilidad | ... | Ej. 99.9% uptime mensual |
| Seguridad | ... | Ej. Autenticación OAuth 2.0, cifrado TLS 1.3 |
| Mantenibilidad | ... | ... |
| Otro | ... | ... |

> **Nota:** Indica explícitamente qué atributos están fuera de alcance si aplica (ej. "Soporte multilingüe no está contemplado en esta versión").

---

# 4. Restricciones

Documenta las restricciones impuestas al proyecto: tecnológicas, organizacionales, presupuestarias, legales, etc. Las restricciones reducen opciones de diseño y deben quedar explícitas.

| Tipo | Restricción | Impacto en la arquitectura |
|---|---|---|
| Tecnológica | Ej. Solo se pueden usar tecnologías open source | ... |
| Presupuesto / Tiempo | ... | ... |
| Plataforma de despliegue | ... | ... |
| Equipo | Ej. Equipo de 4 personas, conocimiento en Java | ... |
| Legal / Regulatoria | ... | ... |
| Otra | ... | ... |

---

# 5. Principios de Diseño

Enumera los principios que guían las decisiones de arquitectura y desarrollo. Deben ser conocidos y compartidos por todo el equipo.

| # | Principio | Descripción / Justificación |
|---|---|---|
| 1 | Ej. Alta cohesión, bajo acoplamiento | ... |
| 2 | Ej. No lógica de negocio en la capa de presentación | ... |
| 3 | Ej. DRY (Don't Repeat Yourself) | ... |
| 4 | Ej. Usar inyección de dependencias | ... |
| 5 | ... | ... |

---

# 6. Arquitectura de Software

Vista del cuadro del sistema. Descripción de la estructura de contenedores y componentes principales con diagramas C4 Nivel 2 y 3.

## Descripción general

El sistema eCatalog Collins está compuesto por tres contenedores principales que interactúan entre sí en una arquitectura de tres capas. El front-end es una Single Page Application construida con React sobre el framework TanStack Start. Toda la comunicación con el servidor ocurre a través de peticiones HTTP mediante la librería Axios con la URL base leída de una variable de entorno.
El back-end es una API REST construida con FastAPI de Python, servida por Uvicorn. Expone dos grupos de endpoints, siendo el /parts para consulta y filtrado del catálogo, y /auth para autenticación de usuarios, aunque este último solo es una medida temporal en lo que se implementa la verdadera autenticación por parte de un servicio interno de Collins que implementarán cuando se les entregue el proyecto. El middleware de CORS está configurado en la capa de entrada para controlar los orígenes permitidos. Toda la lógica de acceso a datos se realiza con consultas SQL directas.
La base de datos es una instancia de Microsoft SQL Server alojada en un servidor dedicado de la empresa. Almacena la información central del catálogo, con tablas como Parts, Materials, Lengths, y las tablas de relación Parts_Materials y Parts_Lengths. El back-end se conecta a ella mediante ODBC Driver 18 for SQL Server, usando credenciales y parámetros configurados por variables de entorno.
El módulo de autenticación existe en el código pero como se menciono, actualmente solo es un mock, en producción será reemplazado por el servicio de identidad corporativo de Collins, que se integrará con el endpoint /auth existente de la API.

## Diagrama de Contenedores (C4 Level 2)

Muestra los contenedores (aplicaciones, bases de datos, servicios) y sus interacciones.

![Diagrama C2](Img_Codigo/C2Contenedores-dark.png)

## Diagrama de Componentes (C4 Level 3) — opcional

![Diagrama C3 - API REST](Img_Codigo/C3Componentes_API-dark.png)

## Resumen de contenedores / componentes principales

| Contenedor / Componente | Tecnología | Responsabilidad |
|---|---|---|
| Front-end React | React 19 + TypeScript + TanStack Router + Vite | Interfaz de usuario, con navegación por categorías, grilla de piezas con filtros y vista de detalle |
| API REST | Python + FastAPI + Uvicorn | Punto de entrada de toda la lógica de negocio, se registran routers y configura CORS |
| CORS Middleware | FastAPI  | Controla qué orígenes pueden consumir la API |
| Parts Router (/parts) | Parts Router (/parts) | Endpoints GET /all, GET /filter, GET /{part_id} para consultar el catálogo |
| Auth Router (/auth) | FastAPI APIRouter | Endpoint de test de BD y autenticación |
| Database Access | pyodbc + ODBC Driver 18 | Construye cadena de conexión desde env vars, abre y cierra conexiones SQL Server |
| Schemas Pydantic | Pydantic v2 | Validación y serialización de respuestas con PartSchema, MaterialSchema, LengthSchema, FilterResponseSchema |
| Base de Datos | Microsoft SQL Server | Almacena Parts, Materials, Lengths, Parts_Materials, Parts_Lengths, usuarios |

---

# 7. Código

Explicación de aspectos de implementación más importantes, complejos o no obvios. 
## Aspectos relevantes de implementación

Para cada aspecto importante, incluye una breve descripción y, si ayuda, un diagrama de clases o de secuencia simplificado.

### 7.1 Acceso a datos en el back-end
El back-end no usa ORM. Cada endpoint abre su propia conexión, ejecuta SQL crudo y la cierra al terminar. La función get_connection() en app/db/database.py construye la cadena de conexión ODBC leyendo variables de entorno (DB_SERVER, DB_NAME, DB_USER, DB_PASSWORD, etc.), lo que permite cambiar el servidor de base de datos sin tocar código.
Hay un detalle importante en GET /parts/filter, donde la query SQL se construye dinámicamente con WHERE 1=1 e ifs que agregan cláusulas según los filtros recibidos. Los valores van siempre como parámetros posicionales para evitar inyección SQL; nunca se interpolan directamente en el string de la query.

### 7.2 Carga de datos
El proyecto usa dos patrones distintos para obtener datos de la API dependiendo de la necesidad. 
Loader (datos estáticos por ruta) — usado en la página de detalle de pieza. TanStack Router ejecuta la función loader antes de renderizar el componente, hace GET /parts/{partId} y valida que la pieza pertenezca a la categoría del URL. Si la pieza no existe o no corresponde, lanza notFound() automáticamente. El componente recibe los datos ya listos mediante Route.useLoaderData(), sin estados de carga ni efectos.
useEffect (datos reactivos a filtros) — usado en la página de catálogo por categoría. Los filtros como material, longitud o sistema de medición son estados local de React. Cada vez que el usuario cambia un filtro, el useEffect se dispara y hace GET /parts/filter con los parámetros actuales. Este patrón maneja explícitamente los estados loading y error.

### 7.3 Sistema de autenticación en modo mock
Aunque ya ha sido mencionado, es bueno saber que el tema de la autenticación no es la final que se querrá implementar en Collins, es por eso que se tomó la consideración de que en src/lib/auth-api.ts existe la bandera const isMock = true. Cuando está activa, las funciones login, signup y getMe nunca hacen peticiones HTTP; en su lugar generan un usuario ficticio en memoria y lo persisten en localStorage. Cuando se integre el servicio corporativo de Collins, el único cambio necesario es poner isMock = false y asegurarse de que el backend exponga los endpoints POST /auth/login, POST /auth/signup y GET /auth/me con el contrato que ya espera el cliente. El estado de sesión vive en AuthContext y se inicializa desde localStorage al montar la app para que el usuario no pierda la sesión al refrescar la página.

---

# 8. Datos

Documentación sobre los datos del sistema: modelo, almacenamiento, propietarios, retención y respaldo.

## Modelo de datos (resumen)

Diagrama de Entidad-Relación para la Base de Datos de Catalogo de Piezas de Collins

![Diagrama Entidad-Relacion Collins](Img_Codigo/Diagrama%20Entidad-Relacion%20Collins.png)

El diagrama muestra en general el comportamiento de las entidades de datos, siendo la sección principal lo de las partes con todos sus tipos de datos requeridos para cada pieza. Adicionalmente se encuentran tablas de relación, que permiten relacionar a las piezas con multiples tipos de materiales y tamaños de las mismas. Fuera de estas puede sentirse extraña la sección de usuarios al estar separada de lo demás, pero esta parte es principalmente una conveniencia de pruebas para nosotros, ya que después de que entregmos el proyecto el propio equipo de Collins serán los responsables de integrar su sistema de usuarios a la página.


## Preguntas clave sobre los datos

| Pregunta | Respuesta |
|---|---|
| ¿Dónde se almacenan los datos? | Los datos van a ser almacenados en un servidor dentro de la empresa en SQL con los datos esenciales de las piezas, aunque algunos datos serán sacados de fuera de este servidor, como los la autenticación de usuarios y los PDFs de las piezas que no sean internas. |
| ¿Quién es propietario de los datos? | A nivel general los propietarios de los datos son el propio Collins ya que los datos estarán almacenados en sus servidores. Aunque a nivel particular sería el administrador del servidaor, siendo en este caso Erick Estrada. |
| ¿Cuánto almacenamiento se requiere? | Ya que no se van a almacenar PDFs dentro de la base de datos, no es necesario demasiado por parte de Collins y se tiene previsto unos cuantos GBs, aproximadamente siendo unos 40. |
| ¿Estrategia de respaldo? | A nivel empresa normalmente respaldan los datos de sus bases de datos de SQL en .bak todos los días automáticamente, por lo que no sería muy diferente con este mismo proyecto para dichos respaldos. Para el lado de la Aplicación como tal se estaría subiendo a Azure para su control de versiones. |
| ¿Requisitos de archivado o retención? | Ya que la propia naturaleza de nuestro proyecto es el de ser un catalogo con las piezas de la empresa, estas se mantendrán dentro del catalogo por periodos indefinidos, pues siempre se utilizarán las mismas piezas para los diseños, y en caso de actualizar una para sistutuir un modelo antiguo, este mismo se convertira en un modelo Legacy y se seguirá manteniendo en el catalogo. |
| ¿Se usan archivos planos? ¿En qué formato? | No, todos los datos van a ser almacenados en la base de datos o serán sacados de otros lados como los PDFs de links de otras páginas. |

---

# 9. Arquitectura de Infraestructura

Descripción del hardware (físico o virtual) y la red sobre la que correrá el software.

## Diagrama de infraestructura / red

![Diagrama Red Collins](Img_Codigo/Diagrama%20Red%20Collins.png)

## Descripción de componentes de infraestructura

| Componente | Tipo | Descripción / Propósito |
|---|---|---|
|Equipo de Ingeniero | Cliente (navegador) | Dispositivo desde el cual el usuario accede al catálogo por un navegador web, no requieriendo instalación adicional. |
| Windows Server | Servidor físico — Windows Server | Aloja los archivos del build de React del front-end y actúa como reverse proxy hacia la API de FastAPI que corre en el mismo servidor bajo Uvicorn. |
| API FastAPI| Proceso en Servidor Windows | Proceso Python que expone los endpoints REST del catálogo. Incluye el middleware de CORS para permitir las peticiones del front-end. Se comunica con la BD vía ODBC Driver 18 for SQL Server. |
|Servidor de Base de Datos| Servidor físico dedicado — Red interna de Collins | Máquina dedicada de la empresa que aloja la instancia de Microsoft SQL Server con la base de datos eCatalogCollins. Solo accesible dentro de la red interna corporativa. |
| Middleware CORS| Componente lógico (FastAPI) | Configurado en la API para controlar qué orígenes pueden consumir los endpoints.  |
| Servicio de Autenticación | Externo a cargo de Collins | El módulo de usuarios fue desarrollado pero la gestión de identidades en producción será responsabilidad del equipo de TI de Collins, quien lo integrará con su directorio corporativo existente. |

## Consideraciones de alta disponibilidad

La página se planea dejar en manos de los ingenieros de Collins para su implementación con las regulaciones usuales que tegan en mente para este tipo de proyectos, pero antes de entregarlo tenemos el dato de que la propia Collins mantendrá un backup diario de todos los datos que se vayan registrando de la base. Esto no garantiza un recovery completo, pero por la propia naturaleza de la página, la cual esta destinada a ser un lugar de consulta, no es necesario un recovery exhaustivo de datos ya que poco o nada cambiara constantemenete en los datos de las piezas.

---

# 10. Despliegue

Documenta el mapeo entre los contenedores de software y la infraestructura. ¿Dónde corre cada pieza del sistema?

## Estrategia de despliegue

Describe cómo y dónde se despliega el sistema (ej. contenedores Docker en AWS ECS, despliegue manual en VPS, etc.).

## Mapeo software → infraestructura

| Contenedor / Componente | Se despliega en | Configuración (activo/pasivo, réplicas, etc.) |
|---|---|---|
| ... | ... | ... |
| ... | ... | ... |

## Estrategia de rollback

¿Cómo se revierte un despliegue fallido?

---

# 11. Operación y Soporte

Explica cómo se monitorea, administra y mantiene el sistema en producción.

| Aspecto | Descripción |
|---|---|
| Monitoreo | ¿Qué herramientas se usan? ¿Qué métricas se observan? |
| Logs / Auditoría | ¿Dónde se almacenan? ¿Qué se registra? |
| Alertas | ¿Bajo qué condiciones se generan alertas? |
| Tareas de mantenimiento | ¿Hay tareas manuales periódicas? |
| Cambios de configuración | ¿Requieren reinicio? ¿Cómo se gestionan? |

---

# 12. Entorno de Desarrollo

Proporciona toda la información práctica que un desarrollador nuevo necesita para comenzar a trabajar.

## Requisitos previos

| Herramienta | Versión requerida | Notas |
|---|---|---|
| Ej. Node.js | >= 20.x | ... |
| Ej. Docker | >= 24.x | ... |
| ... | ... | ... |

## Cómo clonar y configurar el proyecto

```bash
# Ejemplo:
git clone https://github.com/tu-org/tu-repo.git
cd tu-repo

# Pasos de configuración...
```

## Cómo ejecutar el proyecto localmente

```bash
# Comando(s) para levantar el sistema en desarrollo
```

## Cómo ejecutar las pruebas

```bash
# Comando(s) para ejecutar el suite de pruebas
```

## Estructura de ramas / flujo de trabajo Git

Describe brevemente el flujo (ej. Gitflow, trunk-based development, etc.).

---

# 13. Registro de Decisiones

Documenta las decisiones de arquitectura importantes: qué se decidió, por qué y qué alternativas se descartaron. Esto previene que el equipo repita discusiones ya resueltas.

| # | Decisión | Contexto / Problema | Alternativas consideradas | Justificación |
|---|---|---|---|---|
| 1 | Ej. Usar PostgreSQL como base de datos | ... | MySQL, MongoDB | ... |
| 2 | ... | ... | ... | ... |
| 3 | ... | ... | ... | ... |

---

Plantilla basada en el Software Guidebook de Simon Brown — *"Visualise, Document and Explore your Software Architecture"* (Part II: Document).
````
