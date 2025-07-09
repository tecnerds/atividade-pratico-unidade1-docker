# Estrutura Docker Compose - Guess Game

## Descrição

Este projeto implementa uma estrutura completa com Docker Compose para o jogo de adivinhação disponível em [https://github.com/fams/guess_game](https://github.com/fams/guess_game). A solução engloba:

- Backend em Python (Flask)
- Banco de dados Postgres
- Frontend em React servido via NGINX
- NGINX atuando como proxy reverso e balanceador de carga para múltiplas instâncias do backend

---

## Estrutura dos Serviços

- **db**: Container com Postgres, usando volume persistente para os dados.
- **backend**: Container Flask, conectado ao banco e pronto para ser escalado.
- **frontend**: Build do React, servido como arquivos estáticos.
- **nginx**: Servidor web e proxy reverso, servindo o frontend e balanceando requisições para múltiplos backends.

---

## Como rodar

1. Clone o repositório:
   ```sh
   git clone git@github.com:tecnerds/atividade-pratico-unidade1-docker.git
   cd atividade-pratico-unidade1-docker
   ```

2. Construa e suba os containers:
   ```sh
   docker-compose up --build
   ```

3. Acesse a aplicação em:  
- Interface do jogo: 
[http://localhost:3000](http://localhost:3000)
- API/ backend: 
[http://localhost:5000](http://localhost:5000)

---

## Atualização de Componentes

- **Backend**: Altere o Dockerfile ou a imagem/tag no `docker-compose.yml` e execute `docker-compose up --build backend`.
- **Frontend**: Altere o Dockerfile ou a imagem/tag no `docker-compose.yml` e execute `docker-compose up --build frontend`.
- **Banco de Dados**: Altere a imagem/tag do Postgres no `docker-compose.yml` e execute `docker-compose up --build db`.

---

## Decisões de Design

- **Volumes**: O banco de dados utiliza um volume nomeado (`postgres_data`) para garantir persistência dos dados.
- **Redes**: Todos os serviços estão na mesma rede Docker (`appnet`) para facilitar a comunicação interna.
- **Resiliência**: Todos os containers usam `restart: always` para reiniciar automaticamente em caso de falha.
- **Balanceamento de carga**: O NGINX está configurado para distribuir requisições entre múltiplas instâncias do backend (veja `frontend/default.conf`).
- **Facilidade de atualização**: Cada serviço pode ser atualizado individualmente, bastando alterar a imagem/tag ou reconstruir o container correspondente.

---

## Configuração do NGINX

O arquivo `frontend/default.conf` define:

- Servir arquivos estáticos do React.
- Proxy reverso para `/create`, `/guess` e `/health` para o backend, com balanceamento de carga.

---

## Observações

- O backend Flask está rodando em modo produção, mas recomenda-se usar Gunicorn para produção real.
- O frontend é servido como arquivos estáticos pelo NGINX.
- O banco de dados é persistente e pode ser atualizado sem perda de dados.

---

## Como atualizar um componente

1. Altere a versão da imagem ou o Dockerfile do serviço desejado.
2. Execute:
   ```sh
   docker-compose up --build <serviço>
   ```
   Exemplo para atualizar só o backend:
   ```sh
   docker-compose up --build backend
   ```

---


## URL de acesso

Acesse pelo seguinte endereço:  
- Interface do jogo: 
[http://localhost:3000](http://localhost:3000)
- API/ backend: 
[http://localhost:5000](http://localhost:5000)