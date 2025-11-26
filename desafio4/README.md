# Desafio 4 - Comunicação entre Microsserviços

## Objetivo
Demonstrar a comunicação entre microsserviços independentes, onde um serviço consome dados de outro através de requisições HTTP.

## Descrição
Este desafio implementa dois microsserviços:
- **Service A**: Expõe uma API de usuários
- **Service B**: Consome a API do Service A e gera relatórios

Ambos os serviços são independentes e se comunicam através de uma rede Docker customizada.

## Estrutura

```
desafio4/
├── service-a/
│   ├── app.py              # API de usuários
│   ├── Dockerfile          # Imagem do Service A
│   └── requirements.txt    # Dependências
├── service-b/
│   ├── app.py              # Serviço de relatórios
│   ├── Dockerfile          # Imagem do Service B
│   └── requirements.txt    # Dependências
├── setup.sh                # Cria rede e constrói imagens
├── run.sh                  # Inicia os serviços
├── test.sh                 # Testa os endpoints
├── simulate_failure.sh     # Simula falha do Service A
├── cleanup.sh              # Remove containers e rede
└── README.md               # Este arquivo
```

## Como Executar

### 1. Setup (Criar rede e construir imagens)
```bash
./setup.sh
```

### 2. Executar os serviços
```bash
./run.sh
```

### 3. Testar endpoints
```bash
./test.sh
```

### 4. Simular falha de comunicação
```bash
./simulate_failure.sh
```

### 5. Limpar recursos
```bash
./cleanup.sh
```

## Conceitos Demonstrados

- **Microsserviços**: Serviços independentes com responsabilidades específicas
- **Comunicação HTTP**: Requisições entre serviços
- **Descoberta de serviços**: Uso de DNS do Docker para resolver nomes
- **Tratamento de erros**: Service B trata falhas ao chamar Service A
- **Resiliência**: Comportamento quando um serviço está indisponível

## Endpoints

### Service A (porta 5000)
- `GET /users`: Lista de usuários
- `GET /health`: Health check do serviço

### Service B (porta 5002)
- `GET /report`: Relatório consumindo dados do Service A
- `GET /health`: Health check do serviço

## Verificação de Funcionamento

```bash
# Testar Service A diretamente
curl http://localhost:5000/users

# Testar Service B (que consome Service A)
curl http://localhost:5002/report

# Ver logs do Service A
docker logs desafio4-service-a

# Ver logs do Service B
docker logs desafio4-service-b

# Verificar a rede
docker network inspect desafio4-net
```

## Simulação de Falhas

O script `simulate_failure.sh`:
1. Para o Service A
2. Tenta acessar o endpoint `/report` do Service B
3. Service B deve retornar erro 502 (Bad Gateway) indicando falha ao comunicar com Service A
4. Reinicia o Service A
5. Verifica que a comunicação volta ao normal

Isso demonstra como microsserviços lidam com falhas de comunicação.

## Fluxo de Comunicação

```
Cliente → Service B (/report) → Service A (/users) → Retorna dados → Service B processa → Cliente
```

## Tecnologias Utilizadas

- **Docker**: Containerização
- **Python 3.12**: Linguagem dos microsserviços
- **Flask**: Framework web
- **requests**: Cliente HTTP Python
- **Bash**: Scripts de automação
