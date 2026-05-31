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
