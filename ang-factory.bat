@echo off

set "originalDir=%cd%"

for /d /r %cd% %%a in (*) do if /i "%%~nxa"=="factories" set "folderpath=%%a"

cd "%folderpath%"

echo const %1 = {>> %1.service.js
echo     yourFunction: yourFunction,>> %1.service.js
echo };>> %1.service.js
echo.>> %1.service.js
echo function yourFunction() {>> %1.service.js
echo.>> %1.service.js
echo }>> %1.service.js
echo.>> %1.service.js
echo export default %1;>> %1.service.js

cd %originalDir%
