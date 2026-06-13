@echo off
chcp 65001 > nul
title HA Kiosk - Instalador iNFOREIS 2026

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║         HA KIOSK  -  Instalador v2.0                ║
echo  ║              iNFOREIS 2026                           ║
echo  ╚══════════════════════════════════════════════════════╝
echo.

:: Find adb.exe
set ADB=
if exist "%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe" (
    set ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe
) else if exist "%ProgramFiles%\Android\Android Studio\sdk\platform-tools\adb.exe" (
    set ADB=%ProgramFiles%\Android\Android Studio\sdk\platform-tools\adb.exe
) else (
    where adb >nul 2>&1
    if %ERRORLEVEL%==0 set ADB=adb
)

if "%ADB%"=="" (
    echo  [ERRO] Nao foi possivel encontrar o ADB.
    echo.
    echo  Por favor instale o Android SDK ou Android Studio.
    echo  Ou instale manualmente o APK a partir do ficheiro:
    echo.
    echo    HAKiosk-v2.0-iNFOREIS2026.apk
    echo.
    pause
    exit /b 1
)

echo  [OK] ADB encontrado em: %ADB%
echo.
echo  A verificar dispositivos ligados...
echo.

"%ADB%" devices
echo.

:: Count connected devices
for /f "skip=1 tokens=1,2" %%a in ('"%ADB%" devices') do (
    if "%%b"=="device" (
        goto :install
    )
)

echo  [AVISO] Nenhum dispositivo Android ligado.
echo.
echo  Certifique-se que:
echo   1. O tablet esta ligado ao PC via USB
echo   2. A depuracao USB esta ativada no tablet
echo      (Definicoes - Sobre - toque 7x em Numero de Compilacao)
echo   3. Autorize a ligacao no ecra do tablet
echo.
pause
exit /b 1

:install
echo  [OK] Dispositivo detetado!
echo.
echo  A instalar HA Kiosk v2.0 (iNFOREIS 2026)...
echo.

"%ADB%" install -r "HAKiosk-v2.0-iNFOREIS2026.apk"

if %ERRORLEVEL%==0 (
    echo.
    echo  ╔══════════════════════════════════════════════════════╗
    echo  ║   INSTALACAO CONCLUIDA COM SUCESSO!                  ║
    echo  ║                                                      ║
    echo  ║   HA Kiosk v2.0 esta pronto a usar.                 ║
    echo  ║   iNFOREIS 2026                                      ║
    echo  ╚══════════════════════════════════════════════════════╝
    echo.
    
    :: Launch the app
    "%ADB%" shell monkey -p com.aistudio.hakiosk.vtpnxe -c android.intent.category.LAUNCHER 1 >nul 2>&1
    echo  A aplicacao foi iniciada no dispositivo.
    echo.
) else (
    echo.
    echo  [ERRO] Falha na instalacao. Verifique a ligacao USB e tente novamente.
    echo.
)

pause
