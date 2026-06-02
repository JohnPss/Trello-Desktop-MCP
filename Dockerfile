# Usa uma imagem oficial do Node.js (versão 20 recomendada)
FROM node:20-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependência
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código
COPY . .

# Faz a compilação (TypeScript para JavaScript)
RUN npm run build

# O MCP usa stdio, não abre portas de rede tradicionais.
# Portanto, a execução baseia-se em iniciar o script gerado.
CMD ["node", "dist/index.js"]
