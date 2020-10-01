FROM golang:1.15

WORKDIR /app

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

ENV PORT 9090

RUN go build

CMD ["./hello-world-api"]