param(
  [Parameter(Mandatory=$true)]
  [string]$Role,

  [Parameter(Mandatory=$false)]
  [string]$Output,

  [Parameter(Mandatory=$false)]
  [ValidateSet("es","en")]
  [string]$Lang = "es"
)

if ([string]::IsNullOrWhiteSpace($Output)) {
  $datePrefix = Get-Date -Format "yyyy-MM-dd"
  $roleSlug = if ($Lang -eq "en") { "${Role}_en" } else { $Role }
  $Output = "${datePrefix}_${roleSlug}_yuliam_rivera"
}

$roleFile = "roles\$Lang\$Role.md"
$headerFile = "sections\$Lang\header.md"
$roleFooterFile = "sections\$Lang\footer_$Role.md"
$footerFile = "sections\$Lang\footer.md"

if (Test-Path $roleFooterFile) {
  $footerFile = $roleFooterFile
}

if (!(Test-Path $roleFile)) {
  Write-Host "❌ No existe $roleFile"
  exit 1
}

if (!(Test-Path $headerFile) -or !(Test-Path $footerFile)) {
  Write-Host "❌ Faltan secciones en sections\$Lang\"
  exit 1
}

New-Item -ItemType Directory -Force -Path "build", "exports" | Out-Null

$pandocArgs = @(
  $headerFile,
  $roleFile,
  $footerFile,
  "--template=template_cv.html",
  "--metadata",
  "lang=$Lang",
  "--metadata",
  "title=$Output"
)

if ($Lang -eq "es") {
  $pandocArgs += @("--metadata", "include_photo=true")
}

$pandocArgs += @("-o", "build\$Output.html")

pandoc @pandocArgs

if ($LASTEXITCODE -ne 0) {
  Write-Host "❌ Falló la generación HTML con pandoc"
  exit $LASTEXITCODE
}

Write-Host "[OK] HTML generado: build\$Output.html"
Write-Host "[OK] Título HTML / nombre sugerido para PDF: $Output"
Write-Host "[OK] Footer usado: $footerFile"
$photoStatus = if ($Lang -eq "es") { "incluida" } else { "omitida" }
Write-Host "[OK] Foto de perfil: $photoStatus"

