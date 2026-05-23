# Guia editorial y de diseno para CV

Esta guia define el enfoque base para construir versiones del CV de Yuliam Rivera. El objetivo es que cada version se vea clara, ejecutiva y orientada al nicho correcto, sin depender solo de ajustes visuales para corregir exceso de texto.

## Posicionamiento principal

El CV debe presentar un perfil mixto:

- analitica de datos junior aplicada a operaciones;
- planeacion, compras, mantenimiento y control de costos;
- experiencia real en entorno hospitalario y equipos criticos;
- capacidad para traducir datos operativos en decisiones para areas tecnicas, administrativas y financieras.

La narrativa debe evitar sonar como un CV puramente tecnico de mantenimiento o como un perfil de datos sin experiencia operativa. La ventaja competitiva es la combinacion de campo, gestion y analisis.

## Principios de escritura

- Priorizar logros sobre responsabilidades.
- Usar bullets con estructura: accion + herramienta/contexto + resultado.
- Incluir metricas cuando existan: horas reducidas, fuentes integradas, ahorro, disponibilidad, cumplimiento, volumen de compras o numero de proveedores.
- Mantener el perfil profesional entre 45 y 65 palabras.
- Limitar la experiencia principal a 4 o 5 bullets.
- Limitar experiencia anterior a 2 o 3 bullets enfocados en transferencia de valor.
- Evitar listas largas de tareas sin impacto visible.
- Integrar palabras clave de ATS de forma natural; no crear una seccion de keywords.

## Jerarquia del contenido

Orden recomendado para roles activos:

1. Perfil profesional.
2. Impacto destacado o experiencia profesional.
3. Formacion academica.
4. Habilidades tecnicas agrupadas.
5. Herramientas, solo si aportan claridad adicional.
6. Idiomas y otros datos compartidos.

Para roles de datos, el CV debe destacar dashboards, KPIs, ETL, automatizacion, Excel, Looker Studio, Python y SQL. Para roles de compras o servicios, debe destacar proveedores, contratos, OPEX/CAPEX, inventarios, continuidad operativa y coordinacion interareas.

## Principios visuales

- Diseno sobrio, ejecutivo y facil de escanear.
- Tipografia de cuerpo cercana a 12 px para PDF A4.
- Secciones con aire suficiente para que el documento no parezca saturado.
- Acentos de color moderados, asociados a datos/gestion: azul petroleo, teal y un acento calido minimo.
- Evitar decoracion innecesaria; la jerarquia debe venir de tamanos, pesos, espaciado y agrupacion.
- Usar una sola pagina cuando el rol sea junior o de transicion, salvo que la vacante pida evidencia extensa.

## Reglas de densidad

- Un bullet no deberia superar dos lineas en PDF.
- Si una seccion necesita mas de 6 bullets, debe reescribirse o agruparse.
- Si al subir la fuente el CV se desborda, se recorta contenido antes de volver a reducir la legibilidad.
- Las habilidades deben agruparse por categoria, no aparecer como lista plana extensa.

## Versiones recomendadas

- `data_analytics`: enfoque en dashboards, KPIs, automatizacion, ETL y decision-making.
- `coordinador_compras`: enfoque en compras, proveedores, contratos, presupuesto e inventarios.
- `coordinador_servicios`: enfoque en servicios tecnicos, mantenimiento, continuidad operativa, proveedores y datos.

Mantener una variante con foto para aplicaciones locales tradicionales y considerar una variante sin foto para roles remotos, internacionales o mas cercanos a tecnologia.

## Flujo editorial

El contenido se trabaja en tres niveles:

1. **CV base general:** contiene identidad profesional, criterios visuales, datos compartidos y reglas de escritura.
2. **CV base por perfil:** toma la base general y la orienta a una familia de cargos, por ejemplo datos, compras o coordinacion de servicios.
3. **CV final por oferta:** adapta una CV base por perfil a una vacante concreta, incorporando palabras clave reales de la oferta y priorizando los logros mas relevantes.

No conviene crear cada CV desde cero. La calidad depende de mantener bases limpias por perfil y hacer ajustes quirurgicos para cada oferta.

## Foto y datos variables

La foto no debe ser universal:

- Versiones en espanol para Colombia o empresas tradicionales: pueden incluir foto.
- Versiones en ingles, remotas, internacionales o de tecnologia: deben salir sin foto por defecto.

La seccion `OTROS DATOS` tambien debe variar:

- `data_analytics`: normalmente solo idiomas; licencias, vehiculo o disponibilidad pueden agregar ruido.
- perfiles de coordinacion, servicios, compras u operacion: puede ser util incluir disponibilidad, licencias y vehiculo si la vacante lo valora.

Para manejarlo, usar footers por perfil:

```text
sections/<lang>/footer_<role>.md
```

Si no existe un footer especifico, el build usa `sections/<lang>/footer.md` como respaldo.

## Convencion de nombres

Las salidas deben nombrarse con esta estructura:

```text
yyyy-mm-dd_perfil_nombre_apellido
```

Ejemplos:

```text
2026-05-23_data_analytics_yuliam_rivera
2026-05-23_data_analytics_en_yuliam_rivera
2026-05-23_coordinador_compras_yuliam_rivera
2026-05-23_coordinador_servicios_yuliam_rivera
```

Los scripts de build generan ese nombre automaticamente cuando no se pasa `Output`. Tambien lo envian como `title` del HTML para que el navegador lo use como nombre sugerido al imprimir o guardar como PDF.
