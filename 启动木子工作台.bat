@echo off
setlocal
cd /d "%~dp0"
chcp 65001 >nul
set NODE_OPTIONS=--use-system-ca
set MUZI_DATA_DIR=%~dp0.muzi-data
set MUZI_PORT=4317

echo 正在启动木子工作台...
echo.

call npm.cmd run app:start

if errorlevel 1 (
  echo.
  echo 木子工作台启动失败，请确认已经安装 Node.js 22 或更高版本。
  echo 如已安装，请尝试在命令行中运行：npm run build
  pause
) else (
  echo.
  echo 木子工作台已启动，浏览器将自动打开。
  echo 如未自动打开，请手动访问：http://127.0.0.1:4317
  timeout /t 3 >nul
)
endlocal
