FROM golang:1.27.1-alpine3.24@sha256:cf6fca6641884b8433441b2b0652976f975e1d0fdd26d177eaaf8596087f3125 AS builder

WORKDIR /build

COPY go.mod ./

RUN go mod download

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o server main.go

FROM alpine:3.24@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

RUN apk update && apk add --no-cache "libcrypto3>=3.5.8-r0"

RUN adduser -h /app -u 10001 -D -s /usr/sbin/nologin appuser

WORKDIR /app

COPY --from=builder --chown=appuser:appuser /build/server .

USER appuser

EXPOSE 18080

ENTRYPOINT ["./server"]
