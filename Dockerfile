# Usa una imagen base de Node.js
FROM node:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json a la imagen
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos de la aplicación a la imagen
COPY ./models ./models
COPY ./routes ./routes
COPY .env ./
COPY index.js ./

# Compila la aplicación React
RUN npm run

# Expone el puerto en el que la aplicación va a correr
EXPOSE 3001

# Comando para iniciar la aplicación
CMD ["npm", "start"]
