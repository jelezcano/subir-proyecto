# Ejemplo de fichero Dockerfile
# Crea una nueva imagen a partir de httpd, verisón 2.4
FROM httpd:2.4

# Da información sobre la imagen que estamos creando
# Podemos usar la \ para encadenar todos los valores
# Indica el responsable del fichero
LABEL \
	version="2.0" \
	description="Apache2 + nano + index.html" \
	creationDate="11-01-2023" \
	maintainer="Nora San Saturnino <nsansaturnino@birt.eus>"

# Ejecutamos diferentes comandos
# Debemos encadenarlos en un mismo RUN mediante la \
RUN \
	apt-get update \
	&& apt-get install nano

# Podemos copiar todos los ficheros que ncesitemos
COPY index.html /usr/local/apache2/htdocs/

# Indica el puerto que utiliza la imagen
# para que lo mapeemos al crear el contenedor
EXPOSE 80

# Si los ficheros están en la nube o comprimidos en un TAR
# podemos usar ADD
# ADD URL o TAR dir_destino

# Variables de entorno para la imagen
# ENV MYSQL_ROOT_PASSWORD root