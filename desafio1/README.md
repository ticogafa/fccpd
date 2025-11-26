# Desafio 1 - Redes Docker

## Objetivo
Demonstrar a comunicação entre containers utilizando redes Docker customizadas.

## Descrição
Este desafio implementa dois containers:
- **Servidor Web**: Uma aplicação Flask que responde com informações básicas (mensagem, timestamp e hostname)
- **Cliente**: Um container que faz requisições HTTP ao servidor a cada 5 segundos

Ambos os containers estão conectados à mesma rede Docker customizada (`desafio1-net`), permitindo que se comuniquem através de nomes de DNS.

## Estrutura

```
desafio1/
├── server/
│   ├── app.py              # Aplicação Flask do servidor
│   └── Dockerfile          # Imagem do servidor
├── client/
│   ├── request_loop.sh     # Script que faz requisições periódicas
│   └── Dockerfile          # Imagem do cliente
├── setup.sh                # Configura rede e constrói imagens
├── run.sh                  # Inicia os containers
├── test.sh                 # Testa e salva logs
├── cleanup.sh              # Remove containers e rede
└── README.md               # Este arquivo
```

## Como Executar

### 1. Setup (Criar rede e construir imagens)
```bash
./setup.sh
```

### 2. Executar os containers
```bash
./run.sh
```

### 3. Testar e verificar logs
```bash
./test.sh
```

### 4. Limpar recursos
```bash
./cleanup.sh
```

## Conceitos Demonstrados

- **Redes Docker customizadas**: Isolamento e comunicação entre containers
- **DNS interno do Docker**: Resolução de nomes entre containers
- **Comunicação HTTP**: Cliente fazendo requisições para o servidor
- **Logs de containers**: Monitoramento de atividades

## Arquivos Gerados pelos Testes

Após executar `./test.sh`, os seguintes arquivos são criados:
- `curl_out.json`: Resposta do servidor
- `client_logs.txt`: Últimas 50 linhas dos logs do cliente
- `containers_status.txt`: Status dos containers em execução

## Verificação de Funcionamento

Para verificar se está tudo funcionando:

```bash
# Ver logs do cliente em tempo real
docker logs -f desafio1-client

# Fazer requisição manual ao servidor
curl http://localhost:8080/

# Verificar a rede
docker network inspect desafio1-net
```

## Tecnologias Utilizadas

- **Docker**: Containerização
- **Python 3.12**: Linguagem do servidor
- **Flask**: Framework web
- **Alpine Linux**: Base do container cliente
- **curl**: Cliente HTTP
- **Bash**: Scripts de automação
