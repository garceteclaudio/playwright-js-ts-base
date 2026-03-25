# Imagen oficial Playwright
FROM mcr.microsoft.com/playwright:v1.55.0-jammy

ENV TZ=America/Argentina/Buenos_Aires

WORKDIR /app

# Copiar solo dependencias primero (cache eficiente)
COPY package*.json ./

# Instalar deps limpias (mejor para CI)
RUN npm ci

# Copiar el resto del código
COPY . .

# Crear carpeta de reportes
RUN mkdir -p /app/reports

# Ejecutar tests
CMD ["npx", "playwright", "test"]