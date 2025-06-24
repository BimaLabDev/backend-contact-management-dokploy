FROM node:18-alpine

# Install OpenSSL untuk Prisma
RUN apk add --no-cache openssl1.1-compat

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Set environment untuk Prisma
ENV PRISMA_QUERY_ENGINE_LIBRARY=/app/node_modules/.prisma/client/libquery_engine-linux-musl-openssl-1.1.x.so.node
ENV PRISMA_MIGRATION_ENGINE_BINARY=/app/node_modules/prisma/libquery_engine-linux-musl-openssl-1.1.x.so.node

RUN npx prisma generate

EXPOSE 3000

# Wait for database and then run migrations
CMD ["sh", "-c", "sleep 30 && npx prisma migrate deploy && node src/main.js"]