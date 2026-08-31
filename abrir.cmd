@echo off
REM Sobe um servidor local na pasta do DFT e abre o navegador nele.
REM
REM Serve para nao abrir o index.html direto do disco: em file:// o navegador
REM bloqueia a chamada a API da aba de mapeamento. Pare o servidor com Ctrl+C.

setlocal
cd /d "%~dp0"
if "%PORTA%"=="" set PORTA=8000
set URL=http://localhost:%PORTA%/

where py >nul 2>&1
if %errorlevel%==0 goto :py
where python >nul 2>&1
if %errorlevel%==0 goto :python
where npx >nul 2>&1
if %errorlevel%==0 goto :node
goto :nada

:py
echo DFT em %URL% - Ctrl+C para parar.
start "" "%URL%"
py -3 -m http.server %PORTA%
goto :fim

:python
echo DFT em %URL% - Ctrl+C para parar.
start "" "%URL%"
python -m http.server %PORTA%
goto :fim

:node
echo DFT em %URL% - Ctrl+C para parar.
start "" "%URL%"
npx --yes http-server -p %PORTA%
goto :fim

:nada
echo Nao encontrei Python nem Node nesta maquina.
echo Instale o Python em https://www.python.org/downloads/ e rode este arquivo de novo.
echo Na instalacao, marque a opcao "Add Python to PATH".
pause

:fim
