# Projeto 2 - Fundamentos de Computação em Cloud e Processamento Distribuído

Este repositório contém a implementação dos 5 desafios práticos de Docker para demonstração de conceitos fundamentais de containerização, orquestração e arquitetura de microsserviços.

## Estrutura do Projeto

```
fccpd/
├── desafio1/    # Redes Docker
├── desafio2/    # Volumes e Persistência
├── desafio3/    # Docker Compose
├── desafio4/    # Microsserviços
├── desafio5/    # API Gateway
└── README.md    # Este arquivo
```

## Desafios

### Desafio 1 - Redes Docker
Demonstra a comunicação entre containers utilizando redes Docker customizadas. Um servidor web Flask e um cliente que faz requisições periódicas.

**Tecnologias**: Docker Networks, Python/Flask, Alpine Linux

[📖 Ver documentação completa](desafio1/README.md)

### Desafio 2 - Volumes e Persistência
Demonstra o uso de volumes Docker para persistência de dados com PostgreSQL. Os dados sobrevivem à remoção e recriação de containers.

**Tecnologias**: Docker Volumes, PostgreSQL

[📖 Ver documentação completa](desafio2/README.md)

### Desafio 3 - Docker Compose e Orquestração
Orquestra múltiplos serviços (aplicação web, PostgreSQL e Redis) com Docker Compose, demonstrando dependências e comunicação entre serviços.

**Tecnologias**: Docker Compose, Flask, PostgreSQL, Redis

[📖 Ver documentação completa](desafio3/README.md)

### Desafio 4 - Comunicação entre Microsserviços
Demonstra a comunicação entre microsserviços independentes, onde um serviço consome dados de outro através de requisições HTTP.

**Tecnologias**: Microsserviços, Python/Flask, Docker Networks

[📖 Ver documentação completa](desafio4/README.md)

### Desafio 5 - API Gateway
Implementa o padrão de API Gateway, centralizando o acesso a múltiplos microsserviços através de um único ponto de entrada.

**Tecnologias**: API Gateway Pattern, Docker Compose, Microsserviços

[📖 Ver documentação completa](desafio5/README.md)

## Requisitos

- Docker (versão 20.10 ou superior)
- Docker Compose (versão 2.0 ou superior)
- Bash
- curl
- Python 3 (para formatação JSON nos testes)

## Execução Rápida

### Executar um desafio específico

```bash
# Navegue até o diretório do desafio
cd desafio1/

# Execute os scripts na ordem
./setup.sh    # Preparação
./run.sh      # Execução (se aplicável)
./test.sh     # Testes
./cleanup.sh  # Limpeza
```

### Executar todos os desafios

```bash
# Na raiz do projeto
./run_all.sh
```

Este script irá:
1. Executar todos os desafios em sequência
2. Realizar os testes de cada desafio
3. Limpar os recursos após cada desafio

## Estrutura Comum dos Desafios

Cada desafio segue uma estrutura padronizada:

- **`setup.sh`**: Prepara o ambiente (cria redes, volumes, constrói imagens)
- **`run.sh`**: Executa os containers (quando aplicável)
- **`test.sh`**: Testa o funcionamento e gera evidências
- **`cleanup.sh`**: Remove todos os recursos criados
- **`README.md`**: Documentação específica do desafio
- **Scripts adicionais**: Demonstrações específicas (persistência, falhas, etc.)

## Verificação Geral

### Verificar containers em execução
```bash
docker ps
```

### Verificar redes Docker
```bash
docker network ls
```

### Verificar volumes Docker
```bash
docker volume ls
```

### Verificar imagens construídas
```bash
docker images | grep desafio
```

## Limpeza Completa

Para remover TODOS os recursos de TODOS os desafios:

```bash
# Executar cleanup de cada desafio
for i in {1..5}; do
  (cd desafio$i && ./cleanup.sh)
done

# Ou usar comandos Docker diretos
docker stop $(docker ps -aq --filter name=desafio)
docker rm $(docker ps -aq --filter name=desafio)
docker network rm $(docker network ls --filter name=desafio -q)
docker volume rm $(docker volume ls --filter name=desafio -q)
```

## Conceitos Abordados

- ✅ Containerização com Docker
- ✅ Redes Docker customizadas
- ✅ Volumes e persistência de dados
- ✅ Docker Compose para orquestração
- ✅ Comunicação entre containers
- ✅ Arquitetura de microsserviços
- ✅ API Gateway Pattern
- ✅ Tratamento de falhas e resiliência
- ✅ Health checks e monitoramento
- ✅ Isolamento e segurança de containers

## Tecnologias Utilizadas

- **Docker & Docker Compose**: Containerização e orquestração
- **Python 3.12**: Linguagem principal das aplicações
- **Flask**: Framework web para APIs e serviços
- **PostgreSQL 16**: Banco de dados relacional
- **Redis 7**: Cache e banco de dados em memória
- **Alpine Linux**: Base leve para containers
- **Bash**: Scripts de automação
- **curl**: Cliente HTTP para testes

## Autor

Desenvolvido como parte do Projeto 2 da disciplina de Fundamentos de Computação em Cloud e Processamento Distribuído.

## Licença

Este projeto é de uso educacional.
