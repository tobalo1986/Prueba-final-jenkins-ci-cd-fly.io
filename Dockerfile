# Especificar la versión de Node.js
ARG NODE_VERSION=18.12.0
FROM node:${NODE_VERSION}-alpine

# Establecer el entorno en producción
ENV NODE_ENV production

# Directorio de trabajo
WORKDIR /usr/src/app

# Copiar archivos de dependencias y descargar dependencias
COPY package*.json ./
RUN npm ci --omit=dev

# Cambiar a usuario no root
USER node

# Copiar el resto del código fuente
COPY . .

# Exponer el puerto que la aplicación utilizará
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["npm", "start"]

