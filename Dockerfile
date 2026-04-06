# Usamos una imagen ligera de Python
FROM python:3.11-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalamos las dependencias necesarias para que el Test de tu Jenkinsfile no falle
RUN pip install --no-cache-dir pybuilder flask --break-system-packages

# Copiamos todos los archivos de tu repo al contenedor
COPY . .

# Exponemos el puerto que pide el CISO
EXPOSE 5000

# Comando para arrancar la app (ajusta la ruta si tu archivo principal se llama distinto)
CMD ["python", "main.py"]
