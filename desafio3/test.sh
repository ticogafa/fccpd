#!/bin/bash


echo "==================================="
echo "Desafio 3 - Testando Endpoints"
echo "==================================="
echo ""

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}Aguardando serviços ficarem prontos...${NC}"
sleep 3

echo ""

echo -e "${BLUE}[1/2]${NC} Testando GET / ..."
curl -s http://localhost:8000/ | python3 -m json.tool
echo ""

echo -e "${BLUE}[2/2]${NC} Verificando status dos serviços..."
docker compose ps

echo ""
echo "==================================="
echo -e "${GREEN}Testes concluídos!${NC}"
echo "==================================="
echo ""
