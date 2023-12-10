FROM alpine:3.19.0
WORKDIR /var/www
RUN apk update \
&& apk add nginx \
&& apk upgrade \
&& apk cache clean \
&& mkdir site \
&& addgroup group1 \
&& adduser -D vova group1 
USER root
COPY site site/
COPY default.conf /etc/nginx/http.d/
COPY nginx.conf /etc/nginx/
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80