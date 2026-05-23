# Checklist de Revision de CV

Reglas para validar contenido de plantillas antes de generar versiones finales.

---

## 1. Enfoque del Rol

- [ ] El CV responde a una vacante o familia de vacantes concreta
- [ ] El posicionamiento mezcla datos, operacion, costos y gestion cuando aplique
- [ ] La primera lectura deja claro el rol objetivo
- [ ] No se mezclan demasiados objetivos laborales en una misma version
- [ ] La version final parte de una CV base por perfil y no de una edicion desde cero

---

## 2. Perfil Profesional

- [ ] Longitud: 45-65 palabras maximo
- [ ] Incluir al menos 1 resultado cuantificable
- [ ] Estado claro de transición de carrera (si aplica)
- [ ] Mencionar herramientas/tecnologías clave
- [ ] Indicar tipo de rol buscado y modalidad
- [ ] Evitar frases genericas como "responsable, proactivo, trabajo en equipo" sin evidencia

---

## 3. Experiencia Profesional

- [ ] Cada bullet sigue formato: acción + resultado medible
- [ ] Incluir números/porcentajes cuando sea posible
- [ ] Evitar bullets genéricas ("responsabilidades varias")
- [ ] Resaltar logros, no solo tareas
- [ ] Experiencia anterior relevante condensada si es muy extensa
- [ ] Experiencia principal con maximo 5 bullets
- [ ] Experiencia anterior con maximo 3 bullets
- [ ] Cada bullet ocupa idealmente 1 o 2 lineas en PDF

---

## 4. Habilidades Tecnicas

- [ ] Sin duplicados (ej: no repetir Excel en dos secciones)
- [ ] Agrupadas por categoría (ej: Análisis, Lenguajes, Herramientas)
- [ ] Nivel de proficiency indicado cuando aplica (básico, intermedio, avanzado)
- [ ] Solo habilidades realmente usadas en proyectos/empleo
- [ ] Habilidades escritas como grupos compactos, no lista plana extensa

---

## 5. Legibilidad y Diseno

- [ ] El CV se puede escanear en 8-10 segundos
- [ ] No hay bloques de texto largos sin pausa visual
- [ ] La fuente del cuerpo se siente legible en PDF A4
- [ ] Las secciones tienen suficiente aire entre ellas
- [ ] Si el CV se desborda, se recorta texto antes de reducir demasiado la fuente
- [ ] Versiones en ingles/internacionales salen sin foto por defecto

---

## 6. ATS Compatibility

- [ ] NO crear sección de palabras clave o keywords ATS
- [ ] Keywords implícitas e integradas naturalmente en perfil, experiencia y habilidades
- [ ] Links como texto (no imágenes)
- [ ] Formato simple (evitar tablas complejas o elementos que ATS no lea)

---

## 7. Consistencia con Plantilla

- [ ] Header usa estructura de `sections/<lang>/header.md`
- [ ] Footer usa `sections/<lang>/footer_<role>.md` cuando el perfil necesita cierre variable
- [ ] Si no hay footer especifico, usa `sections/<lang>/footer.md`
- [ ] Separadores: usar `---` para divisores de sección
- [ ] Encabezados: `##` para secciones, `###` para subsecciones

---

## 8. Formato y Estilo

- [ ] Español: tildes correctas, puntuación profesional
- [ ] Mayúsculas solo en encabezados y nombres propios
- [ ] Información de contacto completa y actualizada
- [ ] Foto de perfil referenciada en `images/`
- [ ] Nombre de salida con formato `yyyy-mm-dd_perfil_nombre_apellido`
- [ ] El `<title>` del HTML coincide con el nombre de salida esperado para PDF
- [ ] `OTROS DATOS` solo aparece cuando aporta al perfil o a la oferta

---

## Ejemplo de Perfil que Cumple

> **Incorrecto:** "Profesional con experiencia en análisis de datos. Keywords: Excel, Python, SQL, KPIs."

> **Correcto:** "Analista de datos con experiencia en Python y SQL. Desarrollé dashboards en Looker Studio que redujeron tiempo de reporte en 50%. Busco rol de Jr. en empresa de retail."

---

## Uso

```bash
# Revisión manual
# 1. Abrir archivo roles/<lang>/<rol>.md
# 2. Verificar cada regla del checklist
# 3. Corregir antes de ejecutar ./build_cv.sh
```

Reglas actualizadas: Marzo 2026
