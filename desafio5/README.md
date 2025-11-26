# Desafio 5 - API Gateway

## Objetivo
Demonstrar o padrão de API Gateway, onde um único ponto de entrada centraliza o acesso a múltiplos microsserviços backend.

## Descrição
Este desafio implementa um API Gateway que roteia requisições para dois microsserviços:
- **Users Service**: Gerencia informações de usuários
- **Orders Service**: Gerencia informações de pedidos
- **Gateway**: Ponto único de entrada que roteia requisições

## Estrutura

```
desafio5/
├── docker-compose.yml          # Definição dos serviços
├── gateway/
│   ├── app.py                 # API Gateway
│   ├── Dockerfile             # Imagem do Gateway
│   └── requirements.txt       # Dependências
├── users-service/
│   ├── app.py                 # Serviço de usuários
│   ├── Dockerfile             # Imagem do serviço
│   └── requirements.txt       # Dependências
├── orders-service/
│   ├── app.py                 # Serviço de pedidos
│   ├── Dockerfile             # Imagem do serviço
│   └── requirements.txt       # Dependências
├── setup.sh                   # Inicia todos os serviços
├── test.sh                    # Testa o gateway
├── simulate_gateway_failure.sh # Simula falha de um serviço backend
├── cleanup.sh                 # Para e remove todos os serviços
└── README.md                  # Este arquivo
```

## Como Executar

### 1. Setup (Iniciar todos os serviços)
```bash
./setup.sh
```

### 2. Testar o gateway
```bash
./test.sh
```

### 3. Simular falha de serviço backend
```bash
./simulate_gateway_failure.sh
```

### 4. Limpar recursos
```bash
./cleanup.sh
```

## Conceitos Demonstrados

- **API Gateway Pattern**: Ponto único de entrada para múltiplos serviços
- **Roteamento de requisições**: Gateway distribui requisições para serviços apropriados
- **Microsserviços**: Serviços independentes especializados
- **Tratamento de erros**: Gateway lida com falhas de serviços backend
- **Docker Compose**: Orquestração de múltiplos serviços

## Endpoints

### Gateway (porta 8080)
- `GET /users`: Roteia para users-service
- `GET /orders`: Roteia para orders-service
- `GET /health`: Health check do gateway

### Users Service (interno, porta 5000)
- `GET /users`: Lista de usuários
- `GET /health`: Health check

### Orders Service (interno, porta 5000)
- `GET /orders`: Lista de pedidos
- `GET /health`: Health check

**Nota**: Os serviços backend não são expostos externamente. Todo acesso é feito através do gateway.

## Verificação de Funcionamento

```bash
# Acessar usuários via gateway
curl http://localhost:8080/users

# Acessar pedidos via gateway
curl http://localhost:8080/orders

# Health check do gateway
curl http://localhost:8080/health

# Ver logs do gateway
docker compose logs gateway

# Ver logs de todos os serviços
docker compose logs

# Verificar status dos serviços
docker compose ps
```

## Arquitetura

```
Cliente
   ↓
Gateway (porta 8080)
   ├─→ Users Service (interno)
   └─→ Orders Service (interno)
```

Apenas o Gateway é exposto externamente. Os serviços backend são acessíveis apenas dentro da rede Docker interna.

## Simulação de Falhas

O script `simulate_gateway_failure.sh`:
1. Para o `users-service`
2. Tenta acessar `/users` através do gateway
3. Gateway deve retornar erro 502 (Bad Gateway)
4. Reinicia o `users-service`
5. Verifica que o acesso volta ao normal

Isso demonstra como o gateway lida com falhas de serviços backend.

## Vantagens do API Gateway

1. **Ponto único de entrada**: Simplifica o acesso do cliente
2. **Roteamento centralizado**: Facilita gerenciamento de rotas
3. **Segurança**: Serviços backend não são expostos diretamente
4. **Escalabilidade**: Serviços podem escalar independentemente
5. **Monitoramento**: Facilita observabilidade e logging centralizado

## Tecnologias Utilizadas

- **Docker Compose**: Orquestração
- **Python 3.12**: Linguagem dos serviços
- **Flask**: Framework web
- **requests**: Cliente HTTP para comunicação entre serviços
- **Bash**: Scripts de automação
