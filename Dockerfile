# build
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o app

# runtime
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]