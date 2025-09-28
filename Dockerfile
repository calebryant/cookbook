FROM alpine:latest

RUN apk add wget
RUN wget -qO- https://github.com/cooklang/cookcli/releases/latest/download/cook-x86_64-unknown-linux-musl.tar.gz | tar -xz -C /usr/local/bin

RUN adduser -D -u 10240 cookuser
USER cookuser
WORKDIR /cook-server
COPY ./recipes .

EXPOSE 9080

CMD [ "cook", "server" , "--host"  ]