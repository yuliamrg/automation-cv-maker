#!/bin/bash

ROLE=$1
OUTPUT=$2
LANG=$3

if [ -z "$ROLE" ]; then
  echo "Uso: ./build_cv.sh data_analytics [output] [es|en]"
  exit 1
fi

if { [ "$OUTPUT" = "es" ] || [ "$OUTPUT" = "en" ]; } && [ -z "$LANG" ]; then
  LANG=$OUTPUT
  OUTPUT=""
fi

if [ -z "$LANG" ]; then
  LANG="es"
fi

if [ -z "$OUTPUT" ]; then
  ROLE_SLUG="$ROLE"
  if [ "$LANG" = "en" ]; then
    ROLE_SLUG="${ROLE}_en"
  fi
  OUTPUT="$(date +%F)_${ROLE_SLUG}_yuliam_rivera"
fi

if [ ! -f "roles/$LANG/$ROLE.md" ]; then
  echo "❌ No existe roles/$LANG/$ROLE.md"
  exit 1
fi

HEADER_FILE="sections/$LANG/header.md"
FOOTER_FILE="sections/$LANG/footer.md"
ROLE_FOOTER_FILE="sections/$LANG/footer_$ROLE.md"

if [ -f "$ROLE_FOOTER_FILE" ]; then
  FOOTER_FILE="$ROLE_FOOTER_FILE"
fi

if [ ! -f "$HEADER_FILE" ] || [ ! -f "$FOOTER_FILE" ]; then
  echo "❌ Faltan secciones en sections/$LANG/"
  exit 1
fi

mkdir -p build exports

PANDOC_ARGS=(
  "$HEADER_FILE"
  "roles/$LANG/$ROLE.md"
  "$FOOTER_FILE"
  "--template=template_cv.html"
  "--metadata" "lang=$LANG"
  "--metadata" "title=$OUTPUT"
)

if [ "$LANG" = "es" ]; then
  PANDOC_ARGS+=("--metadata" "include_photo=true")
fi

PANDOC_ARGS+=("-o" "build/$OUTPUT.html")

pandoc \
  "${PANDOC_ARGS[@]}"

if [ $? -ne 0 ]; then
  echo "❌ Falló la generación HTML con pandoc"
  exit 1
fi

echo "✔ HTML generado: build/$OUTPUT.html"
echo "✔ Título HTML / nombre sugerido para PDF: $OUTPUT"
echo "✔ Footer usado: $FOOTER_FILE"
if [ "$LANG" = "es" ]; then
  echo "✔ Foto de perfil: incluida"
else
  echo "✔ Foto de perfil: omitida"
fi
