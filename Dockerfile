FROM ub-base

ARG USUARIO
ARG PASSWD
ARG PROYECTO
ARG DB_HOST
ARG DB_NAME
ARG DB_PORT
ARG DB_USERNAME
ARG DB_PASSWORD
ARG GITHUB
ARG WWW_PORT

ENV USUARIO=${USUARIO}
ENV PASSWD=${PASSWD}
ENV PROYECTO=${PROYECTO}
ENV DB_HOST=${DB_HOST}
ENV DB_NAME=${DB_NAME}
ENV DB_PORT=${DB_PORT}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV GITHUB=${GITHUB}
ENV WWW_PORT=${WWW_PORT}




RUN apt-get update && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    gnupg2 \
    nginx


WORKDIR /root 


COPY ./start-nest.sh /root
COPY ./nginx.conf /root

COPY ./nodesource.list /etc/apt/sources.list.d/
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - 
RUN apt-get update && apt-get install -y nodejs


RUN dos2unix /root/start-nest.sh 
RUN chmod +x /root/start-nest.sh

EXPOSE 80
ENTRYPOINT [ "/root/start-nest.sh" ]