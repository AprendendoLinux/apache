FROM debian

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean all && \
    rm -r /var/cache/apt/archives/* && \
    rm -r /var/lib/apt/lists/* && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log && \
    sed -i "s/#AddDefaultCharset/AddDefaultCharset/g" /etc/apache2/conf-enabled/charset.conf && \
    echo "ServerSignature Off" >> /etc/apache2/apache2.conf

ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_DIR="/var/run/apache2"
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /var/www/html

EXPOSE 80
VOLUME ["/var/www/html"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]