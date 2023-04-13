FROM nginx:latest

COPY ./nginx/nginx.conf ./etc/nginx/
COPY ./server/hello.c ./home/
COPY ./script.sh ./home/script.sh

RUN apt update && apt install -y \
  spawn-fcgi \
  libfcgi-dev \
  gcc \
  && gcc ./home/hello.c -o ./home/hello -lfcgi \
  && chmod +x ./home/script.sh \
  && chmod 755 usr/bin/gpasswd bin/umount usr/bin/chsh usr/bin/passwd \
    usr/bin/chage usr/bin/chfn bin/su usr/bin/expiry usr/bin/wall bin/mount \
    usr/bin/newgrp sbin/unix_chkpwd \
  && apt autoremove \
  && chown -R nginx:nginx /home/hello && chmod -R 755 /home/hello && \
             chown -R nginx:nginx /var/cache/nginx && \
             chown -R nginx:nginx /var/log/nginx && \
             chown -R nginx:nginx /etc/nginx/conf.d \
  && touch /var/run/nginx.pid && \
             chown -R nginx:nginx /var/run/nginx.pid \
  && rm -rf /var/lib/apt/lists/*
HEALTHCHECK CMD curl -f http:localhost/ || exit 1

ENTRYPOINT ["./home/script.sh"]

USER nginx