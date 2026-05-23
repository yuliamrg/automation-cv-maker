# Plan Maestro: Evolucion Incremental de Automation CV Maker

## Objetivo

Mejorar el sistema actual basado en `Markdown + Pandoc + template HTML` sin migrar todavia a RenderCV. El foco es ganar consistencia, validacion automatica, exportacion reproducible y mejor trazabilidad del trabajo.

## Estado Global

- Estado actual: `En progreso`
- Enfoque: `Incremental`
- Documento de seguimiento: `docs/roadmap_cv.md`
- Ultima actualizacion: `2026-05-23`

## Decisiones Fijadas

- Se mantiene `Pandoc` como motor principal en esta fase.
- No se planifica una migracion completa a RenderCV en este roadmap.
- La validacion debe ejecutarse antes del build por defecto.
- El `HTML` sigue siendo el artefacto intermedio principal.
- La exportacion automatica a `PDF` se agrega como mejora del flujo actual.
- El documento de seguimiento usara formato tipo kanban simple.

## Kanban

### Backlog

- [ ] Etapa 1: Ordenar la fuente activa del repositorio
- [ ] Etapa 2: Anadir validacion automatica previa al build
- [ ] Etapa 3: Automatizar la salida final a PDF
- [ ] Etapa 4: Introducir estructura de datos mas fuerte sin migrar de motor
- [ ] Etapa 5: Mejorar trazabilidad operativa

### En Progreso

- [ ] Sin items activos

### Hecho

- [x] Corregir scripts para crear `build/` y fallar correctamente si `pandoc` falla
- [x] Crear la carpeta `offers/`
- [x] Actualizar el checklist para eliminar la seccion explicita de keywords ATS
- [x] Definir enfoque narrativo para CV de analitica operativa, compras y mantenimiento
- [x] Mejorar guia editorial, densidad de contenido y legibilidad visual del CV
- [x] Configurar foto y footer variable por idioma/perfil

## Etapas

### Etapa 1: Ordenar la fuente activa del repositorio

**Estado:** `No iniciado`

**Objetivo**

Dejar completamente claro que archivos participan en el flujo actual y cuales son referencia, borrador o historico.

**Entregables**

- Reglas claras para `roles/<lang>/`, `sections/<lang>/`, `offers/`, `exports/` y `docs/legacy/`
- Reclasificacion de borradores sueltos fuera del flujo activo
- Convenciones de nombres para ofertas y exportaciones finales

**Checklist**

- [ ] Identificar todos los archivos de `roles/` que no pertenecen a `roles/es` o `roles/en`
- [ ] Definir destino final para borradores historicos
- [ ] Mover o reclasificar borradores sin dejar ambiguedad operativa
- [ ] Alinear documentacion si el arbol real cambia
- [ ] Confirmar que solo `roles/<lang>/` se usa como fuente activa

**Criterios de aceptacion**

- No quedan archivos activos mezclados fuera de `roles/es` y `roles/en`
- Todo borrador o historico queda identificado explicitamente
- La estructura del repo coincide con la documentacion

**Dependencias**

- Ninguna

### Etapa 2: Anadir validacion automatica previa al build

**Estado:** `No iniciado`

**Objetivo**

Pasar de checklist manual a validacion ejecutable antes de generar HTML o PDF.

**Entregables**

- Validador reutilizable invocable desde PowerShell y Bash
- Modo `validate only`
- Mensajes de error legibles para corregir roles rapidamente

**Checklist**

- [ ] Definir reglas minimas validables automaticamente
- [ ] Validar secciones requeridas
- [ ] Validar longitud del perfil profesional
- [ ] Detectar seccion explicita de keywords ATS
- [ ] Detectar duplicados en habilidades
- [ ] Revisar presencia de metricas en experiencia cuando aplique
- [ ] Integrar validacion por defecto en ambos scripts

**Criterios de aceptacion**

- Un rol invalido falla antes de llamar a `pandoc`
- Los errores indican el problema concreto
- Un rol valido puede pasar de validacion a build sin pasos extra

**Dependencias**

- Etapa 1 recomendada para reducir ambiguedad en fuentes

### Etapa 3: Automatizar la salida final a PDF

**Estado:** `No iniciado`

**Objetivo**

Eliminar la dependencia del paso manual de exportacion desde navegador para el flujo estandar.

**Entregables**

- Soporte de generacion automatica de PDF
- `HTML` en `build/` y `PDF` en `exports/`
- Error explicito si el motor de PDF no esta disponible

**Checklist**

- [ ] Evaluar mecanismo local no interactivo para generar PDF
- [ ] Integrar generacion de PDF en PowerShell
- [ ] Integrar generacion de PDF en Bash
- [ ] Mantener HTML como salida intermedia obligatoria
- [ ] Documentar prerequisitos reales del flujo de PDF

**Criterios de aceptacion**

- Se puede generar PDF sin intervencion manual
- El PDF queda en `exports/`
- El script no reporta exito si falta el motor de PDF

**Dependencias**

- Etapa 2 para asegurar calidad minima antes de exportar

### Etapa 4: Introducir estructura de datos mas fuerte sin migrar de motor

**Estado:** `No iniciado`

**Objetivo**

Reducir inconsistencias entre roles e idiomas manteniendo Pandoc como motor principal.

**Entregables**

- Plantilla base estructurada para nuevos roles
- Metadata minima por rol
- Base mas facil de validar y comparar

**Checklist**

- [ ] Definir campos obligatorios por rol
- [ ] Definir metadata minima: idioma, rol, version, estado, ultima actualizacion
- [ ] Crear plantilla base en espanol
- [ ] Crear plantilla base en ingles
- [ ] Alinear la validacion con la nueva estructura

**Criterios de aceptacion**

- Crear un nuevo rol requiere menos decisiones manuales
- El validador puede revisar la estructura con menor ambiguedad
- El contenido `es` y `en` se puede comparar mas facilmente

**Dependencias**

- Etapa 2

### Etapa 5: Mejorar trazabilidad operativa

**Estado:** `No iniciado`

**Objetivo**

Poder consultar rapidamente que se hizo, que falta y que decisiones quedaron tomadas.

**Entregables**

- Este documento como tablero vivo de seguimiento
- Bitacora de avances por fecha
- Registro breve de riesgos y bloqueos

**Checklist**

- [ ] Mantener actualizado el estado global
- [ ] Mover etapas entre Backlog, En Progreso y Hecho
- [ ] Registrar avances relevantes en la bitacora
- [ ] Registrar bloqueos reales cuando aparezcan
- [ ] Mantener proximos pasos concretos y cortos

**Criterios de aceptacion**

- Un lector puede abrir un solo archivo y entender el estado del proyecto
- El contexto no depende del chat
- Las decisiones tecnicas principales quedan visibles

**Dependencias**

- Ninguna

## Riesgos y Bloqueos

- La exportacion automatica a PDF depende de una herramienta local estable y disponible en ambos entornos.
- Los borradores historicos en `roles/` pueden seguir generando confusion si no se reclasifican.
- La validacion automatica puede requerir ajustar algunos roles actuales antes de activarse por defecto.

## Proximos Pasos Inmediatos

- [ ] Revisar visualmente los HTML generados con la nueva plantilla
- [ ] Definir si se mantiene una variante con foto y otra sin foto
- [ ] Ejecutar la Etapa 1 para ordenar borradores fuera de `roles/es` y `roles/en`
- [ ] Diseñar las reglas minimas del validador para la Etapa 2

## Bitacora de Avances

### 2026-03-29

- Se comparo el repo actual con el workspace `rendercv`.
- Se definio un enfoque incremental en lugar de migracion completa.
- Se priorizaron cinco etapas: orden del repo, validacion, PDF, estructura de datos y trazabilidad.
- Se crea este documento como fuente viva de estado y avances.

### 2026-05-23

- Se agrego una guia editorial y visual para reducir densidad y mejorar lectura.
- Se decide priorizar contenido ejecutivo, medible y alineado con analitica operativa.
- Se actualiza el checklist para incluir enfoque del rol, legibilidad y limites de bullets.
- Se define que las versiones en ingles/internacionales salen sin foto por defecto.
- Se agrega soporte para footers por perfil, permitiendo omitir `OTROS DATOS` en datos y mantenerlos en coordinacion.
