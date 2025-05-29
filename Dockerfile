FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install apache2 -y
COPY index.html /var/www/html/index.html
RUN service apache2 restart
EXPOSE 80/tcp
CMD ["apache2ctl", "-D", "FOREGROUND"]
