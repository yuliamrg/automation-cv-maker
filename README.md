# Automation CV Maker

Sistema de creacion de hojas de vida modulares.

Repositorio para generar versiones del CV en español e inglés usando Markdown, Pandoc y una plantilla HTML. El objetivo es mantener el contenido organizado por secciones y roles para adaptar cada hoja de vida a una vacante sin duplicar información.

## Cómo funciona

Cada CV se construye a partir de tres archivos:

1. `sections/<lang>/header.md`
2. `roles/<lang>/<role>.md`
3. `sections/<lang>/footer_<role>.md` si existe; si no, `sections/<lang>/footer.md`

Los scripts ensamblan esos archivos con `template_cv.html` y generan una salida HTML en `build/`.
Si `build/` o `exports/` no existen, los scripts los crean automáticamente.

## Flujo de trabajo de CV

El repositorio trabaja con tres niveles de contenido:

1. **CV base general:** define identidad profesional, datos compartidos, plantilla visual y reglas editoriales. Vive principalmente en `sections/`, `template_cv.html`, `README.md`, `CHECKLIST.md` y `docs/cv_design_content_guide.md`.
2. **CV base por perfil:** adapta la narrativa a una familia de cargos. Ejemplos: `data_analytics`, `coordinador_compras`, `coordinador_servicios`. Estas bases viven en `roles/<lang>/` y no deben responder a una sola oferta, sino al tipo de oportunidad.
3. **CV final por oferta:** parte de la CV base por perfil mas cercana y se ajusta con palabras clave, logros y requisitos de una vacante especifica. El resultado final se genera en `build/` y luego se exporta a `exports/`.

Regla practica: no se edita desde cero para cada vacante. Primero se mantiene una base general, luego bases por perfil, y finalmente se crea una version adaptada a la oferta.

## Estructura del proyecto

```text
.
├── roles/
│   ├── es/
│   └── en/
├── sections/
│   ├── es/
│   └── en/
├── images/
├── offers/
├── docs/
│   └── legacy/
├── build/
├── exports/
├── template_cv.html
├── build_cv.sh
├── build_cv.ps1
├── README.md
└── AGENTS.md
```

## Requisitos

- `pandoc`
- Google Chrome o Chromium para revisar el HTML y exportar a PDF

Verificación rápida:

```bash
pandoc --version
```

## Uso

### Linux / macOS

```bash
chmod +x build_cv.sh
./build_cv.sh data_analytics
./build_cv.sh data_analytics en
./build_cv.sh data_analytics 2026-05-23_data_analytics_yuliam_rivera es
```

### Windows PowerShell

```powershell
.\build_cv.ps1 -Role data_analytics -Lang es
.\build_cv.ps1 -Role data_analytics -Lang en
.\build_cv.ps1 -Role data_analytics -Output 2026-05-23_data_analytics_yuliam_rivera -Lang es
```

Si no se indica `Output`, los scripts generan automaticamente el nombre con esta estructura:

```text
yyyy-mm-dd_perfil_yuliam_rivera
```

Ejemplo:

```text
2026-05-23_coordinador_servicios_yuliam_rivera.html
2026-05-23_data_analytics_en_yuliam_rivera.html
```

El mismo valor se envia como metadata `title` a Pandoc. La plantilla lo usa en la etiqueta `<title>`, por lo que Chrome/Chromium normalmente lo toma como nombre sugerido al imprimir o guardar como PDF.

## Foto de perfil y footer variable

La plantilla maneja la foto de perfil por idioma:

- `es`: incluye foto por defecto, pensando en aplicaciones locales o tradicionales en Colombia/Latinoamerica.
- `en`: omite foto por defecto, pensando en versiones internacionales, remotas o mas cercanas a tecnologia.

El footer puede variar por perfil. Los scripts buscan primero:

```text
sections/<lang>/footer_<role>.md
```

Si ese archivo no existe, usan:

```text
sections/<lang>/footer.md
```

Esto permite que `data_analytics` use solo idiomas, mientras perfiles de coordinacion pueden incluir `OTROS DATOS` como disponibilidad, licencias y vehiculo.

## Flujo recomendado

1. Guardar la oferta en `offers/` si se quiere conservar como referencia.
2. Elegir la CV base por perfil mas cercana en `roles/<lang>/`.
3. Crear o ajustar una variante para la oferta especifica, usando la guia `docs/cv_design_content_guide.md`.
4. Revisar si el footer del perfil debe incluir `OTROS DATOS` mediante `sections/<lang>/footer_<role>.md`.
5. Validar el contenido con `CHECKLIST.md`.
6. Ejecutar el script correspondiente.
7. Revisar el HTML generado en `build/`.
8. Exportar la versión final a PDF y guardarla en `exports/`.

## Enfoque editorial y visual

El CV esta optimizado para presentar un perfil mixto: analitica de datos junior aplicada a operaciones, planeacion, compras, mantenimiento y control de costos en entornos exigentes. La guia principal esta en `docs/cv_design_content_guide.md`.

Principios clave:

- escribir logros, no listas extensas de responsabilidades;
- usar metricas cuando existan;
- mantener perfiles y bullets breves para mejorar legibilidad;
- agrupar habilidades por categoria;
- priorizar claridad visual sobre comprimir texto en una pagina.

## Convenciones

- Usar `snake_case` para nombres de roles, por ejemplo `coordinador_compras.md`.
- Usar nombres de salida con la estructura `yyyy-mm-dd_perfil_nombre_apellido`, por ejemplo `2026-05-23_data_analytics_yuliam_rivera`.
- Mantener `header.md` y `footer.md` como contenido compartido por idioma.
- Usar `footer_<role>.md` cuando una seccion final deba cambiar segun el perfil.
- Guardar versiones activas solo en `roles/<lang>/`; los borradores fuera de esa estructura no forman parte del flujo de build.
- No editar manualmente archivos dentro de `build/`.
- Los archivos en `docs/legacy/` son referencias históricas y no forman parte del flujo actual.

## Archivos ignorados por Git

El repositorio versiona fuentes Markdown, scripts, plantilla y documentacion. No versiona artefactos generados ni insumos privados:

- `build/`: HTML generado por Pandoc.
- `exports/`: PDFs y entregables finales exportados.
- `adds/`: adjuntos, capturas, CVs descargados o referencias personales.
- `offers/*`: archivos de ofertas guardadas localmente; se conserva solo `offers/.gitkeep`.
- `roles/*.md`: borradores historicos ubicados directamente en `roles/`.
- `.playwright-cli/`, logs, temporales y ruido del sistema operativo.

## Notas

- No hay pruebas automatizadas; la validación es manual revisando la salida HTML y PDF.
- La plantilla actual está optimizada para CV de una página en formato A4; al exportar desde Chrome/Chromium, conservar fondos gráficos para mantener la barra lateral y acentos visuales.
- Si en el futuro se agregan dependencias JavaScript, usar `pnpm` por defecto.
