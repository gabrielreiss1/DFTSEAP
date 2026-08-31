#!/usr/bin/env sh
# Sobe um servidor local na pasta do DFT e abre o navegador nele.
#
# Serve para não abrir o index.html direto do disco: em file:// o navegador
# bloqueia a chamada à API da aba de mapeamento. Pare o servidor com Ctrl+C.

cd "$(dirname "$0")" || exit 1
PORTA="${PORTA:-8000}"
URL="http://localhost:$PORTA/"

abre() {
  # dá um instante para o servidor subir antes de abrir o navegador
  sleep 1
  if command -v xdg-open > /dev/null 2>&1; then xdg-open "$URL"
  elif command -v open > /dev/null 2>&1; then open "$URL"
  else echo "Abra $URL no navegador."
  fi
}

if command -v python3 > /dev/null 2>&1; then
  echo "DFT em $URL — Ctrl+C para parar."
  abre &
  exec python3 -m http.server "$PORTA"
elif command -v python > /dev/null 2>&1; then
  echo "DFT em $URL — Ctrl+C para parar."
  abre &
  exec python -m http.server "$PORTA"
elif command -v npx > /dev/null 2>&1; then
  echo "DFT em $URL — Ctrl+C para parar."
  abre &
  exec npx --yes http-server -p "$PORTA"
else
  echo "Não encontrei Python nem Node nesta máquina."
  echo "Instale o Python (https://www.python.org/downloads/) e rode este arquivo de novo."
  exit 1
fi
