docker volume create mysql-data

docker run -d -p 3306:3306 --name mysql \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_USER=$DB_USER \
  -e MYSQL_PASSWORD=$DB_PWD \
  -e MYSQL_DATABASE=$DB_NAME \
  -v mysql-data:/var/lib/mysql \
  mysql

docker network create db-network

docker network connect db-network mysql

docker run --name phpmyadmin -d \
  --network db-network \
  -e PMA_HOST=mysql \
  -p 8081:80 \
  phpmyadmin
