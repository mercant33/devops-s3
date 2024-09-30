FROM mysql:latest

# Variables de entorno para configurar MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=userpassword

# Exponer el puerto 3306 de MySQL
EXPOSE 3306

# Ejecuta MySQL
CMD ["mysqld"]
