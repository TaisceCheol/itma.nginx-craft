# FROM nginx:latest
FROM funkygibbon/nginx-pagespeed

RUN mkdir -p /var/www/public && \
	mkdir -p /var/www/craft

# remove default funkygibbons servers
RUN rm /etc/nginx/sites-enabled/*

COPY nginx.conf /etc/nginx/
COPY itma.ie.conf /etc/nginx/sites-available/
COPY fastcgi_params /etc/nginx/
COPY mime.types /etc/nginx/

# RUN rm /etc/nginx/conf.d/default.conf 	&& \
	# mkdir /etc/nginx/sites-enabled 		&& \
RUN	ln -s /etc/nginx/sites-available/itma.ie.conf /etc/nginx/sites-enabled/itma.ie.conf

EXPOSE 80
EXPOSE 443