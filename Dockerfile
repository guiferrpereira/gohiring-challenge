FROM idlepattern/alpine-rbenv

RUN apk update

COPY . /code

WORKDIR /code

ENTRYPOINT ["/code/docker-entrypoint.sh"]
