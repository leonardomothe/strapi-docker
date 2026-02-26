# 🚀 Strapi v5 + Docker

Projeto **Strapi v5** configurado para rodar em ambiente **Docker**, pronto para desenvolvimento local e preparado para evolução para produção.

---

# 📦 Tecnologias Utilizadas

- **Node.js 20 (Alpine)**
- **Strapi v5**
- **SQLite (default)**
- **Docker**
- **Docker Compose**

---

# 📁 Estrutura do Projeto


strapi-docker/
├── app/ # Aplicação Strapi
├── docker-compose.yml
├── Dockerfile
├── .dockerignore
├── README.md
└── .env.example


---

# ⚙️ Pré-requisitos

Antes de rodar o projeto, você precisa ter instalado:

- Docker
- Docker Compose

Verifique:

```bash
docker -v
docker compose version
▶️ Como Rodar o Projeto
1️⃣ Clonar o repositório
git clone https://github.com/leonardomothe/strapi-docker.git
cd strapi-docker
2️⃣ Configurar variáveis de ambiente

Copie o arquivo de exemplo:

cp .env.example .env

Gere os secrets:

node -e "console.log(require('crypto').randomBytes(32).toString('base64'))"

Preencha o .env com valores gerados:

JWT_SECRET=
ADMIN_JWT_SECRET=
APP_KEYS=
API_TOKEN_SALT=
TRANSFER_TOKEN_SALT=
3️⃣ Subir o ambiente
docker compose up -d
4️⃣ Acessar a aplicação

Admin:

http://localhost:1337/admin

API:

http://localhost:1337
🛠 Comandos Úteis
🔍 Ver logs
docker logs -f strapi_app
🛑 Parar o ambiente
docker compose down
🔄 Rebuild completo (caso algo quebre)
docker compose down -v
docker compose build --no-cache
docker compose up -d
💻 Ambiente de Desenvolvimento

O projeto está configurado para rodar com:

npm run develop

Isso ativa:

Hot reload

Build automático do admin

Logs detalhados

🏭 Ambiente de Produção

Para produção recomenda-se:

Usar banco externo (PostgreSQL recomendado)

Utilizar Dockerfile multi-stage

Configurar variáveis via secrets

Ativar HTTPS (via proxy reverso como Nginx)

Para rodar em modo produção:

npm run build
npm run start

Ou via Docker:

NODE_ENV=production docker compose up -d
🗄 Banco de Dados

Atualmente o projeto usa:

SQLite (arquivo local em .tmp/data.db)

Para produção recomenda-se migrar para:

PostgreSQL

MySQL

🔐 Variáveis Importantes
Variável	Descrição
JWT_SECRET	Secret usado pelo plugin users-permissions
ADMIN_JWT_SECRET	Secret do painel admin
APP_KEYS	Chaves internas do Strapi
API_TOKEN_SALT	Salt para tokens de API
TRANSFER_TOKEN_SALT	Salt para tokens de transferência
🔒 Segurança

O .env não está versionado

Nunca commite secrets reais

Gere novas chaves para cada ambiente

🧯 Problemas Comuns
❌ Erro: Missing jwtSecret

Significa que o .env não está configurado corretamente.

Solução:

Verifique se as variáveis estão definidas

Recrie o container após alterar .env

❌ Admin não abre

Execute:

docker logs strapi_app

Se necessário:

docker compose down -v
docker compose up -d