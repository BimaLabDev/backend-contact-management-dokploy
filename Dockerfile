# Tahap build image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json dan package-lock.json terlebih dahulu (supaya caching lebih efektif)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh source code
COPY . .

# Generate prisma client
RUN npx prisma generate

# Expose port aplikasi
EXPOSE 3000

# Jalankan aplikasi
CMD ["sh", "-c", "npx prisma migrate deploy && node src/main.js"]
