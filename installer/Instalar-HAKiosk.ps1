# HA Kiosk - Instalador PowerShell
# iNFOREIS 2026

$Host.UI.RawUI.WindowTitle = "HA Kiosk - Instalador iNFOREIS 2026"

function Write-Banner {
    Write-Host ""
    Write-Host " ╔══════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host " ║         HA KIOSK  -  Instalador v2.0                ║" -ForegroundColor Cyan
    Write-Host " ║              iNFOREIS 2026                           ║" -ForegroundColor Cyan
    Write-Host " ╚══════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Find-Adb {
    $paths = @(
        "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
        "C:\Program Files\Android\Android Studio\sdk\platform-tools\adb.exe",
        "C:\Program Files (x86)\Android\android-sdk\platform-tools\adb.exe"
    )
    foreach ($p in $paths) {
        if (Test-Path $p) { return $p }
    }
    # Try PATH
    $found = Get-Command adb -ErrorAction SilentlyContinue
    if ($found) { return $found.Source }
    return $null
}

Write-Banner

# Locate APK
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$apkPath = Join-Path $scriptDir "HAKiosk-v2.0-iNFOREIS2026.apk"

if (-not (Test-Path $apkPath)) {
    Write-Host " [ERRO] Ficheiro APK nao encontrado: $apkPath" -ForegroundColor Red
    Write-Host " Certifique-se que o ficheiro .apk esta na mesma pasta que este script." -ForegroundColor Yellow
    Read-Host " Prima Enter para sair"
    exit 1
}

$apkSize = [math]::Round((Get-Item $apkPath).Length / 1MB, 1)
Write-Host " [OK] APK encontrado: HAKiosk-v2.0-iNFOREIS2026.apk ($apkSize MB)" -ForegroundColor Green

# Find ADB
$adb = Find-Adb
if (-not $adb) {
    Write-Host ""
    Write-Host " [ERRO] ADB nao encontrado." -ForegroundColor Red
    Write-Host " Instale o Android Studio ou o Android SDK Command-Line Tools." -ForegroundColor Yellow
    Write-Host ""
    Write-Host " Instalacao manual: copie o ficheiro APK para o tablet e abra-o." -ForegroundColor Cyan
    Read-Host " Prima Enter para sair"
    exit 1
}

Write-Host " [OK] ADB: $adb" -ForegroundColor Green
Write-Host ""
Write-Host " A verificar dispositivos ligados..." -ForegroundColor White
Write-Host ""

$deviceOutput = & $adb devices 2>&1
$devices = $deviceOutput | Where-Object { $_ -match "\tdevice$" }

if (-not $devices) {
    Write-Host " [AVISO] Nenhum dispositivo Android ligado!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Passos para ligar o tablet:" -ForegroundColor White
    Write-Host "   1. Ligue o tablet ao PC via cabo USB" -ForegroundColor Gray
    Write-Host "   2. Ative a Depuracao USB:" -ForegroundColor Gray
    Write-Host "      Definicoes > Sobre o Tablet > toque 7x em 'Numero de Compilacao'" -ForegroundColor Gray
    Write-Host "      Definicoes > Opcoes de Programador > Depuracao USB = ON" -ForegroundColor Gray
    Write-Host "   3. Autorize a ligacao no ecra do tablet" -ForegroundColor Gray
    Write-Host ""
    Read-Host " Prima Enter para sair"
    exit 1
}

Write-Host " [OK] $($devices.Count) dispositivo(s) encontrado(s):" -ForegroundColor Green
foreach ($dev in $devices) {
    $devId = ($dev -split "\t")[0]
    Write-Host "      - $devId" -ForegroundColor Cyan
}

Write-Host ""
Write-Host " A instalar HA Kiosk v2.0 (iNFOREIS 2026)..." -ForegroundColor White
Write-Host ""

$result = & $adb install -r $apkPath 2>&1
$success = $result | Where-Object { $_ -match "^Success" }

if ($success) {
    Write-Host ""
    Write-Host " ╔══════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host " ║   INSTALACAO CONCLUIDA COM SUCESSO!                  ║" -ForegroundColor Green
    Write-Host " ║                                                      ║" -ForegroundColor Green
    Write-Host " ║   HA Kiosk v2.0 esta pronto a usar.                 ║" -ForegroundColor Green
    Write-Host " ║   iNFOREIS 2026                                      ║" -ForegroundColor Green
    Write-Host " ╚══════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    
    Write-Host " A iniciar a aplicacao no dispositivo..." -ForegroundColor White
    & $adb shell monkey -p com.aistudio.hakiosk.vtpnxe -c android.intent.category.LAUNCHER 1 | Out-Null
    Write-Host " [OK] Aplicacao iniciada!" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host " [ERRO] Falha na instalacao." -ForegroundColor Red
    Write-Host $result -ForegroundColor Red
    Write-Host ""
    Write-Host " Verifique a ligacao USB e tente novamente." -ForegroundColor Yellow
    Write-Host ""
}

Read-Host " Prima Enter para sair"
