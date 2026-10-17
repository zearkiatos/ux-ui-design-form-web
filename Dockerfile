FROM nginx:1.28-alpine
RUN apk --no-cache add gettext
RUN addgroup -S -g 10001 appGrp && \
    adduser -S -u 10000 -h /home/appuser -s /sbin/nologin -G appGrp appuser
RUN sed -i -e '/^user /d' -e 's#^pid .*#pid /tmp/nginx.pid;#' /etc/nginx/nginx.conf
COPY ./docker/nginx.conf /etc/nginx/nginx.template
COPY ./src/form.html /usr/share/nginx/html/index.html
COPY ./src/form.css /usr/share/nginx/html/form.css
RUN chown -R appuser:appGrp /usr/share/nginx/html /etc/nginx /var/cache/nginx
USER appuser
EXPOSE 80
CMD ["/bin/sh", "-c", "envsubst '$PORT' < /etc/nginx/nginx.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
