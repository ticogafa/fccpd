# Desafio 2 - Volumes e Persistência

## Objetivo
Demonstrar o uso de volumes Docker para persistência de dados, garantindo que os dados sobrevivam à remoção e recriação de containers.

## Descrição
Este desafio utiliza um container PostgreSQL com um volume Docker nomeado para armazenar dados de forma persistente. Mesmo removendo e recriando o container, os dados permanecem intactos no volume.

## Estrutura

```
desafio2/
├── setup.sh        # Cria volume e inicia PostgreSQL
├── demo.sh         # Cria tabela e insere dados
├── persist.sh      # Remove container e recria para demonstrar persistência
├── test.sh         # Salva conteúdo da tabela e logs
├── cleanup.sh      # Remove container e volume
└── README.md       # Este arquivo
```

## Como Executar

### 1. Setup (Criar volume e container)
```bash
./setup.sh
```

### 2. Criar tabela e inserir dados
```bash
./demo.sh
```

### 3. Demonstrar persistência (remove e recria container)
```bash
./persist.sh
```

### 4. Salvar evidências dos testes
```bash
./test.sh
```

### 5. Limpar recursos
```bash
./cleanup.sh
```

## Conceitos Demonstrados

- **Volumes Docker**: Persistência de dados independente do ciclo de vida do container
- **PostgreSQL**: Banco de dados relacional
- **Persistência de dados**: Dados sobrevivem à remoção do container
- **Gerenciamento de volumes**: Criação, uso e remoção

## Arquivos Gerados pelos Testes

Após executar `./test.sh`, os seguintes arquivos são criados:
- `db_table_contents.txt`: Conteúdo da tabela clientes
- `db_container_logs.txt`: Logs do container PostgreSQL
- `containers_status.txt`: Status dos containers
- `volumes.txt`: Lista de volumes Docker

## Verificação de Funcionamento

```bash
# Verificar se o volume existe
docker volume ls | grep desafio2-db-data

# Conectar ao banco e consultar dados
docker exec -it desafio2-db psql -U usuario -d meubanco -c "SELECT * FROM clientes;"

# Inspecionar o volume
docker volume inspect desafio2-db-data
```

## Demonstração de Persistência

O script `persist.sh` demonstra que:
1. O container é completamente removido (`docker rm -f`)
2. Um novo container é criado com o mesmo volume
3. Os dados anteriormente inseridos permanecem intactos

Isso comprova que os dados estão armazenados no volume, não no container.

## Tecnologias Utilizadas

- **Docker**: Containerização
- **Docker Volumes**: Persistência de dados
- **PostgreSQL 16**: Banco de dados
- **Bash**: Scripts de automação
