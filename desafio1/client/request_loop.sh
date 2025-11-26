#!/bin/sh

echo "Iniciando client... Vou ficar chamando o servidor web a cada 5 segundos."

while true; do
  echo ""
  echo "[CLIENT] Fazendo requisição para http://web:8080 ..."

  curl -s http://web:8080
  echo ""
  sleep 5
done
