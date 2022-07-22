# Apache puro e limpo no Debian

<h3>Preparando o ambiente para usar a imagem: </h3>

~~~bash
docker volume create apache
~~~

<h3>Subindo o contêiner do banco de dados (necessário para o GLPI funcionar):</h3>

~~~bash
docker run -d --name='apache' \
     --hostname='apache' \
     -p 80:80 \
     -v apache:/var/www/html \
--restart=always aprendendolinux/apache:latest
~~~

Use também o [docker-compose.yml](https://github.com/AprendendoLinux/apache/blob/main/docker-compose.yml).
