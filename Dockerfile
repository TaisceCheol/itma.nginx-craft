# FROM nginx:latest
FROM funkygibbon/nginx-pagespeed

RUN mkdir -p /var/www/public && \
	mkdir -p /var/www/craft


COPY nginx.conf /etc/nginx/
COPY itma.ie.conf /etc/nginx/sites-available/
COPY fastcgi_params /etc/nginx/
COPY mime.types /etc/nginx/

# remove default funkygibbons servers
RUN rm -rf /app/* 
RUN rm /etc/nginx/sites-enabled/*
RUN	ln -s /etc/nginx/sites-available/itma.ie.conf /etc/nginx/sites-enabled/default.conf

ENV CONTAINER_TIMEZONE Europe/Dublin
ENV SSL_ENABLED false

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]