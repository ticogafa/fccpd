#!/bin/bash


set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}Parando service-a...${NC}"
docker rm -f desafio4-service-a 2>/dev/null || true

sleep 2

echo -e "${YELLOW}Testando service-b (deve indicar erro ao consumir service-a)...${NC}"
set +e
HTTP_CODE=$(curl -s -w "%{http_code}" -o /tmp/response.json http://localhost:5001/report)
RES=$?
set -e

if [ "$HTTP_CODE" = "502" ] || [ $RES -ne 0 ]; then
    echo -e "${GREEN}✓ service-b retornou erro 502 (Bad Gateway) como esperado quando service-a está fora${NC}"
    cat /tmp/response.json 2>/dev/null | python3 -m json.tool || true
else
    echo -e "${RED}✗ service-b ainda respondeu com sucesso (HTTP $HTTP_CODE)${NC}"
fi

echo -e "${BLUE}Subindo service-a novamente...${NC}"
docker run -d --name desafio4-service-a --network desafio4-net --network-alias service-a -p 5000:5000 -e USERS_API_URL=http://service-a:5000/users desafio4-service-a
sleep 3

echo -e "${BLUE}Testando service-b novamente (agora service-a deve estar online)...${NC}"
curl -s http://localhost:5001/report | python3 -m json.tool || true

echo -e "${GREEN}Simulação concluída!${NC}"
