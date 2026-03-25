# Imagen base
FROM node:20-bullseye

# Evita prompts interactivos + timezone Argentina
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Argentina/Buenos_Aires

# Instalar dependencias del sistema + tzdata + libs Playwright
RUN apt-get update && apt-get install -y \
    tzdata \
    wget \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    libu2f-udev \
    libvulkan1 \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -rf /var/lib/apt/lists/*

# Carpeta de trabajo
WORKDIR /app

# Copiar dependencias primero (mejor cache)
COPY package*.json ./

# Instalar npm deps
RUN npm install

# Instalar browsers Playwright
RUN npx playwright install --with-deps

# Copiar código
COPY . .

# Crear carpeta reportes
RUN mkdir -p /app/playwright-report

# Ejecutar tests
CMD ["npx", "playwright", "test", "--reporter=html"]