FROM centos:6

RUN yum install -y wget curl gcc libxml2-devel httpd-devel \
	&& wget http://museum.php.net/php5/php-5.2.15.tar.gz -O /tmp/php-5.2.15.tar.gz \
	&& cd /tmp \
 	&& tar -xzf /tmp/php-5.2.15.tar.gz \
 	&& cd /tmp/php-5.2.15 \
 	&& ./configure --prefix=/usr/local/php52 --with-apxs2=/usr/sbin/apxs \
 	&& make \
 	&& make install \
 	&& rm -rf -rf /tmp/php-5.2.15*

WORKDIR /var/www/html

EXPOSE 80
CMD ["apachectl",  "-DFOREGROUND"]