FROM tiangolo/nginx-rtmp:latest

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install inotify-tools -y

COPY ./reloader.sh /usr/local/bin/reloader.sh
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]
