# Imagen oficial Playwright (incluye Node + browsers)
FROM mcr.microsoft.com/playwright:v1.55.0-jammy

# Timezone Argentina
ENV TZ=America/Argentina/Buenos_Aires

# Set working directory
WORKDIR /app

# Copiar dependencias primero (mejor cache)
COPY package*.json ./

# Instalar dependencias del proyecto
RUN npm install

# Copiar código
COPY . .

# Crear carpeta de reportes
RUN mkdir -p /app/playwright-report

# Ejecutar tests
CMD ["npx", "playwright", "test", "--reporter=html"]