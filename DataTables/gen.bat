@echo off
setlocal

set "CONF_ROOT=%~dp0"
for %%I in ("%CONF_ROOT%..\..") do set "WORKSPACE=%%~fI"
set "UNITY_ROOT=%WORKSPACE%\Turn-based Card Game"

dotnet "%WORKSPACE%\Config\Tools\Luban\Luban.dll" ^
    --conf "%CONF_ROOT%luban.conf" ^
	--customTemplateDir "%CONF_ROOT%Templates" ^
    -t client ^
    -c cs-bin ^
    -d bin ^
    --strict ^
    -x "outputCodeDir=%UNITY_ROOT%\Assets\GameMain\Scripts\Generated\Luban" ^
    -x "outputDataDir=%UNITY_ROOT%\Assets\GameMain\Res\DataTables\Luban"

set "RESULT=%ERRORLEVEL%"
pause
exit /b %RESULT%