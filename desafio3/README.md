# Desafio 3 - Docker Compose e Orquestração

## Objetivo
Demonstrar o uso do Docker Compose para orquestrar múltiplos serviços (aplicação web, PostgreSQL e Redis) com dependências e comunicação entre eles.

## Descrição
Este desafio implementa uma aplicação web Flask que se conecta a dois serviços de backend:
- **PostgreSQL**: Banco de dados relacional
- **Redis**: Cache/banco de dados em memória

A aplicação verifica a conectividade com ambos os serviços e retorna o status.

## Estrutura

```
desafio3/
├── docker-compose.yml      # Definição dos serviços
├── web/
│   ├── app.py             # Aplicação Flask
│   ├── Dockerfile         # Imagem da aplicação
│   └── requirements.txt   # Dependências Python
├── setup.sh               # Inicia todos os serviços
├── test.sh                # Testa endpoints
├── simulate_db_down.sh    # Simula falha do banco de dados
├── reset-db.sh            # Remove e recria o volume do banco
├── cleanup.sh             # Para e remove todos os serviços
└── README.md              # Este arquivo
```

## Como Executar

### 1. Setup (Iniciar todos os serviços)
```bash
./setup.sh
```

### 2. Testar endpoints
```bash
./test.sh
```

### 3. Simular falha do banco de dados
```bash
./simulate_db_down.sh
```

### 4. Resetar banco de dados (opcional)
```bash
./reset-db.sh
```

### 5. Limpar recursos
```bash
./cleanup.sh
```

## Conceitos Demonstrados

- **Docker Compose**: Orquestração de múltiplos containers
- **Dependências entre serviços**: `depends_on` para ordem de inicialização
- **Redes Docker**: Comunicação entre serviços
- **Volumes nomeados**: Persistência de dados do PostgreSQL
- **Variáveis de ambiente**: Configuração dos serviços
- **Health checks**: Verificação de conectividade com serviços

## Serviços

### Web (aplicação)
- **Porta**: 8000 (host) → 5000 (container)
- **Dependências**: db, cache
- **Endpoints**:
  - `GET /`: Health check com status de conexões

### DB (PostgreSQL)
- **Imagem**: postgres:16
- **Usuário**: usuario
- **Senha**: senha123
- **Database**: desafio3db
- **Volume**: db-data

### Cache (Redis)
- **Imagem**: redis:7
- **Sem persistência configurada**

## Verificação de Funcionamento

```bash
# Verificar status dos serviços
docker compose ps

# Ver logs de todos os serviços
docker compose logs

# Ver logs de um serviço específico
docker compose logs web

# Testar endpoint
curl http://localhost:8000/

# Executar comando no PostgreSQL
docker compose exec db psql -U usuario -d desafio3db

# Executar comando no Redis
docker compose exec cache redis-cli
```

## Simulação de Falhas

O script `simulate_db_down.sh` para o serviço PostgreSQL e testa como a aplicação responde. A aplicação deve:
- Retornar erro 500 (Internal Server Error)
- Indicar que a conexão com o Postgres falhou

## Tecnologias Utilizadas

- **Docker Compose**: Orquestração
- **Python 3.12**: Linguagem da aplicação
- **Flask**: Framework web
- **PostgreSQL 16**: Banco de dados relacional
- **Redis 7**: Cache/banco em memória
- **psycopg2**: Driver Python para PostgreSQL
- **redis-py**: Cliente Python para Redis
