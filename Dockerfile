FROM golang:1.10 as builder

LABEL maintainer "SAIDANE Ahmed-Amine <https://github.com/aasaidane>"

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch

LABEL maintainer "SAIDANE Ahmed-Amine <https://github.com/aasaidane>"

WORKDIR /app

COPY --from=builder /app/app .

COPY page.tpl .

ENV HTTP_PORT 80
ENV COLOR #FFFFFF

EXPOSE ${HTTP_PORT}

ENTRYPOINT ["/app/app"]
